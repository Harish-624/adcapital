package com.mf.response;


public class ApiCalculatorLumpsumTarget {
	
	public Integer status;
	public String status_msg;
	public String msg;
    private long target_amount;
    private Double expected_return;
    private Integer years;
    private long lumpsum_amount;
    
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
	public long getTarget_amount() {
		return target_amount;
	}
	public void setTarget_amount(long target_amount) {
		this.target_amount = target_amount;
	}
	public Double getExpected_return() {
		return expected_return;
	}
	public void setExpected_return(Double expected_return) {
		this.expected_return = expected_return;
	}
	public Integer getYears() {
		return years;
	}
	public void setYears(Integer years) {
		this.years = years;
	}
	public long getLumpsum_amount() {
		return lumpsum_amount;
	}
	public void setLumpsum_amount(long lumpsum_amount) {
		this.lumpsum_amount = lumpsum_amount;
	}
}
