package com.mf.response;

import java.util.List;

public class FolioWiseTransactionResponse {

	private String folio_no;
	private List<InvestorSchemeWisePortfolioResponse> investorSchemeWisePortfolioResponses;
	
	public String getFolio_no() {
		return folio_no;
	}
	public void setFolio_no(String folio_no) {
		this.folio_no = folio_no;
	}
	public List<InvestorSchemeWisePortfolioResponse> getInvestorSchemeWisePortfolioResponses() {
		return investorSchemeWisePortfolioResponses;
	}
	public void setInvestorSchemeWisePortfolioResponses(
			List<InvestorSchemeWisePortfolioResponse> investorSchemeWisePortfolioResponses) {
		this.investorSchemeWisePortfolioResponses = investorSchemeWisePortfolioResponses;
	}
}
