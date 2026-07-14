package com.mf.model;

import org.springframework.stereotype.Component;

@Component
public class ClientwiseSip {
	private Integer uid;
	private String inv_name;
	private String branch;
	private String rm_name;
	private String subbroker_name;
	private String pan;
	private Double amount;
	private String amc_name;
	private String scheme;
	private String foliono;
	private int counts;
	private String schemecode;
	private Double holding_units;
	private String invested_cost;
	private Double latest_nav;
	private String current_value;
	private String xirr;
	private String category;
	private String prodcode;
	private String div_paid;
	private String div_reinv;
	private String abs_return;
	private Integer dcCount;
	private String scheme_start_date;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getInv_name() {
		return inv_name;
	}
	public void setInv_name(String inv_name) {
		this.inv_name = inv_name;
	}
	public String getPan() {
		return pan;
	}
	public void setPan(String pan) {
		this.pan = pan;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public String getScheme() {
		return scheme;
	}
	public void setScheme(String scheme) {
		this.scheme = scheme;
	}
	public String getFoliono() {
		return foliono;
	}
	public void setFoliono(String foliono) {
		this.foliono = foliono;
	}
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}
	public String getSchemecode() {
		return schemecode;
	}
	public void setSchemecode(String schemecode) {
		this.schemecode = schemecode;
	}
	public Double getHolding_units() {
		return holding_units;
	}
	public void setHolding_units(Double holding_units) {
		this.holding_units = holding_units;
	}
	public String getInvested_cost() {
		return invested_cost;
	}
	public void setInvested_cost(String invested_cost) {
		this.invested_cost = invested_cost;
	}
	public Double getLatest_nav() {
		return latest_nav;
	}
	public void setLatest_nav(Double latest_nav) {
		this.latest_nav = latest_nav;
	}
	public String getCurrent_value() {
		return current_value;
	}
	public void setCurrent_value(String current_value) {
		this.current_value = current_value;
	}
	public String getProdcode() {
		return prodcode;
	}
	public void setProdcode(String prodcode) {
		this.prodcode = prodcode;
	}
	public String getDiv_paid() {
		return div_paid;
	}
	public void setDiv_paid(String div_paid) {
		this.div_paid = div_paid;
	}
	public String getDiv_reinv() {
		return div_reinv;
	}
	public void setDiv_reinv(String div_reinv) {
		this.div_reinv = div_reinv;
	}
	public String getAbs_return() {
		return abs_return;
	}
	public void setAbs_return(String abs_return) {
		this.abs_return = abs_return;
	}
	public Integer getDcCount() {
		return dcCount;
	}
	public void setDcCount(Integer dcCount) {
		this.dcCount = dcCount;
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
	public String getSubbroker_name() {
		return subbroker_name;
	}
	public void setSubbroker_name(String subbroker_name) {
		this.subbroker_name = subbroker_name;
	}
	public String getAmc_name() {
		return amc_name;
	}
	public void setAmc_name(String amc_name) {
		this.amc_name = amc_name;
	}
	public String getXirr() {
		return xirr;
	}
	public void setXirr(String xirr) {
		this.xirr = xirr;
	}
	public String getScheme_start_date() {
		return scheme_start_date;
	}
	public void setScheme_start_date(String scheme_start_date) {
		this.scheme_start_date = scheme_start_date;
	}
}
