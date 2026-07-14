package com.mf.amfi.response;

public class DebtYtmChangePercentResponse {

	private String scheme_amfi;
	private String scheme_category;
	private Double duration_current;
	private Double maturity_current;
	private Double ytm_current;
	private Double change_percent_duration;
	private Double change_percent_maturity;
	private Double change_percent_ytm;
	private Double category_duration;
	private Double category_maturity;
	private Double category_ytm;
	
	public String getScheme_amfi() {
		return scheme_amfi;
	}
	public void setScheme_amfi(String scheme_amfi) {
		this.scheme_amfi = scheme_amfi;
	}
	public String getScheme_category() {
		return scheme_category;
	}
	public void setScheme_category(String scheme_category) {
		this.scheme_category = scheme_category;
	}
	public Double getDuration_current() {
		return duration_current;
	}
	public void setDuration_current(Double duration_current) {
		this.duration_current = duration_current;
	}
	public Double getMaturity_current() {
		return maturity_current;
	}
	public void setMaturity_current(Double maturity_current) {
		this.maturity_current = maturity_current;
	}
	public Double getYtm_current() {
		return ytm_current;
	}
	public void setYtm_current(Double ytm_current) {
		this.ytm_current = ytm_current;
	}
	public Double getChange_percent_duration() {
		return change_percent_duration;
	}
	public void setChange_percent_duration(Double change_percent_duration) {
		this.change_percent_duration = change_percent_duration;
	}
	public Double getChange_percent_maturity() {
		return change_percent_maturity;
	}
	public void setChange_percent_maturity(Double change_percent_maturity) {
		this.change_percent_maturity = change_percent_maturity;
	}
	public Double getChange_percent_ytm() {
		return change_percent_ytm;
	}
	public void setChange_percent_ytm(Double change_percent_ytm) {
		this.change_percent_ytm = change_percent_ytm;
	}
	public Double getCategory_duration() {
		return category_duration;
	}
	public void setCategory_duration(Double category_duration) {
		this.category_duration = category_duration;
	}
	public Double getCategory_maturity() {
		return category_maturity;
	}
	public void setCategory_maturity(Double category_maturity) {
		this.category_maturity = category_maturity;
	}
	public Double getCategory_ytm() {
		return category_ytm;
	}
	public void setCategory_ytm(Double category_ytm) {
		this.category_ytm = category_ytm;
	}	
}
