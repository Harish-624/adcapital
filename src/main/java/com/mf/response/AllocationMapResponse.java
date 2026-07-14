package com.mf.response;


public class AllocationMapResponse {

	private String amc_name;
	private String asset_name;
	private String scheme_name;
	private Double value;
	private Double percentage;
	
	
	public String getAsset_name() {
		return asset_name;
	}
	public void setAsset_name(String asset_name) {
		this.asset_name = asset_name;
	}
	public String getScheme_name() {
		return scheme_name;
	}
	public void setScheme_name(String scheme_name) {
		this.scheme_name = scheme_name;
	}
	public Double getValue() {
		return value;
	}
	public void setValue(Double value) {
		this.value = value;
	}
	public Double getPercentage() {
		return percentage;
	}
	public void setPercentage(Double percentage) {
		this.percentage = percentage;
	}
	public String getAmc_name() {
		return amc_name;
	}
	public void setAmc_name(String amc_name) {
		this.amc_name = amc_name;
	}
}
