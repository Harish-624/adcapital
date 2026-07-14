package com.mf.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "aum_category")
public class AumCategory {
	
	private Integer id;
	private String scheme_broad_category;
	private String category_name;
	private String category_short_name;
	private Integer aum_year;
	private Integer aum_month;
	private String aum_month_str;
	private Date aum_date;
	private String financial_year;
	private Double aum;
	private String client_name;
	private String broker_code;
	private Date created_date;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public Integer getAum_year() {
		return aum_year;
	}
	public void setAum_year(Integer aum_year) {
		this.aum_year = aum_year;
	}
	public Integer getAum_month() {
		return aum_month;
	}
	public void setAum_month(Integer aum_month) {
		this.aum_month = aum_month;
	}
	public String getAum_month_str() {
		return aum_month_str;
	}
	public void setAum_month_str(String aum_month_str) {
		this.aum_month_str = aum_month_str;
	}
	public Date getAum_date() {
		return aum_date;
	}
	public void setAum_date(Date aum_date) {
		this.aum_date = aum_date;
	}
	public String getFinancial_year() {
		return financial_year;
	}
	public void setFinancial_year(String financial_year) {
		this.financial_year = financial_year;
	}
	public Double getAum() {
		return aum;
	}
	public void setAum(Double aum) {
		this.aum = aum;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getBroker_code() {
		return broker_code;
	}
	public void setBroker_code(String broker_code) {
		this.broker_code = broker_code;
	}
	public String getScheme_broad_category() {
		return scheme_broad_category;
	}
	public void setScheme_broad_category(String scheme_broad_category) {
		this.scheme_broad_category = scheme_broad_category;
	}
	public String getCategory_short_name() {
		return category_short_name;
	}
	public void setCategory_short_name(String category_short_name) {
		this.category_short_name = category_short_name;
	}
}
