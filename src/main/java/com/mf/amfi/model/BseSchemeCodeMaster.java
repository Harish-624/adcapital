package com.mf.amfi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "bse_scheme_code_master")
public class BseSchemeCodeMaster {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	private String unique_no;
	private String scheme_code;
	private String rta_scheme_code;
	private String amc_scheme_code;
	private String isin;
	private String amc_code;
	private String amc_name;
	private String scheme_type;
	private String category;
	private String scheme_plan;
	private String scheme_amfi_code;
	private String scheme_name;
	private String scheme;
	private String purchase_allowed;
	private String purchase_transaction_mode;
	private Double minimum_purchase_amount;
	private Double additional_purchase_amount_multiple;
	private Double maximum_purchase_amount;
	private Double purchase_amount_multiplier;
	private String purchase_cutoff_time;
	private String redemption_allowed;
	private String redemption_transaction_mode;
	private Double minimum_redemption_qty;
	private Double redemption_qty_multiplier;
	private Double maximum_redemption_qty;
	private Double redemption_amount_minimum;
	private Double redemption_amount_maximum;
	private Double redemption_amount_multiple;
	private String redemption_cutoff_time;
	private String rta_agent_code;
	private Integer amc_active_flag;
	private String dividend_reinvestment_flag;
	private String sip_flag;
	private String stp_flag;
	private String swp_flag;
	private String switch_flag;
	private String settlement_type;
	private String amc_ind;
	private Double face_value;
	private String start_date;
	private String end_date;
	private String exit_load_flag;
	private String exit_load;
	private String lock_in_period_flag;
	private String lock_in_period;
	private String channel_partner_code;
	
