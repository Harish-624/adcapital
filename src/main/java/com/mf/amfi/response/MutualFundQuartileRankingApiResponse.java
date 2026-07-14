package com.mf.amfi.response;

import java.util.Date;
import java.util.List;

import com.mf.amfi.model.SchemeQuartileRanking;
import com.mf.amfi.model.SchemeQuartileRankingAnnualReturns;

public class MutualFundQuartileRankingApiResponse {
	
	public Integer status;
	public String status_msg;
	public String msg;
	public List<SchemeQuartileRanking> list;
	public List<QuartileRankingResponse> quartileRankingResponseList;
	public Date nav_date;
	public List<SchemeQuartileRankingAnnualReturns> quartile_annual_list;
	
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
	public List<SchemeQuartileRanking> getList() {
		return list;
	}
	public void setList(List<SchemeQuartileRanking> list) {
		this.list = list;
	}
	public Date getNav_date() {
		return nav_date;
	}
	public void setNav_date(Date nav_date) {
		this.nav_date = nav_date;
	}
	public List<QuartileRankingResponse> getQuartileRankingResponseList() {
		return quartileRankingResponseList;
	}
	public void setQuartileRankingResponseList(List<QuartileRankingResponse> quartileRankingResponseList) {
		this.quartileRankingResponseList = quartileRankingResponseList;
	}
	public List<SchemeQuartileRankingAnnualReturns> getQuartile_annual_list() {
		return quartile_annual_list;
	}
	public void setQuartile_annual_list(List<SchemeQuartileRankingAnnualReturns> quartile_annual_list) {
		this.quartile_annual_list = quartile_annual_list;
	}
}
