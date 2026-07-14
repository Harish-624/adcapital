package com.mf.amfi.response;

import java.util.Date;

public class PointToPointNavResponse {

	private String amc;
	private String category;
	private String scheme;
	private Date inception_date;
	private Double start_nav;
	private Date start_nav_date;
	private Double end_nav;
	private Date end_nav_date;
	private Double change_percentage;
	private String scheme_code;
	private String url;
	private String scheme_category;
	private String scheme_company;
	
	private String scheme_amfi_url;
		
	public String getAmc() {
		return amc;
	}
	public void setAmc(String amc) {
		this.amc = amc;
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
	public Date getInception_date() {
		return inception_date;
	}
	public void setInception_date(Date inception_date) {
		this.inception_date = inception_date;
	}
	public Double getStart_nav() {
		return start_nav;
	}
	public void setStart_nav(Double start_nav) {
		this.start_nav = start_nav;
	}
	public Date getStart_nav_date() {
		return start_nav_date;
	}
	public void setStart_nav_date(Date start_nav_date) {
		this.start_nav_date = start_nav_date;
	}
	public Double getEnd_nav() {
		return end_nav;
	}
	public void setEnd_nav(Double end_nav) {
		this.end_nav = end_nav;
	}
	public Date getEnd_nav_date() {
		return end_nav_date;
	}
	public void setEnd_nav_date(Date end_nav_date) {
		this.end_nav_date = end_nav_date;
	}
	public Double getChange_percentage() {
		return change_percentage;
	}
	public void setChange_percentage(Double change_percentage) {
		this.change_percentage = change_percentage;
	}
	public String getScheme_code() {
		return scheme_code;
	}
	public void setScheme_code(String scheme_code) {
		this.scheme_code = scheme_code;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getScheme_category() {
		return scheme_category;
	}
	public void setScheme_category(String scheme_category) {
		this.scheme_category = scheme_category;
	}
	public String getScheme_company() {
		return scheme_company;
	}
	public void setScheme_company(String scheme_company) {
		this.scheme_company = scheme_company;
	}
	public String getScheme_amfi_url() {
		return scheme_amfi_url;
	}
	public void setScheme_amfi_url(String scheme_amfi_url) {
		this.scheme_amfi_url = scheme_amfi_url;
	}
}