package com.ningyang.os;

import com.alibaba.fastjson.JSONObject;
import com.ningyang.os.action.config.SystemConfig;
import com.ningyang.os.action.input.condition.serve.QueryApplyCodeCondition;
import com.ningyang.os.pojo.SerApplyCodeTemplate;
import com.ningyang.os.service.ISerApplyCodeTemplateService;
import com.ningyang.os.service.ISysApiInfoService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class NodeOsApplicationTests {

    @Autowired
    private ISysApiInfoService infoService;
    @Autowired
    private SystemConfig config;
    @Autowired
    private ISerApplyCodeTemplateService templateService;

    @Test
    public void contextLoads() {

        /*List<SysApiInfo> listTemp = infoService.list(null);
        System.out.println(JSONObject.toJSONString(listTemp));*/

        QueryApplyCodeCondition condition = new QueryApplyCodeCondition();
        condition.setTableName("201811");
        condition.setCodeOrder("20181121110700");

        List<SerApplyCodeTemplate> listTemp = templateService.findCodeVoList(condition);

        System.out.println(JSONObject.toJSONString(listTemp));




        String a1 = "http://9suyuan.com/6/xTo6eIdRtF";
        String a2 = "http://9suyuan.com/6/jOU2ybq01EDc";
        String a3 = "6000001929016127";



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
