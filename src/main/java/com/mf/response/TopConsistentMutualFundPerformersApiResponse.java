package com.mf.response;

import java.util.List;

import com.mf.amfi.response.QuartileRankingResponse;


public class TopConsistentMutualFundPerformersApiResponse {
	
	public Integer status;
	public String status_msg;
	public String msg;
	public List<QuartileRankingResponse> list;
	public List<BestRollingReturnsSummaryFinalResponse> list2;
	public List<BestRollingReturnsSummaryFinalResponse> list1;
	
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
	public List<QuartileRankingResponse> getList() {
		return list;
	}
	public void setList(List<QuartileRankingResponse> list) {
		this.list = list;
	}
	public List<BestRollingReturnsSummaryFinalResponse> getList2() {
		return list2;
	}
	public void setList2(List<BestRollingReturnsSummaryFinalResponse> list2) {
		this.list2 = list2;
	}
	public List<BestRollingReturnsSummaryFinalResponse> getList1() {
		return list1;
	}
	public void setList1(List<BestRollingReturnsSummaryFinalResponse> list1) {
		this.list1 = list1;
	}	
}
