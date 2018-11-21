package com.ningyang.os;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ningyang.os.pojo.SysApiInfo;
import com.ningyang.os.service.ISysApiInfoService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class NodeOsApplicationTests {

    @Autowired
    private ISysApiInfoService infoService;

    @Test
    public void contextLoads() {

        List<SysApiInfo> listTemp = infoService.list(null);
        System.out.println(JSONObject.toJSONString(listTemp));
        if (listTemp.size() > 0) {
            System.out.println("ok");
        } else {
            System.out.println("no");
        }
    }

}
