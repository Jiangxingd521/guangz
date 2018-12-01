package com.ningyang.os.controller.wechat;

import com.ningyang.os.wechat.WechatSignture;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/wechat")
public class IndexController {
    private static final Logger LOGGER = LoggerFactory.getLogger(IndexController.class);


    /***
     * 确认请求来自微信服务器
     * @return
     */
    @GetMapping("signture")
    public void  getErpDatas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        WechatSignture.doWechatSignture(request, response);
    }



}
