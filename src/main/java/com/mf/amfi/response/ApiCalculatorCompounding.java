package com.mf.amfi.response;


public class ApiCalculatorCompounding {
	
	public Integer status;
	public String status_msg;
	public String msg;
    private long principal_amount;
    private Double interest_rate;
    private Integer period;
    private String compound_interval;
    private long maturity_amount;
    
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
	public long getPrincipal_amount() {
		return principal_amount;
	}
	public void setPrincipal_amount(long principal_amount) {
		this.principal_amount = principal_amount;
	}
	public Double getInterest_rate() {
		return interest_rate;
	}
	public void setInterest_rate(Double interest_rate) {
		this.interest_rate = interest_rate;
	}
	public Integer getPeriod() {
		return period;
	}
	public void setPeriod(Integer period) {
		this.period = period;
	}
	public String getCompound_interval() {
		return compound_interval;
	}
	public void setCompound_interval(String compound_interval) {
		this.compound_interval = compound_interval;
	}
	public long getMaturity_amount() {
		return maturity_amount;
	}
	public void setMaturity_amount(long maturity_amount) {
		this.maturity_amount = maturity_amount;
	}
}
