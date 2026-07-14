package com.mf.response;

import java.util.List;

import com.mf.amfi.model.ModelPortfolioSchemes;

public class GoalPortfolioResponse {

	public int status;
	public String status_msg;
	public String msg;
	
	private String investorName;
	private String investorPan;
	private String mobile;
	private String email;
	
    private Double total_current_cost;
    private Double total_current_value;
    private Double total_unReliasedGain;
    private Double total_reliasedGain;
    private Double total_CAGR;
    private Double total_absoluteReturn;
    private Double total_dividendReinvestment;
    private Double total_dividendPaid;
    
    private Double equity_total_current_cost;
    private Double equity_total_current_value;
    private Double equity_total_unReliasedGain;
    private Double equity_total_dividendReinvestment;
    private Double equity_total_dividendPaid;
    
    private Double debt_total_current_cost;
    private Double debt_total_current_value;
    private Double debt_total_unReliasedGain;
    private Double debt_total_dividendReinvestment;
    private Double debt_total_dividendPaid;
    
    private Double hybrid_total_current_cost;
    private Double hybrid_total_current_value;
    private Double hybrid_total_unReliasedGain;
    
    private Double hybrid_total_dividendReinvestment;
    private Double hybrid_total_dividendPaid;
    
    private Double solution_total_current_cost;
    private Double solution_total_current_value;
    private Double solution_total_unReliasedGain;
    private Double solution_total_dividendReinvestment;
    private Double solution_total_dividendPaid;
    
    private Double other_total_current_cost;
    private Double other_total_current_value;
    private Double other_total_unReliasedGain;
    private Double other_total_dividendReinvestment;
    private Double other_total_dividendPaid;
    
    private List<InvestorSchemeWisePortfolioResponse> investorSchemeWisePortfolioResponses;
    private List<ModelPortfolioSchemes> modelPortfolioRiskList;

    List<ApiRoboSchemeResponse> scheme_list;
    
