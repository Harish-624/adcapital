package com.mf.amfi.response;

import java.util.List;

import com.mf.amfi.model.LatestNav;
import com.mf.amfi.model.SchemeNavChange;
import com.mf.amfi.model.SchemeNavMonthChange;

public class LatestMutualFundsNAV52WeekHighNavResponse {

	public Integer status;
	public String status_msg;
	public String msg;
	
	public List<String> amcCompanies ;
	public List<String> schemeCategories;
	public List<SchemeNavChange> schemeNavChanges;
	public List<HigestNAVvsTodaysNavResponse> higestNAVvsTodaysNavResponseList;
	public List<LatestNav> dailyNavResponseList;
	private List<NavByAmcCategoryResponse>  navByAmcCategoryResponseList;
	public List<SchemeNavMonthChange> schemeNavMonthChange;
	public List<PointToPointNavResponse> pointToPointNavResponse;
	
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
	public List<String> getAmcCompanies() {
		return amcCompanies;
	}
	public void setAmcCompanies(List<String> amcCompanies) {
		this.amcCompanies = amcCompanies;
	}
	public List<String> getSchemeCategories() {
		return schemeCategories;
	}
	public void setSchemeCategories(List<String> schemeCategories) {
		this.schemeCategories = schemeCategories;
	}
	public List<SchemeNavChange> getSchemeNavChanges() {
		return schemeNavChanges;
	}
	public void setSchemeNavChanges(List<SchemeNavChange> schemeNavChanges) {
		this.schemeNavChanges = schemeNavChanges;
	}
	public List<HigestNAVvsTodaysNavResponse> getHigestNAVvsTodaysNavResponseList() {
		return higestNAVvsTodaysNavResponseList;
	}
	public void setHigestNAVvsTodaysNavResponseList(List<HigestNAVvsTodaysNavResponse> higestNAVvsTodaysNavResponseList) {
		this.higestNAVvsTodaysNavResponseList = higestNAVvsTodaysNavResponseList;
	}
	public List<LatestNav> getDailyNavResponseList() {
		return dailyNavResponseList;
	}
	public void setDailyNavResponseList(List<LatestNav> dailyNavResponseList) {
		this.dailyNavResponseList = dailyNavResponseList;
	}
	public List<NavByAmcCategoryResponse> getNavByAmcCategoryResponseList() {
		return navByAmcCategoryResponseList;
	}
	public void setNavByAmcCategoryResponseList(List<NavByAmcCategoryResponse> navByAmcCategoryResponseList) {
		this.navByAmcCategoryResponseList = navByAmcCategoryResponseList;
	}
	public List<SchemeNavMonthChange> getSchemeNavMonthChange() {
		return schemeNavMonthChange;
	}
	public void setSchemeNavMonthChange(List<SchemeNavMonthChange> schemeNavMonthChange) {
		this.schemeNavMonthChange = schemeNavMonthChange;
	}
	public List<PointToPointNavResponse> getPointToPointNavResponse() {
		return pointToPointNavResponse;
	}
	public void setPointToPointNavResponse(List<PointToPointNavResponse> pointToPointNavResponse) {
		this.pointToPointNavResponse = pointToPointNavResponse;
	}	
}
