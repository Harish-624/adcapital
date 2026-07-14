package com.mf.response;

import java.util.Date;

public class MonthlyMISResponse 
{
	private String client_name;
	private String amc_code;
	private String amc_name;
	private String rm_name;
	private String branch;
	private String total_inflow_amount;
	private String total_outflow_amount;
	private String total_outflow_redemption_amount;
	private String total_net_amount;
	private String newSipCount;
	private String newSipAmountTotal;
	private String terminateSipCount;
	private String terminateSipTotalAmount;
	private String sipCount;
	private String sipAmountTotal;
	
	private Date transaction_date;
	private Double purchase_amount;
	private Double redemption_amount;
	private Double switch_in_amount;
	private Double switch_out_amount;
	private Double ticob_amount;
	private Double tocob_amount;
	private Double net_amount;
	
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getAmc_code() {
		return amc_code;
	}
	public void setAmc_code(String amc_code) {
		this.amc_code = amc_code;
	}
	public String getAmc_name() {
		return amc_name;
	}
	public void setAmc_name(String amc_name) {
		this.amc_name = amc_name;
	}
	public String getRm_name() {
		return rm_name;
	}
	public void setRm_name(String rm_name) {
		this.rm_name = rm_name;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getTotal_inflow_amount() {
		return total_inflow_amount;
	}
	public void setTotal_inflow_amount(String total_inflow_amount) {
		this.total_inflow_amount = total_inflow_amount;
	}
	public String getTotal_outflow_amount() {
		return total_outflow_amount;
	}
	public void setTotal_outflow_amount(String total_outflow_amount) {
		this.total_outflow_amount = total_outflow_amount;
	}
	public String getTotal_net_amount() {
		return total_net_amount;
	}
	public void setTotal_net_amount(String total_net_amount) {
		this.total_net_amount = total_net_amount;
	}
	public String getNewSipCount() {
		return newSipCount;
	}
	public void setNewSipCount(String newSipCount) {
		this.newSipCount = newSipCount;
	}
	public String getNewSipAmountTotal() {
		return newSipAmountTotal;
	}
	public void setNewSipAmountTotal(String newSipAmountTotal) {
		this.newSipAmountTotal = newSipAmountTotal;
	}
	public String getTerminateSipCount() {
		return terminateSipCount;
	}
	public void setTerminateSipCount(String terminateSipCount) {
		this.terminateSipCount = terminateSipCount;
	}
	public String getTerminateSipTotalAmount() {
		return terminateSipTotalAmount;
	}
	public void setTerminateSipTotalAmount(String terminateSipTotalAmount) {
		this.terminateSipTotalAmount = terminateSipTotalAmount;
	}
	public String getSipCount() {
		return sipCount;
	}
	public void setSipCount(String sipCount) {
		this.sipCount = sipCount;
	}
	public String getSipAmountTotal() {
		return sipAmountTotal;
	}
	public void setSipAmountTotal(String sipAmountTotal) {
		this.sipAmountTotal = sipAmountTotal;
	}
	public String getTotal_outflow_redemption_amount() {
		return total_outflow_redemption_amount;
	}
	public void setTotal_outflow_redemption_amount(String total_outflow_redemption_amount) {
		this.total_outflow_redemption_amount = total_outflow_redemption_amount;
	}
	public Date getTransaction_date() {
		return transaction_date;
	}
	public void setTransaction_date(Date transaction_date) {
		this.transaction_date = transaction_date;
	}
	public Double getPurchase_amount() {
		return purchase_amount;
	}
	public void setPurchase_amount(Double purchase_amount) {
		this.purchase_amount = purchase_amount;
	}
	public Double getRedemption_amount() {
		return redemption_amount;
	}
	public void setRedemption_amount(Double redemption_amount) {
		this.redemption_amount = redemption_amount;
	}
	public Double getSwitch_in_amount() {
		return switch_in_amount;
	}
	public void setSwitch_in_amount(Double switch_in_amount) {
		this.switch_in_amount = switch_in_amount;
	}
	public Double getSwitch_out_amount() {
		return switch_out_amount;
	}
	public void setSwitch_out_amount(Double switch_out_amount) {
		this.switch_out_amount = switch_out_amount;
	}
	public Double getTicob_amount() {
		return ticob_amount;
	}
	public void setTicob_amount(Double ticob_amount) {
		this.ticob_amount = ticob_amount;
	}
	public Double getTocob_amount() {
		return tocob_amount;
	}
	public void setTocob_amount(Double tocob_amount) {
		this.tocob_amount = tocob_amount;
	}
	public Double getNet_amount() {
		return net_amount;
	}
	public void setNet_amount(Double net_amount) {
		this.net_amount = net_amount;
	}	
}
