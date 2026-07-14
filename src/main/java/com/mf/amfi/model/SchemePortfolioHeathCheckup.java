package com.mf.amfi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "investor_portfolio_health_checkup")
public class SchemePortfolioHeathCheckup
{
	Integer id;
	String scheme_company;
	String scheme_name;
	String scheme_amfi_short_name;
	String scheme_amfi_code;	
	String scheme_amfi_common;
	String rating;
	Integer rating_value;
	String riskometer;
	String scheme_broad_category;
	String scheme_advisorkhoj_category;
	

  	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getScheme_name() {
		return scheme_name;
	}
	public void setScheme_name(String scheme_name) {
		this.scheme_name = scheme_name;
	}
	public String getScheme_amfi_common() {
		return scheme_amfi_common;
	}
	public void setScheme_amfi_common(String scheme_amfi_common) {
		this.scheme_amfi_common = scheme_amfi_common;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getRiskometer() {
		return riskometer;
	}
	public void setRiskometer(String riskometer) {
		this.riskometer = riskometer;
	}
	public String getScheme_broad_category() {
		return scheme_broad_category;
	}
	public void setScheme_broad_category(String scheme_broad_category) {
		this.scheme_broad_category = scheme_broad_category;
	}
	public String getScheme_advisorkhoj_category() {
		return scheme_advisorkhoj_category;
	}
	public void setScheme_advisorkhoj_category(String scheme_advisorkhoj_category) {
		this.scheme_advisorkhoj_category = scheme_advisorkhoj_category;
	}
	public String getScheme_amfi_short_name() {
		return scheme_amfi_short_name;
	}
	public void setScheme_amfi_short_name(String scheme_amfi_short_name) {
		this.scheme_amfi_short_name = scheme_amfi_short_name;
	}
	public String getScheme_amfi_code() {
		return scheme_amfi_code;
	}
	public void setScheme_amfi_code(String scheme_amfi_code) {
		this.scheme_amfi_code = scheme_amfi_code;
	}
	public String getScheme_company() {
		return scheme_company;
	}
	public void setScheme_company(String scheme_company) {
		this.scheme_company = scheme_company;
	}
	public Integer getRating_value() {
		return rating_value;
	}
	public void setRating_value(Integer rating_value) {
		this.rating_value = rating_value;
	}	
}
