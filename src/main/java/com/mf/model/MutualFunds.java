package com.mf.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "mutual_funds")
public class MutualFunds implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id")
	private int id;
	private String title;
	private String content;
	private Date created_date;
	private String title_url;
	private int feedback_positive;
	private int feedback_negative;
	private String related_articles;
	private String related_calc;
	private String related_topics; 
	private String meta_description;
	private String client_name;
	
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public String getTitle_url() {
		return title_url;
	}
	public void setTitle_url(String title_url) {
		this.title_url = title_url;
	}
	public int getFeedback_positive() {
		return feedback_positive;
	}
	public void setFeedback_positive(int feedback_positive) {
		this.feedback_positive = feedback_positive;
	}
	public int getFeedback_negative() {
		return feedback_negative;
	}
	public void setFeedback_negative(int feedback_negative) {
		this.feedback_negative = feedback_negative;
	}
	public String getRelated_articles() {
		return related_articles;
	}
	public void setRelated_articles(String related_articles) {
		this.related_articles = related_articles;
	}
	public String getRelated_calc() {
		return related_calc;
	}
	public void setRelated_calc(String related_calc) {
		this.related_calc = related_calc;
	}
	public String getRelated_topics() {
		return related_topics;
	}
	public void setRelated_topics(String related_topics) {
		this.related_topics = related_topics;
	}
	public String getMeta_description() {
		return meta_description;
	}
	public void setMeta_description(String meta_description) {
		this.meta_description = meta_description;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
}
