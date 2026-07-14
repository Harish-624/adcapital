package com.mf.response;

import java.util.Date;


public class InvestorSIPMasterResponse 
{
	Integer user_id;
    String investor_name;
    String pan;
    String product_code;
    String amc_name;
    String amc_short_name;
    String scheme_name;
    String to_scheme_name;
    String folio;
    String reg_date;
    String start_date;
    String end_date;
    String closed_date;
	String auto_debit_date;
	Double amount;
	String amount_str;
	String remarks;
	Double top_up_amount;
	String bank;
	String branch;
	String cheque_micr;
	String status;
	Date dueDate;
	String due_date;
	String sip_flag;
	String email;
	String mobile;
	String user_branch;
	String rm_name;
	String subbroker_name;
	String client_name;
	Double current_cost = 0.0;
	Double current_value = 0.0;
	Double xirr = 0.0;
	String logo;
	Double amc_sip_per = 0.0;
	
	public String getInvestor_name() {
		return investor_name;
	}
	public void setInvestor_name(String investor_name) {
		this.investor_name = investor_name;
	}
	public String getPan() {
		return pan;
	}
	public void setPan(String pan) {
		this.pan = pan;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getScheme_name() {
		return scheme_name;
	}
	public void setScheme_name(String scheme_name) {
		this.scheme_name = scheme_name;
	}
	public String getFolio() {
		return folio;
	}
	public void setFolio(String folio) {
		this.folio = folio;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getClosed_date() {
		return closed_date;
	}
	public void setClosed_date(String closed_date) {
		this.closed_date = closed_date;
	}
	public String getAuto_debit_date() {
		return auto_debit_date;
	}
	public void setAuto_debit_date(String auto_debit_date) {
		this.auto_debit_date = auto_debit_date;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Double getTop_up_amount() {
		return top_up_amount;
	}
	public void setTop_up_amount(Double top_up_amount) {
		this.top_up_amount = top_up_amount;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getCheque_micr() {
		return cheque_micr;
	}
	public void setCheque_micr(String cheque_micr) {
		this.cheque_micr = cheque_micr;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	public String getDue_date() {
		return due_date;
	}
	public void setDue_date(String due_date) {
		this.due_date = due_date;
	}
	public String getSip_flag() {
		return sip_flag;
	}
	public void setSip_flag(String sip_flag) {
		this.sip_flag = sip_flag;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getUser_branch() {
		return user_branch;
	}
	public void setUser_branch(String user_branch) {
		this.user_branch = user_branch;
	}
	public String getRm_name() {
		return rm_name;
	}
	public void setRm_name(String rm_name) {
		this.rm_name = rm_name;
	}
	public String getSubbroker_name() {
		return subbroker_name;
	}
	public void setSubbroker_name(String subbroker_name) {
		this.subbroker_name = subbroker_name;
	}
	public Double getCurrent_cost() {
		return current_cost;
	}
	public void setCurrent_cost(Double current_cost) {
		this.current_cost = current_cost;
	}
	public Double getCurrent_value() {
		return current_value;
	}
	public void setCurrent_value(Double current_value) {
		this.current_value = current_value;
	}
	public Double getXirr() {
		return xirr;
	}
	public void setXirr(Double xirr) {
		this.xirr = xirr;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getTo_scheme_name() {
		return to_scheme_name;
	}
	public void setTo_scheme_name(String to_scheme_name) {
		this.to_scheme_name = to_scheme_name;
	}
	public String getAmount_str() {
		return amount_str;
	}
	public void setAmount_str(String amount_str) {
		this.amount_str = amount_str;
	}
	public String getAmc_name() {
		return amc_name;
	}
	public void setAmc_name(String amc_name) {
		this.amc_name = amc_name;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public Double getAmc_sip_per() {
		return amc_sip_per;
	}
	public void setAmc_sip_per(Double amc_sip_per) {
		this.amc_sip_per = amc_sip_per;
	}
	public String getAmc_short_name() {
		return amc_short_name;
	}
	public void setAmc_short_name(String amc_short_name) {
		this.amc_short_name = amc_short_name;
	}	
}
