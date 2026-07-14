package com.mf.amfi.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "scheme_best_performance")
public class SchemeBestPerformance 
{
	private Integer id;
	private String scheme_amfi;
	private String scheme_amfi_code;
	private Date worstdate_monthly;
	private String worstrtns_monthly;
	private Date bestdate_monthly;
	private String bestrtns_monthly;
	private Date worstdate_annually;
	private String worstrtns_annually;
	private Date bestdate_annually;
	private String bestrtns_annually;
	private Date worstdate_quarterly;
	private String worstrtns_quarterly;
	private Date bestdate_quarterly;
	private String bestrtns_quarterly;
	
	@Transient
	private String bestdate_quarterly_str;
	
	@Transient
	private String worstdate_quarterly_str;
	
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getScheme_amfi() {
		return scheme_amfi;
	}
	public void setScheme_amfi(String scheme_amfi) {
		this.scheme_amfi = scheme_amfi;
	}
	public String getScheme_amfi_code() {
		return scheme_amfi_code;
	}
	public void setScheme_amfi_code(String scheme_amfi_code) {
		this.scheme_amfi_code = scheme_amfi_code;
	}
	public Date getWorstdate_monthly() {
		return worstdate_monthly;
	}
	public void setWorstdate_monthly(Date worstdate_monthly) {
		this.worstdate_monthly = worstdate_monthly;
	}
	public String getWorstrtns_monthly() {
		return worstrtns_monthly;
	}
	public void setWorstrtns_monthly(String worstrtns_monthly) {
		this.worstrtns_monthly = worstrtns_monthly;
	}
	public Date getBestdate_monthly() {
		return bestdate_monthly;
	}
	public void setBestdate_monthly(Date bestdate_monthly) {
		this.bestdate_monthly = bestdate_monthly;
	}
	public String getBestrtns_monthly() {
		return bestrtns_monthly;
	}
	public void setBestrtns_monthly(String bestrtns_monthly) {
		this.bestrtns_monthly = bestrtns_monthly;
	}
	public Date getWorstdate_annually() {
		return worstdate_annually;
	}
	public void setWorstdate_annually(Date worstdate_annually) {
		this.worstdate_annually = worstdate_annually;
	}
	public String getWorstrtns_annually() {
		return worstrtns_annually;
	}
	public void setWorstrtns_annually(String worstrtns_annually) {
		this.worstrtns_annually = worstrtns_annually;
	}
	public Date getBestdate_annually() {
		return bestdate_annually;
	}
	public void setBestdate_annually(Date bestdate_annually) {
		this.bestdate_annually = bestdate_annually;
	}
	public String getBestrtns_annually() {
		return bestrtns_annually;
	}
	public void setBestrtns_annually(String bestrtns_annually) {
		this.bestrtns_annually = bestrtns_annually;
	}
	public Date getWorstdate_quarterly() {
		return worstdate_quarterly;
	}
	public void setWorstdate_quarterly(Date worstdate_quarterly) {
		this.worstdate_quarterly = worstdate_quarterly;
	}
	public String getWorstrtns_quarterly() {
		return worstrtns_quarterly;
	}
	public void setWorstrtns_quarterly(String worstrtns_quarterly) {
		this.worstrtns_quarterly = worstrtns_quarterly;
	}
	public Date getBestdate_quarterly() {
		return bestdate_quarterly;
	}
	public void setBestdate_quarterly(Date bestdate_quarterly) {
		this.bestdate_quarterly = bestdate_quarterly;
	}
	public String getBestrtns_quarterly() {
		return bestrtns_quarterly;
	}
	public void setBestrtns_quarterly(String bestrtns_quarterly) {
		this.bestrtns_quarterly = bestrtns_quarterly;
	}
	@Transient
	public String getBestdate_quarterly_str() {
		return bestdate_quarterly_str;
	}
	public void setBestdate_quarterly_str(String bestdate_quarterly_str) {
		this.bestdate_quarterly_str = bestdate_quarterly_str;
	}
	@Transient
	public String getWorstdate_quarterly_str() {
		return worstdate_quarterly_str;
	}
	public void setWorstdate_quarterly_str(String worstdate_quarterly_str) {
		this.worstdate_quarterly_str = worstdate_quarterly_str;
	}
	
	
}
