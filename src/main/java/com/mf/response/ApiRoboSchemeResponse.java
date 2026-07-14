package com.mf.response;


public class ApiRoboSchemeResponse {
	
    private String scheme_name;
    private String category;
    private Double allocation_percentage;
    private Double allocation_amount;
	private Double returns_1year;
	private Double returns_3year;
	private Double returns_5year;
	private Double returns_10year;
	private Double returns_inception;
	
	
	public String getScheme_name() {
		return scheme_name;
	}
	public void setScheme_name(String scheme_name) {
		this.scheme_name = scheme_name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Double getAllocation_percentage() {
		return allocation_percentage;
	}
	public void setAllocation_percentage(Double allocation_percentage) {
		this.allocation_percentage = allocation_percentage;
	}
	public Double getAllocation_amount() {
		return allocation_amount;
	}
	public void setAllocation_amount(Double allocation_amount) {
		this.allocation_amount = allocation_amount;
	}
	public Double getReturns_1year() {
		return returns_1year;
	}
	public void setReturns_1year(Double returns_1year) {
		this.returns_1year = returns_1year;
	}
	public Double getReturns_3year() {
		return returns_3year;
	}
	public void setReturns_3year(Double returns_3year) {
		this.returns_3year = returns_3year;
	}
	public Double getReturns_5year() {
		return returns_5year;
	}
	public void setReturns_5year(Double returns_5year) {
		this.returns_5year = returns_5year;
	}
	public Double getReturns_10year() {
		return returns_10year;
	}
	public void setReturns_10year(Double returns_10year) {
		this.returns_10year = returns_10year;
	}
	public Double getReturns_inception() {
		return returns_inception;
	}
	public void setReturns_inception(Double returns_inception) {
		this.returns_inception = returns_inception;
	}
}
