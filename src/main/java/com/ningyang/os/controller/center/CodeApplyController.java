package com.ningyang.os.controller.center;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ningyang.os.action.config.SystemConfig;
import com.ningyang.os.action.input.command.web.serve.ApplyCodeCommand;
import com.ningyang.os.action.input.command.web.serve.CenterCodeCommand;
import com.ningyang.os.action.input.condition.base.QueryCodeCondition;
import com.ningyang.os.action.input.condition.serve.QueryApplyCodeCondition;
import com.ningyang.os.action.input.condition.serve.QueryGoodsCondition;
import com.ningyang.os.action.output.vo.web.base.BrandSeriesProductVo;
import com.ningyang.os.action.output.vo.web.base.CodeImportTemplateVo;
import com.ningyang.os.action.output.vo.web.serve.ApplyCodeVo;
import com.ningyang.os.action.output.vo.web.serve.GoodsInfoVo;
import com.ningyang.os.action.utils.DateUtil;
import com.ningyang.os.action.utils.ReadFileBackData;
import com.ningyang.os.action.utils.WebResult;
import com.ningyang.os.controller.system.BaseController;
import com.ningyang.os.pojo.SerApplyCodeTemplate;
import com.ningyang.os.pojo.SerGoodsInfo;
import com.ningyang.os.pojo.SysUserInfo;
import com.ningyang.os.service.*;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static cn.hutool.core.io.FileUtil.exist;
import static cn.hutool.core.io.FileUtil.mkdir;
import static cn.hutool.core.util.ZipUtil.zip;
import static cn.hutool.http.HttpUtil.post;
import static com.ningyang.os.action.enums.SystemErrorEnum.*;
import static com.ningyang.os.action.utils.DateUtil.getOrderNum;
import static com.ningyang.os.action.utils.DateUtil.getSimpleYearShort;
import static org.apache.commons.lang3.StringUtils.isNotBlank;
import static org.apache.commons.lang3.StringUtils.stripToNull;


//import org.apache.commons.io.FileUtils;
//import org.apache.commons.codec.i

/**
 * @Author： kaider
 * @Date：2018/11/15 16:15
 * @描述：溯源码申请
 */
