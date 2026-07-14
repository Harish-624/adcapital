package com.mf.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bridge_associate_registration")
public class BridgeAssociateRegistration {
	
	private Integer id;
	private String first_name;
	private String middle_name;
	private String last_name;
	private String dob;
	private String pan;
	private String email;
	private String mobile;
	private String user_password;
	private String cor_address1;	 
	private String cor_address2;
	private String cor_city;
	private String cor_state;
	private String cor_pincode;	
	private String cor_phone;
	private String per_address1;	 
	private String per_address2;
	private String per_city;
	private String per_state;
	private String per_pincode;	
	private String per_phone;
	private String arn_status;
	private String arn_code;
	private String arn_issue_date;
	private String arn_expiry_date;
	private String euin_code;
	private String euin_issue_date;
	private String euin_expiry_date;
	private String sebi_status;
	private String ia_code;
	private String ia_issue_date;
	private String ia_expiry_date;
	private String org_type;
	private String sales_name;
	private String sales_email;
	private String sales_phone;
	private String operation_name;
	private String operation_email;
	private String operation_phone;
	private String bank_name;
	private String acc_no;
	private String ifsc_code;
	private String micr_code;
	private String acc_type;
	private String bank_address;
	private String bank_city;
	private String bank_state;
	private String bank_country;
	private String bank_pincode;
	private String equity_aum;
	private String debt_aum;
	private String insurance_aum;
	private String direct_equity_aum;
	private String others_aum;
	private String investor_count;
	private String branch_count;
	private String sales_person_count;
	private String subbroker_count;
	private String product;
	private Date created_date;
	
