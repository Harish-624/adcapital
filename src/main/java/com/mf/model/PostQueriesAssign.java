package com.mf.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "post_queries_assign")
public class PostQueriesAssign
{
	private int id;
	private int query_id;
	private int advisor_id;
	private String advisor_name;
	private String email;
	private String mobile;
	private Date assign_date;
	private Date reply_date;
	private String reply;
	private boolean active;
	private String profile_url;
	private Integer service_id;
	private String service_name;
	private String android_reply;
	private String short_content;
	private String disqus_url;	
	private String title;
	private String url;
	private String client_name;
	
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuery_id() {
		return query_id;
	}
	public void setQuery_id(int query_id) {
		this.query_id = query_id;
	}
	
	public String getAdvisor_name() {
		return advisor_name;
	}
	public void setAdvisor_name(String advisor_name) {
		this.advisor_name = advisor_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Date getAssign_date() {
		return assign_date;
	}
	public void setAssign_date(Date assign_date) {
		this.assign_date = assign_date;
	}
	
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public String getProfile_url() {
		return profile_url;
	}
	public void setProfile_url(String profile_url) {
		this.profile_url = profile_url;
	}
	public Integer getService_id() {
		return service_id;
	}
	public void setService_id(Integer service_id) {
		this.service_id = service_id;
	}
	public String getService_name() {
		return service_name;
	}
	public void setService_name(String service_name) {
		this.service_name = service_name;
	}
	public String getAndroid_reply() {
		return android_reply;
	}
	public void setAndroid_reply(String android_reply) {
		this.android_reply = android_reply;
	}
	public String getShort_content() {
		return short_content;
	}
	public void setShort_content(String short_content) {
		this.short_content = short_content;
	}
	public String getDisqus_url() {
		return disqus_url;
	}
	public void setDisqus_url(String disqus_url) {
		this.disqus_url = disqus_url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getAdvisor_id() {
		return advisor_id;
	}
	public void setAdvisor_id(int advisor_id) {
		this.advisor_id = advisor_id;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
}
