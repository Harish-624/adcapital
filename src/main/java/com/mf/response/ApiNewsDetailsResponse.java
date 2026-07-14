package com.mf.response;

import java.util.Date;
import java.util.List;


public class ApiNewsDetailsResponse 
{
	private Integer status;
	private String status_msg;
	private String msg;
	private int id;
	
	private String android_content;
	private String title;
	private String url;
	private String full_content;
	private String source_name;
	private String source_url;
	private Date create_date;
	private String category;

	
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAndroid_content() {
		return android_content;
	}
	public void setAndroid_content(String android_content) {
		this.android_content = android_content;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFull_content() {
		return full_content;
	}
	public void setFull_content(String full_content) {
		this.full_content = full_content;
	}
	public String getSource_name() {
		return source_name;
	}
	public void setSource_name(String source_name) {
		this.source_name = source_name;
	}
	public String getSource_url() {
		return source_url;
	}
	public void setSource_url(String source_url) {
		this.source_url = source_url;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}	
}
