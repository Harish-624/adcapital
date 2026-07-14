package com.mf.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class Users 
{
	private Integer id;
	private String name;
	private String alias;
	private String pan;
	private String mobile;
	private String email;
	private Integer type_id;
	private String branch;
	private String branch_manager_name;
	private String rm_name;
	private String subbroker_name;
	private String payout;
	private Integer active;
	private Integer email_active;
	private String user_password;
	private String user_pass;
	
	private String street_1;
	private String street_2;
	private String street_3;
	private String city;
	private String pincode;
	private String state;
	private String state_code;
	private String country;
	private String father_name;
	private String gender;
	private String date_of_birth;
	private String marital_status;
	private String anniversary_date;
	private String place_of_birth;
	private String country_of_birth;
	private String country_birth_code;
	private String phone_office;
	private String phone_residence;
	private String resident_status;
	
	private String tax_status;
	private String tax_status_code;
	private String holding_nature;
	private String holding_nature_code;
	private String occupation;
	private String occupation_code;
	private String annual_income;
	private String annual_income_code;
	private String source_of_wealth;
	private String source_of_wealth_code;
	private String political;
	private String political_code;
	private String networth_amount;
	private String networth_dob;
	private String address_type;
	private String address_type_code;
	
	private String guard_name;
	private String guard_pan;
	private String guard_dob;
	private String guard_mobile;
	private String guard_email;
	private String guard_relationship;
	private String guard_others;
	
	private String joint_holder_name1;
	private String joint_holder_pan1;
	private String joint_holder_dob1;
	private String joint_holder_email1;
	private String joint_holder_mobile1;
	private String joint_holder_signature1;
	private String joint_holder_name2;
	private String joint_holder_pan2;
	private String joint_holder_dob2;
	private String joint_holder_email2;
	private String joint_holder_mobile2;
	private String joint_holder_signature2;
	private String nri_address1;
	private String nri_address2;
	private String nri_address3;
	private String nri_city;
	private String nri_pincode;
	private String nri_state;
	private String nri_country;
	
	private Integer bse_nominee_required;
	private String bse_nominee_name;
	private String bse_nominee_relationship;
	private String bse_nominee_dob;
	
	private String bank_code1;
	private String bank_mode1;
	private String bank_name1;
	private String bank_branch1;
	private String bank_address1;
	private String bank_account_number1;
	private String bank_account_holder_name1;
	private String bank_account_type1;
	private String bank_ifsc_code1;
	private String bank_micr_code1;
	private String default_bank1;
	
	private String bank_code2;
	private String bank_mode2;
	private String bank_name2;
	private String bank_branch2;
	private String bank_address2;
	private String bank_account_number2;
	private String bank_account_holder_name2;
	private String bank_account_type2;
	private String bank_ifsc_code2;
	private String bank_micr_code2;
	private String default_bank2;
	
	private String bank_code3;
	private String bank_mode3;
	private String bank_name3;
	private String bank_branch3;
	private String bank_address3;
	private String bank_account_number3;
	private String bank_account_holder_name3;
	private String bank_account_type3;
	private String bank_ifsc_code3;
	private String bank_micr_code3;
	private String default_bank3;
	
	private String bank_code4;
	private String bank_mode4;
	private String bank_name4;
	private String bank_branch4;
	private String bank_address4;
	private String bank_account_number4;
	private String bank_account_holder_name4;
	private String bank_account_type4;
	private String bank_ifsc_code4;
	private String bank_micr_code4;
	private String default_bank4;
	
	private String bank_name5;
	private String bank_code5;
	private String bank_mode5;
	private String bank_branch5;
	private String bank_address5;
	private String bank_account_number5;
	private String bank_account_holder_name5;
	private String bank_account_type5;
	private String bank_ifsc_code5;
	private String bank_micr_code5;
	private String default_bank5;
	
	private Integer isip_otm_flag1;
	private String isip_otm1;
	private Integer isip_otm_approved1;
	private Date isip_otm_created_date1;
	
	private Integer isip_otm_flag2;
	private String isip_otm2;
	private Integer isip_otm_approved2;
	private Date isip_otm_created_date2;
	
	private Integer isip_otm_flag3;
	private String isip_otm3;
	private Integer isip_otm_approved3;
	private Date isip_otm_created_date3;
	
	private Integer isip_otm_flag4;
	private String isip_otm4;
	private Integer isip_otm_approved4;
	private Date isip_otm_created_date4;
	
	private Integer isip_otm_flag5;
	private String isip_otm5;
	private Integer isip_otm_approved5;
	private Date isip_otm_created_date5;
	
	private Integer xsip_otm_flag1;
	private String xsip_otm1;
	private Integer xsip_otm_approved1;
	private Date xsip_otm_created_date1;
	
	private Integer xsip_otm_flag2;
	private String xsip_otm2;
	private Integer xsip_otm_approved2;
	private Date xsip_otm_created_date2;
	
	private Integer xsip_otm_flag3;
	private String xsip_otm3;
	private Integer xsip_otm_approved3;
	private Date xsip_otm_created_date3;
	
	private Integer xsip_otm_flag4;
	private String xsip_otm4;
	private Integer xsip_otm_approved4;
	private Date xsip_otm_created_date4;
	
	private Integer xsip_otm_flag5;
	private String xsip_otm5;
	private Integer xsip_otm_approved5;
	private Date xsip_otm_created_date5;
	
	private Integer emandate_otm_flag1;
	private String emandate_otm1;
	private Integer emandate_otm_approved1;
	private Date emandate_otm_created_date1;
	
	private Integer emandate_otm_flag2;
	private String emandate_otm2;
	private Integer emandate_otm_approved2;
	private Date emandate_otm_created_date2;
	
	private Integer emandate_otm_flag3;
	private String emandate_otm3;
	private Integer emandate_otm_approved3;
	private Date emandate_otm_created_date3;
	
	private Integer emandate_otm_flag4;
	private String emandate_otm4;
	private Integer emandate_otm_approved4;
	private Date emandate_otm_created_date4;
	
	private Integer emandate_otm_flag5;
	private String emandate_otm5;
	private Integer emandate_otm_approved5;
	private Date emandate_otm_created_date5;
	
	private Integer email_verified;
	private String email_authcode;
	private Integer mobile_verified;
	private String mobile_otp;
	private Integer bse_customer;
	private Integer bse_active;
	private String bse_client_code;
	private Integer bse_steps_completed;
	private Integer bse_investor_info;
	private Integer bse_contact_info;
	private Integer bse_bank_info;
	private Integer bse_nominee_info;
	private Integer bse_signature_info;
	private String bse_signature;
	private String bse_chequeleaf; 
	private String bse_client_type;
	
	private String aadhaar;
	private String broker_code;
	private String client_name;
	private Date created_date;
	
	//private String nationality;
	private String fax;
	private String proof_submitted1;
	private String proof_submitted2;
	
	private String permanent_address1;
	private String permanent_address2;
	private String permanent_address3;
	private String permanent_city;
	private String permanent_pincode;
	private String permanent_state;
	private String permanent_country;
	private String emp_code;
	private String emp_name;
	private String emp_designation;
	private String emp_kyc;
	
	private String dependent_name1;
	private String dependent_dob1;
	private String dependent_relationship1;
	private String dependent_name2;
	private String dependent_dob2;
	private String dependent_relationship2;
	private String dependent_name3;
	private String dependent_dob3;
	private String dependent_relationship3;
	private String dependent_name4;
	private String dependent_dob4;
	private String dependent_relationship4;
	
	private String portfolio_review;
	private String rm_review;
	private String fee_model;
	
	private String current_age;
	private String investment_period;
	private String investment_goal;
	private String feel_about_losses;
	private String feel_about_returns;
	private String attitude_performance_3years;
	private String attitude_performance_3months;
	private String risk_category;
	private String risk_appetite;
	private String user_risk;
	//private Integer portfolio_created;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPan() {
		return pan;
	}
	public void setPan(String pan) {
		this.pan = pan;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getType_id() {
		return type_id;
	}
	public void setType_id(Integer type_id) {
		this.type_id = type_id;
	}
	public String getRm_name() {
		return rm_name;
	}
	public void setRm_name(String rm_name) {
		this.rm_name = rm_name;
	}
	public String getSubbroker_name() {
		return subbroker_name;
	}
	public void setSubbroker_name(String subbroker_name) {
		this.subbroker_name = subbroker_name;
	}
	public String getPayout() {
		return payout;
	}
	public void setPayout(String payout) {
		this.payout = payout;
	}
	public Integer getActive() {
		return active;
	}
	public void setActive(Integer active) {
		this.active = active;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getStreet_1() {
		return street_1;
	}
	public void setStreet_1(String street_1) {
		this.street_1 = street_1;
	}
	public String getStreet_2() {
		return street_2;
	}
	public void setStreet_2(String street_2) {
		this.street_2 = street_2;
	}
	public String getStreet_3() {
		return street_3;
	}
	public void setStreet_3(String street_3) {
		this.street_3 = street_3;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getState_code() {
		return state_code;
	}
	public void setState_code(String state_code) {
		this.state_code = state_code;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getFather_name() {
		return father_name;
	}
	public void setFather_name(String father_name) {
		this.father_name = father_name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDate_of_birth() {
		return date_of_birth;
	}
	public void setDate_of_birth(String date_of_birth) {
		this.date_of_birth = date_of_birth;
	}
	public String getMarital_status() {
		return marital_status;
	}
	public void setMarital_status(String marital_status) {
		this.marital_status = marital_status;
	}
	public String getAnniversary_date() {
		return anniversary_date;
	}
	public void setAnniversary_date(String anniversary_date) {
		this.anniversary_date = anniversary_date;
	}
	public String getPlace_of_birth() {
		return place_of_birth;
	}
	public void setPlace_of_birth(String place_of_birth) {
		this.place_of_birth = place_of_birth;
	}
	public String getCountry_of_birth() {
		return country_of_birth;
	}
	public void setCountry_of_birth(String country_of_birth) {
		this.country_of_birth = country_of_birth;
	}
	public String getCountry_birth_code() {
		return country_birth_code;
	}
	public void setCountry_birth_code(String country_birth_code) {
		this.country_birth_code = country_birth_code;
	}
	public String getPhone_office() {
		return phone_office;
	}
	public void setPhone_office(String phone_office) {
		this.phone_office = phone_office;
	}
	public String getPhone_residence() {
		return phone_residence;
	}
	public void setPhone_residence(String phone_residence) {
		this.phone_residence = phone_residence;
	}
	public String getResident_status() {
		return resident_status;
	}
	public void setResident_status(String resident_status) {
		this.resident_status = resident_status;
	}
	public String getTax_status() {
		return tax_status;
	}
	public void setTax_status(String tax_status) {
		this.tax_status = tax_status;
	}
	public String getTax_status_code() {
		return tax_status_code;
	}
	public void setTax_status_code(String tax_status_code) {
		this.tax_status_code = tax_status_code;
	}
	public String getHolding_nature() {
		return holding_nature;
	}
	public void setHolding_nature(String holding_nature) {
		this.holding_nature = holding_nature;
	}
	public String getHolding_nature_code() {
		return holding_nature_code;
	}
	public void setHolding_nature_code(String holding_nature_code) {
		this.holding_nature_code = holding_nature_code;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getOccupation_code() {
		return occupation_code;
	}
	public void setOccupation_code(String occupation_code) {
		this.occupation_code = occupation_code;
	}
	public String getAnnual_income() {
		return annual_income;
	}
	public void setAnnual_income(String annual_income) {
		this.annual_income = annual_income;
	}
	public String getAnnual_income_code() {
		return annual_income_code;
	}
	public void setAnnual_income_code(String annual_income_code) {
		this.annual_income_code = annual_income_code;
	}
	public String getSource_of_wealth() {
		return source_of_wealth;
	}
	public void setSource_of_wealth(String source_of_wealth) {
		this.source_of_wealth = source_of_wealth;
	}
	public String getSource_of_wealth_code() {
		return source_of_wealth_code;
	}
	public void setSource_of_wealth_code(String source_of_wealth_code) {
		this.source_of_wealth_code = source_of_wealth_code;
	}
	public String getPolitical() {
		return political;
	}
	public void setPolitical(String political) {
		this.political = political;
	}
	public String getPolitical_code() {
		return political_code;
	}
	public void setPolitical_code(String political_code) {
		this.political_code = political_code;
	}
	public String getNetworth_amount() {
		return networth_amount;
	}
	public void setNetworth_amount(String networth_amount) {
		this.networth_amount = networth_amount;
	}
	public String getNetworth_dob() {
		return networth_dob;
	}
	public void setNetworth_dob(String networth_dob) {
		this.networth_dob = networth_dob;
	}
	public String getAddress_type() {
		return address_type;
	}
	public void setAddress_type(String address_type) {
		this.address_type = address_type;
	}
	public String getAddress_type_code() {
		return address_type_code;
	}
	public void setAddress_type_code(String address_type_code) {
		this.address_type_code = address_type_code;
	}
	public String getGuard_name() {
		return guard_name;
	}
	public void setGuard_name(String guard_name) {
		this.guard_name = guard_name;
	}
	public String getGuard_pan() {
		return guard_pan;
	}
	public void setGuard_pan(String guard_pan) {
		this.guard_pan = guard_pan;
	}
	public String getGuard_dob() {
		return guard_dob;
	}
	public void setGuard_dob(String guard_dob) {
		this.guard_dob = guard_dob;
	}
	public String getGuard_mobile() {
		return guard_mobile;
	}
	public void setGuard_mobile(String guard_mobile) {
		this.guard_mobile = guard_mobile;
	}
	public String getGuard_email() {
		return guard_email;
	}
	public void setGuard_email(String guard_email) {
		this.guard_email = guard_email;
	}
	public String getGuard_relationship() {
		return guard_relationship;
	}
	public void setGuard_relationship(String guard_relationship) {
		this.guard_relationship = guard_relationship;
	}
	public String getGuard_others() {
		return guard_others;
	}
	public void setGuard_others(String guard_others) {
		this.guard_others = guard_others;
	}
	public String getJoint_holder_name1() {
		return joint_holder_name1;
	}
	public void setJoint_holder_name1(String joint_holder_name1) {
		this.joint_holder_name1 = joint_holder_name1;
	}
	public String getJoint_holder_pan1() {
		return joint_holder_pan1;
	}
	public void setJoint_holder_pan1(String joint_holder_pan1) {
		this.joint_holder_pan1 = joint_holder_pan1;
	}
	public String getJoint_holder_dob1() {
		return joint_holder_dob1;
	}
	public void setJoint_holder_dob1(String joint_holder_dob1) {
		this.joint_holder_dob1 = joint_holder_dob1;
	}
	public String getJoint_holder_email1() {
		return joint_holder_email1;
	}
	public void setJoint_holder_email1(String joint_holder_email1) {
		this.joint_holder_email1 = joint_holder_email1;
	}
	public String getJoint_holder_mobile1() {
		return joint_holder_mobile1;
	}
	public void setJoint_holder_mobile1(String joint_holder_mobile1) {
		this.joint_holder_mobile1 = joint_holder_mobile1;
	}
	public String getJoint_holder_signature1() {
		return joint_holder_signature1;
	}
	public void setJoint_holder_signature1(String joint_holder_signature1) {
		this.joint_holder_signature1 = joint_holder_signature1;
	}
	public String getJoint_holder_name2() {
		return joint_holder_name2;
	}
	public void setJoint_holder_name2(String joint_holder_name2) {
		this.joint_holder_name2 = joint_holder_name2;
	}
	public String getJoint_holder_pan2() {
		return joint_holder_pan2;
	}
	public void setJoint_holder_pan2(String joint_holder_pan2) {
		this.joint_holder_pan2 = joint_holder_pan2;
	}
	public String getJoint_holder_dob2() {
		return joint_holder_dob2;
	}
	public void setJoint_holder_dob2(String joint_holder_dob2) {
		this.joint_holder_dob2 = joint_holder_dob2;
	}
	public String getJoint_holder_email2() {
		return joint_holder_email2;
	}
	public void setJoint_holder_email2(String joint_holder_email2) {
		this.joint_holder_email2 = joint_holder_email2;
	}
	public String getJoint_holder_mobile2() {
		return joint_holder_mobile2;
	}
	public void setJoint_holder_mobile2(String joint_holder_mobile2) {
		this.joint_holder_mobile2 = joint_holder_mobile2;
	}
	public String getJoint_holder_signature2() {
		return joint_holder_signature2;
	}
	public void setJoint_holder_signature2(String joint_holder_signature2) {
		this.joint_holder_signature2 = joint_holder_signature2;
	}
	public String getNri_address1() {
		return nri_address1;
	}
	public void setNri_address1(String nri_address1) {
		this.nri_address1 = nri_address1;
	}
	public String getNri_address2() {
		return nri_address2;
	}
	public void setNri_address2(String nri_address2) {
		this.nri_address2 = nri_address2;
	}
	public String getNri_address3() {
		return nri_address3;
	}
	public void setNri_address3(String nri_address3) {
		this.nri_address3 = nri_address3;
	}
	public String getNri_city() {
		return nri_city;
	}
	public void setNri_city(String nri_city) {
		this.nri_city = nri_city;
	}
	public String getNri_pincode() {
		return nri_pincode;
	}
	public void setNri_pincode(String nri_pincode) {
		this.nri_pincode = nri_pincode;
	}
	public String getNri_state() {
		return nri_state;
	}
	public void setNri_state(String nri_state) {
		this.nri_state = nri_state;
	}
	public String getNri_country() {
		return nri_country;
	}
	public void setNri_country(String nri_country) {
		this.nri_country = nri_country;
	}
	public Integer getBse_nominee_required() {
		return bse_nominee_required;
	}
	public void setBse_nominee_required(Integer bse_nominee_required) {
		this.bse_nominee_required = bse_nominee_required;
	}
	public String getBse_nominee_name() {
		return bse_nominee_name;
	}
	public void setBse_nominee_name(String bse_nominee_name) {
		this.bse_nominee_name = bse_nominee_name;
	}
	public String getBse_nominee_relationship() {
		return bse_nominee_relationship;
	}
	public void setBse_nominee_relationship(String bse_nominee_relationship) {
		this.bse_nominee_relationship = bse_nominee_relationship;
	}
	public String getBse_nominee_dob() {
		return bse_nominee_dob;
	}
	public void setBse_nominee_dob(String bse_nominee_dob) {
		this.bse_nominee_dob = bse_nominee_dob;
	}
	public String getBank_code1() {
		return bank_code1;
	}
	public void setBank_code1(String bank_code1) {
		this.bank_code1 = bank_code1;
	}
	public String getBank_mode1() {
		return bank_mode1;
	}
	public void setBank_mode1(String bank_mode1) {
		this.bank_mode1 = bank_mode1;
	}
	public String getBank_name1() {
		return bank_name1;
	}
	public void setBank_name1(String bank_name1) {
		this.bank_name1 = bank_name1;
	}
	public String getBank_branch1() {
		return bank_branch1;
	}
	public void setBank_branch1(String bank_branch1) {
		this.bank_branch1 = bank_branch1;
	}
	public String getBank_address1() {
		return bank_address1;
	}
	public void setBank_address1(String bank_address1) {
		this.bank_address1 = bank_address1;
	}
	public String getBank_account_number1() {
		return bank_account_number1;
	}
	public void setBank_account_number1(String bank_account_number1) {
		this.bank_account_number1 = bank_account_number1;
	}
	public String getBank_account_holder_name1() {
		return bank_account_holder_name1;
	}
	public void setBank_account_holder_name1(String bank_account_holder_name1) {
		this.bank_account_holder_name1 = bank_account_holder_name1;
	}
	public String getBank_account_type1() {
		return bank_account_type1;
	}
	public void setBank_account_type1(String bank_account_type1) {
		this.bank_account_type1 = bank_account_type1;
	}
	public String getBank_ifsc_code1() {
		return bank_ifsc_code1;
	}
	public void setBank_ifsc_code1(String bank_ifsc_code1) {
		this.bank_ifsc_code1 = bank_ifsc_code1;
	}
	public String getBank_micr_code1() {
		return bank_micr_code1;
	}
	public void setBank_micr_code1(String bank_micr_code1) {
		this.bank_micr_code1 = bank_micr_code1;
	}
	public String getDefault_bank1() {
		return default_bank1;
	}
	public void setDefault_bank1(String default_bank1) {
		this.default_bank1 = default_bank1;
	}
	public String getBank_code2() {
		return bank_code2;
	}
	public void setBank_code2(String bank_code2) {
		this.bank_code2 = bank_code2;
	}
	public String getBank_mode2() {
		return bank_mode2;
	}
	public void setBank_mode2(String bank_mode2) {
		this.bank_mode2 = bank_mode2;
	}
	public String getBank_name2() {
		return bank_name2;
	}
	public void setBank_name2(String bank_name2) {
		this.bank_name2 = bank_name2;
	}
	public String getBank_branch2() {
		return bank_branch2;
	}
	public void setBank_branch2(String bank_branch2) {
		this.bank_branch2 = bank_branch2;
	}
	public String getBank_address2() {
		return bank_address2;
	}
	public void setBank_address2(String bank_address2) {
		this.bank_address2 = bank_address2;
	}
	public String getBank_account_number2() {
		return bank_account_number2;
	}
	public void setBank_account_number2(String bank_account_number2) {
		this.bank_account_number2 = bank_account_number2;
	}
	public String getBank_account_holder_name2() {
		return bank_account_holder_name2;
	}
	public void setBank_account_holder_name2(String bank_account_holder_name2) {
		this.bank_account_holder_name2 = bank_account_holder_name2;
	}
	public String getBank_account_type2() {
		return bank_account_type2;
	}
	public void setBank_account_type2(String bank_account_type2) {
		this.bank_account_type2 = bank_account_type2;
	}
	public String getBank_ifsc_code2() {
		return bank_ifsc_code2;
	}
	public void setBank_ifsc_code2(String bank_ifsc_code2) {
		this.bank_ifsc_code2 = bank_ifsc_code2;
	}
	public String getBank_micr_code2() {
		return bank_micr_code2;
	}
	public void setBank_micr_code2(String bank_micr_code2) {
		this.bank_micr_code2 = bank_micr_code2;
	}
	public String getDefault_bank2() {
		return default_bank2;
	}
	public void setDefault_bank2(String default_bank2) {
		this.default_bank2 = default_bank2;
	}
	public String getBank_code3() {
		return bank_code3;
	}
	public void setBank_code3(String bank_code3) {
		this.bank_code3 = bank_code3;
	}
	public String getBank_mode3() {
		return bank_mode3;
	}
	public void setBank_mode3(String bank_mode3) {
		this.bank_mode3 = bank_mode3;
	}
	public String getBank_name3() {
		return bank_name3;
	}
	public void setBank_name3(String bank_name3) {
		this.bank_name3 = bank_name3;
	}
	public String getBank_branch3() {
		return bank_branch3;
	}
	public void setBank_branch3(String bank_branch3) {
		this.bank_branch3 = bank_branch3;
	}
	public String getBank_address3() {
		return bank_address3;
	}
	public void setBank_address3(String bank_address3) {
		this.bank_address3 = bank_address3;
	}
	public String getBank_account_number3() {
		return bank_account_number3;
	}
	public void setBank_account_number3(String bank_account_number3) {
		this.bank_account_number3 = bank_account_number3;
	}
	public String getBank_account_holder_name3() {
		return bank_account_holder_name3;
	}
	public void setBank_account_holder_name3(String bank_account_holder_name3) {
		this.bank_account_holder_name3 = bank_account_holder_name3;
	}
	public String getBank_account_type3() {
		return bank_account_type3;
	}
	public void setBank_account_type3(String bank_account_type3) {
		this.bank_account_type3 = bank_account_type3;
	}
	public String getBank_ifsc_code3() {
		return bank_ifsc_code3;
	}
	public void setBank_ifsc_code3(String bank_ifsc_code3) {
		this.bank_ifsc_code3 = bank_ifsc_code3;
	}
	public String getBank_micr_code3() {
		return bank_micr_code3;
	}
	public void setBank_micr_code3(String bank_micr_code3) {
		this.bank_micr_code3 = bank_micr_code3;
	}
	public String getDefault_bank3() {
		return default_bank3;
	}
	public void setDefault_bank3(String default_bank3) {
		this.default_bank3 = default_bank3;
	}
	public String getBank_code4() {
		return bank_code4;
	}
	public void setBank_code4(String bank_code4) {
		this.bank_code4 = bank_code4;
	}
	public String getBank_mode4() {
		return bank_mode4;
	}
	public void setBank_mode4(String bank_mode4) {
		this.bank_mode4 = bank_mode4;
	}
	public String getBank_name4() {
		return bank_name4;
	}
	public void setBank_name4(String bank_name4) {
		this.bank_name4 = bank_name4;
	}
	public String getBank_branch4() {
		return bank_branch4;
	}
	public void setBank_branch4(String bank_branch4) {
		this.bank_branch4 = bank_branch4;
	}
	public String getBank_address4() {
		return bank_address4;
	}
	public void setBank_address4(String bank_address4) {
		this.bank_address4 = bank_address4;
	}
	public String getBank_account_number4() {
		return bank_account_number4;
	}
	public void setBank_account_number4(String bank_account_number4) {
		this.bank_account_number4 = bank_account_number4;
	}
	public String getBank_account_holder_name4() {
		return bank_account_holder_name4;
	}
	public void setBank_account_holder_name4(String bank_account_holder_name4) {
		this.bank_account_holder_name4 = bank_account_holder_name4;
	}
	public String getBank_account_type4() {
		return bank_account_type4;
	}
	public void setBank_account_type4(String bank_account_type4) {
		this.bank_account_type4 = bank_account_type4;
	}
	public String getBank_ifsc_code4() {
		return bank_ifsc_code4;
	}
	public void setBank_ifsc_code4(String bank_ifsc_code4) {
		this.bank_ifsc_code4 = bank_ifsc_code4;
	}
	public String getBank_micr_code4() {
		return bank_micr_code4;
	}
	public void setBank_micr_code4(String bank_micr_code4) {
		this.bank_micr_code4 = bank_micr_code4;
	}
	public String getDefault_bank4() {
		return default_bank4;
	}
	public void setDefault_bank4(String default_bank4) {
		this.default_bank4 = default_bank4;
	}
	public String getBank_name5() {
		return bank_name5;
	}
	public void setBank_name5(String bank_name5) {
		this.bank_name5 = bank_name5;
	}
	public String getBank_code5() {
		return bank_code5;
	}
	public void setBank_code5(String bank_code5) {
		this.bank_code5 = bank_code5;
	}
	public String getBank_mode5() {
		return bank_mode5;
	}
	public void setBank_mode5(String bank_mode5) {
		this.bank_mode5 = bank_mode5;
	}
	public String getBank_branch5() {
		return bank_branch5;
	}
	public void setBank_branch5(String bank_branch5) {
		this.bank_branch5 = bank_branch5;
	}
	public String getBank_address5() {
		return bank_address5;
	}
	public void setBank_address5(String bank_address5) {
		this.bank_address5 = bank_address5;
	}
	public String getBank_account_number5() {
		return bank_account_number5;
	}
	public void setBank_account_number5(String bank_account_number5) {
		this.bank_account_number5 = bank_account_number5;
	}
	public String getBank_account_holder_name5() {
		return bank_account_holder_name5;
	}
	public void setBank_account_holder_name5(String bank_account_holder_name5) {
		this.bank_account_holder_name5 = bank_account_holder_name5;
	}
	public String getBank_account_type5() {
		return bank_account_type5;
	}
	public void setBank_account_type5(String bank_account_type5) {
		this.bank_account_type5 = bank_account_type5;
	}
	public String getBank_ifsc_code5() {
		return bank_ifsc_code5;
	}
	public void setBank_ifsc_code5(String bank_ifsc_code5) {
		this.bank_ifsc_code5 = bank_ifsc_code5;
	}
	public String getBank_micr_code5() {
		return bank_micr_code5;
	}
	public void setBank_micr_code5(String bank_micr_code5) {
		this.bank_micr_code5 = bank_micr_code5;
	}
	public String getDefault_bank5() {
		return default_bank5;
	}
	public void setDefault_bank5(String default_bank5) {
		this.default_bank5 = default_bank5;
	}
	public Integer getIsip_otm_flag1() {
		return isip_otm_flag1;
	}
	public void setIsip_otm_flag1(Integer isip_otm_flag1) {
		this.isip_otm_flag1 = isip_otm_flag1;
	}
	public String getIsip_otm1() {
		return isip_otm1;
	}
	public void setIsip_otm1(String isip_otm1) {
		this.isip_otm1 = isip_otm1;
	}
	public Integer getIsip_otm_approved1() {
		return isip_otm_approved1;
	}
	public void setIsip_otm_approved1(Integer isip_otm_approved1) {
		this.isip_otm_approved1 = isip_otm_approved1;
	}
	public Date getIsip_otm_created_date1() {
		return isip_otm_created_date1;
	}
	public void setIsip_otm_created_date1(Date isip_otm_created_date1) {
		this.isip_otm_created_date1 = isip_otm_created_date1;
	}
	public Integer getIsip_otm_flag2() {
		return isip_otm_flag2;
	}
	public void setIsip_otm_flag2(Integer isip_otm_flag2) {
		this.isip_otm_flag2 = isip_otm_flag2;
	}
	public String getIsip_otm2() {
		return isip_otm2;
	}
	public void setIsip_otm2(String isip_otm2) {
		this.isip_otm2 = isip_otm2;
	}
	public Integer getIsip_otm_approved2() {
		return isip_otm_approved2;
	}
	public void setIsip_otm_approved2(Integer isip_otm_approved2) {
		this.isip_otm_approved2 = isip_otm_approved2;
	}
	public Date getIsip_otm_created_date2() {
		return isip_otm_created_date2;
	}
	public void setIsip_otm_created_date2(Date isip_otm_created_date2) {
		this.isip_otm_created_date2 = isip_otm_created_date2;
	}
	public Integer getIsip_otm_flag3() {
		return isip_otm_flag3;
	}
	public void setIsip_otm_flag3(Integer isip_otm_flag3) {
		this.isip_otm_flag3 = isip_otm_flag3;
	}
	public String getIsip_otm3() {
		return isip_otm3;
	}
	public void setIsip_otm3(String isip_otm3) {
		this.isip_otm3 = isip_otm3;
	}
	public Integer getIsip_otm_approved3() {
		return isip_otm_approved3;
	}
	public void setIsip_otm_approved3(Integer isip_otm_approved3) {
		this.isip_otm_approved3 = isip_otm_approved3;
	}
	public Date getIsip_otm_created_date3() {
		return isip_otm_created_date3;
	}
	public void setIsip_otm_created_date3(Date isip_otm_created_date3) {
		this.isip_otm_created_date3 = isip_otm_created_date3;
	}
	public Integer getIsip_otm_flag4() {
		return isip_otm_flag4;
	}
	public void setIsip_otm_flag4(Integer isip_otm_flag4) {
		this.isip_otm_flag4 = isip_otm_flag4;
	}
	public String getIsip_otm4() {
		return isip_otm4;
	}
	public void setIsip_otm4(String isip_otm4) {
		this.isip_otm4 = isip_otm4;
	}
	public Integer getIsip_otm_approved4() {
		return isip_otm_approved4;
	}
	public void setIsip_otm_approved4(Integer isip_otm_approved4) {
		this.isip_otm_approved4 = isip_otm_approved4;
	}
	public Date getIsip_otm_created_date4() {
		return isip_otm_created_date4;
	}
	public void setIsip_otm_created_date4(Date isip_otm_created_date4) {
		this.isip_otm_created_date4 = isip_otm_created_date4;
	}
	public Integer getIsip_otm_flag5() {
		return isip_otm_flag5;
	}
	public void setIsip_otm_flag5(Integer isip_otm_flag5) {
		this.isip_otm_flag5 = isip_otm_flag5;
	}
	public String getIsip_otm5() {
		return isip_otm5;
	}
	public void setIsip_otm5(String isip_otm5) {
		this.isip_otm5 = isip_otm5;
	}
	public Integer getIsip_otm_approved5() {
		return isip_otm_approved5;
	}
	public void setIsip_otm_approved5(Integer isip_otm_approved5) {
		this.isip_otm_approved5 = isip_otm_approved5;
	}
	public Date getIsip_otm_created_date5() {
		return isip_otm_created_date5;
	}
	public void setIsip_otm_created_date5(Date isip_otm_created_date5) {
		this.isip_otm_created_date5 = isip_otm_created_date5;
	}
	public Integer getXsip_otm_flag1() {
		return xsip_otm_flag1;
	}
	public void setXsip_otm_flag1(Integer xsip_otm_flag1) {
		this.xsip_otm_flag1 = xsip_otm_flag1;
	}
	public String getXsip_otm1() {
		return xsip_otm1;
	}
	public void setXsip_otm1(String xsip_otm1) {
		this.xsip_otm1 = xsip_otm1;
	}
	public Integer getXsip_otm_approved1() {
		return xsip_otm_approved1;
	}
	public void setXsip_otm_approved1(Integer xsip_otm_approved1) {
		this.xsip_otm_approved1 = xsip_otm_approved1;
	}
	public Date getXsip_otm_created_date1() {
		return xsip_otm_created_date1;
	}
	public void setXsip_otm_created_date1(Date xsip_otm_created_date1) {
		this.xsip_otm_created_date1 = xsip_otm_created_date1;
	}
	public Integer getXsip_otm_flag2() {
		return xsip_otm_flag2;
	}
	public void setXsip_otm_flag2(Integer xsip_otm_flag2) {
		this.xsip_otm_flag2 = xsip_otm_flag2;
	}
	public String getXsip_otm2() {
		return xsip_otm2;
	}
	public void setXsip_otm2(String xsip_otm2) {
		this.xsip_otm2 = xsip_otm2;
	}
	public Integer getXsip_otm_approved2() {
		return xsip_otm_approved2;
	}
	public void setXsip_otm_approved2(Integer xsip_otm_approved2) {
		this.xsip_otm_approved2 = xsip_otm_approved2;
	}
	public Date getXsip_otm_created_date2() {
		return xsip_otm_created_date2;
	}
	public void setXsip_otm_created_date2(Date xsip_otm_created_date2) {
		this.xsip_otm_created_date2 = xsip_otm_created_date2;
	}
	public Integer getXsip_otm_flag3() {
		return xsip_otm_flag3;
	}
	public void setXsip_otm_flag3(Integer xsip_otm_flag3) {
		this.xsip_otm_flag3 = xsip_otm_flag3;
	}
	public String getXsip_otm3() {
		return xsip_otm3;
	}
	public void setXsip_otm3(String xsip_otm3) {
		this.xsip_otm3 = xsip_otm3;
	}
	public Integer getXsip_otm_approved3() {
		return xsip_otm_approved3;
	}
	public void setXsip_otm_approved3(Integer xsip_otm_approved3) {
		this.xsip_otm_approved3 = xsip_otm_approved3;
	}
	public Date getXsip_otm_created_date3() {
		return xsip_otm_created_date3;
	}
	public void setXsip_otm_created_date3(Date xsip_otm_created_date3) {
		this.xsip_otm_created_date3 = xsip_otm_created_date3;
	}
	public Integer getXsip_otm_flag4() {
		return xsip_otm_flag4;
	}
	public void setXsip_otm_flag4(Integer xsip_otm_flag4) {
		this.xsip_otm_flag4 = xsip_otm_flag4;
	}
	public String getXsip_otm4() {
		return xsip_otm4;
	}
	public void setXsip_otm4(String xsip_otm4) {
		this.xsip_otm4 = xsip_otm4;
	}
	public Integer getXsip_otm_approved4() {
		return xsip_otm_approved4;
	}
	public void setXsip_otm_approved4(Integer xsip_otm_approved4) {
		this.xsip_otm_approved4 = xsip_otm_approved4;
	}
	public Date getXsip_otm_created_date4() {
		return xsip_otm_created_date4;
	}
	public void setXsip_otm_created_date4(Date xsip_otm_created_date4) {
		this.xsip_otm_created_date4 = xsip_otm_created_date4;
	}
	public Integer getXsip_otm_flag5() {
		return xsip_otm_flag5;
	}
	public void setXsip_otm_flag5(Integer xsip_otm_flag5) {
		this.xsip_otm_flag5 = xsip_otm_flag5;
	}
	public String getXsip_otm5() {
		return xsip_otm5;
	}
	public void setXsip_otm5(String xsip_otm5) {
		this.xsip_otm5 = xsip_otm5;
	}
	public Integer getXsip_otm_approved5() {
		return xsip_otm_approved5;
	}
	public void setXsip_otm_approved5(Integer xsip_otm_approved5) {
		this.xsip_otm_approved5 = xsip_otm_approved5;
	}
	public Date getXsip_otm_created_date5() {
		return xsip_otm_created_date5;
	}
	public void setXsip_otm_created_date5(Date xsip_otm_created_date5) {
		this.xsip_otm_created_date5 = xsip_otm_created_date5;
	}
	public Integer getEmandate_otm_flag1() {
		return emandate_otm_flag1;
	}
	public void setEmandate_otm_flag1(Integer emandate_otm_flag1) {
		this.emandate_otm_flag1 = emandate_otm_flag1;
	}
	public String getEmandate_otm1() {
		return emandate_otm1;
	}
	public void setEmandate_otm1(String emandate_otm1) {
		this.emandate_otm1 = emandate_otm1;
	}
	public Integer getEmandate_otm_approved1() {
		return emandate_otm_approved1;
	}
	public void setEmandate_otm_approved1(Integer emandate_otm_approved1) {
		this.emandate_otm_approved1 = emandate_otm_approved1;
	}
	public Date getEmandate_otm_created_date1() {
		return emandate_otm_created_date1;
	}
	public void setEmandate_otm_created_date1(Date emandate_otm_created_date1) {
		this.emandate_otm_created_date1 = emandate_otm_created_date1;
	}
	public Integer getEmandate_otm_flag2() {
		return emandate_otm_flag2;
	}
	public void setEmandate_otm_flag2(Integer emandate_otm_flag2) {
		this.emandate_otm_flag2 = emandate_otm_flag2;
	}
	public String getEmandate_otm2() {
		return emandate_otm2;
	}
	public void setEmandate_otm2(String emandate_otm2) {
		this.emandate_otm2 = emandate_otm2;
	}
	public Integer getEmandate_otm_approved2() {
		return emandate_otm_approved2;
	}
	public void setEmandate_otm_approved2(Integer emandate_otm_approved2) {
		this.emandate_otm_approved2 = emandate_otm_approved2;
	}
	public Date getEmandate_otm_created_date2() {
		return emandate_otm_created_date2;
	}
	public void setEmandate_otm_created_date2(Date emandate_otm_created_date2) {
		this.emandate_otm_created_date2 = emandate_otm_created_date2;
	}
	public Integer getEmandate_otm_flag3() {
		return emandate_otm_flag3;
	}
	public void setEmandate_otm_flag3(Integer emandate_otm_flag3) {
		this.emandate_otm_flag3 = emandate_otm_flag3;
	}
	public String getEmandate_otm3() {
		return emandate_otm3;
	}
	public void setEmandate_otm3(String emandate_otm3) {
		this.emandate_otm3 = emandate_otm3;
	}
	public Integer getEmandate_otm_approved3() {
		return emandate_otm_approved3;
	}
	public void setEmandate_otm_approved3(Integer emandate_otm_approved3) {
		this.emandate_otm_approved3 = emandate_otm_approved3;
	}
	public Date getEmandate_otm_created_date3() {
		return emandate_otm_created_date3;
	}
	public void setEmandate_otm_created_date3(Date emandate_otm_created_date3) {
		this.emandate_otm_created_date3 = emandate_otm_created_date3;
	}
	public Integer getEmandate_otm_flag4() {
		return emandate_otm_flag4;
	}
	public void setEmandate_otm_flag4(Integer emandate_otm_flag4) {
		this.emandate_otm_flag4 = emandate_otm_flag4;
	}
	public String getEmandate_otm4() {
		return emandate_otm4;
	}
	public void setEmandate_otm4(String emandate_otm4) {
		this.emandate_otm4 = emandate_otm4;
	}
	public Integer getEmandate_otm_approved4() {
		return emandate_otm_approved4;
	}
	public void setEmandate_otm_approved4(Integer emandate_otm_approved4) {
		this.emandate_otm_approved4 = emandate_otm_approved4;
	}
	public Date getEmandate_otm_created_date4() {
		return emandate_otm_created_date4;
	}
	public void setEmandate_otm_created_date4(Date emandate_otm_created_date4) {
		this.emandate_otm_created_date4 = emandate_otm_created_date4;
	}
	public Integer getEmandate_otm_flag5() {
		return emandate_otm_flag5;
	}
	public void setEmandate_otm_flag5(Integer emandate_otm_flag5) {
		this.emandate_otm_flag5 = emandate_otm_flag5;
	}
	public String getEmandate_otm5() {
		return emandate_otm5;
	}
	public void setEmandate_otm5(String emandate_otm5) {
		this.emandate_otm5 = emandate_otm5;
	}
	public Integer getEmandate_otm_approved5() {
		return emandate_otm_approved5;
	}
	public void setEmandate_otm_approved5(Integer emandate_otm_approved5) {
		this.emandate_otm_approved5 = emandate_otm_approved5;
	}
	public Date getEmandate_otm_created_date5() {
		return emandate_otm_created_date5;
	}
	public void setEmandate_otm_created_date5(Date emandate_otm_created_date5) {
		this.emandate_otm_created_date5 = emandate_otm_created_date5;
	}
	public Integer getEmail_verified() {
		return email_verified;
	}
	public void setEmail_verified(Integer email_verified) {
		this.email_verified = email_verified;
	}
	public String getEmail_authcode() {
		return email_authcode;
	}
	public void setEmail_authcode(String email_authcode) {
		this.email_authcode = email_authcode;
	}
	public Integer getMobile_verified() {
		return mobile_verified;
	}
	public void setMobile_verified(Integer mobile_verified) {
		this.mobile_verified = mobile_verified;
	}
	public String getMobile_otp() {
		return mobile_otp;
	}
	public void setMobile_otp(String mobile_otp) {
		this.mobile_otp = mobile_otp;
	}
	public Integer getBse_customer() {
		return bse_customer;
	}
	public void setBse_customer(Integer bse_customer) {
		this.bse_customer = bse_customer;
	}
	public Integer getBse_active() {
		return bse_active;
	}
	public void setBse_active(Integer bse_active) {
		this.bse_active = bse_active;
	}
	public String getBse_client_code() {
		return bse_client_code;
	}
	public void setBse_client_code(String bse_client_code) {
		this.bse_client_code = bse_client_code;
	}
	public Integer getBse_steps_completed() {
		return bse_steps_completed;
	}
	public void setBse_steps_completed(Integer bse_steps_completed) {
		this.bse_steps_completed = bse_steps_completed;
	}
	public Integer getBse_investor_info() {
		return bse_investor_info;
	}
	public void setBse_investor_info(Integer bse_investor_info) {
		this.bse_investor_info = bse_investor_info;
	}
	public Integer getBse_contact_info() {
		return bse_contact_info;
	}
	public void setBse_contact_info(Integer bse_contact_info) {
		this.bse_contact_info = bse_contact_info;
	}
	public Integer getBse_bank_info() {
		return bse_bank_info;
	}
	public void setBse_bank_info(Integer bse_bank_info) {
		this.bse_bank_info = bse_bank_info;
	}
	public Integer getBse_nominee_info() {
		return bse_nominee_info;
	}
	public void setBse_nominee_info(Integer bse_nominee_info) {
		this.bse_nominee_info = bse_nominee_info;
	}
	public Integer getBse_signature_info() {
		return bse_signature_info;
	}
	public void setBse_signature_info(Integer bse_signature_info) {
		this.bse_signature_info = bse_signature_info;
	}
	public String getBse_signature() {
		return bse_signature;
	}
	public void setBse_signature(String bse_signature) {
		this.bse_signature = bse_signature;
	}
	public String getBse_chequeleaf() {
		return bse_chequeleaf;
	}
	public void setBse_chequeleaf(String bse_chequeleaf) {
		this.bse_chequeleaf = bse_chequeleaf;
	}
	public String getBse_client_type() {
		return bse_client_type;
	}
	public void setBse_client_type(String bse_client_type) {
		this.bse_client_type = bse_client_type;
	}
	public String getAadhaar() {
		return aadhaar;
	}
	public void setAadhaar(String aadhaar) {
		this.aadhaar = aadhaar;
	}
	public String getBroker_code() {
		return broker_code;
	}
	public void setBroker_code(String broker_code) {
		this.broker_code = broker_code;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public String getProof_submitted1() {
		return proof_submitted1;
	}
	public void setProof_submitted1(String proof_submitted1) {
		this.proof_submitted1 = proof_submitted1;
	}
	public String getProof_submitted2() {
		return proof_submitted2;
	}
	public void setProof_submitted2(String proof_submitted2) {
		this.proof_submitted2 = proof_submitted2;
	}
	public String getPermanent_address1() {
		return permanent_address1;
	}
	public void setPermanent_address1(String permanent_address1) {
		this.permanent_address1 = permanent_address1;
	}
	public String getPermanent_address2() {
		return permanent_address2;
	}
	public void setPermanent_address2(String permanent_address2) {
		this.permanent_address2 = permanent_address2;
	}
	public String getPermanent_address3() {
		return permanent_address3;
	}
	public void setPermanent_address3(String permanent_address3) {
		this.permanent_address3 = permanent_address3;
	}
	public String getPermanent_city() {
		return permanent_city;
	}
	public void setPermanent_city(String permanent_city) {
		this.permanent_city = permanent_city;
	}
	public String getPermanent_pincode() {
		return permanent_pincode;
	}
	public void setPermanent_pincode(String permanent_pincode) {
		this.permanent_pincode = permanent_pincode;
	}
	public String getPermanent_state() {
		return permanent_state;
	}
	public void setPermanent_state(String permanent_state) {
		this.permanent_state = permanent_state;
	}
	public String getPermanent_country() {
		return permanent_country;
	}
	public void setPermanent_country(String permanent_country) {
		this.permanent_country = permanent_country;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getEmp_designation() {
		return emp_designation;
	}
	public void setEmp_designation(String emp_designation) {
		this.emp_designation = emp_designation;
	}
	public String getEmp_kyc() {
		return emp_kyc;
	}
	public void setEmp_kyc(String emp_kyc) {
		this.emp_kyc = emp_kyc;
	}
	public String getDependent_name1() {
		return dependent_name1;
	}
	public void setDependent_name1(String dependent_name1) {
		this.dependent_name1 = dependent_name1;
	}
	public String getDependent_dob1() {
		return dependent_dob1;
	}
	public void setDependent_dob1(String dependent_dob1) {
		this.dependent_dob1 = dependent_dob1;
	}
	public String getDependent_relationship1() {
		return dependent_relationship1;
	}
	public void setDependent_relationship1(String dependent_relationship1) {
		this.dependent_relationship1 = dependent_relationship1;
	}
	public String getDependent_name2() {
		return dependent_name2;
	}
	public void setDependent_name2(String dependent_name2) {
		this.dependent_name2 = dependent_name2;
	}
	public String getDependent_dob2() {
		return dependent_dob2;
	}
	public void setDependent_dob2(String dependent_dob2) {
		this.dependent_dob2 = dependent_dob2;
	}
	public String getDependent_relationship2() {
		return dependent_relationship2;
	}
	public void setDependent_relationship2(String dependent_relationship2) {
		this.dependent_relationship2 = dependent_relationship2;
	}
	public String getDependent_name3() {
		return dependent_name3;
	}
	public void setDependent_name3(String dependent_name3) {
		this.dependent_name3 = dependent_name3;
	}
	public String getDependent_dob3() {
		return dependent_dob3;
	}
	public void setDependent_dob3(String dependent_dob3) {
		this.dependent_dob3 = dependent_dob3;
	}
	public String getDependent_relationship3() {
		return dependent_relationship3;
	}
	public void setDependent_relationship3(String dependent_relationship3) {
		this.dependent_relationship3 = dependent_relationship3;
	}
	public String getDependent_name4() {
		return dependent_name4;
	}
	public void setDependent_name4(String dependent_name4) {
		this.dependent_name4 = dependent_name4;
	}
	public String getDependent_dob4() {
		return dependent_dob4;
	}
	public void setDependent_dob4(String dependent_dob4) {
		this.dependent_dob4 = dependent_dob4;
	}
	public String getDependent_relationship4() {
		return dependent_relationship4;
	}
	public void setDependent_relationship4(String dependent_relationship4) {
		this.dependent_relationship4 = dependent_relationship4;
	}
	public String getPortfolio_review() {
		return portfolio_review;
	}
	public void setPortfolio_review(String portfolio_review) {
		this.portfolio_review = portfolio_review;
	}
	public String getRm_review() {
		return rm_review;
	}
	public void setRm_review(String rm_review) {
		this.rm_review = rm_review;
	}
	public String getFee_model() {
		return fee_model;
	}
	public void setFee_model(String fee_model) {
		this.fee_model = fee_model;
	}
	public String getCurrent_age() {
		return current_age;
	}
	public void setCurrent_age(String current_age) {
		this.current_age = current_age;
	}
	public String getInvestment_period() {
		return investment_period;
	}
	public void setInvestment_period(String investment_period) {
		this.investment_period = investment_period;
	}
	public String getInvestment_goal() {
		return investment_goal;
	}
	public void setInvestment_goal(String investment_goal) {
		this.investment_goal = investment_goal;
	}
	public String getFeel_about_losses() {
		return feel_about_losses;
	}
	public void setFeel_about_losses(String feel_about_losses) {
		this.feel_about_losses = feel_about_losses;
	}
	public String getFeel_about_returns() {
		return feel_about_returns;
	}
	public void setFeel_about_returns(String feel_about_returns) {
		this.feel_about_returns = feel_about_returns;
	}
	public String getAttitude_performance_3years() {
		return attitude_performance_3years;
	}
	public void setAttitude_performance_3years(String attitude_performance_3years) {
		this.attitude_performance_3years = attitude_performance_3years;
	}
	public String getAttitude_performance_3months() {
		return attitude_performance_3months;
	}
	public void setAttitude_performance_3months(String attitude_performance_3months) {
		this.attitude_performance_3months = attitude_performance_3months;
	}
	public String getRisk_category() {
		return risk_category;
	}
	public void setRisk_category(String risk_category) {
		this.risk_category = risk_category;
	}
	public String getRisk_appetite() {
		return risk_appetite;
	}
	public void setRisk_appetite(String risk_appetite) {
		this.risk_appetite = risk_appetite;
	}
	public String getUser_risk() {
		return user_risk;
	}
	public void setUser_risk(String user_risk) {
		this.user_risk = user_risk;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getBranch_manager_name() {
		return branch_manager_name;
	}
	public void setBranch_manager_name(String branch_manager_name) {
		this.branch_manager_name = branch_manager_name;
	}
	public Integer getEmail_active() {
		return email_active;
	}
	public void setEmail_active(Integer email_active) {
		this.email_active = email_active;
	}
	public String getEmp_code() {
		return emp_code;
	}
	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}
}
