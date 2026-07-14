package com.mf.amfi.response;

import java.util.List;
import java.util.Map;

import com.mf.amfi.model.AmfiMutualFundCompanies;
import com.mf.amfi.model.BseBank;
import com.mf.amfi.model.BseCountry;
import com.mf.amfi.model.BseSIPMaster;
import com.mf.amfi.model.BseSchemeCodeMaster;
import com.mf.amfi.model.NseCountry;
import com.mf.amfi.model.NseSchemeMaster;
import com.mf.amfi.model.NseSchemeMasterLimit;
import com.mf.amfi.model.Pincode;
import com.mf.amfi.model.SchemeCategoryAnnualReturns;
import com.mf.amfi.model.SchemePerformancesBenchmark;
import com.mf.amfi.model.UsersPortfolioTotal;
import com.mf.model.AumAmc;
import com.mf.model.AumCategory;
import com.mf.model.AumFamily;
import com.mf.model.BrokerageConsolidated;
import com.mf.model.ClientwiseSip;
import com.mf.model.CommonSubbrokerSummary;
import com.mf.model.Users;
import com.mf.model.UsersGoalSavedPlan;
import com.mf.model.UsersPortfolioSchemewise;
import com.mf.response.AllocationMapResponse;
import com.mf.response.ApiBankInfo;
import com.mf.response.ApiGetAllNotificationsResponse;
import com.mf.response.ApiInvestorSearch;
import com.mf.response.ApiMandateDetails;
import com.mf.response.ApiRoboSchemeResponse;
import com.mf.response.BrokerageAmcResponse;
import com.mf.response.CategoryResponse;
import com.mf.response.ExpiringShortlySip;
import com.mf.response.FolioWiseTransactionResponse;
import com.mf.response.InvestorPortfolioResponse;
import com.mf.response.InvestorSIPMasterResponse;
import com.mf.response.InvestorSchemeWisePortfolioResponse;
import com.mf.response.InvestorSchemeWiseTransactionResponse;
import com.mf.response.MonthlyMISResponse;
import com.mf.response.NseIINResponse;
import com.mf.response.RmInvestorResponse;
import com.mf.response.SIPTransactionResponse;
import com.mf.response.Top50KubotFunds;
import com.mf.response.TransactionReportResponse;

public class ApiCommonResponse {

	public int status;
	public String status_msg;
	public String msg;
	private int pageid;
	private int pageCount;
	private int totalCount;
	public List<String> list;
	public Users user;
	
	public String nav_date;
	public String scheme_name;
	public String category;
	public boolean validScheme;
	
	public String pan;
	public String pan_name;
	
	public Pincode pincode;
	
	public List<BseBank> bseBanks;
	public List<ApiInvestorSearch> user_list;
	public List<NseSchemeMaster> nfoSchemeList;
	
	public InvestorPortfolioResponse investorPortfolioResponse;
	public List<InvestorPortfolioResponse> investorPortfolioResponseList;
	public List<UsersPortfolioTotal> usersPortfolioTotalList;
	public List<RmInvestorResponse> familyAumList;
	public List<AumAmc> amcAumList;
	public List<AumCategory> categoryAumList;
	public List<String> portfolioFinancialYearList;
	
	public List<Top50KubotFunds> top50SmartMoneyFunds;
	public List<BseSIPMaster> sip_scheme_details_list;
	
	public NseSchemeMaster nse_scheme_master;
	public NseSchemeMasterLimit nse_scheme_master_limit;
	public List<NseSchemeMasterLimit> nse_sip_scheme_list;
	public List<ApiGetAllNotificationsResponse> notification_list;
	
	public String paymentGatewayHtml;
	public String paymentGatewayLink;
	
	public Double target_amount;
	public Double inflation;
	public Integer years;
	public Double sip_amount;
	
	public List<String> folioList;
	public List<String> schemeOptionsList;
	public List<ApiMandateDetails> mandate_list;
	public List<ApiBankInfo> bankInfo_list;
	
	public List<ApiRoboSchemeResponse> goal_scheme_list;
	
	public List<String> schemeCategoryList;
	
	public List<SIPTransactionResponse> scheme_transaction_list;
	public List<CategoryResponse> broad_category_res_list;
	public List<AllocationMapResponse> market_capital_list;
	public List<AllocationMapResponse> equity_holdings_list;
	public List<AllocationMapResponse> debt_holdings_list;
	public List<AllocationMapResponse> sector_allocation_list;
	public List<CategoryResponse> amc_allocation_list;
	public List<CategoryResponse> category_allocation_list;
	