	@Transient
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
	public String getUnique_no() {
		return unique_no;
	}
	public void setUnique_no(String unique_no) {
		this.unique_no = unique_no;
	}
	public String getScheme_code() {
		return scheme_code;
	}
	public void setScheme_code(String scheme_code) {
		this.scheme_code = scheme_code;
	}
	public String getRta_scheme_code() {
		return rta_scheme_code;
	}
	public void setRta_scheme_code(String rta_scheme_code) {
		this.rta_scheme_code = rta_scheme_code;
	}
	public String getAmc_scheme_code() {
		return amc_scheme_code;
	}
	public void setAmc_scheme_code(String amc_scheme_code) {
		this.amc_scheme_code = amc_scheme_code;
	}
	public String getIsin() {
		return isin;
	}
	public void setIsin(String isin) {
		this.isin = isin;
	}
	public String getAmc_code() {
		return amc_code;
	}
	public void setAmc_code(String amc_code) {
		this.amc_code = amc_code;
	}
	public String getScheme_type() {
		return scheme_type;
	}
	public void setScheme_type(String scheme_type) {
		this.scheme_type = scheme_type;
	}
	public String getScheme_plan() {
		return scheme_plan;
	}
	public void setScheme_plan(String scheme_plan) {
		this.scheme_plan = scheme_plan;
	}
	public String getScheme_name() {
		return scheme_name;
	}
	public void setScheme_name(String scheme_name) {
		this.scheme_name = scheme_name;
	}
	public String getPurchase_allowed() {
		return purchase_allowed;
	}
	public void setPurchase_allowed(String purchase_allowed) {
		this.purchase_allowed = purchase_allowed;
	}
	public String getPurchase_transaction_mode() {
		return purchase_transaction_mode;
	}
	public void setPurchase_transaction_mode(String purchase_transaction_mode) {
		this.purchase_transaction_mode = purchase_transaction_mode;
	}
	public Double getMinimum_purchase_amount() {
		return minimum_purchase_amount;
	}
	public void setMinimum_purchase_amount(Double minimum_purchase_amount) {
		this.minimum_purchase_amount = minimum_purchase_amount;
	}
	public Double getAdditional_purchase_amount_multiple() {
		return additional_purchase_amount_multiple;
	}
	public void setAdditional_purchase_amount_multiple(
			Double additional_purchase_amount_multiple) {
		this.additional_purchase_amount_multiple = additional_purchase_amount_multiple;
	}
	public Double getMaximum_purchase_amount() {
		return maximum_purchase_amount;
	}
	public void setMaximum_purchase_amount(Double maximum_purchase_amount) {
		this.maximum_purchase_amount = maximum_purchase_amount;
	}
	public Double getPurchase_amount_multiplier() {
		return purchase_amount_multiplier;
	}
	public void setPurchase_amount_multiplier(Double purchase_amount_multiplier) {
		this.purchase_amount_multiplier = purchase_amount_multiplier;
	}
	public String getPurchase_cutoff_time() {
		return purchase_cutoff_time;
	}
	public void setPurchase_cutoff_time(String purchase_cutoff_time) {
		this.purchase_cutoff_time = purchase_cutoff_time;
	}
	public String getRedemption_allowed() {
		return redemption_allowed;
	}
	public void setRedemption_allowed(String redemption_allowed) {
		this.redemption_allowed = redemption_allowed;
	}
	public String getRedemption_transaction_mode() {
		return redemption_transaction_mode;
	}
	public void setRedemption_transaction_mode(String redemption_transaction_mode) {
		this.redemption_transaction_mode = redemption_transaction_mode;
	}
	public Double getMinimum_redemption_qty() {
		return minimum_redemption_qty;
	}
	public void setMinimum_redemption_qty(Double minimum_redemption_qty) {
		this.minimum_redemption_qty = minimum_redemption_qty;
	}
	public Double getRedemption_qty_multiplier() {
		return redemption_qty_multiplier;
	}
	public void setRedemption_qty_multiplier(Double redemption_qty_multiplier) {
		this.redemption_qty_multiplier = redemption_qty_multiplier;
	}
	public Double getMaximum_redemption_qty() {
		return maximum_redemption_qty;
	}
	public void setMaximum_redemption_qty(Double maximum_redemption_qty) {
		this.maximum_redemption_qty = maximum_redemption_qty;
	}
	public Double getRedemption_amount_minimum() {
		return redemption_amount_minimum;
	}
	public void setRedemption_amount_minimum(Double redemption_amount_minimum) {
		this.redemption_amount_minimum = redemption_amount_minimum;
	}
	public Double getRedemption_amount_maximum() {
		return redemption_amount_maximum;
	}
	public void setRedemption_amount_maximum(Double redemption_amount_maximum) {
		this.redemption_amount_maximum = redemption_amount_maximum;
	}
	public Double getRedemption_amount_multiple() {
		return redemption_amount_multiple;
	}
	public void setRedemption_amount_multiple(Double redemption_amount_multiple) {
		this.redemption_amount_multiple = redemption_amount_multiple;
	}
	public String getRedemption_cutoff_time() {
		return redemption_cutoff_time;
	}
	public void setRedemption_cutoff_time(String redemption_cutoff_time) {
		this.redemption_cutoff_time = redemption_cutoff_time;
	}
	public String getRta_agent_code() {
		return rta_agent_code;
	}
	public void setRta_agent_code(String rta_agent_code) {
		this.rta_agent_code = rta_agent_code;
	}
	public Integer getAmc_active_flag() {
		return amc_active_flag;
	}
	public void setAmc_active_flag(Integer amc_active_flag) {
		this.amc_active_flag = amc_active_flag;
	}
	public String getDividend_reinvestment_flag() {
		return dividend_reinvestment_flag;
	}
	public void setDividend_reinvestment_flag(String dividend_reinvestment_flag) {
		this.dividend_reinvestment_flag = dividend_reinvestment_flag;
	}
	public String getSip_flag() {
		return sip_flag;
	}
	public void setSip_flag(String sip_flag) {
		this.sip_flag = sip_flag;
	}
	public String getStp_flag() {
		return stp_flag;
	}
	public void setStp_flag(String stp_flag) {
		this.stp_flag = stp_flag;
	}
	public String getSwp_flag() {
		return swp_flag;
	}
	public void setSwp_flag(String swp_flag) {
		this.swp_flag = swp_flag;
	}
	public String getSwitch_flag() {
		return switch_flag;
	}
	public void setSwitch_flag(String switch_flag) {
		this.switch_flag = switch_flag;
	}
	public String getSettlement_type() {
		return settlement_type;
	}
	public void setSettlement_type(String settlement_type) {
		this.settlement_type = settlement_type;
	}
	public String getAmc_ind() {
		return amc_ind;
	}
	public void setAmc_ind(String amc_ind) {
		this.amc_ind = amc_ind;
	}
	public Double getFace_value() {
		return face_value;
	}
	public void setFace_value(Double face_value) {
		this.face_value = face_value;
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
	public String getExit_load_flag() {
		return exit_load_flag;
	}
	public void setExit_load_flag(String exit_load_flag) {
		this.exit_load_flag = exit_load_flag;
	}
	public String getExit_load() {
		return exit_load;
	}
	public void setExit_load(String exit_load) {
		this.exit_load = exit_load;
	}
	public String getLock_in_period_flag() {
		return lock_in_period_flag;
	}
	public void setLock_in_period_flag(String lock_in_period_flag) {
		this.lock_in_period_flag = lock_in_period_flag;
	}
	public String getLock_in_period() {
		return lock_in_period;
	}
	public void setLock_in_period(String lock_in_period) {
		this.lock_in_period = lock_in_period;
	}
	public String getChannel_partner_code() {
		return channel_partner_code;
	}
	public void setChannel_partner_code(String channel_partner_code) {
		this.channel_partner_code = channel_partner_code;
	}
	public String getAmc_name() {
		return amc_name;
	}
	public void setAmc_name(String amc_name) {
		this.amc_name = amc_name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getScheme() {
		return scheme;
	}
	public void setScheme(String scheme) {
		this.scheme = scheme;
	}
	
	@Transient
	public String getAmc_logo() {
		return amc_logo;
	}
	@Transient
	public void setAmc_logo(String amc_logo) {
		this.amc_logo = amc_logo;
	}
	public String getScheme_amfi_code() {
		return scheme_amfi_code;
	}
	public void setScheme_amfi_code(String scheme_amfi_code) {
		this.scheme_amfi_code = scheme_amfi_code;
	}
}
