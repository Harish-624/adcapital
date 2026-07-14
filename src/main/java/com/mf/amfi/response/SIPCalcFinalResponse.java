package com.mf.amfi.response;

import java.util.Date;
import java.util.List;


public class SIPCalcFinalResponse 
{
	public String scheme;
	public Date inception_date;
    public Date nav_date;
    public Double nav;
    public Double units;
    public int no_of_installment;
    public Double invested_amount;
    public Double current_value;
    public Double returns;
    public List<SIPCalcResponse> sip_list;
    public String url;
    public Date current_nav_date;
    public Double current_value_today;
    
    public String scheme_amfi_url;
    
	public String getScheme() {
		return scheme;
	}
	public void setScheme(String scheme) {
		this.scheme = scheme;
	}
	public Date getInception_date() {
		return inception_date;
	}
	public void setInception_date(Date inception_date) {
		this.inception_date = inception_date;
	}
	public Date getNav_date() {
		return nav_date;
	}
	public void setNav_date(Date nav_date) {
		this.nav_date = nav_date;
	}
	public Double getNav() {
		return nav;
	}
	public void setNav(Double nav) {
		this.nav = nav;
	}
	public Double getUnits() {
		return units;
	}
	public void setUnits(Double units) {
		this.units = units;
	}
	public int getNo_of_installment() {
		return no_of_installment;
	}
	public void setNo_of_installment(int no_of_installment) {
		this.no_of_installment = no_of_installment;
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
	public Double getReturns() {
		return returns;
	}
	public void setReturns(Double returns) {
		this.returns = returns;
	}
	public List<SIPCalcResponse> getSip_list() {
		return sip_list;
	}
	public void setSip_list(List<SIPCalcResponse> sip_list) {
		this.sip_list = sip_list;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getScheme_amfi_url() {
		return scheme_amfi_url;
	}
	public void setScheme_amfi_url(String scheme_amfi_url) {
		this.scheme_amfi_url = scheme_amfi_url;
	}
	public Date getCurrent_nav_date() {
		return current_nav_date;
	}
	public void setCurrent_nav_date(Date current_nav_date) {
		this.current_nav_date = current_nav_date;
	}
	public Double getCurrent_value_today() {
		return current_value_today;
	}
	public void setCurrent_value_today(Double current_value_today) {
		this.current_value_today = current_value_today;
	}
}
