package com.mf.amfi.response;

import java.util.List;

import com.mf.amfi.model.SchemePortfolioHeathCheckup;
import com.mf.response.BestRollingReturnsSummaryFinalResponse;


public class MutualFundTopConsistentFundResponse {
	
	public Integer status;
	public String status_msg;
	public String msg;
	public List<SchemePortfolioHeathCheckup> list;
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
	public List<SchemePortfolioHeathCheckup> getList() {
		return list;
	}
	public void setList(List<SchemePortfolioHeathCheckup> list) {
		this.list = list;
	}
	public List<BestRollingReturnsSummaryFinalResponse> getList1() {
		return list1;
	}
	public void setList1(List<BestRollingReturnsSummaryFinalResponse> list1) {
		this.list1 = list1;
	}	
}