	public String aum_month;
	public Double total_aum;
	public Double aum_change_value;
	public Double aum_change_percentage;
	public Integer total_investors;
	public Integer total_family_investors;
	public Integer total_elss_investors;
	public Integer total_sip_investors;
	public Integer total_sip_count;
	public Double total_sip_amount;
	public Double avg_sip_amount;
	public String brokerage_month;
	public Double brokerage_amount;
	public List<CategoryResponse> broad_list;
	public List<AumFamily> family_aum_list;
	
	public List<InvestorSIPMasterResponse> sip_list;
	public List<ExpiringShortlySip> expiringshortlysip;
	
	public Integer sip_active_count;
	public Double sip_active_amount;
	public Double sip_average_amount;
	public Integer sip_active_investor_count;
	public Integer sip_expiring_count;
	public Double sip_expiring_amount;
	public Integer sip_starting_count;
	public Double sip_starting_amount;
	public Double sip_amc1_amount;
	public Double sip_amc2_amount;
	public Double sip_amc3_amount;
	public Double sip_amc4_amount;
	public Double sip_amc5_amount;
	public Double sip_amc6_amount;
	public Double sip_amc7_amount;
	public Double sip_amc8_amount;
	
	public List<TransactionReportResponse> transaction_list;
	public List<AmfiMutualFundCompanies> sip_amc_list;
	public List<UsersPortfolioSchemewise> usersPortfolioSchemewiseList;
	public List<String> amc_list;
	public List<String> category_list;
	public List<String> broad_category_list;
	public List<String> branch_list;
	public List<String> rm_list;
	public List<String> subbroker_list;
	public List<ClientwiseSip> client_scheme_holding_list;
	public List<InvestorSchemeWisePortfolioResponse> xirr_report;
	public List<MonthlyMISResponse> daily_transaction_analysis_list;
	public Double total_purchase_amount;
	public Double total_redemption_amount;
	public Double total_switch_in_amount;
	public Double total_switch_out_amount;
	public Double total_ticob_amount;
	public Double total_tocob_amount;
	public Double total_net_amount;
	
	public List<BrokerageAmcResponse> rmAumList;
	public List<BrokerageConsolidated> rmAUMSummaryList;
	public List<String> financialYearList;
	public List<BrokerageConsolidated> brokerageList;
	public List<BrokerageDetailsResponse> brokerage_list;
	
	public List<CommonSubbrokerSummary> commonBrokerageList;
	
	public Double mf_return;
	public Double mf_value;
	public Double scheme_return;
	public Double scheme_value;
	public Double benchmark_return;
	public Double benchmark_value;
	public Double gold_return;
	public Double gold_value;
	public Double fd_return;
	public Double fd_value;
	
	public String total_mis_inflow_amount;
	public String total_mis_outflow_amount;
	public String total_mis_redemption_amount;
	public String total_mis_net_amount;
	public List<MonthlyMISResponse> monthly_mis_list;
	public List<InvestorSchemeWiseTransactionResponse> transaction_rejection_list;
	public BseSchemeCodeMaster bse_scheme_master;
	public List<BseSchemeCodeMaster> nfo_scheme_list;
	public List<UsersGoalSavedPlan> goal_list;
	
	public List<NseIINResponse> nse_iin_list;
	public List<NseIINResponse> bse_client_code_list;
	public List<NseCountry> nse_country_list;
	public List<BseCountry> bse_country_list;
	
	public String transactionNumber;
	public List<FolioWiseTransactionResponse> folio_master_list;
	
	public Map<String, String> ratingMap;
	public Map<String, Double> issuerMap;
	public Map<String, Double> assetMap;
	public DebtYtmChangePercentResponse debtYtmChangePercent;
	
