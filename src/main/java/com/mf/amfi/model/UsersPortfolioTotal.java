package com.mf.amfi.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "users_portfolio_total")
public class UsersPortfolioTotal 
{
	private Integer id;
	private String name;
	private Integer user_id;
	private String pan;
	private String branch;
	private String rm_name;
	private String super_subbroker_name;
	private String subbroker_name;
	private Integer aum_year;
	private Integer aum_month;
	private String aum_month_str;
	private Date aum_date;
	private String financial_year;
	private Double invested_amount;
	private Double current_value;
	private Double unrealised_profit;
	private Double realised_profit;
	private Double cagr;
	private Date created_date;
	private String client_name;
	private String broker_code;
	
	@Transient
	private String current_value_str;
	@Transient
	private String email;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public String getSuper_subbroker_name() {
		return super_subbroker_name;
	}
	public void setSuper_subbroker_name(String super_subbroker_name) {
		this.super_subbroker_name = super_subbroker_name;
	}
	public String getSubbroker_name() {
		return subbroker_name;
	}
	public void setSubbroker_name(String subbroker_name) {
		this.subbroker_name = subbroker_name;
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
	public Double getInvested_amount() {
		return invested_amount;
	}
	public void setInvested_amount(Double invested_amount) {
		this.invested_amount = invested_amount;
	}
	public Double getCurrent_value() {
		return current_value;
	}
	public void setCurrent_value(Double current_value) {
		this.current_value = current_value;
	}
	public Double getUnrealised_profit() {
		return unrealised_profit;
	}
	public void setUnrealised_profit(Double unrealised_profit) {
		this.unrealised_profit = unrealised_profit;
	}
	public Double getRealised_profit() {
		return realised_profit;
	}
	public void setRealised_profit(Double realised_profit) {
		this.realised_profit = realised_profit;
	}
	public Double getCagr() {
		return cagr;
	}
	public void setCagr(Double cagr) {
		this.cagr = cagr;
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
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	@Transient
	public String getCurrent_value_str() {
		return current_value_str;
	}
	@Transient
	public void setCurrent_value_str(String current_value_str) {
		this.current_value_str = current_value_str;
	}
	public String getBroker_code() {
		return broker_code;
	}
	public void setBroker_code(String broker_code) {
		this.broker_code = broker_code;
	}
	@Transient
	public String getEmail() {
		return email;
	}
	@Transient
	public void setEmail(String email) {
		this.email = email;
	}
}
