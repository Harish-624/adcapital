package com.mf.amfi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "debt_ytm_change_percent")
public class DebtYtmChangePercent {

	private Integer id;
	private String scheme_amfi;
	private String scheme_amfi_code;
	private String scheme_category;
	private Double duration_last;
	private Double maturity_last;
	private Double ytm_last;
	private Double duration_current;
	private Double maturity_current;
	private Double ytm_current;
	private Double change_percent_duration;
	private Double change_percent_maturity;
	private Double change_percent_ytm;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
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
	public String getScheme_category() {
		return scheme_category;
	}
	public void setScheme_category(String scheme_category) {
		this.scheme_category = scheme_category;
	}
	public Double getDuration_last() {
		return duration_last;
	}
	public void setDuration_last(Double duration_last) {
		this.duration_last = duration_last;
	}
	public Double getMaturity_last() {
		return maturity_last;
	}
	public void setMaturity_last(Double maturity_last) {
		this.maturity_last = maturity_last;
	}
	public Double getYtm_last() {
		return ytm_last;
	}
	public void setYtm_last(Double ytm_last) {
		this.ytm_last = ytm_last;
	}
	public Double getDuration_current() {
		return duration_current;
	}
	public void setDuration_current(Double duration_current) {
		this.duration_current = duration_current;
	}
	public Double getMaturity_current() {
		return maturity_current;
	}
	public void setMaturity_current(Double maturity_current) {
		this.maturity_current = maturity_current;
	}
	public Double getYtm_current() {
		return ytm_current;
	}
	public void setYtm_current(Double ytm_current) {
		this.ytm_current = ytm_current;
	}
	public Double getChange_percent_duration() {
		return change_percent_duration;
	}
	public void setChange_percent_duration(Double change_percent_duration) {
		this.change_percent_duration = change_percent_duration;
	}
	public Double getChange_percent_maturity() {
		return change_percent_maturity;
	}
	public void setChange_percent_maturity(Double change_percent_maturity) {
		this.change_percent_maturity = change_percent_maturity;
	}
	public Double getChange_percent_ytm() {
		return change_percent_ytm;
	}
	public void setChange_percent_ytm(Double change_percent_ytm) {
		this.change_percent_ytm = change_percent_ytm;
	}
}
