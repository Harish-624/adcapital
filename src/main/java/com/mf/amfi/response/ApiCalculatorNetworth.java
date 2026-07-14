package com.mf.amfi.response;


public class ApiCalculatorNetworth {
	
	public Integer status;
	public String status_msg;
	public String msg;
    private long shares_equity_value;
    private long fixed_income_value;
    private long cash_value;
    private long property_value;
    private long gold_value;
    private long other_assets_value;
    private long home_loan_value;
    private long personal_other_loan_value;
    private long income_tax_value;
    private long outstanding_bill_value;
    private long credit_card_due_value;
    private long other_liabilities_value;
    private long total_assets;
    private long total_liabillities;
    private long total_networth;
    
    
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
	public long getShares_equity_value() {
		return shares_equity_value;
	}
	public void setShares_equity_value(long shares_equity_value) {
		this.shares_equity_value = shares_equity_value;
	}
	public long getFixed_income_value() {
		return fixed_income_value;
	}
	public void setFixed_income_value(long fixed_income_value) {
		this.fixed_income_value = fixed_income_value;
	}
	public long getCash_value() {
		return cash_value;
	}
	public void setCash_value(long cash_value) {
		this.cash_value = cash_value;
	}
	public long getProperty_value() {
		return property_value;
	}
	public void setProperty_value(long property_value) {
		this.property_value = property_value;
	}
	public long getGold_value() {
		return gold_value;
	}
	public void setGold_value(long gold_value) {
		this.gold_value = gold_value;
	}
	public long getOther_assets_value() {
		return other_assets_value;
	}
	public void setOther_assets_value(long other_assets_value) {
		this.other_assets_value = other_assets_value;
	}
	public long getHome_loan_value() {
		return home_loan_value;
	}
	public void setHome_loan_value(long home_loan_value) {
		this.home_loan_value = home_loan_value;
	}
	public long getPersonal_other_loan_value() {
		return personal_other_loan_value;
	}
	public void setPersonal_other_loan_value(long personal_other_loan_value) {
		this.personal_other_loan_value = personal_other_loan_value;
	}
	public long getIncome_tax_value() {
		return income_tax_value;
	}
	public void setIncome_tax_value(long income_tax_value) {
		this.income_tax_value = income_tax_value;
	}
	public long getOutstanding_bill_value() {
		return outstanding_bill_value;
	}
	public void setOutstanding_bill_value(long outstanding_bill_value) {
		this.outstanding_bill_value = outstanding_bill_value;
	}
	public long getCredit_card_due_value() {
		return credit_card_due_value;
	}
	public void setCredit_card_due_value(long credit_card_due_value) {
		this.credit_card_due_value = credit_card_due_value;
	}
	public long getOther_liabilities_value() {
		return other_liabilities_value;
	}
	public void setOther_liabilities_value(long other_liabilities_value) {
		this.other_liabilities_value = other_liabilities_value;
	}
	public long getTotal_assets() {
		return total_assets;
	}
	public void setTotal_assets(long total_assets) {
		this.total_assets = total_assets;
	}
	public long getTotal_liabillities() {
		return total_liabillities;
	}
	public void setTotal_liabillities(long total_liabillities) {
		this.total_liabillities = total_liabillities;
	}
	public long getTotal_networth() {
		return total_networth;
	}
	public void setTotal_networth(long total_networth) {
		this.total_networth = total_networth;
	}
}
