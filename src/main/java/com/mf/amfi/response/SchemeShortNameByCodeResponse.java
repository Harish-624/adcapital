package com.mf.amfi.response;

public class SchemeShortNameByCodeResponse {
	
	
	public Integer status;
	public String status_msg;
	public String msg;
	public String scheme_name;
	public String scheme_amfi_short_name;
	public String scheme_amfi_common;
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
	public String getScheme_name() {
		return scheme_name;
	}
	public void setScheme_name(String scheme_name) {
		this.scheme_name = scheme_name;
	}
	public String getScheme_amfi_short_name() {
		return scheme_amfi_short_name;
	}
	public void setScheme_amfi_short_name(String scheme_amfi_short_name) {
		this.scheme_amfi_short_name = scheme_amfi_short_name;
	}
	public String getScheme_amfi_common() {
		return scheme_amfi_common;
	}
	public void setScheme_amfi_common(String scheme_amfi_common) {
		this.scheme_amfi_common = scheme_amfi_common;
	}

}
