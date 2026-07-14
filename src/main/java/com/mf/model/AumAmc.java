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
@Table(name = "aum_amc")
public class AumAmc {
	
	private Integer id;
	private String company_code;
	private String company_name;
	private Integer aum_year;
	private Integer aum_month;
	private String aum_month_str;
	private String financial_year;
	private Date financial_date;
	private Double aum_amount;
	private String client_name;
	private String broker_code;
	private Date created_date;
	
	@Transient
	private String aum_amount_str;
	@Transient
	private Double aum_percentage;
	@Transient
	private String amc_logo;
	@Transient
	private String amc_name_short;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCompany_code() {
		return company_code;
	}
	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
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
	public String getFinancial_year() {
		return financial_year;
	}
	public void setFinancial_year(String financial_year) {
		this.financial_year = financial_year;
	}
	public Date getFinancial_date() {
		return financial_date;
	}
	public void setFinancial_date(Date financial_date) {
		this.financial_date = financial_date;
	}
	public Double getAum_amount() {
		return aum_amount;
	}
	public void setAum_amount(Double aum_amount) {
		this.aum_amount = aum_amount;
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
	@Transient
	public String getAum_amount_str() {
		return aum_amount_str;
	}
	@Transient
	public void setAum_amount_str(String aum_amount_str) {
		this.aum_amount_str = aum_amount_str;
	}
	@Transient
	public String getAmc_logo() {
		return amc_logo;
	}
	@Transient
	public void setAmc_logo(String amc_logo) {
		this.amc_logo = amc_logo;
	}
	@Transient
	public Double getAum_percentage() {
		return aum_percentage;
	}
	@Transient
	public void setAum_percentage(Double aum_percentage) {
		this.aum_percentage = aum_percentage;
	}
	@Transient
	public String getAmc_name_short() {
		return amc_name_short;
	}
	@Transient
	public void setAmc_name_short(String amc_name_short) {
		this.amc_name_short = amc_name_short;
	}
	
}
