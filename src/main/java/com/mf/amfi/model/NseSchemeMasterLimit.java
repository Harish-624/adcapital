package com.mf.amfi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "nse_scheme_master_limit")
public class NseSchemeMasterLimit {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	private String registrar_id;
	private String amc_code;
	private String product_code;
	private String product_short_name;
	private String product_long_name;
	private String trxn_type;
	private String sub_trxn_type;
	private String sub_trxn_type_desc;
	private String minimum_amount;
	private String maximum_amount;
	private String min_units;
	private String multiples;
	private String min_installment_months;
	private String last_modified_date;
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRegistrar_id() {
		return registrar_id;
	}
	public void setRegistrar_id(String registrar_id) {
		this.registrar_id = registrar_id;
	}
	public String getAmc_code() {
		return amc_code;
	}
	public void setAmc_code(String amc_code) {
		this.amc_code = amc_code;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getProduct_short_name() {
		return product_short_name;
	}
	public void setProduct_short_name(String product_short_name) {
		this.product_short_name = product_short_name;
	}
	public String getProduct_long_name() {
		return product_long_name;
	}
	public void setProduct_long_name(String product_long_name) {
		this.product_long_name = product_long_name;
	}
	public String getTrxn_type() {
		return trxn_type;
	}
	public void setTrxn_type(String trxn_type) {
		this.trxn_type = trxn_type;
	}
	public String getSub_trxn_type() {
		return sub_trxn_type;
	}
	public void setSub_trxn_type(String sub_trxn_type) {
		this.sub_trxn_type = sub_trxn_type;
	}
	public String getSub_trxn_type_desc() {
		return sub_trxn_type_desc;
	}
	public void setSub_trxn_type_desc(String sub_trxn_type_desc) {
		this.sub_trxn_type_desc = sub_trxn_type_desc;
	}
	public String getMinimum_amount() {
		return minimum_amount;
	}
	public void setMinimum_amount(String minimum_amount) {
		this.minimum_amount = minimum_amount;
	}
	public String getMaximum_amount() {
		return maximum_amount;
	}
	public void setMaximum_amount(String maximum_amount) {
		this.maximum_amount = maximum_amount;
	}
	public String getMin_units() {
		return min_units;
	}
	public void setMin_units(String min_units) {
		this.min_units = min_units;
	}
	public String getMultiples() {
		return multiples;
	}
	public void setMultiples(String multiples) {
		this.multiples = multiples;
	}
	public String getMin_installment_months() {
		return min_installment_months;
	}
	public void setMin_installment_months(String min_installment_months) {
		this.min_installment_months = min_installment_months;
	}
	public String getLast_modified_date() {
		return last_modified_date;
	}
	public void setLast_modified_date(String last_modified_date) {
		this.last_modified_date = last_modified_date;
	}
}