@RestController
@RequestMapping("center/code/apply")
public class CodeApplyController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(CodeApplyController.class);

    @Autowired
    private ISerApplyCodeInfoService infoService;
    @Autowired
    private ISerApplyCodeTemplateService templateService;
    @Autowired
    private ISerApplyCodeTableInfoService tableInfoService;
    @Autowired
    private SystemConfig config;
    @Autowired
    private ISerCodeImportTemplateInfoService codeImportTemplateInfoService;
    @Autowired
    private ISerGoodsInfoService goodsInfoService;
    @Autowired
    private ISerBrandSeriesProductInfoService productInfoService;
    @Autowired
    private ISerGoodsInfoService serGoodsInfoService;

    @GetMapping("getCodeApplyPage")
    public Map<String, Object> getCodeApplyPage(
            QueryCodeCondition condition
    ) {
        try {
            Page<ApplyCodeVo> pageVo = infoService.findApplyCodeVoPageByCondition(condition);
            return WebResult.success().put("pageVo", pageVo).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(DATA_ERROR.getInfo()).toMap();
        }
    }

    /**
     * 向中心请求二维码
     *
     * @param userToken
     * @param command
     * @return
     */
    @PostMapping("add")
    public Map<String, Object> add(
            @RequestHeader("Authorization") String userToken,
            @RequestBody ApplyCodeCommand command
    ) {
        try {
            SysUserInfo userInfo = getBaseUserInfo(userToken);
            if (userInfo != null) {
                command.setApplyUserId(userInfo.getId());

                String userCode = getAuthorizationCode(0);
                if (isNotBlank(userCode)) {
                    command.setUserCode(userCode);
                    if (command.getCodeType() == 1) {
                        //条形码
                        command.setCodePosition(2L);
                    }
                    //设定内外码
                    if (command.getCodePositionType() == 1) {
                        command.setCodePosition(1L);
                    } else {
                        command.setCodePosition(2L);
                    }
                    command.setCodeOrder(getOrderNum());
                    String result = post(config.getDefaultCenterUrl() + "company/web/api/makeCodeOrder", JSONObject.toJSONString(command));
                    JSONObject object = JSONObject.parseObject(result);
                    boolean flag = (boolean) object.get("result");
                    if (flag) {
                        //插入申请记录
                        boolean flag1 = infoService.add(command);
                        if (flag1) {
                            return WebResult.success().toMap();
                        } else {
                            return WebResult.failure(OPERATING_ERROR.getInfo()).toMap();
                        }
                    }
                } else {
                    return WebResult.failure(PERMISSION_ERROR.getInfo()).toMap();
                }
            }
            return WebResult.failure(OPERATING_ERROR.getInfo()).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(OPERATING_ERROR.getInfo()).toMap();
        }
    }

    /**
     * 中心通信存储溯源码
     *
     * @param command
     * @return
     */
    @PostMapping("getApplyCodeData")
    public Map<String, Object> getApplyCodeData(
            @RequestBody CenterCodeCommand command
    ) {
        String centerCode = command.getApiCode();
        String nodeCode = getAuthorizationCode(1);
//        System.out.println(JSONObject.toJSONString(command));
        if (centerCode.equals(nodeCode)) {
            boolean codeFlag = templateService.addBatch(command);
            if (codeFlag) {
                boolean applyFlag = infoService.updateApplyState(command);
                if (applyFlag) {
                    tableInfoService.addCodeFlag(command.getCodeFlag());
                    return WebResult.success().toMap();
                }
                return WebResult.failure(EDIT_ERROR.getInfo()).toMap();
            }
            return WebResult.failure(IMPORT_DATA_ERROR.getInfo()).toMap();
        } else {
            return WebResult.failure(SEND_ERROR.getInfo()).toMap();
        }
    }


    /**
     * 生成溯源码压缩包
     *
     * @param condition
     * @return
     */
    @GetMapping("downCode")
    public Map<String, Object> downCode(
            QueryApplyCodeCondition condition
    ) {
        try {
            String rootFilePath = config.getDefaultQRCodeTemplateFilePath();
            String zipFileName = condition.getCodeOrder();

            boolean flag = exist(rootFilePath + "/" + zipFileName + ".zip");
            if (!flag) {
                //不存在
                // 文件名(同时也是需要zip的文件)
                File pFile = mkdir(rootFilePath + zipFileName);
                //创建父文件夹
                String pFilePath = pFile.getPath();
                int codeType = condition.getCodeType();

                List<SerApplyCodeTemplate> codeList = templateService.findCodeVoList(condition);

                BufferedWriter bw;
                if (codeType == 2) {
                    //二维码
                    bw = new BufferedWriter(new FileWriter(pFilePath + "/" + zipFileName
                            + '-' + condition.getCodeTypeName() + '-' + condition.getCodePositionTypeName() + ".txt"));
                    for (SerApplyCodeTemplate code : codeList) {
//                        encode(code.getCodeContent(), pFilePath, false, String.valueOf(code.getCenterId()));
                        bw.write(code.getCodeContent() + "\r");
                        bw.newLine();
                        bw.flush();
                    }
                    bw.close();
                } else if (codeType == 1) {
                    //条形码
                    bw = new BufferedWriter(new FileWriter(pFilePath + "/" + zipFileName
                            + '-' + condition.getCodeTypeName() + '-' + condition.getCodePositionTypeName() + ".txt"));
                    for (SerApplyCodeTemplate code : codeList) {
//                        generateFile(code.getCodeContent(), pFilePath + "/" + code.getCenterId() + ".png");
                        bw.write(code.getCodeContent() + "\r");
                        bw.newLine();
                        bw.flush();
                    }
                    bw.close();
                }
                //创建压缩文件
                zip(pFile);
            }
            return WebResult.success().put("zipFileName", zipFileName).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(e).toMap();
        }
    }

    /**
     * 下载溯源码压缩包
     *
     * @param condition
     * @return
     * @throws IOException
     */
    @GetMapping("downloadZip")
    public ResponseEntity<byte[]> downloadZip(QueryApplyCodeCondition condition) throws IOException {
        //下载具体文件
        File file = new File(config.getDefaultQRCodeTemplateFilePath() + condition.getCodeOrder() + ".zip");
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }

    /**
     * 向中心请求二维码.简化版。
     * 生成多组二维码，同时匹配好对应关系。
     * add by suntao
     *
     * @param userToken
     * @param command
     * @return
     */
    @PostMapping("addSimplified")
    public Map<String, Object> addCodeSimplified(
            @RequestHeader("Authorization") String userToken,
            @RequestBody ApplyCodeCommand command) {
        try {
            ApplyCodeCommand commandLeft = null;
            SysUserInfo userInfo = getBaseUserInfo(userToken);
            if (userInfo != null) {
                command.setApplyUserId(userInfo.getId());
                command.setBusinessType(1L);

                String userCode = getAuthorizationCode(0);
                if (isNotBlank(userCode)) {
                    command.setUserCode(userCode);
                    if (command.getCodeType() == 1) {
                        //条形码
                        command.setCodeType(1L);
                    } else {
                        //二维码
                        command.setCodeType(2L);
                    }

                    CodeImportTemplateVo codeImportTemplateVo = new CodeImportTemplateVo();
                    codeImportTemplateVo = codeImportTemplateInfoService.findCodeImportTemplateVo(command.getCodeTemplate());

                    //根据模板id。获取左码和右码，以及数量。来生成对应的码。
                    //插入申请记录
                    String orderNum = DateUtil.getOrderNum1();
                    command.setCodeOrderSimplified(orderNum);

                    Date date = new Date();
                    command.setApplyDate(date);

                    commandLeft = command;

                    Integer applyCount = command.getApplyCount();

                    if (codeImportTemplateVo.getRightCodeId() != null) {
                        //内码 -- 对应模板的右码。
                        command.setCodeOrder(orderNum);
                        command.setCodePosition(1L);
                        Integer rightCodeNum = stripToNull(codeImportTemplateVo.getRightCodeNum()) == null ? 1 : Integer.parseInt(codeImportTemplateVo.getRightCodeNum());

                        Integer codeNum = 0;
                        if (rightCodeNum > 0) {
                            codeNum = applyCount * rightCodeNum;
                        } else {
                            codeNum = applyCount;
                        }
                        command.setApplyCount(codeNum);
                        command.setCodePositionType(codeImportTemplateVo.getRightCodeId());

                        //将信息发送道审批端
                        String result = post(config.getDefaultCenterUrl() + "company/web/api/makeCodeOrder", JSONObject.toJSONString(command));
                        JSONObject object = JSONObject.parseObject(result);
                        boolean flag = (boolean) object.get("result");
                        if (flag) {
                            //生成右码
                            boolean flag1 = infoService.add(command);
                        }
                    }

                    if (codeImportTemplateVo.getLeftCodeId() != null) {
                        String orderNum1 = DateUtil.getOrderNum1();
                        commandLeft.setCodeOrder(orderNum1);
                        //外码 对应模板的左码
                        commandLeft.setCodePosition(2L);
                        commandLeft.setCodePositionType(codeImportTemplateVo.getLeftCodeId());
                        commandLeft.setApplyCount(applyCount);

                        //将信息发送道审批端
                        String resultLeft = post(config.getDefaultCenterUrl() + "company/web/api/makeCodeOrder", JSONObject.toJSONString(commandLeft));
                        JSONObject objectLeft = JSONObject.parseObject(resultLeft);
                        boolean flagLeft = (boolean) objectLeft.get("result");
                        if (flagLeft) {
                            //生成左码
                            boolean flag2 = infoService.add(commandLeft);
                        }
                    }

                    return WebResult.success().toMap();
                } else {
                    return WebResult.failure(PERMISSION_ERROR.getInfo()).toMap();
                }
            }
            return WebResult.failure(OPERATING_ERROR.getInfo()).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(OPERATING_ERROR.getInfo()).toMap();
        }
    }

    /**
     * 简化版业务处理。增加溯源码的对应关系。判断逻辑：通过溯源码的数量与申请的数量做比较，如果是多的一方，则为内码，如果是少的一方，则为外码。
     *
     * @param codeOrderSimplified
     * @param command
     * @return
     */
    public boolean addApplyCodeRalations(String codeOrderSimplified, CenterCodeCommand command) {
        //add by suntao 处理简化版数据信息
        QueryCodeCondition codeCondition = new QueryCodeCondition();
        codeCondition.setCodeOrderSimplified(codeOrderSimplified);

        String codeOrder = "";
        boolean flag;
        String tableName = getSimpleYearShort() + command.getCodeFlag();

        try {
            //根据订单编码，获取申请信息，判断是否是简化版业务
            List<ApplyCodeVo> applyCodeCommandList = infoService.findApplyCodeVoListByCondition(codeCondition);
            if (!applyCodeCommandList.isEmpty()) {
                QueryApplyCodeCondition queryApplyCodeCondition = null;
                //溯源码类型数
                int applyCodeCommandNum = applyCodeCommandList.size();

                //获取模板信息
                CodeImportTemplateVo templateVo = null;
                //模板对应的品牌系列产品
                BrandSeriesProductVo brandSeriesProductVo = null;
                //商品信息。码对应关系
                List<SerGoodsInfo> listTemp = new ArrayList<>();
                SerGoodsInfo info = null;

                switch (applyCodeCommandNum) {
                    case 1://单码，直接插入
                        ApplyCodeVo applyCodeVo = applyCodeCommandList.get(0);

                        codeOrder = applyCodeVo.getCodeOrder();
                        queryApplyCodeCondition = new QueryApplyCodeCondition();
                        queryApplyCodeCondition.setCodeOrder(codeOrder);
                        queryApplyCodeCondition.setTableName(tableName);
                        //溯源码信息列表
                        List<SerApplyCodeTemplate> codeList = templateService.findCodeVoList(queryApplyCodeCondition);
                        //获取模板信息
                        templateVo = codeImportTemplateInfoService.findCodeImportTemplateVo(applyCodeVo.getCodeTemplateId());
                        //模板对应的品牌系列产品
                        brandSeriesProductVo = productInfoService.findBrandSeriesProductVo(templateVo.getProductId());

                        for (SerApplyCodeTemplate data : codeList) {
                            info = new SerGoodsInfo();
                            info.setBrandId(brandSeriesProductVo.getBrandId());
                            info.setBrandName(templateVo.getBrandName());
                            info.setBrandSeriesId(brandSeriesProductVo.getSeriesId());
                            info.setBrandSeriesName(templateVo.getSeriesName());
                            info.setBrandSeriesProductId(brandSeriesProductVo.getProductId());
                            info.setBrandSeriesProductName(templateVo.getProductName());
                            info.setM1(data.getCodeContent());
                            info.setCreateTime(new Date());
                            info.setUpdateTime(new Date());
                            info.setGoodsState(0);
                            listTemp.add(info);
                        }

                        if (!listTemp.isEmpty()) {
                            flag = goodsInfoService.saveBatch(listTemp);
                        }

                        break;
                    case 2:
                        //获取订单编号，再去二维码表里查找，如果所有的订单都可以查到对应的二维码，那么，可以写入到二维码对应表里了，如果有任一个订单还没有生成二维码，那么不用写入二维码对应表

                        ApplyCodeVo applyCodeVo0 = applyCodeCommandList.get(0);
                        ApplyCodeVo applyCodeVo1 = applyCodeCommandList.get(1);
                        ApplyCodeVo applyCodeVoTemp = null;

                        //判断谁是里面的码，谁是外面的码
                        CodeImportTemplateVo codeImportTemplateVo = new CodeImportTemplateVo();
                        codeImportTemplateVo = codeImportTemplateInfoService.findCodeImportTemplateVo(applyCodeVo0.getCodeTemplateId());

                        //模板的右码，是里面的码
                        if (!(applyCodeVo0.getCodePositionType() == codeImportTemplateVo.getRightCodeId())) {
                            //交换位置，applyCodeVo0 代表里面的码，applyCodeVo1代表外面的码
                            applyCodeVoTemp = applyCodeVo0;
                            applyCodeVo0 = applyCodeVo1;
                            applyCodeVo1 = applyCodeVoTemp;
                        }

                        //获取模板信息
                        templateVo = codeImportTemplateInfoService.findCodeImportTemplateVo(applyCodeVo0.getCodeTemplateId());
                        //模板对应的品牌系列产品
                        brandSeriesProductVo = productInfoService.findBrandSeriesProductVo(templateVo.getProductId());

                        //右码数量
                        int rightCodeNum = 1;
                        if (StringUtils.isNotEmpty(templateVo.getRightCodeNum())) {
                            rightCodeNum = Integer.parseInt(templateVo.getRightCodeNum());
                        }

                        codeOrder = applyCodeVo0.getCodeOrder();
                        queryApplyCodeCondition = new QueryApplyCodeCondition();
                        queryApplyCodeCondition.setCodeOrder(codeOrder);
                        queryApplyCodeCondition.setTableName(tableName);
                        //溯源码信息列表.里面的码，数量大于等于外面的码
                        List<SerApplyCodeTemplate> codeList0 = templateService.findCodeVoList(queryApplyCodeCondition);

                        if (codeList0.isEmpty()) {
                            break;
                        }

                        codeOrder = applyCodeVo1.getCodeOrder();
                        queryApplyCodeCondition = new QueryApplyCodeCondition();
                        queryApplyCodeCondition.setCodeOrder(codeOrder);
                        queryApplyCodeCondition.setTableName(tableName);
                        //溯源码信息列表，外面的码
                        List<SerApplyCodeTemplate> codeList1 = templateService.findCodeVoList(queryApplyCodeCondition);

                        if (codeList1.isEmpty()) {
                            break;
                        }

                        int i = 0;
                        int j = 0;

                        for (SerApplyCodeTemplate code0 : codeList0) {
                            info = new SerGoodsInfo();
                            info.setBrandId(brandSeriesProductVo.getBrandId());
                            info.setBrandName(templateVo.getBrandName());
                            info.setBrandSeriesId(brandSeriesProductVo.getSeriesId());
                            info.setBrandSeriesName(templateVo.getSeriesName());
                            info.setBrandSeriesProductId(brandSeriesProductVo.getProductId());
                            info.setBrandSeriesProductName(templateVo.getProductName());
                            info.setM1(code0.getCodeContent());
                            info.setM1Remark(templateVo.getRightCodeName());

                            //码2
                            j++;
                            info.setM2(codeList1.get(i).getCodeContent());
                            info.setM2Remark(templateVo.getLeftCodeName());
                            if (j % rightCodeNum == 0) {
                                i++;
                            }

                            info.setCreateTime(new Date());
                            info.setUpdateTime(new Date());
                            info.setGoodsState(0);
                            listTemp.add(info);
                        }

                        if (!listTemp.isEmpty()) {
                            flag = goodsInfoService.saveBatch(listTemp);
                        }

                        break;
                    default:
                        break;
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
        return true;
    }

    /**
     * 溯源码发放（简化版）分页查询
     *
     * @param condition
     * @return
     */
    @GetMapping("getCodeApplySimplifiedPage")
    public Map<String, Object> getCodeApplySimplifiedPage(
            QueryCodeCondition condition) {
        try {
            Page<ApplyCodeVo> pageVo = infoService.findApplyCodeVoSimplifiedPageByCondition(condition);
            return WebResult.success().put("pageVo", pageVo).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(DATA_ERROR.getInfo()).toMap();
        }
    }

    /**
     * 生成溯源码压缩包（简化版）
     *
     * @param condition
     * @return
     */
    @GetMapping("downCodeSimplified")
    public Map<String, Object> downCodeSimplified(
            QueryApplyCodeCondition condition
    ) {
        try {
            String rootFilePath = config.getDefaultQRCodeTemplateFilePath();
            String zipFileName = condition.getCodeOrderSimplified();

            boolean flag = exist(rootFilePath + "/" + zipFileName + ".zip");
            if (!flag) {
                //不存在
                // 文件名(同时也是需要zip的文件)
                File pFile = mkdir(rootFilePath + zipFileName);
                //创建父文件夹
                String pFilePath = pFile.getPath();
                int codeType = condition.getCodeType();

                //处理简化版数据信息
                QueryCodeCondition codeCondition = new QueryCodeCondition();
                codeCondition.setCodeOrderSimplified(condition.getCodeOrderSimplified());
                //根据订单编码，获取申请信息，判断是否是简化版业务
                List<ApplyCodeVo> applyCodeCommandList = infoService.findApplyCodeVoListByCondition(codeCondition);

                if (!applyCodeCommandList.isEmpty()) {

                    int length = applyCodeCommandList.size();

                    BufferedWriter bw;

                    switch (length) {
                        case 1:
                            condition.setCodeOrder(applyCodeCommandList.get(0).getCodeOrder());
                            condition.setTableName(applyCodeCommandList.get(0).getTableName());
                            List<SerApplyCodeTemplate> codeList = templateService.findCodeVoList(condition);

                            if (codeType == 2) {
                                //二维码
                                bw = new BufferedWriter(new FileWriter(pFilePath + "/" + zipFileName
                                        + '-' + condition.getCodeTypeName() + ".txt"));
                                for (SerApplyCodeTemplate code : codeList) {
                                    bw.write(code.getCodeContent() + "\r");
                                    bw.newLine();
                                    bw.flush();
                                }
                                bw.close();
                            } else if (codeType == 1) {
                                //条形码
                                bw = new BufferedWriter(new FileWriter(pFilePath + "/" + zipFileName
                                        + '-' + condition.getCodeTypeName() + ".txt"));
                                for (SerApplyCodeTemplate code : codeList) {
                                    bw.write(code.getCodeContent() + "\r");
                                    bw.newLine();
                                    bw.flush();
                                }
                                bw.close();
                            }
                            break;

                        case 2:

                            ApplyCodeVo applyCodeVo0 = applyCodeCommandList.get(0);
                            ApplyCodeVo applyCodeVo1 = applyCodeCommandList.get(1);
                            ApplyCodeVo applyCodeVoTemp;

                            //判断谁是里面的码，谁是外面的码
                            CodeImportTemplateVo codeImportTemplateVo = new CodeImportTemplateVo();
                            codeImportTemplateVo = codeImportTemplateInfoService.findCodeImportTemplateVo(applyCodeVo0.getCodeTemplateId());

                            //模板的右码，是里面的码
                            if (!(applyCodeVo0.getCodePositionType() == codeImportTemplateVo.getRightCodeId())) {
                                //交换位置，applyCodeVo0 代表里面的码，applyCodeVo1代表外面的码
                                applyCodeVoTemp = applyCodeVo0;
                                applyCodeVo0 = applyCodeVo1;
                                applyCodeVo1 = applyCodeVoTemp;
                            }

                            QueryApplyCodeCondition condition1 = new QueryApplyCodeCondition();
                            condition1.setCodeOrder(applyCodeVo1.getCodeOrder());
                            condition1.setTableName(applyCodeVo1.getTableName());
                            List<SerApplyCodeTemplate> codeList1 = templateService.findCodeVoList(condition1);

                            QueryGoodsCondition goodsCondition;
                            List<GoodsInfoVo> goodsInfoVoList;

                            //二维码
                            bw = new BufferedWriter(new FileWriter(pFilePath + "/" + zipFileName
                                    + '-' + condition.getCodeTypeName() + ".txt"));

                            //根据applyCodeVo1外面的码，在商品表里，查找对应的内码。
                            for (SerApplyCodeTemplate serApplyCodeTemplate : codeList1) {
                                goodsCondition = new QueryGoodsCondition();
                                goodsCondition.setM2(serApplyCodeTemplate.getCodeContent());
                                goodsInfoVoList = serGoodsInfoService.findGoodsInfoVoByCondition(goodsCondition);

                                if (!goodsInfoVoList.isEmpty()) {
                                    for (GoodsInfoVo goodsInfoVo : goodsInfoVoList) {
                                        bw.write(goodsInfoVo.getM1() + "," + goodsInfoVo.getM2() + "\r");
                                        bw.newLine();
                                        bw.flush();
                                    }
                                }
                            }

                            bw.close();
                            break;

                        default:
                            break;
                    }
                }
                //创建压缩文件
                zip(pFile);
            }
            return WebResult.success().put("zipFileName", zipFileName).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(e).toMap();
        }
    }

    /**
     * 下载溯源码压缩包
     *
     * @param condition
     * @return
     * @throws IOException
     */
    @GetMapping("downloadSimplifiedZip")
    public ResponseEntity<byte[]> downloadSimplifiedZip(QueryApplyCodeCondition condition) throws IOException {
        //下载具体文件
        File file = new File(config.getDefaultQRCodeTemplateFilePath() + condition.getCodeOrderSimplified() + ".zip");
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }

}
