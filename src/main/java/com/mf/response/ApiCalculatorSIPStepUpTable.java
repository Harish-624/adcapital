package com.mf.response;


public class ApiCalculatorSIPStepUpTable {
	
    private String year;
    private long sip_amount_per_month;
    private long invested_amount_per_year;
    private long total_invested_amount;
    
    
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public long getSip_amount_per_month() {
		return sip_amount_per_month;
	}
	public void setSip_amount_per_month(long sip_amount_per_month) {
		this.sip_amount_per_month = sip_amount_per_month;
	}
	public long getInvested_amount_per_year() {
		return invested_amount_per_year;
	}
	public void setInvested_amount_per_year(long invested_amount_per_year) {
		this.invested_amount_per_year = invested_amount_per_year;
	}
	public long getTotal_invested_amount() {
		return total_invested_amount;
	}
	public void setTotal_invested_amount(long total_invested_amount) {
		this.total_invested_amount = total_invested_amount;
	}
}
