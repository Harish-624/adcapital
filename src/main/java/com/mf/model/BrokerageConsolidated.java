package com.mf.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "brokerage_consolidated")
public class BrokerageConsolidated 
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	Integer id;
	String rm_name;
	String associate_name;
	String branch;
	Integer type_id;
	String brokerage_month;
	Date brokerage_month_date;
	String financial_year;
	Double gross_brokerage;	
	Double service_tax;	
	Double net_brokerage;
	Double expenses;	
	Double net_after_expenses;
	Double associate_payout;
	String client_name;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRm_name() {
		return rm_name;
	}
	public void setRm_name(String rm_name) {
		this.rm_name = rm_name;
	}
	public String getAssociate_name() {
		return associate_name;
	}
	public void setAssociate_name(String associate_name) {
		this.associate_name = associate_name;
	}
	public Integer getType_id() {
		return type_id;
	}
	public void setType_id(Integer type_id) {
		this.type_id = type_id;
	}
	public String getBrokerage_month() {
		return brokerage_month;
	}
	public void setBrokerage_month(String brokerage_month) {
		this.brokerage_month = brokerage_month;
	}
	public Date getBrokerage_month_date() {
		return brokerage_month_date;
	}
	public void setBrokerage_month_date(Date brokerage_month_date) {
		this.brokerage_month_date = brokerage_month_date;
	}
	public String getFinancial_year() {
		return financial_year;
	}
	public void setFinancial_year(String financial_year) {
		this.financial_year = financial_year;
	}
	public Double getGross_brokerage() {
		return gross_brokerage;
	}
	public void setGross_brokerage(Double gross_brokerage) {
		this.gross_brokerage = gross_brokerage;
	}
	public Double getService_tax() {
		return service_tax;
	}
	public void setService_tax(Double service_tax) {
		this.service_tax = service_tax;
	}
	public Double getNet_brokerage() {
		return net_brokerage;
	}
	public void setNet_brokerage(Double net_brokerage) {
		this.net_brokerage = net_brokerage;
	}
	public Double getExpenses() {
		return expenses;
	}
	public void setExpenses(Double expenses) {
		this.expenses = expenses;
	}
	public Double getNet_after_expenses() {
		return net_after_expenses;
	}
	public void setNet_after_expenses(Double net_after_expenses) {
		this.net_after_expenses = net_after_expenses;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public Double getAssociate_payout() {
		return associate_payout;
	}
	public void setAssociate_payout(Double associate_payout) {
		this.associate_payout = associate_payout;
	}
}
