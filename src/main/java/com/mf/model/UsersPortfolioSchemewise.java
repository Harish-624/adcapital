package com.mf.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "users_portfolio_schemewise")
public class UsersPortfolioSchemewise 
{
	private Integer id;
	private String name;
	private String pan;
	private Integer user_id;
	private String amc_code;
	private String amc_name;
	private String folio_no;
	private String branch;
	private String rm_name;
	private String super_subbroker_name;
	private String subbroker_name;
	private Integer type_id;
	private String scheme_category;
	private String scheme_broad_category;
	private String scheme_code;
	private String dividend_option;
	private String scheme_option_code;
	private String scheme_amfi_code;
	private String scheme_name;
	private String scheme_amfi_short_name;
	private String scheme_common;
	private Double total_units;
	private Double load_free_units;
	private Double purchase_amount;
	private Double invested_amount;
	private Double current_value;
	private Double xirr;
	private Double latest_nav;
	private Double dividend_paid = 0.0;
	private Double dividend_reinvest = 0.0;
	private Date start_date;
	private String salutation;
	private String pincode;
	private String ter_location;
	private String sip_reg_date;
	private Integer sip_flag;
	private Double sip_amount;
	private Date last_transaction_Date;
	private Integer average_days;
	private String isin;
	private String registrar;
	private String client_name;
	private String broker_code;
	private Date created_date;
	
	@Transient
	Double short_term_units;
	@Transient
	Double short_term_amount;
	@Transient
	Double long_term_units;
	@Transient
	Double long_term_amount;
	
	@Transient	
	String curr_str;
	
	@Transient
	String freeunit_str;
	
	@Transient
	String freeunitValue_str;
	
	@Transient
	String investedamt_str;
	
	@Transient
	String divident_str;
	
	@Transient
	String scheme_risk;
	
	@Transient
	String scheme_rating;
	
