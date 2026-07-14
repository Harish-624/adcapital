package com.mf.response;

public class Top50KubotFunds {

	public String scheme_name;
	public String scheme_category;
	public String scheme_category_class;
	public Double scheme_assets;
	public String scheme_assets_date;
	public Double scheme_returns_3yr;
	public Double scheme_returns_5yr;
	public Double scheme_returns_inception;
	public String riskometer;
	
	private Double price;
	private Double price_change_onday;
	private Double price_change_percent_onday;
	
	private String logo;
	
	public String getScheme_name() {
		return scheme_name;
	}
	public void setScheme_name(String scheme_name) {
		this.scheme_name = scheme_name;
	}
	public String getScheme_category() {
		return scheme_category;
	}
	public void setScheme_category(String scheme_category) {
		this.scheme_category = scheme_category;
	}
	public String getScheme_category_class() {
		return scheme_category_class;
	}
	public void setScheme_category_class(String scheme_category_class) {
		this.scheme_category_class = scheme_category_class;
	}
	public Double getScheme_assets() {
		return scheme_assets;
	}
	public void setScheme_assets(Double scheme_assets) {
		this.scheme_assets = scheme_assets;
	}
	public String getScheme_assets_date() {
		return scheme_assets_date;
	}
	public void setScheme_assets_date(String scheme_assets_date) {
		this.scheme_assets_date = scheme_assets_date;
	}
	public Double getScheme_returns_3yr() {
		return scheme_returns_3yr;
	}
	public void setScheme_returns_3yr(Double scheme_returns_3yr) {
		this.scheme_returns_3yr = scheme_returns_3yr;
	}
	public Double getScheme_returns_inception() {
		return scheme_returns_inception;
	}
	public void setScheme_returns_inception(Double scheme_returns_inception) {
		this.scheme_returns_inception = scheme_returns_inception;
	}
	public String getRiskometer() {
		return riskometer;
	}
	public void setRiskometer(String riskometer) {
		this.riskometer = riskometer;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getPrice_change_onday() {
		return price_change_onday;
	}
	public void setPrice_change_onday(Double price_change_onday) {
		this.price_change_onday = price_change_onday;
	}
	public Double getPrice_change_percent_onday() {
		return price_change_percent_onday;
	}
	public void setPrice_change_percent_onday(Double price_change_percent_onday) {
		this.price_change_percent_onday = price_change_percent_onday;
	}
	public Double getScheme_returns_5yr() {
		return scheme_returns_5yr;
	}
	public void setScheme_returns_5yr(Double scheme_returns_5yr) {
		this.scheme_returns_5yr = scheme_returns_5yr;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	
}
