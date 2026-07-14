package com.mf.amfi.response;

import java.util.List;

import com.mf.response.ApiCalculatorSIPStepUpTable;


public class ApiCalculatorGoalBasedTopupSIP {
	
	public Integer status;
	public String status_msg;
	public String msg;
    private long goal_amount;
    private Double expected_rate_of_return;
    private Integer investment_period;
    private Integer sip_topup_value;
    private long sip_amount;
    private long invested_amount;
    private long growth_value;
    private long maturity_amount;
    private List<ApiCalculatorSIPStepUpTable> list;
    
    
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getStatus_msg() {
		return status_msg;
	}
	public void setStatus_msg(String status_msg) {
		this.status_msg = status_msg;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public long getGoal_amount() {
		return goal_amount;
	}
	public void setGoal_amount(long goal_amount) {
		this.goal_amount = goal_amount;
	}
	public Double getExpected_rate_of_return() {
		return expected_rate_of_return;
	}
	public void setExpected_rate_of_return(Double expected_rate_of_return) {
		this.expected_rate_of_return = expected_rate_of_return;
	}
	public Integer getInvestment_period() {
		return investment_period;
	}
	public void setInvestment_period(Integer investment_period) {
		this.investment_period = investment_period;
	}
	public Integer getSip_topup_value() {
		return sip_topup_value;
	}
	public void setSip_topup_value(Integer sip_topup_value) {
		this.sip_topup_value = sip_topup_value;
	}
	public long getSip_amount() {
		return sip_amount;
	}
	public void setSip_amount(long sip_amount) {
		this.sip_amount = sip_amount;
	}
	public long getInvested_amount() {
		return invested_amount;
	}
	public void setInvested_amount(long invested_amount) {
		this.invested_amount = invested_amount;
	}
	public long getGrowth_value() {
		return growth_value;
	}
	public void setGrowth_value(long growth_value) {
		this.growth_value = growth_value;
	}
	public long getMaturity_amount() {
		return maturity_amount;
	}
	public void setMaturity_amount(long maturity_amount) {
		this.maturity_amount = maturity_amount;
	}
	public List<ApiCalculatorSIPStepUpTable> getList() {
		return list;
	}
	public void setList(List<ApiCalculatorSIPStepUpTable> list) {
		this.list = list;
	}
}
