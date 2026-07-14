package com.mf.response;


public class ApiCalculatorEMI {
	
	public Integer status;
	public String status_msg;
	public String msg;
    private long loan_amount;
    private Double interest_rate;
    private String loan_tenure_type;
    private Double loan_tenure;
    private long emi;
    private long total_interest;
    private long total_amount;
    
    
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
	public long getLoan_amount() {
		return loan_amount;
	}
	public void setLoan_amount(long loan_amount) {
		this.loan_amount = loan_amount;
	}
	public Double getInterest_rate() {
		return interest_rate;
	}
	public void setInterest_rate(Double interest_rate) {
		this.interest_rate = interest_rate;
	}
	public String getLoan_tenure_type() {
		return loan_tenure_type;
	}
	public void setLoan_tenure_type(String loan_tenure_type) {
		this.loan_tenure_type = loan_tenure_type;
	}
	public Double getLoan_tenure() {
		return loan_tenure;
	}
	public void setLoan_tenure(Double loan_tenure) {
		this.loan_tenure = loan_tenure;
	}
	public long getEmi() {
		return emi;
	}
	public void setEmi(long emi) {
		this.emi = emi;
	}
	public long getTotal_interest() {
		return total_interest;
	}
	public void setTotal_interest(long total_interest) {
		this.total_interest = total_interest;
	}
	public long getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(long total_amount) {
		this.total_amount = total_amount;
	}
}
