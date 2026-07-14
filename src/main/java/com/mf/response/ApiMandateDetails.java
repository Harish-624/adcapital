package com.mf.response;


public class ApiMandateDetails {
	
	public String bank_name;
	public String bank_account_number;
	public String mandate_type;
	public Integer mandate_flag;
	public String mandate_id;
	public String mandate_amount;
	public Integer mandate_approved;
	public String default_bank;
	
	
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getBank_account_number() {
		return bank_account_number;
	}
	public void setBank_account_number(String bank_account_number) {
		this.bank_account_number = bank_account_number;
	}
	public String getMandate_type() {
		return mandate_type;
	}
	public void setMandate_type(String mandate_type) {
		this.mandate_type = mandate_type;
	}
	public String getMandate_id() {
		return mandate_id;
	}
	public void setMandate_id(String mandate_id) {
		this.mandate_id = mandate_id;
	}
	public Integer getMandate_approved() {
		return mandate_approved;
	}
	public void setMandate_approved(Integer mandate_approved) {
		this.mandate_approved = mandate_approved;
	}
	public String getDefault_bank() {
		return default_bank;
	}
	public void setDefault_bank(String default_bank) {
		this.default_bank = default_bank;
	}
	public Integer getMandate_flag() {
		return mandate_flag;
	}
	public void setMandate_flag(Integer mandate_flag) {
		this.mandate_flag = mandate_flag;
	}
	public String getMandate_amount() {
		return mandate_amount;
	}
	public void setMandate_amount(String mandate_amount) {
		this.mandate_amount = mandate_amount;
	}
}
