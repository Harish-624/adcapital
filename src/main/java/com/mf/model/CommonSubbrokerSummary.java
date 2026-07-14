package com.mf.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "common_subbroker_summary")
public class CommonSubbrokerSummary 
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	private String brokerage_month;
	private Date brokerage_month_date;
	private String financial_year;
	private String branch;
	private String rm_name;
	private String super_subbroker_name;
	private String subbroker_name;
	private Double subbroker_payout;
	private Integer type_id;
	private Double brokerage_received;
	private Double trial;
	private Double clawback;
	private Double gross_brokerage;
	private Double super_subbroker_brokerage;
	private Double margin;
	private Date created_date;
	private String broker_code;
	private String client_name;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getBrokerage_month() {
		return brokerage_month;
	}
	public void setBrokerage_month(String brokerage_month) {
		this.brokerage_month = brokerage_month;
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
	public Double getBrokerage_received() {
		return brokerage_received;
	}
	public void setBrokerage_received(Double brokerage_received) {
		this.brokerage_received = brokerage_received;
	}
	public Double getTrial() {
		return trial;
	}
	public void setTrial(Double trial) {
		this.trial = trial;
	}
	public Double getClawback() {
		return clawback;
	}
	public void setClawback(Double clawback) {
		this.clawback = clawback;
	}
	public Double getGross_brokerage() {
		return gross_brokerage;
	}
	public void setGross_brokerage(Double gross_brokerage) {
		this.gross_brokerage = gross_brokerage;
	}
	public Double getMargin() {
		return margin;
	}
	public void setMargin(Double margin) {
		this.margin = margin;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
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
	public String getSuper_subbroker_name() {
		return super_subbroker_name;
	}
	public void setSuper_subbroker_name(String super_subbroker_name) {
		this.super_subbroker_name = super_subbroker_name;
	}
	public Double getSuper_subbroker_brokerage() {
		return super_subbroker_brokerage;
	}
	public void setSuper_subbroker_brokerage(Double super_subbroker_brokerage) {
		this.super_subbroker_brokerage = super_subbroker_brokerage;
	}
	public Integer getType_id() {
		return type_id;
	}
	public void setType_id(Integer type_id) {
		this.type_id = type_id;
	}
	public Double getSubbroker_payout() {
		return subbroker_payout;
	}
	public void setSubbroker_payout(Double subbroker_payout) {
		this.subbroker_payout = subbroker_payout;
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
}
