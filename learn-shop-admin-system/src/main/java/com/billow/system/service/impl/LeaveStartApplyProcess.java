package com.billow.system.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.billow.system.pojo.ex.LeaveEx;
import com.billow.system.pojo.po.ApplyInfoPo;
import com.billow.system.service.StartApplyProcess;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * 请假申请流程启动回调
 *
 * @author liuyongtao
 * @create 2019-09-02 17:37
 */
@Slf4j
@Service
public class LeaveStartApplyProcess implements StartApplyProcess<LeaveEx> {

    @Override
    public String genApplyData(LeaveEx leaveEx) {
        Map<String, Object> variables = this.startProcessBefore(leaveEx);
        return JSONObject.toJSONString(variables);
    }

    @Override
    public Map<String, Object> startProcessBefore(LeaveEx leaveEx) {
        Map<String, Object> variables = new HashMap<>();
        variables.put("startDate", leaveEx.getStartDate());
        variables.put("endDate", leaveEx.getEndDate());
        variables.put("reason", leaveEx.getReason());
        variables.put("submitType", leaveEx.getSubmitType());
        return variables;
    }

    @Override
    public void startProcessAfter(ApplyInfoPo applyInfoPo) {
        log.info("LeaveStartApplyProcess.startProcessAfter");
    }
}
