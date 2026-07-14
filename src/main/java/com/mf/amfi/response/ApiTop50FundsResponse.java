package com.mf.amfi.response;

import java.util.List;

import com.mf.amfi.model.SchemePerformances;

public class ApiTop50FundsResponse {

	public int status;
	public String status_msg;
	public String msg;
	public List<SchemePerformances> list;
	
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
	public List<SchemePerformances> getList() {
		return list;
	}
	public void setList(List<SchemePerformances> list) {
		this.list = list;
	}
}
