package com.mf.response;

public class TransactionReportResponse 
{

	private Integer id;
	private String investor_name;
	private String investor_pan;
	private String folio_number;
	private String scheme_name;
	private String units;
	private String amount;
	private String transaction_date;
	private String transaction_type;
	private String nav;
	private String amc_name;
	private String branch;
	private String rm_name;
	private String subbroker_name;
	private String reg_date;
	private String start_date;
	private String frequency;
	private String sip_date;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFolio_number() {
		return folio_number;
	}
	public void setFolio_number(String folio_number) {
		this.folio_number = folio_number;
	}
	public String getScheme_name() {
		return scheme_name;
	}
	public void setScheme_name(String scheme_name) {
		this.scheme_name = scheme_name;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getUnits() {
		return units;
	}
	public void setUnits(String units) {
		this.units = units;
	}
	public String getInvestor_name() {
		return investor_name;
	}
	public void setInvestor_name(String investor_name) {
		this.investor_name = investor_name;
	}
	public String getInvestor_pan() {
		return investor_pan;
	}
	public void setInvestor_pan(String investor_pan) {
		this.investor_pan = investor_pan;
	}
	public String getTransaction_date() {
		return transaction_date;
	}
	public void setTransaction_date(String transaction_date) {
		this.transaction_date = transaction_date;
	}
	public String getTransaction_type() {
		return transaction_type;
	}
	public void setTransaction_type(String transaction_type) {
		this.transaction_type = transaction_type;
	}
	public String getNav() {
		return nav;
	}
	public void setNav(String nav) {
		this.nav = nav;
	}
	public String getAmc_name() {
		return amc_name;
	}
	public void setAmc_name(String amc_name) {
		this.amc_name = amc_name;
	}
	public String getRm_name() {
		return rm_name;
	}
	public void setRm_name(String rm_name) {
		this.rm_name = rm_name;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getSubbroker_name() {
		return subbroker_name;
	}
	public void setSubbroker_name(String subbroker_name) {
		this.subbroker_name = subbroker_name;
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
	public String getFrequency() {
		return frequency;
	}
	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}
	public String getSip_date() {
		return sip_date;
	}
	public void setSip_date(String sip_date) {
		this.sip_date = sip_date;
	}
}
