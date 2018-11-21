package com.ningyang.os.action.input.command.web.serve;

import com.ningyang.os.action.input.command.base.ApiCommand;
import com.ningyang.os.action.output.dto.serve.CenterCodeDto;

import java.util.List;

/**
 * @Author： kaider
 * @Date：2018/11/20 12:06
 * @描述：溯源码
 */
public class CenterCodeCommand extends ApiCommand {
    //申请状态
    private int applyState;
    //码订单
    private String codeOrder;
    //溯源码
    private List<CenterCodeDto> codeVoList;

    public int getApplyState() {
        return applyState;
    }

    public void setApplyState(int applyState) {
        this.applyState = applyState;
    }

    public String getCodeOrder() {
        return codeOrder;
    }

    public void setCodeOrder(String codeOrder) {
        this.codeOrder = codeOrder;
    }

    public List<CenterCodeDto> getCodeVoList() {
        return codeVoList;
    }

    public void setCodeVoList(List<CenterCodeDto> codeVoList) {
        this.codeVoList = codeVoList;
    }
}
