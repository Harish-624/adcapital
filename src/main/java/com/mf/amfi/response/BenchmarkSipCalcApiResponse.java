package com.mf.amfi.response;

import java.util.List;

public class BenchmarkSipCalcApiResponse {

	public Integer status;
	public String status_msg;
	public String msg;

	public String category;
	public String frequency;
	public String amount;
	public String start_date;
	public String end_date;
	List<BenchmarkSIPCalcFinalResponse> list;
	List<BenchmarkSIPCalcFinalResponse> benchlist;
	
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getFrequency() {
		return frequency;
	}
	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public List<BenchmarkSIPCalcFinalResponse> getList() {
		return list;
	}
	public void setList(List<BenchmarkSIPCalcFinalResponse> list) {
		this.list = list;
	}
	public List<BenchmarkSIPCalcFinalResponse> getBenchlist() {
		return benchlist;
	}
	public void setBenchlist(List<BenchmarkSIPCalcFinalResponse> benchlist) {
		this.benchlist = benchlist;
	}	
}
