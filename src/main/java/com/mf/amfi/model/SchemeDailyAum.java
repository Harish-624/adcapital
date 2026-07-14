package com.mf.amfi.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "scheme_daily_aum")
public class SchemeDailyAum 
{
	private Integer id;
	private String scheme_amfi_common;
	private String scheme_category;
	private Double aum;
	private Date aum_date;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getScheme_amfi_common() {
		return scheme_amfi_common;
	}
	public void setScheme_amfi_common(String scheme_amfi_common) {
		this.scheme_amfi_common = scheme_amfi_common;
	}
	public String getScheme_category() {
		return scheme_category;
	}
	public void setScheme_category(String scheme_category) {
		this.scheme_category = scheme_category;
	}
	public Double getAum() {
		return aum;
	}
	public void setAum(Double aum) {
		this.aum = aum;
	}
	public Date getAum_date() {
		return aum_date;
	}
	public void setAum_date(Date aum_date) {
		this.aum_date = aum_date;
	}
}
