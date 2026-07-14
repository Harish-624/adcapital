package com.mf.amfi.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "amfi_mf_companies")
public class AmfiMutualFundCompanies 
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	private Integer mf_company_id;
	private String mf_company_name;
	private String amc_code;
	private String registrar;
	private int dividend_flag;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getMf_company_id() {
		return mf_company_id;
	}
	public void setMf_company_id(Integer mf_company_id) {
		this.mf_company_id = mf_company_id;
	}
	public String getMf_company_name() {
		return mf_company_name;
	}
	public void setMf_company_name(String mf_company_name) {
		this.mf_company_name = mf_company_name;
	}
	public String getAmc_code() {
		return amc_code;
	}
	public void setAmc_code(String amc_code) {
		this.amc_code = amc_code;
	}
	public String getRegistrar() {
		return registrar;
	}
	public void setRegistrar(String registrar) {
		this.registrar = registrar;
	}
	public int getDividend_flag() {
		return dividend_flag;
	}
	public void setDividend_flag(int dividend_flag) {
		this.dividend_flag = dividend_flag;
	}
	
}
