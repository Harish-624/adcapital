package com.mf.response;

import java.util.Date;

public class ApiBankInfo {
	
	private String bank_name;
	private String bank_code;
	private String bank_mode;
	private String bank_branch;
	private String bank_address;
	private String bank_account_number;
	private String bank_account_holder_name;
	private String bank_account_type;
	private String bank_ifsc_code;
	private String bank_micr_code;
	private String default_bank;
	
	private Integer isip_otm_flag;
	private String isip_otm;
	private Integer isip_otm_approved;
	private Date isip_otm_created_date;
	
	private Integer xsip_otm_flag;
	private String xsip_otm;
	private Integer xsip_otm_approved;
	private Date xsip_otm_created_date;
	
	private Integer emandate_otm_flag;
	private String emandate_otm;
	private Integer emandate_otm_approved;
	private Date emandate_otm_created_date;
	
	private Integer nse_ach_flag = 0;
	private String nse_ach = "";
	private String nse_ach_amount = "";
	private Integer nse_ach_approved = 0;
	private Date nse_ach_created_date;
	
	
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getBank_code() {
		return bank_code;
	}
	public void setBank_code(String bank_code) {
		this.bank_code = bank_code;
	}
	public String getBank_mode() {
		return bank_mode;
	}
	public void setBank_mode(String bank_mode) {
		this.bank_mode = bank_mode;
	}
	public String getBank_branch() {
		return bank_branch;
	}
	public void setBank_branch(String bank_branch) {
		this.bank_branch = bank_branch;
	}
	public String getBank_address() {
		return bank_address;
	}
	public void setBank_address(String bank_address) {
		this.bank_address = bank_address;
	}
	public String getBank_account_number() {
		return bank_account_number;
	}
	public void setBank_account_number(String bank_account_number) {
		this.bank_account_number = bank_account_number;
	}
	public String getBank_account_holder_name() {
		return bank_account_holder_name;
	}
	public void setBank_account_holder_name(String bank_account_holder_name) {
		this.bank_account_holder_name = bank_account_holder_name;
	}
	public String getBank_account_type() {
		return bank_account_type;
	}
	public void setBank_account_type(String bank_account_type) {
		this.bank_account_type = bank_account_type;
	}
	public String getBank_ifsc_code() {
		return bank_ifsc_code;
	}
	public void setBank_ifsc_code(String bank_ifsc_code) {
		this.bank_ifsc_code = bank_ifsc_code;
	}
	public String getBank_micr_code() {
		return bank_micr_code;
	}
	public void setBank_micr_code(String bank_micr_code) {
		this.bank_micr_code = bank_micr_code;
	}
	public String getDefault_bank() {
		return default_bank;
	}
	public void setDefault_bank(String default_bank) {
		this.default_bank = default_bank;
	}
	public Integer getIsip_otm_flag() {
		return isip_otm_flag;
	}
	public void setIsip_otm_flag(Integer isip_otm_flag) {
		this.isip_otm_flag = isip_otm_flag;
	}
	public String getIsip_otm() {
		return isip_otm;
	}
	public void setIsip_otm(String isip_otm) {
		this.isip_otm = isip_otm;
	}
	public Integer getIsip_otm_approved() {
		return isip_otm_approved;
	}
	public void setIsip_otm_approved(Integer isip_otm_approved) {
		this.isip_otm_approved = isip_otm_approved;
	}
	public Date getIsip_otm_created_date() {
		return isip_otm_created_date;
	}
	public void setIsip_otm_created_date(Date isip_otm_created_date) {
		this.isip_otm_created_date = isip_otm_created_date;
	}
	public Integer getXsip_otm_flag() {
		return xsip_otm_flag;
	}
	public void setXsip_otm_flag(Integer xsip_otm_flag) {
		this.xsip_otm_flag = xsip_otm_flag;
	}
	public String getXsip_otm() {
		return xsip_otm;
	}
	public void setXsip_otm(String xsip_otm) {
		this.xsip_otm = xsip_otm;
	}
	public Integer getXsip_otm_approved() {
		return xsip_otm_approved;
	}
	public void setXsip_otm_approved(Integer xsip_otm_approved) {
		this.xsip_otm_approved = xsip_otm_approved;
	}
	public Date getXsip_otm_created_date() {
		return xsip_otm_created_date;
	}
	public void setXsip_otm_created_date(Date xsip_otm_created_date) {
		this.xsip_otm_created_date = xsip_otm_created_date;
	}
	public Integer getEmandate_otm_flag() {
		return emandate_otm_flag;
	}
	public void setEmandate_otm_flag(Integer emandate_otm_flag) {
		this.emandate_otm_flag = emandate_otm_flag;
	}
	public String getEmandate_otm() {
		return emandate_otm;
	}
	public void setEmandate_otm(String emandate_otm) {
		this.emandate_otm = emandate_otm;
	}
	public Integer getEmandate_otm_approved() {
		return emandate_otm_approved;
	}
	public void setEmandate_otm_approved(Integer emandate_otm_approved) {
		this.emandate_otm_approved = emandate_otm_approved;
	}
	public Date getEmandate_otm_created_date() {
		return emandate_otm_created_date;
	}
	public void setEmandate_otm_created_date(Date emandate_otm_created_date) {
		this.emandate_otm_created_date = emandate_otm_created_date;
	}
	public Integer getNse_ach_flag() {
		return nse_ach_flag;
	}
	public void setNse_ach_flag(Integer nse_ach_flag) {
		this.nse_ach_flag = nse_ach_flag;
	}
	public String getNse_ach() {
		return nse_ach;
	}
	public void setNse_ach(String nse_ach) {
		this.nse_ach = nse_ach;
	}
	public Integer getNse_ach_approved() {
		return nse_ach_approved;
	}
	public void setNse_ach_approved(Integer nse_ach_approved) {
		this.nse_ach_approved = nse_ach_approved;
	}
	public Date getNse_ach_created_date() {
		return nse_ach_created_date;
	}
	public void setNse_ach_created_date(Date nse_ach_created_date) {
		this.nse_ach_created_date = nse_ach_created_date;
	}
	public String getNse_ach_amount() {
		return nse_ach_amount;
	}
	public void setNse_ach_amount(String nse_ach_amount) {
		this.nse_ach_amount = nse_ach_amount;
	}
}
