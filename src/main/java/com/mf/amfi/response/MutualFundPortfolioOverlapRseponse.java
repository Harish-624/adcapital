package com.mf.amfi.response;

import java.util.List;

public class MutualFundPortfolioOverlapRseponse {
	
	public Integer status;
	public String status_msg;
	public String msg;
	
	public Double scheme1_common_stocks;
	public Double scheme2_common_stocks;
	public Double scheme1_uncommon_stocks;
	public Double scheme2_uncommon_stocks;
	public Double scheme1_portfolio_overlap;
	public Double scheme2_portfolio_overlap;
	public Double average_portfolio_overlap;
	public Double no_portfolio_overlap;
	
	public Integer no_of_common_stocks;
	public Integer no_of_uncommon_stocks_scheme1;
	public Integer no_of_uncommon_stocks_scheme2;
	public String portfolio_date;
	public List<String> scheme_array;
	
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getStatus_msg() {
		return status_msg;
	}
	public void setStatus_msg(String status_msg) {
		this.status_msg = status_msg;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Double getScheme1_common_stocks() {
		return scheme1_common_stocks;
	}
	public void setScheme1_common_stocks(Double scheme1_common_stocks) {
		this.scheme1_common_stocks = scheme1_common_stocks;
	}
	public Double getScheme2_common_stocks() {
		return scheme2_common_stocks;
	}
	public void setScheme2_common_stocks(Double scheme2_common_stocks) {
		this.scheme2_common_stocks = scheme2_common_stocks;
	}
	public Double getScheme1_uncommon_stocks() {
		return scheme1_uncommon_stocks;
	}
	public void setScheme1_uncommon_stocks(Double scheme1_uncommon_stocks) {
		this.scheme1_uncommon_stocks = scheme1_uncommon_stocks;
	}
	public Double getScheme2_uncommon_stocks() {
		return scheme2_uncommon_stocks;
	}
	public void setScheme2_uncommon_stocks(Double scheme2_uncommon_stocks) {
		this.scheme2_uncommon_stocks = scheme2_uncommon_stocks;
	}
	public Double getScheme1_portfolio_overlap() {
		return scheme1_portfolio_overlap;
	}
	public void setScheme1_portfolio_overlap(Double scheme1_portfolio_overlap) {
		this.scheme1_portfolio_overlap = scheme1_portfolio_overlap;
	}
	public Double getScheme2_portfolio_overlap() {
		return scheme2_portfolio_overlap;
	}
	public void setScheme2_portfolio_overlap(Double scheme2_portfolio_overlap) {
		this.scheme2_portfolio_overlap = scheme2_portfolio_overlap;
	}
	public Double getAverage_portfolio_overlap() {
		return average_portfolio_overlap;
	}
	public void setAverage_portfolio_overlap(Double average_portfolio_overlap) {
		this.average_portfolio_overlap = average_portfolio_overlap;
	}
	public Double getNo_portfolio_overlap() {
		return no_portfolio_overlap;
	}
	public void setNo_portfolio_overlap(Double no_portfolio_overlap) {
		this.no_portfolio_overlap = no_portfolio_overlap;
	}
	public Integer getNo_of_common_stocks() {
		return no_of_common_stocks;
	}
	public void setNo_of_common_stocks(Integer no_of_common_stocks) {
		this.no_of_common_stocks = no_of_common_stocks;
	}
	public Integer getNo_of_uncommon_stocks_scheme1() {
		return no_of_uncommon_stocks_scheme1;
	}
	public void setNo_of_uncommon_stocks_scheme1(Integer no_of_uncommon_stocks_scheme1) {
		this.no_of_uncommon_stocks_scheme1 = no_of_uncommon_stocks_scheme1;
	}
	public Integer getNo_of_uncommon_stocks_scheme2() {
		return no_of_uncommon_stocks_scheme2;
	}
	public void setNo_of_uncommon_stocks_scheme2(Integer no_of_uncommon_stocks_scheme2) {
		this.no_of_uncommon_stocks_scheme2 = no_of_uncommon_stocks_scheme2;
	}
	public String getPortfolio_date() {
		return portfolio_date;
	}
	public void setPortfolio_date(String portfolio_date) {
		this.portfolio_date = portfolio_date;
	}
	public List<String> getScheme_array() {
		return scheme_array;
	}
	public void setScheme_array(List<String> scheme_array) {
		this.scheme_array = scheme_array;
	}
}