    private String future_value;
    private String future_value_amount;
    private String target_amount;
    private String lumpsum_amount;
    private Double sip_amount;
    private String risk_profile;
    
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
	public String getInvestorName() {
		return investorName;
	}
	public void setInvestorName(String investorName) {
		this.investorName = investorName;
	}
	public String getInvestorPan() {
		return investorPan;
	}
	public void setInvestorPan(String investorPan) {
		this.investorPan = investorPan;
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
	public Double getTotal_current_cost() {
		return total_current_cost;
	}
	public void setTotal_current_cost(Double total_current_cost) {
		this.total_current_cost = total_current_cost;
	}
	public Double getTotal_current_value() {
		return total_current_value;
	}
	public void setTotal_current_value(Double total_current_value) {
		this.total_current_value = total_current_value;
	}
	public Double getTotal_unReliasedGain() {
		return total_unReliasedGain;
	}
	public void setTotal_unReliasedGain(Double total_unReliasedGain) {
		this.total_unReliasedGain = total_unReliasedGain;
	}
	public Double getTotal_CAGR() {
		return total_CAGR;
	}
	public void setTotal_CAGR(Double total_CAGR) {
		this.total_CAGR = total_CAGR;
	}
	public Double getTotal_dividendReinvestment() {
		return total_dividendReinvestment;
	}
	public void setTotal_dividendReinvestment(Double total_dividendReinvestment) {
		this.total_dividendReinvestment = total_dividendReinvestment;
	}
	public Double getTotal_dividendPaid() {
		return total_dividendPaid;
	}
	public void setTotal_dividendPaid(Double total_dividendPaid) {
		this.total_dividendPaid = total_dividendPaid;
	}
	public Double getEquity_total_current_cost() {
		return equity_total_current_cost;
	}
	public void setEquity_total_current_cost(Double equity_total_current_cost) {
		this.equity_total_current_cost = equity_total_current_cost;
	}
	public Double getEquity_total_current_value() {
		return equity_total_current_value;
	}
	public void setEquity_total_current_value(Double equity_total_current_value) {
		this.equity_total_current_value = equity_total_current_value;
	}
	public Double getEquity_total_unReliasedGain() {
		return equity_total_unReliasedGain;
	}
	public void setEquity_total_unReliasedGain(Double equity_total_unReliasedGain) {
		this.equity_total_unReliasedGain = equity_total_unReliasedGain;
	}
	public Double getEquity_total_dividendReinvestment() {
		return equity_total_dividendReinvestment;
	}
	public void setEquity_total_dividendReinvestment(Double equity_total_dividendReinvestment) {
		this.equity_total_dividendReinvestment = equity_total_dividendReinvestment;
	}
	public Double getEquity_total_dividendPaid() {
		return equity_total_dividendPaid;
	}
	public void setEquity_total_dividendPaid(Double equity_total_dividendPaid) {
		this.equity_total_dividendPaid = equity_total_dividendPaid;
	}
	public Double getDebt_total_current_cost() {
		return debt_total_current_cost;
	}
	public void setDebt_total_current_cost(Double debt_total_current_cost) {
		this.debt_total_current_cost = debt_total_current_cost;
	}
	public Double getDebt_total_current_value() {
		return debt_total_current_value;
	}
	public void setDebt_total_current_value(Double debt_total_current_value) {
		this.debt_total_current_value = debt_total_current_value;
	}
	public Double getDebt_total_unReliasedGain() {
		return debt_total_unReliasedGain;
	}
	public void setDebt_total_unReliasedGain(Double debt_total_unReliasedGain) {
		this.debt_total_unReliasedGain = debt_total_unReliasedGain;
	}
	public Double getDebt_total_dividendReinvestment() {
		return debt_total_dividendReinvestment;
	}
	public void setDebt_total_dividendReinvestment(Double debt_total_dividendReinvestment) {
		this.debt_total_dividendReinvestment = debt_total_dividendReinvestment;
	}
	public Double getDebt_total_dividendPaid() {
		return debt_total_dividendPaid;
	}
	public void setDebt_total_dividendPaid(Double debt_total_dividendPaid) {
		this.debt_total_dividendPaid = debt_total_dividendPaid;
	}
	public Double getHybrid_total_current_cost() {
		return hybrid_total_current_cost;
	}
	public void setHybrid_total_current_cost(Double hybrid_total_current_cost) {
		this.hybrid_total_current_cost = hybrid_total_current_cost;
	}
	public Double getHybrid_total_current_value() {
		return hybrid_total_current_value;
	}
	public void setHybrid_total_current_value(Double hybrid_total_current_value) {
		this.hybrid_total_current_value = hybrid_total_current_value;
	}
	public Double getHybrid_total_unReliasedGain() {
		return hybrid_total_unReliasedGain;
	}
	public void setHybrid_total_unReliasedGain(Double hybrid_total_unReliasedGain) {
		this.hybrid_total_unReliasedGain = hybrid_total_unReliasedGain;
	}
	public Double getHybrid_total_dividendReinvestment() {
		return hybrid_total_dividendReinvestment;
	}
	public void setHybrid_total_dividendReinvestment(Double hybrid_total_dividendReinvestment) {
		this.hybrid_total_dividendReinvestment = hybrid_total_dividendReinvestment;
	}
	public Double getHybrid_total_dividendPaid() {
		return hybrid_total_dividendPaid;
	}
	public void setHybrid_total_dividendPaid(Double hybrid_total_dividendPaid) {
		this.hybrid_total_dividendPaid = hybrid_total_dividendPaid;
	}
	public Double getSolution_total_current_cost() {
		return solution_total_current_cost;
	}
	public void setSolution_total_current_cost(Double solution_total_current_cost) {
		this.solution_total_current_cost = solution_total_current_cost;
	}
	public Double getSolution_total_current_value() {
		return solution_total_current_value;
	}
	public void setSolution_total_current_value(Double solution_total_current_value) {
		this.solution_total_current_value = solution_total_current_value;
	}
	public Double getSolution_total_unReliasedGain() {
		return solution_total_unReliasedGain;
	}
	public void setSolution_total_unReliasedGain(Double solution_total_unReliasedGain) {
		this.solution_total_unReliasedGain = solution_total_unReliasedGain;
	}
	public Double getSolution_total_dividendReinvestment() {
		return solution_total_dividendReinvestment;
	}
	public void setSolution_total_dividendReinvestment(Double solution_total_dividendReinvestment) {
		this.solution_total_dividendReinvestment = solution_total_dividendReinvestment;
	}
	public Double getSolution_total_dividendPaid() {
		return solution_total_dividendPaid;
	}
	public void setSolution_total_dividendPaid(Double solution_total_dividendPaid) {
		this.solution_total_dividendPaid = solution_total_dividendPaid;
	}
	public Double getOther_total_current_cost() {
		return other_total_current_cost;
	}
	public void setOther_total_current_cost(Double other_total_current_cost) {
		this.other_total_current_cost = other_total_current_cost;
	}
	public Double getOther_total_current_value() {
		return other_total_current_value;
	}
	public void setOther_total_current_value(Double other_total_current_value) {
		this.other_total_current_value = other_total_current_value;
	}
	public Double getOther_total_unReliasedGain() {
		return other_total_unReliasedGain;
	}
	public void setOther_total_unReliasedGain(Double other_total_unReliasedGain) {
		this.other_total_unReliasedGain = other_total_unReliasedGain;
	}
	public Double getOther_total_dividendReinvestment() {
		return other_total_dividendReinvestment;
	}
	public void setOther_total_dividendReinvestment(Double other_total_dividendReinvestment) {
		this.other_total_dividendReinvestment = other_total_dividendReinvestment;
	}
	public Double getOther_total_dividendPaid() {
		return other_total_dividendPaid;
	}
	public void setOther_total_dividendPaid(Double other_total_dividendPaid) {
		this.other_total_dividendPaid = other_total_dividendPaid;
	}
	public Double getTotal_reliasedGain() {
		return total_reliasedGain;
	}
	public void setTotal_reliasedGain(Double total_reliasedGain) {
		this.total_reliasedGain = total_reliasedGain;
	}
	public Double getTotal_absoluteReturn() {
		return total_absoluteReturn;
	}
	public void setTotal_absoluteReturn(Double total_absoluteReturn) {
		this.total_absoluteReturn = total_absoluteReturn;
	}
	public List<InvestorSchemeWisePortfolioResponse> getInvestorSchemeWisePortfolioResponses() {
		return investorSchemeWisePortfolioResponses;
	}
	public void setInvestorSchemeWisePortfolioResponses(
			List<InvestorSchemeWisePortfolioResponse> investorSchemeWisePortfolioResponses) {
		this.investorSchemeWisePortfolioResponses = investorSchemeWisePortfolioResponses;
	}
	public List<ModelPortfolioSchemes> getModelPortfolioRiskList() {
		return modelPortfolioRiskList;
	}
	public void setModelPortfolioRiskList(List<ModelPortfolioSchemes> modelPortfolioRiskList) {
		this.modelPortfolioRiskList = modelPortfolioRiskList;
	}
	public String getFuture_value() {
		return future_value;
	}
	public void setFuture_value(String future_value) {
		this.future_value = future_value;
	}
	public String getFuture_value_amount() {
		return future_value_amount;
	}
	public void setFuture_value_amount(String future_value_amount) {
		this.future_value_amount = future_value_amount;
	}
	public String getTarget_amount() {
		return target_amount;
	}
	public void setTarget_amount(String target_amount) {
		this.target_amount = target_amount;
	}
	public String getLumpsum_amount() {
		return lumpsum_amount;
	}
	public void setLumpsum_amount(String lumpsum_amount) {
		this.lumpsum_amount = lumpsum_amount;
	}
	public Double getSip_amount() {
		return sip_amount;
	}
	public void setSip_amount(Double sip_amount) {
		this.sip_amount = sip_amount;
	}
	public List<ApiRoboSchemeResponse> getScheme_list() {
		return scheme_list;
	}
	public void setScheme_list(List<ApiRoboSchemeResponse> scheme_list) {
		this.scheme_list = scheme_list;
	}
	public String getRisk_profile() {
		return risk_profile;
	}
	public void setRisk_profile(String risk_profile) {
		this.risk_profile = risk_profile;
	}
}
