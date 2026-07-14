package com.mf.amfi.response;

import java.util.List;

public class SIPSchemePerformanceResponse {

	String scheme;
	String isin;
	String category;
	String inception_date;
	double current_cost;
	double current_value;
	double returns;
	double expense_ratio;
	double net_assets;
	String last_nav_date;
	double last_nav;
	double total_units;
	int installment;
	String sip_start_date;
	String sip_end_date;
	List<Integer> year_list;
	List<Double> value_list;
	double ppf_current_value;
	double ppf_returns;
	double start_nav;
	double end_nav;
    String url;
    double total_dividend_amount;
    
    String scheme_amfi_url;

    
    String scheme_company;
    String scheme_company_short_name;
    
    String scheme_amfi_short_name;
	
	public String getScheme() {
		return scheme;
	}
	public void setScheme(String scheme) {
		this.scheme = scheme;
	}
	public String getInception_date() {
		return inception_date;
	}
	public void setInception_date(String inception_date) {
		this.inception_date = inception_date;
	}
	public double getCurrent_value() {
		return current_value;
	}
	public void setCurrent_value(double current_value) {
		this.current_value = current_value;
	}
	public double getCurrent_cost() {
		return current_cost;
	}
	public void setCurrent_cost(double current_cost) {
		this.current_cost = current_cost;
	}
	public double getReturns() {
		return returns;
	}
	public void setReturns(double returns) {
		this.returns = returns;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public double getExpense_ratio() {
		return expense_ratio;
	}
	public void setExpense_ratio(double expense_ratio) {
		this.expense_ratio = expense_ratio;
	}
	public double getNet_assets() {
		return net_assets;
	}
	public void setNet_assets(double net_assets) {
		this.net_assets = net_assets;
	}
	public String getLast_nav_date() {
		return last_nav_date;
	}
	public void setLast_nav_date(String last_nav_date) {
		this.last_nav_date = last_nav_date;
	}
	public double getLast_nav() {
		return last_nav;
	}
	public void setLast_nav(double last_nav) {
		this.last_nav = last_nav;
	}
	public double getTotal_units() {
		return total_units;
	}
	public void setTotal_units(double total_units) {
		this.total_units = total_units;
	}
	public int getInstallment() {
		return installment;
	}
	public void setInstallment(int installment) {
		this.installment = installment;
	}
	public String getSip_start_date() {
		return sip_start_date;
	}
	public void setSip_start_date(String sip_start_date) {
		this.sip_start_date = sip_start_date;
	}
	public String getSip_end_date() {
		return sip_end_date;
	}
	public void setSip_end_date(String sip_end_date) {
		this.sip_end_date = sip_end_date;
	}
	public List<Integer> getYear_list() {
		return year_list;
	}
	public void setYear_list(List<Integer> year_list) {
		this.year_list = year_list;
	}
	public List<Double> getValue_list() {
		return value_list;
	}
	public void setValue_list(List<Double> value_list) {
		this.value_list = value_list;
	}
	public double getPpf_current_value() {
		return ppf_current_value;
	}
	public void setPpf_current_value(double ppf_current_value) {
		this.ppf_current_value = ppf_current_value;
	}
	public double getPpf_returns() {
		return ppf_returns;
	}
	public void setPpf_returns(double ppf_returns) {
		this.ppf_returns = ppf_returns;
	}
	public double getStart_nav() {
		return start_nav;
	}
	public void setStart_nav(double start_nav) {
		this.start_nav = start_nav;
	}
	public double getEnd_nav() {
		return end_nav;
	}
	public void setEnd_nav(double end_nav) {
		this.end_nav = end_nav;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public double getTotal_dividend_amount() {
		return total_dividend_amount;
	}
	public void setTotal_dividend_amount(double total_dividend_amount) {
		this.total_dividend_amount = total_dividend_amount;
	}
	public String getIsin() {
		return isin;
	}
	public void setIsin(String isin) {
		this.isin = isin;
	}

	public String getScheme_amfi_url() {
		return scheme_amfi_url;
	}
	public void setScheme_amfi_url(String scheme_amfi_url) {
		this.scheme_amfi_url = scheme_amfi_url;
	}
	public String getScheme_company() {
		return scheme_company;
	}
	public void setScheme_company(String scheme_company) {
		this.scheme_company = scheme_company;
	}
	public String getScheme_company_short_name() {
		return scheme_company_short_name;
	}
	public void setScheme_company_short_name(String scheme_company_short_name) {
		this.scheme_company_short_name = scheme_company_short_name;
	}
	public String getScheme_amfi_short_name() {
		return scheme_amfi_short_name;
	}
	public void setScheme_amfi_short_name(String scheme_amfi_short_name) {
		this.scheme_amfi_short_name = scheme_amfi_short_name;
	}
}
