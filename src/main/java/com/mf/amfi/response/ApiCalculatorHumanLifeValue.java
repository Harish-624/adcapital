package com.mf.amfi.response;


public class ApiCalculatorHumanLifeValue {
	
	public Integer status;
	public String status_msg;
	public String msg;
    private long annual_income_expense;
    private Double expected_increase_income_expense;
    private long loan_amount;
    private long cumulative_income_expense;
    private long life_cover_value;
    
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
	public long getAnnual_income_expense() {
		return annual_income_expense;
	}
	public void setAnnual_income_expense(long annual_income_expense) {
		this.annual_income_expense = annual_income_expense;
	}
	public Double getExpected_increase_income_expense() {
		return expected_increase_income_expense;
	}
	public void setExpected_increase_income_expense(Double expected_increase_income_expense) {
		this.expected_increase_income_expense = expected_increase_income_expense;
	}
	public long getLoan_amount() {
		return loan_amount;
	}
	public void setLoan_amount(long loan_amount) {
		this.loan_amount = loan_amount;
	}
	public long getCumulative_income_expense() {
		return cumulative_income_expense;
	}
	public void setCumulative_income_expense(long cumulative_income_expense) {
		this.cumulative_income_expense = cumulative_income_expense;
	}
	public long getLife_cover_value() {
		return life_cover_value;
	}
	public void setLife_cover_value(long life_cover_value) {
		this.life_cover_value = life_cover_value;
	}
}
