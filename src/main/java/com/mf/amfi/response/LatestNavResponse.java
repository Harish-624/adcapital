package com.mf.amfi.response;

import java.util.List;

import com.mf.amfi.model.LatestNav;



public class LatestNavResponse {

	public List<LatestNav> latestNavList;
    public String pageId;
    public String noOfPages;
    public String noOfRecords;
    public String noOfTotalRecords;
	public List<LatestNav> getLatestNavList() {
		return latestNavList;
	}
	public void setLatestNavList(List<LatestNav> latestNavList) {
		this.latestNavList = latestNavList;
	}
	public String getPageId() {
		return pageId;
	}
	public void setPageId(String pageId) {
		this.pageId = pageId;
	}
	public String getNoOfPages() {
		return noOfPages;
	}
	public void setNoOfPages(String noOfPages) {
		this.noOfPages = noOfPages;
	}
	public String getNoOfRecords() {
		return noOfRecords;
	}
	public void setNoOfRecords(String noOfRecords) {
		this.noOfRecords = noOfRecords;
	}
	public String getNoOfTotalRecords() {
		return noOfTotalRecords;
	}
	public void setNoOfTotalRecords(String noOfTotalRecords) {
		this.noOfTotalRecords = noOfTotalRecords;
	}
}
