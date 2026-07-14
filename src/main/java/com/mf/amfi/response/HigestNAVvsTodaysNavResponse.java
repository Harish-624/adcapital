package com.mf.amfi.response;

import java.util.Date;

public class HigestNAVvsTodaysNavResponse {

	private String fund;

	private Date highestNavDate;
	private Double highestNavValue;
	private Double highestInvestmentValue;
	
	private Date todaysNavDate;
	private Double todaysNavValue;
	private Double todaysInvestmentValue;
	
	public String getFund() {
		return fund;
	}
	public void setFund(String fund) {
		this.fund = fund;
	}
	public Date getHighestNavDate() {
		return highestNavDate;
	}
	public void setHighestNavDate(Date highestNavDate) {
		this.highestNavDate = highestNavDate;
	}
	public Double getHighestNavValue() {
		return highestNavValue;
	}
	public void setHighestNavValue(Double highestNavValue) {
		this.highestNavValue = highestNavValue;
	}
	public Double getHighestInvestmentValue() {
		return highestInvestmentValue;
	}
	public void setHighestInvestmentValue(Double highestInvestmentValue) {
		this.highestInvestmentValue = highestInvestmentValue;
	}
	public Date getTodaysNavDate() {
		return todaysNavDate;
	}
	public void setTodaysNavDate(Date todaysNavDate) {
		this.todaysNavDate = todaysNavDate;
	}
	public Double getTodaysNavValue() {
		return todaysNavValue;
	}
	public void setTodaysNavValue(Double todaysNavValue) {
		this.todaysNavValue = todaysNavValue;
	}
	public Double getTodaysInvestmentValue() {
		return todaysInvestmentValue;
	}
	public void setTodaysInvestmentValue(Double todaysInvestmentValue) {
		this.todaysInvestmentValue = todaysInvestmentValue;
	}
}
