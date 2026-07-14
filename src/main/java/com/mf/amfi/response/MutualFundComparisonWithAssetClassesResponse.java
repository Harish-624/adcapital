package com.mf.amfi.response;


import java.util.List;

import com.mf.amfi.response.SIPSchemePerformanceResponse;

public class MutualFundComparisonWithAssetClassesResponse {
	
	public Integer status;
	public String status_msg;
	public String msg;
	
	public String scheme;
	public String year;
	public String amount;
	public List<SIPSchemePerformanceResponse> list;
	public List<SIPSchemePerformanceResponse> graph_data_list;
	public List<MutualFundComparisonWithAssetClassesResponse> graph_list;
	
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
	
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getScheme() {
		return scheme;
	}
	public void setScheme(String scheme) {
		this.scheme = scheme;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public List<SIPSchemePerformanceResponse> getList() {
		return list;
	}
	public void setList(List<SIPSchemePerformanceResponse> list) {
		this.list = list;
	}

	public List<SIPSchemePerformanceResponse> getGraph_data_list() {
		return graph_data_list;
	}
	public void setGraph_data_list(List<SIPSchemePerformanceResponse> graph_data_list) {
		this.graph_data_list = graph_data_list;
	}
	public List<MutualFundComparisonWithAssetClassesResponse> getGraph_list() {
		return graph_list;
	}
	public void setGraph_list(List<MutualFundComparisonWithAssetClassesResponse> graph_list) {
		this.graph_list = graph_list;
	}
	
}
