package com.ningyang.os.service.impl;

import com.ningyang.os.pojo.MemberInfo;
import com.ningyang.os.dao.MemberInfoMapper;
import com.ningyang.os.service.IMemberInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author kaider
 * @since 2018-11-26
 */
@Service
public class MemberInfoServiceImpl extends ServiceImpl<MemberInfoMapper, MemberInfo> implements IMemberInfoService {

}
