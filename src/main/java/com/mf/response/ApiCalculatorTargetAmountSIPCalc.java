package com.mf.response;


public class ApiCalculatorTargetAmountSIPCalc {
	
	public Integer status;
	public String status_msg;
	public String msg;
    private long wealth_amount;
    private Double inflation_rate;
    private Double expected_return;
    private Integer period;
    private long target_wealth;
    private long sip_amount;
    private long invested_amount;
    private long growth_amount;
    
    
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
	public long getWealth_amount() {
		return wealth_amount;
	}
	public void setWealth_amount(long wealth_amount) {
		this.wealth_amount = wealth_amount;
	}
	public Double getInflation_rate() {
		return inflation_rate;
	}
	public void setInflation_rate(Double inflation_rate) {
		this.inflation_rate = inflation_rate;
	}
	public Double getExpected_return() {
		return expected_return;
	}
	public void setExpected_return(Double expected_return) {
		this.expected_return = expected_return;
	}
	public Integer getPeriod() {
		return period;
	}
	public void setPeriod(Integer period) {
		this.period = period;
	}
	public long getTarget_wealth() {
		return target_wealth;
	}
	public void setTarget_wealth(long target_wealth) {
		this.target_wealth = target_wealth;
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
	public long getGrowth_amount() {
		return growth_amount;
	}
	public void setGrowth_amount(long growth_amount) {
		this.growth_amount = growth_amount;
	}
}
