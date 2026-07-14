package com.mf.amfi.response;

import java.util.List;

public class SIPReturnsCalculatorAMCWiseAPIResponse {

	public Integer status;
	public String status_msg;
	public String msg;
	public List<SIPSchemePerformanceResponse> list;
	public String scheme_benchmark_code;
	public String scheme_benchmark_name;
	
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
	public List<SIPSchemePerformanceResponse> getList() {
		return list;
	}
	public void setList(List<SIPSchemePerformanceResponse> list) {
		this.list = list;
	}
	public String getScheme_benchmark_code() {
		return scheme_benchmark_code;
	}
	public void setScheme_benchmark_code(String scheme_benchmark_code) {
		this.scheme_benchmark_code = scheme_benchmark_code;
	}
	public String getScheme_benchmark_name() {
		return scheme_benchmark_name;
	}
	public void setScheme_benchmark_name(String scheme_benchmark_name) {
		this.scheme_benchmark_name = scheme_benchmark_name;
	}
}
