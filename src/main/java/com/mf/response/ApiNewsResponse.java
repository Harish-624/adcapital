package com.mf.response;

public class ApiNewsResponse 
{
	private int id;
	private String title;
	private String small_content;
	private String full_content;
	private String android_content;
	private String source_name;
	private String create_date;
	private String category;
	private String url;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSmall_content() {
		return small_content;
	}
	public void setSmall_content(String small_content) {
		this.small_content = small_content;
	}
	public String getSource_name() {
		return source_name;
	}
	public void setSource_name(String source_name) {
		this.source_name = source_name;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getFull_content() {
		return full_content;
	}
	public void setFull_content(String full_content) {
		this.full_content = full_content;
	}
	public String getAndroid_content() {
		return android_content;
	}
	public void setAndroid_content(String android_content) {
		this.android_content = android_content;
	}
	
	
}
