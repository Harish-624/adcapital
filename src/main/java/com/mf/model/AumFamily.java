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
@Table(name = "aum_family")
public class AumFamily {
	
	private Integer id;
	private String branch;
	private String rm_name;
	private String subbroker_name;
	private String name;
	private String pan;
	private Integer user_id;
	private Integer aum_year;
	private Integer aum_month;
	private String aum_month_str;
	private String financial_year;
	private Date financial_date;
	private Double aum_amount;
	private String client_name;
	private Date created_date;
	private String broker_code;
	
	@Transient
	private String aum_amount_str;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getRm_name() {
		return rm_name;
	}
	public void setRm_name(String rm_name) {
		this.rm_name = rm_name;
	}
	public String getSubbroker_name() {
		return subbroker_name;
	}
	public void setSubbroker_name(String subbroker_name) {
		this.subbroker_name = subbroker_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPan() {
		return pan;
	}
	public void setPan(String pan) {
		this.pan = pan;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
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
	public void setAum_amount_str(String aum_amount_str) {
		this.aum_amount_str = aum_amount_str;
	}
}
