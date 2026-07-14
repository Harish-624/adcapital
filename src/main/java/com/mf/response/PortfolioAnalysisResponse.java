package com.mf.response;

import com.mf.amfi.response.SchemeAssets;
import com.mf.amfi.response.SchemePortfolioAnalysisResponse;

public class PortfolioAnalysisResponse 
{
	private SchemeAssets schemeAssets;
	private SchemePortfolioAnalysisResponse schemePortfolioAnalysisResponse;
	
	public SchemeAssets getSchemeAssets() {
		return schemeAssets;
	}
	public void setSchemeAssets(SchemeAssets schemeAssets) {
		this.schemeAssets = schemeAssets;
	}
	public SchemePortfolioAnalysisResponse getSchemePortfolioAnalysisResponse() {
		return schemePortfolioAnalysisResponse;
	}
	public void setSchemePortfolioAnalysisResponse(
			SchemePortfolioAnalysisResponse schemePortfolioAnalysisResponse) {
		this.schemePortfolioAnalysisResponse = schemePortfolioAnalysisResponse;
	}
}
