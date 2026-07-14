package com.mf.amfi.response;

import java.util.List;

import com.mf.amfi.model.SchemePerformances;
import com.mf.amfi.model.SchemePerformancesBenchmark;
import com.mf.amfi.model.SchemePerformancesCategory;


public class AnnualReturnOFFundsResponse {

	public Integer status;
	public String status_msg;
	public String msg;
	public List<SchemePerformances> schemePerformancesList;
	public SchemePerformancesBenchmark benchmark_returns;
	public SchemePerformancesCategory category_returns;
	
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
	public List<SchemePerformances> getSchemePerformancesList() {
		return schemePerformancesList;
	}
	public void setSchemePerformancesList(List<SchemePerformances> schemePerformancesList) {
		this.schemePerformancesList = schemePerformancesList;
	}
	public SchemePerformancesBenchmark getBenchmark_returns() {
		return benchmark_returns;
	}
	public void setBenchmark_returns(SchemePerformancesBenchmark benchmark_returns) {
		this.benchmark_returns = benchmark_returns;
	}
	public SchemePerformancesCategory getCategory_returns() {
		return category_returns;
	}
	public void setCategory_returns(SchemePerformancesCategory category_returns) {
		this.category_returns = category_returns;
	}
}
