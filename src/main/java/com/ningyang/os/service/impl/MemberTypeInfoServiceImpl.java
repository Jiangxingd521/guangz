package com.ningyang.os.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ningyang.os.pojo.MemberTypeInfo;
import com.ningyang.os.dao.MemberTypeInfoMapper;
import com.ningyang.os.service.IMemberTypeInfoService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 会员类型 服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-29
 */
@Service
public class MemberTypeInfoServiceImpl extends ServiceImpl<MemberTypeInfoMapper, MemberTypeInfo> implements IMemberTypeInfoService {

}
