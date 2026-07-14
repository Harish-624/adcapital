package com.mf.response;

import java.util.List;

import com.mf.model.Users;
import com.mf.model.UsersGoalSavedPlan;
import com.mf.model.UsersPortfolioSchemewise;

public class CommonResponse 
{
	public int status;
	public String status_msg;
	public String msg;
	public List<String> list;
	public String encrypted_text;
	public String userid;
	
	private int pageid;
	private int pageCount;
	private int totalCount;
	public Users user;
	
	private List<UsersPortfolioSchemewise> usersPortfolioSchemewiseList;
	
	private List<UsersGoalSavedPlan> goal_list; 

	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
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
	public List<String> getList() {
		return list;
	}
	public int getPageid() {
		return pageid;
	}
	public void setPageid(int pageid) {
		this.pageid = pageid;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	public void setList(List<String> list) {
		this.list = list;
	}
	public String getEncrypted_text() {
		return encrypted_text;
	}
	public void setEncrypted_text(String encrypted_text) {
		this.encrypted_text = encrypted_text;
	}
	public String getUserid() {
		return userid;
	}
	public List<UsersGoalSavedPlan> getGoal_list() {
		return goal_list;
	}
	public void setGoal_list(List<UsersGoalSavedPlan> goal_list) {
		this.goal_list = goal_list;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public List<UsersPortfolioSchemewise> getUsersPortfolioSchemewiseList() {
		return usersPortfolioSchemewiseList;
	}
	public void setUsersPortfolioSchemewiseList(List<UsersPortfolioSchemewise> usersPortfolioSchemewiseList) {
		this.usersPortfolioSchemewiseList = usersPortfolioSchemewiseList;
	}
	
}