	private String pan_image;
	private String passport_image;
	private String gst_image;
	private String cheque_image;
	private String photo_image;
	private String arn_image;
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getMiddle_name() {
		return middle_name;
	}
	public void setMiddle_name(String middle_name) {
		this.middle_name = middle_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getSales_phone() {
		return sales_phone;
	}
	public void setSales_phone(String sales_phone) {
		this.sales_phone = sales_phone;
	}
	public String getOperation_phone() {
		return operation_phone;
	}
	public void setOperation_phone(String operation_phone) {
		this.operation_phone = operation_phone;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getPan() {
		return pan;
	}
	public void setPan(String pan) {
		this.pan = pan;
	}
	public String getCor_address1() {
		return cor_address1;
	}
	public void setCor_address1(String cor_address1) {
		this.cor_address1 = cor_address1;
	}
	public String getCor_address2() {
		return cor_address2;
	}
	public void setCor_address2(String cor_address2) {
		this.cor_address2 = cor_address2;
	}
	public String getCor_city() {
		return cor_city;
	}
	public void setCor_city(String cor_city) {
		this.cor_city = cor_city;
	}
	public String getCor_state() {
		return cor_state;
	}
	public void setCor_state(String cor_state) {
		this.cor_state = cor_state;
	}
	public String getCor_pincode() {
		return cor_pincode;
	}
	public void setCor_pincode(String cor_pincode) {
		this.cor_pincode = cor_pincode;
	}
	public String getPer_address1() {
		return per_address1;
	}
	public void setPer_address1(String per_address1) {
		this.per_address1 = per_address1;
	}
	public String getPer_address2() {
		return per_address2;
	}
	public void setPer_address2(String per_address2) {
		this.per_address2 = per_address2;
	}
	public String getPer_city() {
		return per_city;
	}
	public void setPer_city(String per_city) {
		this.per_city = per_city;
	}
	public String getPer_state() {
		return per_state;
	}
	public void setPer_state(String per_state) {
		this.per_state = per_state;
	}
	public String getPer_pincode() {
		return per_pincode;
	}
	public void setPer_pincode(String per_pincode) {
		this.per_pincode = per_pincode;
	}
	public String getArn_status() {
		return arn_status;
	}
	public void setArn_status(String arn_status) {
		this.arn_status = arn_status;
	}
	public String getArn_code() {
		return arn_code;
	}
	public void setArn_code(String arn_code) {
		this.arn_code = arn_code;
	}
	public String getArn_issue_date() {
		return arn_issue_date;
	}
	public void setArn_issue_date(String arn_issue_date) {
		this.arn_issue_date = arn_issue_date;
	}
	public String getArn_expiry_date() {
		return arn_expiry_date;
	}
	public void setArn_expiry_date(String arn_expiry_date) {
		this.arn_expiry_date = arn_expiry_date;
	}
	public String getEuin_code() {
		return euin_code;
	}
	public void setEuin_code(String euin_code) {
		this.euin_code = euin_code;
	}
	public String getEuin_issue_date() {
		return euin_issue_date;
	}
	public void setEuin_issue_date(String euin_issue_date) {
		this.euin_issue_date = euin_issue_date;
	}
	public String getEuin_expiry_date() {
		return euin_expiry_date;
	}
	public void setEuin_expiry_date(String euin_expiry_date) {
		this.euin_expiry_date = euin_expiry_date;
	}
	public String getIa_code() {
		return ia_code;
	}
	public void setIa_code(String ia_code) {
		this.ia_code = ia_code;
	}
	public String getIa_issue_date() {
		return ia_issue_date;
	}
	public void setIa_issue_date(String ia_issue_date) {
		this.ia_issue_date = ia_issue_date;
	}
	public String getIa_expiry_date() {
		return ia_expiry_date;
	}
	public void setIa_expiry_date(String ia_expiry_date) {
		this.ia_expiry_date = ia_expiry_date;
	}
	public String getOrg_type() {
		return org_type;
	}
	public void setOrg_type(String org_type) {
		this.org_type = org_type;
	}
	public String getSales_name() {
		return sales_name;
	}
	public void setSales_name(String sales_name) {
		this.sales_name = sales_name;
	}
	public String getSales_email() {
		return sales_email;
	}
	public void setSales_email(String sales_email) {
		this.sales_email = sales_email;
	}
	public String getOperation_name() {
		return operation_name;
	}
	public void setOperation_name(String operation_name) {
		this.operation_name = operation_name;
	}
	public String getOperation_email() {
		return operation_email;
	}
	public void setOperation_email(String operation_email) {
		this.operation_email = operation_email;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getAcc_no() {
		return acc_no;
	}
	public void setAcc_no(String acc_no) {
		this.acc_no = acc_no;
	}
	public String getIfsc_code() {
		return ifsc_code;
	}
	public void setIfsc_code(String ifsc_code) {
		this.ifsc_code = ifsc_code;
	}
	public String getMicr_code() {
		return micr_code;
	}
	public void setMicr_code(String micr_code) {
		this.micr_code = micr_code;
	}
	public String getAcc_type() {
		return acc_type;
	}
	public void setAcc_type(String acc_type) {
		this.acc_type = acc_type;
	}
	public String getBank_address() {
		return bank_address;
	}
	public void setBank_address(String bank_address) {
		this.bank_address = bank_address;
	}
	public String getBank_city() {
		return bank_city;
	}
	public void setBank_city(String bank_city) {
		this.bank_city = bank_city;
	}
	public String getBank_state() {
		return bank_state;
	}
	public void setBank_state(String bank_state) {
		this.bank_state = bank_state;
	}
	public String getBank_country() {
		return bank_country;
	}
	public void setBank_country(String bank_country) {
		this.bank_country = bank_country;
	}
	public String getBank_pincode() {
		return bank_pincode;
	}
	public void setBank_pincode(String bank_pincode) {
		this.bank_pincode = bank_pincode;
	}
	public String getEquity_aum() {
		return equity_aum;
	}
	public void setEquity_aum(String equity_aum) {
		this.equity_aum = equity_aum;
	}
	public String getDebt_aum() {
		return debt_aum;
	}
	public void setDebt_aum(String debt_aum) {
		this.debt_aum = debt_aum;
	}
	public String getInsurance_aum() {
		return insurance_aum;
	}
	public void setInsurance_aum(String insurance_aum) {
		this.insurance_aum = insurance_aum;
	}
	public String getDirect_equity_aum() {
		return direct_equity_aum;
	}
	public void setDirect_equity_aum(String direct_equity_aum) {
		this.direct_equity_aum = direct_equity_aum;
	}
	public String getOthers_aum() {
		return others_aum;
	}
	public void setOthers_aum(String others_aum) {
		this.others_aum = others_aum;
	}
	public String getInvestor_count() {
		return investor_count;
	}
	public void setInvestor_count(String investor_count) {
		this.investor_count = investor_count;
	}
	public String getBranch_count() {
		return branch_count;
	}
	public void setBranch_count(String branch_count) {
		this.branch_count = branch_count;
	}
	public String getSales_person_count() {
		return sales_person_count;
	}
	public void setSales_person_count(String sales_person_count) {
		this.sales_person_count = sales_person_count;
	}
	public String getSubbroker_count() {
		return subbroker_count;
	}
	public void setSubbroker_count(String subbroker_count) {
		this.subbroker_count = subbroker_count;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public String getSebi_status() {
		return sebi_status;
	}
	public void setSebi_status(String sebi_status) {
		this.sebi_status = sebi_status;
	}
	public String getPan_image() {
		return pan_image;
	}
	public void setPan_image(String pan_image) {
		this.pan_image = pan_image;
	}
	public String getPassport_image() {
		return passport_image;
	}
	public void setPassport_image(String passport_image) {
		this.passport_image = passport_image;
	}
	public String getGst_image() {
		return gst_image;
	}
	public void setGst_image(String gst_image) {
		this.gst_image = gst_image;
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
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getCheque_image() {
		return cheque_image;
	}
	public void setCheque_image(String cheque_image) {
		this.cheque_image = cheque_image;
	}
	public String getPhoto_image() {
		return photo_image;
	}
	public void setPhoto_image(String photo_image) {
		this.photo_image = photo_image;
	}
	public String getArn_image() {
		return arn_image;
	}
	public void setArn_image(String arn_image) {
		this.arn_image = arn_image;
	}
	public String getCor_phone() {
		return cor_phone;
	}
	public void setCor_phone(String cor_phone) {
		this.cor_phone = cor_phone;
	}
	public String getPer_phone() {
		return per_phone;
	}
	public void setPer_phone(String per_phone) {
		this.per_phone = per_phone;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
}
