package com.mf.amfi.response;

import java.util.List;

import com.mf.amfi.model.SchemePerformancesSip;


public class MutualFundSIPReturnsAPIResponse {


	public Integer status;
	public String status_msg;
	public String msg;
	public List<SchemePerformancesSip> list;
	public List<SipResponseByAmc> sipList;
	public List<SchemePerformancesSip> benchmark_returns_list;
	public List<SchemePerformancesSip> category_returns_list;
	public SchemePerformancesSip benchmark_returns;
	public SchemePerformancesSip category_returns;

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
	public List<SipResponseByAmc> getSipList() {
		return sipList;
	}
	public void setSipList(List<SipResponseByAmc> sipList) {
		this.sipList = sipList;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public List<SchemePerformancesSip> getList() {
		return list;
	}
	public void setList(List<SchemePerformancesSip> list) {
		this.list = list;
	}
	public SchemePerformancesSip getBenchmark_returns() {
		return benchmark_returns;
	}
	public void setBenchmark_returns(SchemePerformancesSip benchmark_returns) {
		this.benchmark_returns = benchmark_returns;
	}
	public SchemePerformancesSip getCategory_returns() {
		return category_returns;
	}
	public void setCategory_returns(SchemePerformancesSip category_returns) {
		this.category_returns = category_returns;
	}
	public List<SchemePerformancesSip> getBenchmark_returns_list() {
		return benchmark_returns_list;
	}
	public void setBenchmark_returns_list(List<SchemePerformancesSip> benchmark_returns_list) {
		this.benchmark_returns_list = benchmark_returns_list;
	}
	public List<SchemePerformancesSip> getCategory_returns_list() {
		return category_returns_list;
	}
	public void setCategory_returns_list(List<SchemePerformancesSip> category_returns_list) {
		this.category_returns_list = category_returns_list;
	}
}
