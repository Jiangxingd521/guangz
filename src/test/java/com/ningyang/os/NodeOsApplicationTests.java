package com.ningyang.os;

import com.alibaba.fastjson.JSONObject;
import com.ningyang.os.action.config.SystemConfig;
import com.ningyang.os.action.input.condition.serve.QueryApplyCodeCondition;
import com.ningyang.os.action.utils.ReadFileBackData;
import com.ningyang.os.action.utils.WebResult;
import com.ningyang.os.dao.SerApplyCodeTableInfoMapper;
import com.ningyang.os.pojo.SerApplyCodeTemplate;
import com.ningyang.os.service.ISerApplyCodeTableInfoService;
import com.ningyang.os.service.ISerApplyCodeTemplateService;
import com.ningyang.os.service.ISerCodeImportTemplateInfoService;
import com.ningyang.os.service.ISysApiInfoService;
import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class NodeOsApplicationTests {

    @Autowired
    private ISysApiInfoService infoService;
    @Autowired
    private SystemConfig config;
    @Autowired
    private ISerApplyCodeTableInfoService tableInfoService;
    @Autowired
    private ISerCodeImportTemplateInfoService templateInfoService;
    @Autowired
    private ISerApplyCodeTemplateService codeTemplateService;

    @Test
    public void contextLoads() {

        /*List<SysApiInfo> listTemp = infoService.list(null);
        System.out.println(JSONObject.toJSONString(listTemp));*/

        /*QueryApplyCodeCondition condition = new QueryApplyCodeCondition();
        condition.setTableName("201811");
        condition.setCodeOrder("20181121110700");

        List<SerApplyCodeTemplate> listTemp = templateService.findCodeVoList(condition);

        System.out.println(JSONObject.toJSONString(listTemp));*/




        /*String a1 = "http://9suyuan.com/6/AvWaM3SNYH/11";

        String leftCodeFlag =a1.split("/")[5];
        System.out.println(leftCodeFlag);


        List<String> tableList = mapper.selectCodeTableList(leftCodeFlag);
        System.out.println(JSONObject.toJSONString(tableList));
        String aa = StringUtils.join(tableList, ",");
        System.out.println(aa);*/

       /*
        http://9suyuan.com/6/p2Vp4UeRMYlx/11
        http://9suyuan.com/6/aksCLdcAsghf/11
        http://9suyuan.com/6/HOcFZwe5VPfp/11
        http://9suyuan.com/6/1H7n9Ypxgb7h/11
        http://9suyuan.com/6/hr7lqVkC1yBP/11
        http://9suyuan.com/6/Ngc3CZbe7L/11
        http://9suyuan.com/6/yR4kMMaSU0/11
        http://9suyuan.com/6/5XKBhLNQ7X/11
        http://9suyuan.com/6/pzTuoHh9od/11
        http://9suyuan.com/6/fNtEDOXM9V/11
        http://9suyuan.com/6/Qpqbiep5xCJ8/11
        http://9suyuan.com/6/PosaqtmVu8WC/11
        http://9suyuan.com/6/wT7PxlpLeUEB/11
        http://9suyuan.com/6/aUuRBHcgfmON/11
        http://9suyuan.com/6/IYxSaKgzxrDo/11*/

        //溯源码位置
        Long codePosition = 1L;
        //溯源码位置类型
        Long codePositionType = 1L;

        List<ReadFileBackData> fileList = new ArrayList<>();
        ReadFileBackData data1 = new ReadFileBackData();
        data1.setLData("http://9suyuan.com/6/p2Vp4UeRMYlx/11");
        ReadFileBackData data2 = new ReadFileBackData();
        data2.setLData("http://9suyuan.com/6/Ngc3CZbe7L/11");
        ReadFileBackData data3 = new ReadFileBackData();
        data3.setLData("http://9suyuan.com/6/HOcFZwe5VPfp/11");
        ReadFileBackData data4 = new ReadFileBackData();
        data4.setLData("http://9suyuan.com/6/1H7n9Ypxgb7h/11");
        ReadFileBackData data5 = new ReadFileBackData();
        data5.setLData("http://9suyuan.com/6/hr7lqVkC1yBP/11");
        fileList.add(data1);
        fileList.add(data2);
        fileList.add(data3);
        fileList.add(data4);
        fileList.add(data5);


        //校验左码是否符合
        for(ReadFileBackData data : fileList){
            String leftCodeFlag = data.getLData().split("/")[5];
            //查询溯源码所在表
            String codeTables = tableInfoService.findCodeTableList(leftCodeFlag);
            //溯源码内容
            String codeContent = data.getLData();
            //溯源码
            SerApplyCodeTemplate code = codeTemplateService.findCodeByTables(codeTables, codeContent);
            System.out.println(JSONObject.toJSONString(code));
            System.out.println(code.getCodePosition()+"----"+ code.getCodePositionType());

            if(code.getCodePosition()!=codePosition && code.getCodePositionType()!=codePositionType){
                System.out.println("错误提示：no");
            }else{
                System.out.println("继续运行：yes");
            }

        }





/*
        try {
            BufferedWriter bw = new BufferedWriter(new FileWriter("/Users/kaider/temp/WorkLog/qrcode/a.txt"));
            for (SerApplyCodeTemplate s : listTemp) {
                bw.write(s.getCodeContent()+"\r");
                bw.newLine();
                bw.flush();
            }
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
*/


        /*String contents="6901236341292";
        int width = 200, height = 100;

        encodeBarCode(contents,width, height, "/Users/kaider/temp/WorkLog/qrcode/b.png");


        String path = "/Users/kaider/temp/WorkLog/qrcode/barcode.png";
        generateFile(contents, path);*/


    }

}