	@Transient
	String current_value_str;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPan() {
		return pan;
	}
	public void setPan(String pan) {
		this.pan = pan;
	}
	public Double getInvested_amount() {
		return invested_amount;
	}
	public void setInvested_amount(Double invested_amount) {
		this.invested_amount = invested_amount;
	}
	public Double getCurrent_value() {
		return current_value;
	}
	public void setCurrent_value(Double current_value) {
		this.current_value = current_value;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getAmc_name() {
		return amc_name;
	}
	public void setAmc_name(String amc_name) {
		this.amc_name = amc_name;
	}
	public String getFolio_no() {
		return folio_no;
	}
	public void setFolio_no(String folio_no) {
		this.folio_no = folio_no;
	}
	public String getScheme_code() {
		return scheme_code;
	}
	public void setScheme_code(String scheme_code) {
		this.scheme_code = scheme_code;
	}
	public String getScheme_amfi_code() {
		return scheme_amfi_code;
	}
	public void setScheme_amfi_code(String scheme_amfi_code) {
		this.scheme_amfi_code = scheme_amfi_code;
	}
	public String getScheme_name() {
		return scheme_name;
	}
	public void setScheme_name(String scheme_name) {
		this.scheme_name = scheme_name;
	}
	public Double getTotal_units() {
		return total_units;
	}
	public void setTotal_units(Double total_units) {
		this.total_units = total_units;
	}
	public Double getLatest_nav() {
		return latest_nav;
	}
	public void setLatest_nav(Double latest_nav) {
		this.latest_nav = latest_nav;
	}
	public String getSalutation() {
		return salutation;
	}
	public void setSalutation(String salutation) {
		this.salutation = salutation;
	}
	public String getAmc_code() {
		return amc_code;
	}
	public void setAmc_code(String amc_code) {
		this.amc_code = amc_code;
	}
	public String getScheme_category() {
		return scheme_category;
	}
	public void setScheme_category(String scheme_category) {
		this.scheme_category = scheme_category;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getRm_name() {
		return rm_name;
	}
	public void setRm_name(String rm_name) {
		this.rm_name = rm_name;
	}	
	public String getSuper_subbroker_name() {
		return super_subbroker_name;
	}
	public void setSuper_subbroker_name(String super_subbroker_name) {
		this.super_subbroker_name = super_subbroker_name;
	}
	public String getSubbroker_name() {
		return subbroker_name;
	}
	public void setSubbroker_name(String subbroker_name) {
		this.subbroker_name = subbroker_name;
	}
	public Double getDividend_paid() {
		return dividend_paid;
	}
	public void setDividend_paid(Double dividend_paid) {
		this.dividend_paid = dividend_paid;
	}
	public Double getDividend_reinvest() {
		return dividend_reinvest;
	}
	public void setDividend_reinvest(Double dividend_reinvest) {
		this.dividend_reinvest = dividend_reinvest;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getTer_location() {
		return ter_location;
	}
	public void setTer_location(String ter_location) {
		this.ter_location = ter_location;
	}
	public String getSip_reg_date() {
		return sip_reg_date;
	}
	public void setSip_reg_date(String sip_reg_date) {
		this.sip_reg_date = sip_reg_date;
	}
	public String getScheme_common() {
		return scheme_common;
	}
	public void setScheme_common(String scheme_common) {
		this.scheme_common = scheme_common;
	}
	public Double getXirr() {
		return xirr;
	}
	public void setXirr(Double xirr) {
		this.xirr = xirr;
	}
	public Integer getSip_flag() {
		return sip_flag;
	}
	public void setSip_flag(Integer sip_flag) {
		this.sip_flag = sip_flag;
	}
	public String getRegistrar() {
		return registrar;
	}
	public void setRegistrar(String registrar) {
		this.registrar = registrar;
	}
	@Transient
	public Double getShort_term_units() {
		return short_term_units;
	}
	public void setShort_term_units(Double short_term_units) {
		this.short_term_units = short_term_units;
	}
	@Transient
	public Double getShort_term_amount() {
		return short_term_amount;
	}
	public void setShort_term_amount(Double short_term_amount) {
		this.short_term_amount = short_term_amount;
	}
	@Transient
	public Double getLong_term_units() {
		return long_term_units;
	}
	public void setLong_term_units(Double long_term_units) {
		this.long_term_units = long_term_units;
	}
	@Transient
	public Double getLong_term_amount() {
		return long_term_amount;
	}
	public void setLong_term_amount(Double long_term_amount) {
		this.long_term_amount = long_term_amount;
	}
	public String getBroker_code() {
		return broker_code;
	}
	public void setBroker_code(String broker_code) {
		this.broker_code = broker_code;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getLast_transaction_Date() {
		return last_transaction_Date;
	}
	public void setLast_transaction_Date(Date last_transaction_Date) {
		this.last_transaction_Date = last_transaction_Date;
	}
	public Double getSip_amount() {
		return sip_amount;
	}
	public void setSip_amount(Double sip_amount) {
		this.sip_amount = sip_amount;
	}
	public Integer getType_id() {
		return type_id;
	}
	public void setType_id(Integer type_id) {
		this.type_id = type_id;
	}
	public String getScheme_amfi_short_name() {
		return scheme_amfi_short_name;
	}
	public void setScheme_amfi_short_name(String scheme_amfi_short_name) {
		this.scheme_amfi_short_name = scheme_amfi_short_name;
	}
	public Double getLoad_free_units() {
		return load_free_units;
	}
	public void setLoad_free_units(Double load_free_units) {
		this.load_free_units = load_free_units;
	}
	public Integer getAverage_days() {
		return average_days;
	}
	public void setAverage_days(Integer average_days) {
		this.average_days = average_days;
	}
	public String getScheme_broad_category() {
		return scheme_broad_category;
	}
	public void setScheme_broad_category(String scheme_broad_category) {
		this.scheme_broad_category = scheme_broad_category;
	}
	public String getIsin() {
		return isin;
	}
	public void setIsin(String isin) {
		this.isin = isin;
	}
	public String getDividend_option() {
		return dividend_option;
	}
	public void setDividend_option(String dividend_option) {
		this.dividend_option = dividend_option;
	}
	public String getScheme_option_code() {
		return scheme_option_code;
	}
	public void setScheme_option_code(String scheme_option_code) {
		this.scheme_option_code = scheme_option_code;
	}
	public Double getPurchase_amount() {
		return purchase_amount;
	}
	public void setPurchase_amount(Double purchase_amount) {
		this.purchase_amount = purchase_amount;
	}
	@Transient
	public String getCurr_str() {
		return curr_str;
	}
	@Transient
	public void setCurr_str(String curr_str) {
		this.curr_str = curr_str;
	}
	@Transient
	public String getFreeunit_str() {
		return freeunit_str;
	}
	@Transient
	public void setFreeunit_str(String freeunit_str) {
		this.freeunit_str = freeunit_str;
	}
	@Transient
	public String getFreeunitValue_str() {
		return freeunitValue_str;
	}
	@Transient
	public void setFreeunitValue_str(String freeunitValue_str) {
		this.freeunitValue_str = freeunitValue_str;
	}
	@Transient
	public String getInvestedamt_str() {
		return investedamt_str;
	}
	@Transient
	public void setInvestedamt_str(String investedamt_str) {
		this.investedamt_str = investedamt_str;
	}
	@Transient
	public String getDivident_str() {
		return divident_str;
	}
	@Transient
	public void setDivident_str(String divident_str) {
		this.divident_str = divident_str;
	}
	@Transient
	public String getScheme_risk() {
		return scheme_risk;
	}
	@Transient
	public void setScheme_risk(String scheme_risk) {
		this.scheme_risk = scheme_risk;
	}
	@Transient
	public String getScheme_rating() {
		return scheme_rating;
	}
	@Transient
	public void setScheme_rating(String scheme_rating) {
		this.scheme_rating = scheme_rating;
	}
	@Transient
	public String getCurrent_value_str() {
		return current_value_str;
	}
	@Transient
	public void setCurrent_value_str(String current_value_str) {
		this.current_value_str = current_value_str;
	}
}
