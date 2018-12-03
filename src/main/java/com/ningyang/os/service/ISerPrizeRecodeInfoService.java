package com.ningyang.os.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ningyang.os.action.input.command.web.serve.PrizeSetLogCommand;
import com.ningyang.os.pojo.SerPrizeRecodeInfo;

/**
 * <p>
 * 布奖记录 服务类
 * </p>
 *
 * @author kaider
 * @since 2018-11-29
 */
public interface ISerPrizeRecodeInfoService extends IService<SerPrizeRecodeInfo> {



    boolean addOrUpdate(PrizeSetLogCommand command, Long userId);

}
