package com.mf.amfi.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "scheme_quartile_ranking")
public class SchemeQuartileRanking {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private String scheme_amfi;
	private String scheme_amfi_code;
	private String scheme_category;
	private String scheme_company;
	private Date inception_date;
	private String period;
	
	private double returns;
	private String returns_rank;
	private double returns_last_quater;
	private String returns_last_quater_rank;
	private double returns_before_last_quater;
	private String returns_before_last_quater_rank;
	private double scheme_assets;
	private String scheme_asset_date;
	
	private String scheme_amfi_url;
	
	
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
	public String getScheme_company() {
		return scheme_company;
	}
	public void setScheme_company(String scheme_company) {
		this.scheme_company = scheme_company;
	}
	public Date getInception_date() {
		return inception_date;
	}
	public void setInception_date(Date inception_date) {
		this.inception_date = inception_date;
	}
	public double getReturns() {
		return returns;
	}
	public void setReturns(double returns) {
		this.returns = returns;
	}
	public String getReturns_rank() {
		return returns_rank;
	}
	public void setReturns_rank(String returns_rank) {
		this.returns_rank = returns_rank;
	}
	public double getReturns_last_quater() {
		return returns_last_quater;
	}
	public void setReturns_last_quater(double returns_last_quater) {
		this.returns_last_quater = returns_last_quater;
	}
	public String getReturns_last_quater_rank() {
		return returns_last_quater_rank;
	}
	public void setReturns_last_quater_rank(String returns_last_quater_rank) {
		this.returns_last_quater_rank = returns_last_quater_rank;
	}
	public double getReturns_before_last_quater() {
		return returns_before_last_quater;
	}
	public void setReturns_before_last_quater(double returns_before_last_quater) {
		this.returns_before_last_quater = returns_before_last_quater;
	}
	public String getReturns_before_last_quater_rank() {
		return returns_before_last_quater_rank;
	}
	public void setReturns_before_last_quater_rank(
			String returns_before_last_quater_rank) {
		this.returns_before_last_quater_rank = returns_before_last_quater_rank;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public double getScheme_assets() {
		return scheme_assets;
	}
	public void setScheme_assets(double scheme_assets) {
		this.scheme_assets = scheme_assets;
	}
	public String getScheme_asset_date() {
		return scheme_asset_date;
	}
	public void setScheme_asset_date(String scheme_asset_date) {
		this.scheme_asset_date = scheme_asset_date;
	}
	public String getScheme_amfi_url() {
		return scheme_amfi_url;
	}
	public void setScheme_amfi_url(String scheme_amfi_url) {
		this.scheme_amfi_url = scheme_amfi_url;
	}
	
}
