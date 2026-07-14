package com.mf.amfi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bse_sip_master")
public class BseSIPMaster {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	private String amc_code;
	private String amc_name;
	private String category;
	private String scheme_amfi_code;
	private String scheme_amfi;
	private String scheme_code;
	private String scheme_name;
	private String sip_transaction_mode;
	private String sip_frequency;
	private String sip_dates;
	private Integer sip_minimum_gap;
	private Integer sip_maximum_gap;
	private Integer sip_installment_gap;
	private Integer sip_status;
	private Double sip_minimum_installment_amount;
	private Double sip_maximum_installment_amount;
	private Double sip_multiplier_amount;
	private Integer sip_minimum_installment_numbers;
	private Integer sip_maximum_installment_numbers;
	private String scheme_isin;
	private String scheme_type;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAmc_code() {
		return amc_code;
	}
	public void setAmc_code(String amc_code) {
		this.amc_code = amc_code;
	}
	public String getAmc_name() {
		return amc_name;
	}
	public void setAmc_name(String amc_name) {
		this.amc_name = amc_name;
	}
	public String getScheme_code() {
		return scheme_code;
	}
	public void setScheme_code(String scheme_code) {
		this.scheme_code = scheme_code;
	}
	public String getScheme_name() {
		return scheme_name;
	}
	public void setScheme_name(String scheme_name) {
		this.scheme_name = scheme_name;
	}
	public String getSip_transaction_mode() {
		return sip_transaction_mode;
	}
	public void setSip_transaction_mode(String sip_transaction_mode) {
		this.sip_transaction_mode = sip_transaction_mode;
	}
	public String getSip_frequency() {
		return sip_frequency;
	}
	public void setSip_frequency(String sip_frequency) {
		this.sip_frequency = sip_frequency;
	}
	public String getSip_dates() {
		return sip_dates;
	}
	public void setSip_dates(String sip_dates) {
		this.sip_dates = sip_dates;
	}
	public Integer getSip_minimum_gap() {
		return sip_minimum_gap;
	}
	public void setSip_minimum_gap(Integer sip_minimum_gap) {
		this.sip_minimum_gap = sip_minimum_gap;
	}
	public Integer getSip_maximum_gap() {
		return sip_maximum_gap;
	}
	public void setSip_maximum_gap(Integer sip_maximum_gap) {
		this.sip_maximum_gap = sip_maximum_gap;
	}
	public Integer getSip_installment_gap() {
		return sip_installment_gap;
	}
	public void setSip_installment_gap(Integer sip_installment_gap) {
		this.sip_installment_gap = sip_installment_gap;
	}
	public Integer getSip_status() {
		return sip_status;
	}
	public void setSip_status(Integer sip_status) {
		this.sip_status = sip_status;
	}
	public Double getSip_minimum_installment_amount() {
		return sip_minimum_installment_amount;
	}
	public void setSip_minimum_installment_amount(
			Double sip_minimum_installment_amount) {
		this.sip_minimum_installment_amount = sip_minimum_installment_amount;
	}
	public Double getSip_maximum_installment_amount() {
		return sip_maximum_installment_amount;
	}
	public void setSip_maximum_installment_amount(
			Double sip_maximum_installment_amount) {
		this.sip_maximum_installment_amount = sip_maximum_installment_amount;
	}
	public Double getSip_multiplier_amount() {
		return sip_multiplier_amount;
	}
	public void setSip_multiplier_amount(Double sip_multiplier_amount) {
		this.sip_multiplier_amount = sip_multiplier_amount;
	}
	public Integer getSip_minimum_installment_numbers() {
		return sip_minimum_installment_numbers;
	}
	public void setSip_minimum_installment_numbers(
			Integer sip_minimum_installment_numbers) {
		this.sip_minimum_installment_numbers = sip_minimum_installment_numbers;
	}
	public Integer getSip_maximum_installment_numbers() {
		return sip_maximum_installment_numbers;
	}
	public void setSip_maximum_installment_numbers(
			Integer sip_maximum_installment_numbers) {
		this.sip_maximum_installment_numbers = sip_maximum_installment_numbers;
	}
	public String getScheme_isin() {
		return scheme_isin;
	}
	public void setScheme_isin(String scheme_isin) {
		this.scheme_isin = scheme_isin;
	}
	public String getScheme_type() {
		return scheme_type;
	}
	public void setScheme_type(String scheme_type) {
		this.scheme_type = scheme_type;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getScheme_amfi_code() {
		return scheme_amfi_code;
	}
	public void setScheme_amfi_code(String scheme_amfi_code) {
		this.scheme_amfi_code = scheme_amfi_code;
	}
	public String getScheme_amfi() {
		return scheme_amfi;
	}
	public void setScheme_amfi(String scheme_amfi) {
		this.scheme_amfi = scheme_amfi;
	}
}
