package com.ningyang.os.controller.serve;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ningyang.os.action.input.command.web.serve.ImportCodeCommand;
import com.ningyang.os.action.input.condition.serve.QueryApplyCodeCondition;
import com.ningyang.os.action.output.vo.web.serve.ImportCodeVo;
import com.ningyang.os.action.utils.ReadFileBackData;
import com.ningyang.os.action.utils.WebResult;
import com.ningyang.os.controller.system.BaseController;
import com.ningyang.os.service.ILCodeImportFileInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

import static com.ningyang.os.action.enums.SystemErrorEnum.DATA_ERROR;
import static com.ningyang.os.action.enums.SystemErrorEnum.IMPORT_DATA_ERROR;
import static com.ningyang.os.action.utils.ReadFileUtil.returnReadFileData;
import static com.ningyang.os.action.utils.UuidUtil.generateUUID;

/**
 * @Author： kaider
 * @Date：2018/11/22 14:15
 * @描述：机器导入溯源码
 */
@RestController
@RequestMapping("center/qrcode")
public class ImportCodeController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(ImportCodeController.class);

    @Autowired
    private ILCodeImportFileInfoService infoService;

    /**
     *
     * @param condition
     * @return
     */
    @GetMapping("getImportCodePage")
    public Map<String, Object> getImportCodePage(
            QueryApplyCodeCondition condition
    ) {
        try {
            Page<ImportCodeVo> pageVo = infoService.findImportCodeVoPageByCondition(condition);
            return WebResult.success().put("pageVo", pageVo).toMap();
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(DATA_ERROR.getInfo()).toMap();
        }
    }


    /**
     * fixme 文件数据处理
     * 导入机器溯源码文件
     * @param userToken
     * @param file
     * @param templateId
     * @return
     */
    @PostMapping("importFile")
    public Map<String,Object> importFile(
            @RequestHeader("Authorization") String userToken,
            @RequestParam(value = "file", required = false) MultipartFile file,
            Long templateId,
            HttpServletRequest request
    ){
        if(file==null){
            return WebResult.failure("请上传文件!").toMap();
        }
        try {
            String fileName = file.getOriginalFilename();
            Long uploadUserId = getBaseUserInfo(userToken).getId();

            String saveFileName = generateUUID() + fileName;
            File saveFile = new File(request.getSession().getServletContext().getRealPath("/upload/") + saveFileName);
            String saveFilePath = "upload/" + saveFileName;
            if (!saveFile.getParentFile().exists()) {
                saveFile.getParentFile().mkdirs();
            }
            BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(saveFile));
            out.write(file.getBytes());
            out.flush();
            out.close();

            //获取导入文件左右数据
            List<ReadFileBackData> fileList = returnReadFileData(file);
            //加入导入日志
            ImportCodeCommand command = new ImportCodeCommand();
            command.setImportFileName(fileName);
            command.setSaveFilePath(saveFilePath);
            command.setCodeCount(Long.valueOf(fileList.size()*2));
            command.setUserId(uploadUserId);
            command.setTemplateId(templateId);
            boolean logFlag = infoService.add(command);
            //接入数据到临时表
            return WebResult.success().toMap();

        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return WebResult.failure(IMPORT_DATA_ERROR.getInfo()).toMap();
        }
    }




}
