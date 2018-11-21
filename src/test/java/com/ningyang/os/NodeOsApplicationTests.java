package com.ningyang.os;

import com.alibaba.fastjson.JSONObject;
import com.ningyang.os.action.config.SystemConfig;
import com.ningyang.os.pojo.SysApiInfo;
import com.ningyang.os.service.ISysApiInfoService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static com.ningyang.os.action.utils.BarcodeUtil.generateFile;
import static com.ningyang.os.action.utils.QRCodeUtil.encodeBarCode;

@RunWith(SpringRunner.class)
@SpringBootTest
public class NodeOsApplicationTests {

    @Autowired
    private ISysApiInfoService infoService;
    @Autowired
    private SystemConfig config;

    @Test
    public void contextLoads() {

        /*List<SysApiInfo> listTemp = infoService.list(null);
        System.out.println(JSONObject.toJSONString(listTemp));
        if (listTemp.size() > 0) {
            System.out.println("ok");
        } else {
            System.out.println("no");
        }
*/
        String contents="6901236341292";
        int width = 200, height = 100;

        encodeBarCode(contents,width, height, "/Users/kaider/temp/WorkLog/qrcode/b.png");


        String path = "/Users/kaider/temp/WorkLog/qrcode/barcode.png";
        generateFile(contents, path);


    }

}
