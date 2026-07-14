package com.mf.response;


public class NseIINResponse {

	private String iin_number;
	private String bse_client_code;
	private String holding_nature;
	private String joint_holder_name1;
	private String joint_holder_name2;
	private String joint_holder_pan1;
	private String joint_holder_pan2;
	
	
	public String getIin_number() {
		return iin_number;
	}
	public void setIin_number(String iin_number) {
		this.iin_number = iin_number;
	}
	public String getHolding_nature() {
		return holding_nature;
	}
	public void setHolding_nature(String holding_nature) {
		this.holding_nature = holding_nature;
	}
	public String getJoint_holder_name1() {
		return joint_holder_name1;
	}
	public void setJoint_holder_name1(String joint_holder_name1) {
		this.joint_holder_name1 = joint_holder_name1;
	}
	public String getJoint_holder_name2() {
		return joint_holder_name2;
	}
	public void setJoint_holder_name2(String joint_holder_name2) {
		this.joint_holder_name2 = joint_holder_name2;
	}
	public String getJoint_holder_pan1() {
		return joint_holder_pan1;
	}
	public void setJoint_holder_pan1(String joint_holder_pan1) {
		this.joint_holder_pan1 = joint_holder_pan1;
	}
	public String getJoint_holder_pan2() {
		return joint_holder_pan2;
	}
	public void setJoint_holder_pan2(String joint_holder_pan2) {
		this.joint_holder_pan2 = joint_holder_pan2;
	}
	public String getBse_client_code() {
		return bse_client_code;
	}
	public void setBse_client_code(String bse_client_code) {
		this.bse_client_code = bse_client_code;
	}
}
