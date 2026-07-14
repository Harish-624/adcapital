package com.mf.response;


public class ApiCalculatorFutureValue {
	
	public Integer status;
	public String status_msg;
	public String msg;
    private long current_cost;
    private Double inflation_rate;
    private Integer no_years;
    private long future_amount;
    
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
	public long getCurrent_cost() {
		return current_cost;
	}
	public void setCurrent_cost(long current_cost) {
		this.current_cost = current_cost;
	}
	public Double getInflation_rate() {
		return inflation_rate;
	}
	public void setInflation_rate(Double inflation_rate) {
		this.inflation_rate = inflation_rate;
	}
	public Integer getNo_years() {
		return no_years;
	}
	public void setNo_years(Integer no_years) {
		this.no_years = no_years;
	}
	public long getFuture_amount() {
		return future_amount;
	}
	public void setFuture_amount(long future_amount) {
		this.future_amount = future_amount;
	}
}
