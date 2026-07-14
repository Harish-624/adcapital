package com.mf.amfi.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "scheme_nav_month_change")
public class SchemeNavMonthChange {

	private Integer id;
	private String scheme_name;
	private String scheme_code;
	private String scheme_category;
	private String scheme_company;
	private Date scheme_inception_date;
	private Date start_nav_date;
	private Double start_nav;
	private Date end_nav_date;
	private Double end_nav;
	private Double nav_change_percentage;
	
	private String scheme_amfi_url;
		
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
	public String getScheme_code() {
		return scheme_code;
	}
	public void setScheme_code(String scheme_code) {
		this.scheme_code = scheme_code;
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
	public Date getScheme_inception_date() {
		return scheme_inception_date;
	}
	public void setScheme_inception_date(Date scheme_inception_date) {
		this.scheme_inception_date = scheme_inception_date;
	}
	public Date getStart_nav_date() {
		return start_nav_date;
	}
	public void setStart_nav_date(Date start_nav_date) {
		this.start_nav_date = start_nav_date;
	}
	public Double getStart_nav() {
		return start_nav;
	}
	public void setStart_nav(Double start_nav) {
		this.start_nav = start_nav;
	}
	public Date getEnd_nav_date() {
		return end_nav_date;
	}
	public void setEnd_nav_date(Date end_nav_date) {
		this.end_nav_date = end_nav_date;
	}
	public Double getEnd_nav() {
		return end_nav;
	}
	public void setEnd_nav(Double end_nav) {
		this.end_nav = end_nav;
	}
	public Double getNav_change_percentage() {
		return nav_change_percentage;
	}
	public void setNav_change_percentage(Double nav_change_percentage) {
		this.nav_change_percentage = nav_change_percentage;
	}
	public String getScheme_amfi_url() {
		return scheme_amfi_url;
	}
	public void setScheme_amfi_url(String scheme_amfi_url) {
		this.scheme_amfi_url = scheme_amfi_url;
	}		
}
