package com.mf.response;

import java.util.List;


public class MutualFundPortfolioAPIResponse {

	public Integer status;
	public String status_msg;
	public String msg;
	
    public String amc;
    public String year;
    public String amc_name;
    public List<String> amcList;
    public List<String> year_list;
    public List<DownloadCenter2> portfolio_list;
	
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
	public String getAmc() {
		return amc;
	}
	public void setAmc(String amc) {
		this.amc = amc;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getAmc_name() {
		return amc_name;
	}
	public void setAmc_name(String amc_name) {
		this.amc_name = amc_name;
	}
	public List<String> getAmcList() {
		return amcList;
	}
	public void setAmcList(List<String> amcList) {
		this.amcList = amcList;
	}
	public List<String> getYear_list() {
		return year_list;
	}
	public void setYear_list(List<String> year_list) {
		this.year_list = year_list;
	}
	public List<DownloadCenter2> getPortfolio_list() {
		return portfolio_list;
	}
	public void setPortfolio_list(List<DownloadCenter2> portfolio_list) {
		this.portfolio_list = portfolio_list;
	}

}
