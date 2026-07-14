package com.mf.response;

import org.springframework.stereotype.Component;

@Component
public class ExpiringShortlySip {
	
	private Integer user_id;
	private String name;
	private String pan;
	private String folio;
	private String scheme;
	private Double amount;
	private String amount_str;
	private String start_date;
	private String end_date;
	private String start_day;
	private String closed_date;
	private String user_branch;
	private String rm_name;
	private String subbroker_name;
	
	private Double invested_cost;
	private Double current_value;
	private Double abs_return;
	
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
	public String getFolio() {
		return folio;
	}
	public void setFolio(String folio) {
		this.folio = folio;
	}
	public String getScheme() {
		return scheme;
	}
	public void setScheme(String scheme) {
		this.scheme = scheme;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getStart_day() {
		return start_day;
	}
	public void setStart_day(String start_day) {
		this.start_day = start_day;
	}
	public String getClosed_date() {
		return closed_date;
	}
	public void setClosed_date(String closed_date) {
		this.closed_date = closed_date;
	}
	public String getUser_branch() {
		return user_branch;
	}
	public void setUser_branch(String user_branch) {
		this.user_branch = user_branch;
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
	public String getAmount_str() {
		return amount_str;
	}
	public void setAmount_str(String amount_str) {
		this.amount_str = amount_str;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Double getInvested_cost() {
		return invested_cost;
	}
	public void setInvested_cost(Double invested_cost) {
		this.invested_cost = invested_cost;
	}
	public Double getCurrent_value() {
		return current_value;
	}
	public void setCurrent_value(Double current_value) {
		this.current_value = current_value;
	}
	public Double getAbs_return() {
		return abs_return;
	}
	public void setAbs_return(Double abs_return) {
		this.abs_return = abs_return;
	}
}
