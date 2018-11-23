package com.ningyang.os.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.action.utils.ReadFileBackData;
import com.ningyang.os.pojo.SerCodeImportTempInfo;
import com.ningyang.os.dao.SerCodeImportTempInfoMapper;
import com.ningyang.os.pojo.SerCodeImportTemplateInfo;
import com.ningyang.os.service.ISerCodeImportTempInfoService;
import com.ningyang.os.service.ISerCodeImportTemplateInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 溯源码导入临时表 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-23
 */
@Service
public class SerCodeImportTempInfoServiceImpl extends ServiceImpl<SerCodeImportTempInfoMapper, SerCodeImportTempInfo> implements ISerCodeImportTempInfoService {

    @Autowired
    private ISerCodeImportTemplateInfoService templateInfoService;

//    private

    @Override
    public boolean add(List<ReadFileBackData> listData, Long templateId) {
        //获取模板信息
        SerCodeImportTemplateInfo templateInfo = templateInfoService.getById(templateId);
        List<SerCodeImportTempInfo> listTemp = getCodeInfo(listData,templateInfo);
        System.out.println(JSONObject.toJSONString(listTemp));
        return false;
    }


    private List<SerCodeImportTempInfo> getCodeInfo(List<ReadFileBackData> listData, SerCodeImportTemplateInfo templateInfo){
        List<SerCodeImportTempInfo> listTemp = new ArrayList<>();
        for(ReadFileBackData data : listData){
            SerCodeImportTempInfo info = new SerCodeImportTempInfo();
            info.setTemplateId(templateInfo.getId());
            info.setLeftCode(data.getLData());
            info.setRightCode(data.getRData());


        }


        return listTemp;
    }

}
