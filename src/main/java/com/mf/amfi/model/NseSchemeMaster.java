package com.mf.amfi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "nse_scheme_master")
public class NseSchemeMaster {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	private String amc_code;
	private String amc_name;
	private String product_code;
	private String product_name;
	private String category;
	private String scheme_amfi_code;
	private String scheme_amfi;
	private String systematic_frequencies;
	private String sip_dates;
	private String stp_dates;
	private String swp_dates;
	private String purchase_allowed;
	private String switch_allowed;
	private String redemption_allowed;
	private String sip_allowed;
	private String stp_allowed;
	private String swp_allowed;
	private String reinvest_tag;
	private String product_category;
	private String isin;
	private String last_modified_date;
	private String active_flag;
	private String asset_class;
	private String sub_fund_code;
	private String plan_type;
	private String insurance_enabled;
	private String rta_code;
	private String nfo_enabled;
	private String nfo_close_date;
	private String nfo_sip_effective_date;
	private String allow_freedom_sip;
	private String allow_freedom_swp;
	private String allow_donor;
	private String amc_logo;
	
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAmc_code() {
		return amc_code;
	}
	public void setAmc_code(String amc_code) {
		this.amc_code = amc_code;
	}
	public String getAmc_name() {
		return amc_name;
	}
	public void setAmc_name(String amc_name) {
		this.amc_name = amc_name;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getSystematic_frequencies() {
		return systematic_frequencies;
	}
	public void setSystematic_frequencies(String systematic_frequencies) {
		this.systematic_frequencies = systematic_frequencies;
	}
	public String getSip_dates() {
		return sip_dates;
	}
	public void setSip_dates(String sip_dates) {
		this.sip_dates = sip_dates;
	}
	public String getStp_dates() {
		return stp_dates;
	}
	public void setStp_dates(String stp_dates) {
		this.stp_dates = stp_dates;
	}
	public String getSwp_dates() {
		return swp_dates;
	}
	public void setSwp_dates(String swp_dates) {
		this.swp_dates = swp_dates;
	}
	public String getPurchase_allowed() {
		return purchase_allowed;
	}
	public void setPurchase_allowed(String purchase_allowed) {
		this.purchase_allowed = purchase_allowed;
	}
	public String getSwitch_allowed() {
		return switch_allowed;
	}
	public void setSwitch_allowed(String switch_allowed) {
		this.switch_allowed = switch_allowed;
	}
	public String getRedemption_allowed() {
		return redemption_allowed;
	}
	public void setRedemption_allowed(String redemption_allowed) {
		this.redemption_allowed = redemption_allowed;
	}
	public String getSip_allowed() {
		return sip_allowed;
	}
	public void setSip_allowed(String sip_allowed) {
		this.sip_allowed = sip_allowed;
	}
	public String getStp_allowed() {
		return stp_allowed;
	}
	public void setStp_allowed(String stp_allowed) {
		this.stp_allowed = stp_allowed;
	}
	public String getSwp_allowed() {
		return swp_allowed;
	}
	public void setSwp_allowed(String swp_allowed) {
		this.swp_allowed = swp_allowed;
	}
	public String getReinvest_tag() {
		return reinvest_tag;
	}
	public void setReinvest_tag(String reinvest_tag) {
		this.reinvest_tag = reinvest_tag;
	}
	public String getProduct_category() {
		return product_category;
	}
	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}
	public String getIsin() {
		return isin;
	}
	public void setIsin(String isin) {
		this.isin = isin;
	}
	public String getLast_modified_date() {
		return last_modified_date;
	}
	public void setLast_modified_date(String last_modified_date) {
		this.last_modified_date = last_modified_date;
	}
	public String getActive_flag() {
		return active_flag;
	}
	public void setActive_flag(String active_flag) {
		this.active_flag = active_flag;
	}
	public String getAsset_class() {
		return asset_class;
	}
	public void setAsset_class(String asset_class) {
		this.asset_class = asset_class;
	}
	public String getSub_fund_code() {
		return sub_fund_code;
	}
	public void setSub_fund_code(String sub_fund_code) {
		this.sub_fund_code = sub_fund_code;
	}
	public String getPlan_type() {
		return plan_type;
	}
	public void setPlan_type(String plan_type) {
		this.plan_type = plan_type;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getScheme_amfi() {
		return scheme_amfi;
	}
	public void setScheme_amfi(String scheme_amfi) {
		this.scheme_amfi = scheme_amfi;
	}
	public String getScheme_amfi_code() {
		return scheme_amfi_code;
	}
	public void setScheme_amfi_code(String scheme_amfi_code) {
		this.scheme_amfi_code = scheme_amfi_code;
	}
	public String getRta_code() {
		return rta_code;
	}
	public void setRta_code(String rta_code) {
		this.rta_code = rta_code;
	}
	public String getNfo_enabled() {
		return nfo_enabled;
	}
	public void setNfo_enabled(String nfo_enabled) {
		this.nfo_enabled = nfo_enabled;
	}
	public String getNfo_close_date() {
		return nfo_close_date;
	}
	public void setNfo_close_date(String nfo_close_date) {
		this.nfo_close_date = nfo_close_date;
	}
	public String getNfo_sip_effective_date() {
		return nfo_sip_effective_date;
	}
	public void setNfo_sip_effective_date(String nfo_sip_effective_date) {
		this.nfo_sip_effective_date = nfo_sip_effective_date;
	}
	public String getInsurance_enabled() {
		return insurance_enabled;
	}
	public void setInsurance_enabled(String insurance_enabled) {
		this.insurance_enabled = insurance_enabled;
	}
	public String getAllow_freedom_sip() {
		return allow_freedom_sip;
	}
	public void setAllow_freedom_sip(String allow_freedom_sip) {
		this.allow_freedom_sip = allow_freedom_sip;
	}
	public String getAllow_freedom_swp() {
		return allow_freedom_swp;
	}
	public void setAllow_freedom_swp(String allow_freedom_swp) {
		this.allow_freedom_swp = allow_freedom_swp;
	}
	public String getAllow_donor() {
		return allow_donor;
	}
	public void setAllow_donor(String allow_donor) {
		this.allow_donor = allow_donor;
	}
	@Transient
	public String getAmc_logo() {
		return amc_logo;
	}
	@Transient
	public void setAmc_logo(String amc_logo) {
		this.amc_logo = amc_logo;
	}
}