	public SchemePerformancesBenchmark benchmark_returns;
	public List<SchemeCategoryAnnualReturns> category_returns;
	
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
	public String getNav_date() {
		return nav_date;
	}
	public void setNav_date(String nav_date) {
		this.nav_date = nav_date;
	}
	public boolean isValidScheme() {
		return validScheme;
	}
	public void setValidScheme(boolean validScheme) {
		this.validScheme = validScheme;
	}
	public String getScheme_name() {
		return scheme_name;
	}
	public void setScheme_name(String scheme_name) {
		this.scheme_name = scheme_name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public List<String> getList() {
		return list;
	}
	public void setList(List<String> list) {
		this.list = list;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	public String getPan() {
		return pan;
	}
	public void setPan(String pan) {
		this.pan = pan;
	}
	public String getPan_name() {
		return pan_name;
	}
	public void setPan_name(String pan_name) {
		this.pan_name = pan_name;
	}
	public Pincode getPincode() {
		return pincode;
	}
	public void setPincode(Pincode pincode) {
		this.pincode = pincode;
	}
	public List<BseBank> getBseBanks() {
		return bseBanks;
	}
	public void setBseBanks(List<BseBank> bseBanks) {
		this.bseBanks = bseBanks;
	}
	public List<ApiInvestorSearch> getUser_list() {
		return user_list;
	}
	public void setUser_list(List<ApiInvestorSearch> user_list) {
		this.user_list = user_list;
	}
	public List<NseSchemeMaster> getNfoSchemeList() {
		return nfoSchemeList;
	}
	public void setNfoSchemeList(List<NseSchemeMaster> nfoSchemeList) {
		this.nfoSchemeList = nfoSchemeList;
	}
	public InvestorPortfolioResponse getInvestorPortfolioResponse() {
		return investorPortfolioResponse;
	}
	public void setInvestorPortfolioResponse(InvestorPortfolioResponse investorPortfolioResponse) {
		this.investorPortfolioResponse = investorPortfolioResponse;
	}
	public List<InvestorPortfolioResponse> getInvestorPortfolioResponseList() {
		return investorPortfolioResponseList;
	}
	public void setInvestorPortfolioResponseList(List<InvestorPortfolioResponse> investorPortfolioResponseList) {
		this.investorPortfolioResponseList = investorPortfolioResponseList;
	}
	public List<UsersPortfolioTotal> getUsersPortfolioTotalList() {
		return usersPortfolioTotalList;
	}
	public void setUsersPortfolioTotalList(List<UsersPortfolioTotal> usersPortfolioTotalList) {
		this.usersPortfolioTotalList = usersPortfolioTotalList;
	}
	public List<RmInvestorResponse> getFamilyAumList() {
		return familyAumList;
	}
	public void setFamilyAumList(List<RmInvestorResponse> familyAumList) {
		this.familyAumList = familyAumList;
	}
	public List<AumAmc> getAmcAumList() {
		return amcAumList;
	}
	public void setAmcAumList(List<AumAmc> amcAumList) {
		this.amcAumList = amcAumList;
	}
	public List<AumCategory> getCategoryAumList() {
		return categoryAumList;
	}
	public void setCategoryAumList(List<AumCategory> categoryAumList) {
		this.categoryAumList = categoryAumList;
	}
	public List<String> getPortfolioFinancialYearList() {
		return portfolioFinancialYearList;
	}
	public void setPortfolioFinancialYearList(List<String> portfolioFinancialYearList) {
		this.portfolioFinancialYearList = portfolioFinancialYearList;
	}
	public List<Top50KubotFunds> getTop50SmartMoneyFunds() {
		return top50SmartMoneyFunds;
	}
	public void setTop50SmartMoneyFunds(List<Top50KubotFunds> top50SmartMoneyFunds) {
		this.top50SmartMoneyFunds = top50SmartMoneyFunds;
	}
	public List<BseSIPMaster> getSip_scheme_details_list() {
		return sip_scheme_details_list;
	}
	public void setSip_scheme_details_list(List<BseSIPMaster> sip_scheme_details_list) {
		this.sip_scheme_details_list = sip_scheme_details_list;
	}
	public NseSchemeMaster getNse_scheme_master() {
		return nse_scheme_master;
	}
	public void setNse_scheme_master(NseSchemeMaster nse_scheme_master) {
		this.nse_scheme_master = nse_scheme_master;
	}
	public NseSchemeMasterLimit getNse_scheme_master_limit() {
		return nse_scheme_master_limit;
	}
	public void setNse_scheme_master_limit(NseSchemeMasterLimit nse_scheme_master_limit) {
		this.nse_scheme_master_limit = nse_scheme_master_limit;
	}
	public List<NseSchemeMasterLimit> getNse_sip_scheme_list() {
		return nse_sip_scheme_list;
	}
	public void setNse_sip_scheme_list(List<NseSchemeMasterLimit> nse_sip_scheme_list) {
		this.nse_sip_scheme_list = nse_sip_scheme_list;
	}
	public List<ApiGetAllNotificationsResponse> getNotification_list() {
		return notification_list;
	}
	public void setNotification_list(List<ApiGetAllNotificationsResponse> notification_list) {
		this.notification_list = notification_list;
	}
	public String getPaymentGatewayHtml() {
		return paymentGatewayHtml;
	}
	public void setPaymentGatewayHtml(String paymentGatewayHtml) {
		this.paymentGatewayHtml = paymentGatewayHtml;
	}
	public String getPaymentGatewayLink() {
		return paymentGatewayLink;
	}
	public void setPaymentGatewayLink(String paymentGatewayLink) {
		this.paymentGatewayLink = paymentGatewayLink;
	}
	public Double getTarget_amount() {
		return target_amount;
	}
	public void setTarget_amount(Double target_amount) {
		this.target_amount = target_amount;
	}
	public Double getInflation() {
		return inflation;
	}
	public void setInflation(Double inflation) {
		this.inflation = inflation;
	}
	public Integer getYears() {
		return years;
	}
	public void setYears(Integer years) {
		this.years = years;
	}
	public Double getSip_amount() {
		return sip_amount;
	}
	public void setSip_amount(Double sip_amount) {
		this.sip_amount = sip_amount;
	}
	public List<String> getFolioList() {
		return folioList;
	}
	public void setFolioList(List<String> folioList) {
		this.folioList = folioList;
	}
	public List<String> getSchemeOptionsList() {
		return schemeOptionsList;
	}
	public void setSchemeOptionsList(List<String> schemeOptionsList) {
		this.schemeOptionsList = schemeOptionsList;
	}
	public List<ApiMandateDetails> getMandate_list() {
		return mandate_list;
	}
	public void setMandate_list(List<ApiMandateDetails> mandate_list) {
		this.mandate_list = mandate_list;
	}
	public List<ApiBankInfo> getBankInfo_list() {
		return bankInfo_list;
	}
	public void setBankInfo_list(List<ApiBankInfo> bankInfo_list) {
		this.bankInfo_list = bankInfo_list;
	}
	public List<ApiRoboSchemeResponse> getGoal_scheme_list() {
		return goal_scheme_list;
	}
	public void setGoal_scheme_list(List<ApiRoboSchemeResponse> goal_scheme_list) {
		this.goal_scheme_list = goal_scheme_list;
	}
	public List<String> getSchemeCategoryList() {
		return schemeCategoryList;
	}
	public void setSchemeCategoryList(List<String> schemeCategoryList) {
		this.schemeCategoryList = schemeCategoryList;
	}
	public List<SIPTransactionResponse> getScheme_transaction_list() {
		return scheme_transaction_list;
	}
	public void setScheme_transaction_list(List<SIPTransactionResponse> scheme_transaction_list) {
		this.scheme_transaction_list = scheme_transaction_list;
	}
	public List<CategoryResponse> getBroad_category_res_list() {
		return broad_category_res_list;
	}
	public void setBroad_category_res_list(List<CategoryResponse> broad_category_res_list) {
		this.broad_category_res_list = broad_category_res_list;
	}
	public List<AllocationMapResponse> getMarket_capital_list() {
		return market_capital_list;
	}
	public void setMarket_capital_list(List<AllocationMapResponse> market_capital_list) {
		this.market_capital_list = market_capital_list;
	}
	public List<AllocationMapResponse> getEquity_holdings_list() {
		return equity_holdings_list;
	}
	public void setEquity_holdings_list(List<AllocationMapResponse> equity_holdings_list) {
		this.equity_holdings_list = equity_holdings_list;
	}
	public List<AllocationMapResponse> getDebt_holdings_list() {
		return debt_holdings_list;
	}
	public void setDebt_holdings_list(List<AllocationMapResponse> debt_holdings_list) {
		this.debt_holdings_list = debt_holdings_list;
	}
	public List<AllocationMapResponse> getSector_allocation_list() {
		return sector_allocation_list;
	}
	public void setSector_allocation_list(List<AllocationMapResponse> sector_allocation_list) {
		this.sector_allocation_list = sector_allocation_list;
	}
	public List<CategoryResponse> getAmc_allocation_list() {
		return amc_allocation_list;
	}
	public void setAmc_allocation_list(List<CategoryResponse> amc_allocation_list) {
		this.amc_allocation_list = amc_allocation_list;
	}
	public List<CategoryResponse> getCategory_allocation_list() {
		return category_allocation_list;
	}
	public void setCategory_allocation_list(List<CategoryResponse> category_allocation_list) {
		this.category_allocation_list = category_allocation_list;
	}
	public String getAum_month() {
		return aum_month;
	}
	public void setAum_month(String aum_month) {
		this.aum_month = aum_month;
	}
	public Double getTotal_aum() {
		return total_aum;
	}
	public void setTotal_aum(Double total_aum) {
		this.total_aum = total_aum;
	}
	public Double getAum_change_value() {
		return aum_change_value;
	}
	public void setAum_change_value(Double aum_change_value) {
		this.aum_change_value = aum_change_value;
	}
	public Double getAum_change_percentage() {
		return aum_change_percentage;
	}
	public void setAum_change_percentage(Double aum_change_percentage) {
		this.aum_change_percentage = aum_change_percentage;
	}
	public Integer getTotal_investors() {
		return total_investors;
	}
	public void setTotal_investors(Integer total_investors) {
		this.total_investors = total_investors;
	}
	public Integer getTotal_family_investors() {
		return total_family_investors;
	}
	public void setTotal_family_investors(Integer total_family_investors) {
		this.total_family_investors = total_family_investors;
	}
	public Integer getTotal_elss_investors() {
		return total_elss_investors;
	}
	public void setTotal_elss_investors(Integer total_elss_investors) {
		this.total_elss_investors = total_elss_investors;
	}
	public Integer getTotal_sip_investors() {
		return total_sip_investors;
	}
	public void setTotal_sip_investors(Integer total_sip_investors) {
		this.total_sip_investors = total_sip_investors;
	}
	public Integer getTotal_sip_count() {
		return total_sip_count;
	}
	public void setTotal_sip_count(Integer total_sip_count) {
		this.total_sip_count = total_sip_count;
	}
	public Double getTotal_sip_amount() {
		return total_sip_amount;
	}
	public void setTotal_sip_amount(Double total_sip_amount) {
		this.total_sip_amount = total_sip_amount;
	}
	public Double getAvg_sip_amount() {
		return avg_sip_amount;
	}
	public void setAvg_sip_amount(Double avg_sip_amount) {
		this.avg_sip_amount = avg_sip_amount;
	}
	public String getBrokerage_month() {
		return brokerage_month;
	}
	public void setBrokerage_month(String brokerage_month) {
		this.brokerage_month = brokerage_month;
	}
	public Double getBrokerage_amount() {
		return brokerage_amount;
	}
	public void setBrokerage_amount(Double brokerage_amount) {
		this.brokerage_amount = brokerage_amount;
	}
	public List<CategoryResponse> getBroad_list() {
		return broad_list;
	}
	public void setBroad_list(List<CategoryResponse> broad_list) {
		this.broad_list = broad_list;
	}
	public List<AumFamily> getFamily_aum_list() {
		return family_aum_list;
	}
	public void setFamily_aum_list(List<AumFamily> family_aum_list) {
		this.family_aum_list = family_aum_list;
	}
	public List<InvestorSIPMasterResponse> getSip_list() {
		return sip_list;
	}
	public void setSip_list(List<InvestorSIPMasterResponse> sip_list) {
		this.sip_list = sip_list;
	}
	public List<ExpiringShortlySip> getExpiringshortlysip() {
		return expiringshortlysip;
	}
	public void setExpiringshortlysip(List<ExpiringShortlySip> expiringshortlysip) {
		this.expiringshortlysip = expiringshortlysip;
	}
	public Integer getSip_active_count() {
		return sip_active_count;
	}
	public void setSip_active_count(Integer sip_active_count) {
		this.sip_active_count = sip_active_count;
	}
	public Double getSip_active_amount() {
		return sip_active_amount;
	}
	public void setSip_active_amount(Double sip_active_amount) {
		this.sip_active_amount = sip_active_amount;
	}
	public Double getSip_average_amount() {
		return sip_average_amount;
	}
	public void setSip_average_amount(Double sip_average_amount) {
		this.sip_average_amount = sip_average_amount;
	}
	public Integer getSip_active_investor_count() {
		return sip_active_investor_count;
	}
	public void setSip_active_investor_count(Integer sip_active_investor_count) {
		this.sip_active_investor_count = sip_active_investor_count;
	}
	public Integer getSip_expiring_count() {
		return sip_expiring_count;
	}
	public void setSip_expiring_count(Integer sip_expiring_count) {
		this.sip_expiring_count = sip_expiring_count;
	}
	public Double getSip_expiring_amount() {
		return sip_expiring_amount;
	}
	public void setSip_expiring_amount(Double sip_expiring_amount) {
		this.sip_expiring_amount = sip_expiring_amount;
	}
	public Integer getSip_starting_count() {
		return sip_starting_count;
	}
	public void setSip_starting_count(Integer sip_starting_count) {
		this.sip_starting_count = sip_starting_count;
	}
	public Double getSip_starting_amount() {
		return sip_starting_amount;
	}
	public void setSip_starting_amount(Double sip_starting_amount) {
		this.sip_starting_amount = sip_starting_amount;
	}
	public Double getSip_amc1_amount() {
		return sip_amc1_amount;
	}
	public void setSip_amc1_amount(Double sip_amc1_amount) {
		this.sip_amc1_amount = sip_amc1_amount;
	}
	public Double getSip_amc2_amount() {
		return sip_amc2_amount;
	}
	public void setSip_amc2_amount(Double sip_amc2_amount) {
		this.sip_amc2_amount = sip_amc2_amount;
	}
	public Double getSip_amc3_amount() {
		return sip_amc3_amount;
	}
	public void setSip_amc3_amount(Double sip_amc3_amount) {
		this.sip_amc3_amount = sip_amc3_amount;
	}
	public Double getSip_amc4_amount() {
		return sip_amc4_amount;
	}
	public void setSip_amc4_amount(Double sip_amc4_amount) {
		this.sip_amc4_amount = sip_amc4_amount;
	}
	public Double getSip_amc5_amount() {
		return sip_amc5_amount;
	}
	public void setSip_amc5_amount(Double sip_amc5_amount) {
		this.sip_amc5_amount = sip_amc5_amount;
	}
	public Double getSip_amc6_amount() {
		return sip_amc6_amount;
	}
	public void setSip_amc6_amount(Double sip_amc6_amount) {
		this.sip_amc6_amount = sip_amc6_amount;
	}
	public Double getSip_amc7_amount() {
		return sip_amc7_amount;
	}
	public void setSip_amc7_amount(Double sip_amc7_amount) {
		this.sip_amc7_amount = sip_amc7_amount;
	}
	public Double getSip_amc8_amount() {
		return sip_amc8_amount;
	}
	public void setSip_amc8_amount(Double sip_amc8_amount) {
		this.sip_amc8_amount = sip_amc8_amount;
	}
	public List<TransactionReportResponse> getTransaction_list() {
		return transaction_list;
	}
	public void setTransaction_list(List<TransactionReportResponse> transaction_list) {
		this.transaction_list = transaction_list;
	}
	public List<AmfiMutualFundCompanies> getSip_amc_list() {
		return sip_amc_list;
	}
	public void setSip_amc_list(List<AmfiMutualFundCompanies> sip_amc_list) {
		this.sip_amc_list = sip_amc_list;
	}
	public List<UsersPortfolioSchemewise> getUsersPortfolioSchemewiseList() {
		return usersPortfolioSchemewiseList;
	}
	public void setUsersPortfolioSchemewiseList(List<UsersPortfolioSchemewise> usersPortfolioSchemewiseList) {
		this.usersPortfolioSchemewiseList = usersPortfolioSchemewiseList;
	}
	public List<String> getAmc_list() {
		return amc_list;
	}
	public void setAmc_list(List<String> amc_list) {
		this.amc_list = amc_list;
	}
	public List<String> getCategory_list() {
		return category_list;
	}
	public void setCategory_list(List<String> category_list) {
		this.category_list = category_list;
	}
	public List<String> getBroad_category_list() {
		return broad_category_list;
	}
	public void setBroad_category_list(List<String> broad_category_list) {
		this.broad_category_list = broad_category_list;
	}
	public List<String> getBranch_list() {
		return branch_list;
	}
	public void setBranch_list(List<String> branch_list) {
		this.branch_list = branch_list;
	}
	public List<String> getRm_list() {
		return rm_list;
	}
	public void setRm_list(List<String> rm_list) {
		this.rm_list = rm_list;
	}
	public List<String> getSubbroker_list() {
		return subbroker_list;
	}
	public void setSubbroker_list(List<String> subbroker_list) {
		this.subbroker_list = subbroker_list;
	}
	public List<ClientwiseSip> getClient_scheme_holding_list() {
		return client_scheme_holding_list;
	}
	public void setClient_scheme_holding_list(List<ClientwiseSip> client_scheme_holding_list) {
		this.client_scheme_holding_list = client_scheme_holding_list;
	}
	public List<InvestorSchemeWisePortfolioResponse> getXirr_report() {
		return xirr_report;
	}
	public void setXirr_report(List<InvestorSchemeWisePortfolioResponse> xirr_report) {
		this.xirr_report = xirr_report;
	}
	public List<MonthlyMISResponse> getDaily_transaction_analysis_list() {
		return daily_transaction_analysis_list;
	}
	public void setDaily_transaction_analysis_list(List<MonthlyMISResponse> daily_transaction_analysis_list) {
		this.daily_transaction_analysis_list = daily_transaction_analysis_list;
	}
	public Double getTotal_purchase_amount() {
		return total_purchase_amount;
	}
	public void setTotal_purchase_amount(Double total_purchase_amount) {
		this.total_purchase_amount = total_purchase_amount;
	}
	public Double getTotal_redemption_amount() {
		return total_redemption_amount;
	}
	public void setTotal_redemption_amount(Double total_redemption_amount) {
		this.total_redemption_amount = total_redemption_amount;
	}
	public Double getTotal_switch_in_amount() {
		return total_switch_in_amount;
	}
	public void setTotal_switch_in_amount(Double total_switch_in_amount) {
		this.total_switch_in_amount = total_switch_in_amount;
	}
	public Double getTotal_switch_out_amount() {
		return total_switch_out_amount;
	}
	public void setTotal_switch_out_amount(Double total_switch_out_amount) {
		this.total_switch_out_amount = total_switch_out_amount;
	}
	public Double getTotal_ticob_amount() {
		return total_ticob_amount;
	}
	public void setTotal_ticob_amount(Double total_ticob_amount) {
		this.total_ticob_amount = total_ticob_amount;
	}
	public Double getTotal_tocob_amount() {
		return total_tocob_amount;
	}
	public void setTotal_tocob_amount(Double total_tocob_amount) {
		this.total_tocob_amount = total_tocob_amount;
	}
	public Double getTotal_net_amount() {
		return total_net_amount;
	}
	public void setTotal_net_amount(Double total_net_amount) {
		this.total_net_amount = total_net_amount;
	}
	public List<BrokerageAmcResponse> getRmAumList() {
		return rmAumList;
	}
	public void setRmAumList(List<BrokerageAmcResponse> rmAumList) {
		this.rmAumList = rmAumList;
	}
	public List<BrokerageConsolidated> getRmAUMSummaryList() {
		return rmAUMSummaryList;
	}
	public void setRmAUMSummaryList(List<BrokerageConsolidated> rmAUMSummaryList) {
		this.rmAUMSummaryList = rmAUMSummaryList;
	}
	public List<String> getFinancialYearList() {
		return financialYearList;
	}
	public void setFinancialYearList(List<String> financialYearList) {
		this.financialYearList = financialYearList;
	}
	public List<BrokerageConsolidated> getBrokerageList() {
		return brokerageList;
	}
	public void setBrokerageList(List<BrokerageConsolidated> brokerageList) {
		this.brokerageList = brokerageList;
	}
	public List<BrokerageDetailsResponse> getBrokerage_list() {
		return brokerage_list;
	}
	public void setBrokerage_list(List<BrokerageDetailsResponse> brokerage_list) {
		this.brokerage_list = brokerage_list;
	}
	public List<CommonSubbrokerSummary> getCommonBrokerageList() {
		return commonBrokerageList;
	}
	public void setCommonBrokerageList(List<CommonSubbrokerSummary> commonBrokerageList) {
		this.commonBrokerageList = commonBrokerageList;
	}
	public Double getMf_return() {
		return mf_return;
	}
	public void setMf_return(Double mf_return) {
		this.mf_return = mf_return;
	}
	public Double getMf_value() {
		return mf_value;
	}
	public void setMf_value(Double mf_value) {
		this.mf_value = mf_value;
	}
	public Double getScheme_return() {
		return scheme_return;
	}
	public void setScheme_return(Double scheme_return) {
		this.scheme_return = scheme_return;
	}
	public Double getScheme_value() {
		return scheme_value;
	}
	public void setScheme_value(Double scheme_value) {
		this.scheme_value = scheme_value;
	}
	public Double getBenchmark_return() {
		return benchmark_return;
	}
	public void setBenchmark_return(Double benchmark_return) {
		this.benchmark_return = benchmark_return;
	}
	public Double getBenchmark_value() {
		return benchmark_value;
	}
	public void setBenchmark_value(Double benchmark_value) {
		this.benchmark_value = benchmark_value;
	}
	public Double getGold_return() {
		return gold_return;
	}
	public void setGold_return(Double gold_return) {
		this.gold_return = gold_return;
	}
	public Double getGold_value() {
		return gold_value;
	}
	public void setGold_value(Double gold_value) {
		this.gold_value = gold_value;
	}
	public Double getFd_return() {
		return fd_return;
	}
	public void setFd_return(Double fd_return) {
		this.fd_return = fd_return;
	}
	public Double getFd_value() {
		return fd_value;
	}
	public void setFd_value(Double fd_value) {
		this.fd_value = fd_value;
	}
	public String getTotal_mis_inflow_amount() {
		return total_mis_inflow_amount;
	}
	public void setTotal_mis_inflow_amount(String total_mis_inflow_amount) {
		this.total_mis_inflow_amount = total_mis_inflow_amount;
	}
	public String getTotal_mis_outflow_amount() {
		return total_mis_outflow_amount;
	}
	public void setTotal_mis_outflow_amount(String total_mis_outflow_amount) {
		this.total_mis_outflow_amount = total_mis_outflow_amount;
	}
	public String getTotal_mis_redemption_amount() {
		return total_mis_redemption_amount;
	}
	public void setTotal_mis_redemption_amount(String total_mis_redemption_amount) {
		this.total_mis_redemption_amount = total_mis_redemption_amount;
	}
	public String getTotal_mis_net_amount() {
		return total_mis_net_amount;
	}
	public void setTotal_mis_net_amount(String total_mis_net_amount) {
		this.total_mis_net_amount = total_mis_net_amount;
	}
	public List<MonthlyMISResponse> getMonthly_mis_list() {
		return monthly_mis_list;
	}
	public void setMonthly_mis_list(List<MonthlyMISResponse> monthly_mis_list) {
		this.monthly_mis_list = monthly_mis_list;
	}
	public List<InvestorSchemeWiseTransactionResponse> getTransaction_rejection_list() {
		return transaction_rejection_list;
	}
	public void setTransaction_rejection_list(List<InvestorSchemeWiseTransactionResponse> transaction_rejection_list) {
		this.transaction_rejection_list = transaction_rejection_list;
	}
	public BseSchemeCodeMaster getBse_scheme_master() {
		return bse_scheme_master;
	}
	public void setBse_scheme_master(BseSchemeCodeMaster bse_scheme_master) {
		this.bse_scheme_master = bse_scheme_master;
	}
	public List<BseSchemeCodeMaster> getNfo_scheme_list() {
		return nfo_scheme_list;
	}
	public void setNfo_scheme_list(List<BseSchemeCodeMaster> nfo_scheme_list) {
		this.nfo_scheme_list = nfo_scheme_list;
	}
	public List<UsersGoalSavedPlan> getGoal_list() {
		return goal_list;
	}
	public void setGoal_list(List<UsersGoalSavedPlan> goal_list) {
		this.goal_list = goal_list;
	}
	public List<NseIINResponse> getNse_iin_list() {
		return nse_iin_list;
	}
	public void setNse_iin_list(List<NseIINResponse> nse_iin_list) {
		this.nse_iin_list = nse_iin_list;
	}
	public List<NseIINResponse> getBse_client_code_list() {
		return bse_client_code_list;
	}
	public void setBse_client_code_list(List<NseIINResponse> bse_client_code_list) {
		this.bse_client_code_list = bse_client_code_list;
	}
	public List<NseCountry> getNse_country_list() {
		return nse_country_list;
	}
	public void setNse_country_list(List<NseCountry> nse_country_list) {
		this.nse_country_list = nse_country_list;
	}
	public List<BseCountry> getBse_country_list() {
		return bse_country_list;
	}
	public void setBse_country_list(List<BseCountry> bse_country_list) {
		this.bse_country_list = bse_country_list;
	}
	public String getTransactionNumber() {
		return transactionNumber;
	}
	public void setTransactionNumber(String transactionNumber) {
		this.transactionNumber = transactionNumber;
	}
	public List<FolioWiseTransactionResponse> getFolio_master_list() {
		return folio_master_list;
	}
	public void setFolio_master_list(List<FolioWiseTransactionResponse> folio_master_list) {
		this.folio_master_list = folio_master_list;
	}
	public Map<String, String> getRatingMap() {
		return ratingMap;
	}
	public void setRatingMap(Map<String, String> ratingMap) {
		this.ratingMap = ratingMap;
	}
	public Map<String, Double> getIssuerMap() {
		return issuerMap;
	}
	public void setIssuerMap(Map<String, Double> issuerMap) {
		this.issuerMap = issuerMap;
	}
	public Map<String, Double> getAssetMap() {
		return assetMap;
	}
	public void setAssetMap(Map<String, Double> assetMap) {
		this.assetMap = assetMap;
	}
	public DebtYtmChangePercentResponse getDebtYtmChangePercent() {
		return debtYtmChangePercent;
	}
	public void setDebtYtmChangePercent(DebtYtmChangePercentResponse debtYtmChangePercent) {
		this.debtYtmChangePercent = debtYtmChangePercent;
	}
	public SchemePerformancesBenchmark getBenchmark_returns() {
		return benchmark_returns;
	}
	public void setBenchmark_returns(SchemePerformancesBenchmark benchmark_returns) {
		this.benchmark_returns = benchmark_returns;
	}
	public List<SchemeCategoryAnnualReturns> getCategory_returns() {
		return category_returns;
	}
	public void setCategory_returns(List<SchemeCategoryAnnualReturns> category_returns) {
		this.category_returns = category_returns;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
