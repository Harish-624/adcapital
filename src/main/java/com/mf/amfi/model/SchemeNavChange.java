package com.mf.amfi.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "scheme_nav_change")
public class SchemeNavChange {

	private Integer id;
	private String scheme_name;
	private String scheme_code;
	private String scheme_category;
	private String scheme_company;
	private Date scheme_inception_date;
	private Date latest_nav_date;
	private Double latest_nav;
	private Date highest_nav_date;
	private Double highest_nav;
	private Double highest_change_percentage;
	private Date lowest_nav_date;
	private Double lowest_nav;
	private Double lowest_change_percentage;
	private Date prev_month_nav_date;
	private Double prev_month_nav;
	private Double prev_month_change_percentage;
	private String url;
	
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
	public Date getLatest_nav_date() {
		return latest_nav_date;
	}
	public void setLatest_nav_date(Date latest_nav_date) {
		this.latest_nav_date = latest_nav_date;
	}
	public Double getLatest_nav() {
		return latest_nav;
	}
	public void setLatest_nav(Double latest_nav) {
		this.latest_nav = latest_nav;
	}
	public Date getHighest_nav_date() {
		return highest_nav_date;
	}
	public void setHighest_nav_date(Date highest_nav_date) {
		this.highest_nav_date = highest_nav_date;
	}
	public Double getHighest_nav() {
		return highest_nav;
	}
	public void setHighest_nav(Double highest_nav) {
		this.highest_nav = highest_nav;
	}
	public Date getScheme_inception_date() {
		return scheme_inception_date;
	}
	public void setScheme_inception_date(Date scheme_inception_date) {
		this.scheme_inception_date = scheme_inception_date;
	}
	public Double getHighest_change_percentage() {
		return highest_change_percentage;
	}
	public void setHighest_change_percentage(Double highest_change_percentage) {
		this.highest_change_percentage = highest_change_percentage;
	}
	public Date getLowest_nav_date() {
		return lowest_nav_date;
	}
	public void setLowest_nav_date(Date lowest_nav_date) {
		this.lowest_nav_date = lowest_nav_date;
	}
	public Double getLowest_nav() {
		return lowest_nav;
	}
	public void setLowest_nav(Double lowest_nav) {
		this.lowest_nav = lowest_nav;
	}
	public Double getLowest_change_percentage() {
		return lowest_change_percentage;
	}
	public void setLowest_change_percentage(Double lowest_change_percentage) {
		this.lowest_change_percentage = lowest_change_percentage;
	}
	public Date getPrev_month_nav_date() {
		return prev_month_nav_date;
	}
	public void setPrev_month_nav_date(Date prev_month_nav_date) {
		this.prev_month_nav_date = prev_month_nav_date;
	}
	public Double getPrev_month_nav() {
		return prev_month_nav;
	}
	public void setPrev_month_nav(Double prev_month_nav) {
		this.prev_month_nav = prev_month_nav;
	}
	public Double getPrev_month_change_percentage() {
		return prev_month_change_percentage;
	}
	public void setPrev_month_change_percentage(Double prev_month_change_percentage) {
		this.prev_month_change_percentage = prev_month_change_percentage;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getScheme_amfi_url() {
		return scheme_amfi_url;
	}
	public void setScheme_amfi_url(String scheme_amfi_url) {
		this.scheme_amfi_url = scheme_amfi_url;
	}
}