package com.mf.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.internal.util.StringHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mf.amfi.model.SchemeBestPerformance;
import com.mf.amfi.model.SchemeCategoryAnnualReturns;
import com.mf.amfi.model.SchemeDailyAum;
import com.mf.amfi.model.SchemeMapping;
import com.mf.amfi.model.SchemePerformances;
import com.mf.amfi.model.SchemePerformancesBenchmark;
import com.mf.amfi.model.SchemeRollingReturns;
import com.mf.amfi.response.ApiCalculatorLumpsum;
import com.mf.amfi.response.ApiCommonResponse;
import com.mf.amfi.response.BenchmarkSIPCalcFinalResponse;
import com.mf.amfi.response.BenchmarkSipCalcApiResponse;
import com.mf.amfi.response.DebtYtmChangePercentResponse;
import com.mf.amfi.response.LumpsumReturnsAPIResponse;
import com.mf.amfi.response.MutualFundSchemeAPIResponse;
import com.mf.amfi.response.RollingReturnsMultipleSchemesAPIResponse;
import com.mf.amfi.response.RollingReturnsSummaryResponse;
import com.mf.amfi.response.SchemeInfoApiResponse;
import com.mf.amfi.response.SchemePortfolioAnalysisApiResponse;
import com.mf.amfi.response.SchemePortfolioAnalysisResponse;
import com.mf.amfi.response.SchemePortfolioResponse;
import com.mf.amfi.response.SchemeSipLumpsumReturnsApiResponse;
import com.mf.response.CommonResponse;
import com.mf.response.PortfolioAnalysisResponse;
import com.mf.utils.CommonUtils;
import com.mf.utils.HttpPost;
import com.mf.utils.MfApiAccessor;
import com.mf.utils.MfApiUrls;
import com.mf.utils.StatusMessage;

@Controller
@RequestMapping(value="/mutual-funds-research")
public class MutualFundSchemeOverviewController 
{
	
	
	
		
	@RequestMapping(value="/getPortfolioAnalysis")
	public void getPortfolioAnalysis(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
    	PrintWriter writer = response.getWriter();
		response.setContentType("application/json");
		Gson gson = null;
		try 
		{	
			gson = new Gson();
			
    		String scheme_amfi = request.getParameter("scheme_amfi");  
    		PortfolioAnalysisResponse analysisResponse = new PortfolioAnalysisResponse();
    		
 			//SchemeAssets schemeAssets = mutualFundOverviewDAO.getSchemeAsset(scheme_amfi_code);
 			//analysisResponse.setSchemeAssets(schemeAssets);
    		
    		HashMap<String, String> hashMap = new HashMap<String, String>();
	 		hashMap.put("scheme_name", scheme_amfi);
	 		 		
	 		String formattedUrl, result = "";
	 		
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getPortfolioAnalysis, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);	
	 		gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		SchemePortfolioAnalysisApiResponse mutualFundSchemeAPIResponse = gson.fromJson(result, SchemePortfolioAnalysisApiResponse.class); 		
	 		//SchemePortfolioAnalysisResponse schemePortfolioAnalysisResponse = mutualFundOverviewDAO.getPortfolioAnalysisReportForFundOverview(scheme_amfi_code);
	 		SchemePortfolioAnalysisResponse schemePortfolioAnalysisResponse = mutualFundSchemeAPIResponse.getSchemePortfolioAnalysisResponse();
	 		if(schemePortfolioAnalysisResponse.getSectorAllocationMap() != null)
	 			schemePortfolioAnalysisResponse.setSectorAllocationMap((HashMap<String, Double>) CommonUtils.sortByValuesDescending(schemePortfolioAnalysisResponse.getSectorAllocationMap()));
	 		analysisResponse.setSchemePortfolioAnalysisResponse(schemePortfolioAnalysisResponse);
	 		
    		
    		writer.print(gson.toJson(analysisResponse));
		    writer.close();
		    return;
		} 
		catch (Exception ex) 
		{
		    writer.close();
			ex.printStackTrace();
		}
	}

	
	

	

	@RequestMapping(value="/getCompleteNavReportForFundOverview")
	public void getCompleteNavReportForFundOverview(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
    	PrintWriter writer = response.getWriter();
		response.setContentType("application/json");
		
		try 
		{	
			String scheme_amfi_name = request.getParameter("scheme_amfi_name");   		
    		scheme_amfi_name = URLDecoder.decode(scheme_amfi_name, "UTF-8");
    		
    		//getNavMovementGraph
    		
    		HashMap<String, String> hashMap = new HashMap<String, String>();
	 		hashMap.put("scheme_amfi_name",scheme_amfi_name);
	 		
	 		String formattedUrl, result = "";
	 		
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getNavMovementGraph, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);	 		
	 		CommonResponse commonAPIResponse = new Gson().fromJson(result, CommonResponse.class); 		
	 		
    		//String result = mutualFundOverviewDAO.getCompleteNavReportForFundOverview(scheme_amfi_name);
    		writer.print(commonAPIResponse.getMsg());
		    writer.close();
		    return;
		} 
		catch (Exception ex) 
		{
		    writer.close();
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/isValidFundName", method= RequestMethod.POST)
	public void isValidFundName(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
    	PrintWriter writer = response.getWriter();
		response.setContentType("text/Html");
		Gson gson = new Gson();
        String fund = null;
		try 
		{
            fund = request.getParameter("fund");
            if(fund == null || StringHelper.isEmpty(fund))
            {
        		writer.print(gson.toJson(false));
    		    writer.close();
    		    return;
            }
            fund = fund.trim();
            fund = URLDecoder.decode(fund, "UTF-8");
            
	 		String formattedUrl, result = "";
	 		
	 		HashMap<String, String> hashMap = new HashMap<String, String>();
	 		hashMap.put("scheme", fund);
	 		
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.isValidFundName, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);	 		
	 		ApiCommonResponse apiCommonResponse = new Gson().fromJson(result, ApiCommonResponse.class); 
	 		boolean value = apiCommonResponse.isValidScheme();
            
    		writer.print(gson.toJson(value));
		    writer.close();
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	
	
	
	@RequestMapping(value="/getRelatedfunds")
	public void getRelatedfunds(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		 
		PrintWriter writer = response.getWriter();
		response.setContentType("application/json");
		Gson gson = new Gson();
    	try 
   		{          
	 		String category =  request.getParameter("category");
	 		
	 		if(category == null){category= "Equity: Multi Cap";}
	 		
	 		category = category.trim();
	 		
	 		HashMap<String, String> hashMap = new HashMap<String, String>();
	 		hashMap.put("period", "3y");
	 		hashMap.put("category", category);
	 		hashMap.put("type", "Open");
	 		hashMap.put("maxno","1000");
	 		hashMap.put("mode","Growth");
	 		
	 		String formattedUrl, result = "";
	 		
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSchemePerformanceReturns, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);	 		
	 		MutualFundSchemeAPIResponse mutualFundSchemeAPIResponse = new Gson().fromJson(result, MutualFundSchemeAPIResponse.class); 		
	 		request.setAttribute("benchmark_returns", mutualFundSchemeAPIResponse.getBenchmark_returns());	
	 		
	 		request.setAttribute("schemePerformances", mutualFundSchemeAPIResponse.getList());	 		
	 		request.setAttribute("category_returns", mutualFundSchemeAPIResponse.getCategory_returns());
	 		
	 		List<SchemePerformances> schemeList = mutualFundSchemeAPIResponse.getList().stream().limit(10).collect(Collectors.toList());
	 		writer.print(gson.toJson(schemeList));
		    writer.close();
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
	}
	}
