package com.mf.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.internal.util.StringHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;
import com.mf.amfi.model.LatestNav;
import com.mf.amfi.model.ModelPortfolioSchemes;
import com.mf.amfi.model.SchemeCategoryAnnualReturns;
import com.mf.amfi.model.SchemeMapping;
import com.mf.amfi.model.SchemePerformances;
import com.mf.amfi.model.SchemePerformancesBenchmark;
import com.mf.amfi.model.SchemePerformancesCategory;
import com.mf.amfi.model.SchemePerformancesLumpsum;
import com.mf.amfi.model.SchemePerformancesSip;
import com.mf.amfi.model.SchemePortfolio;
import com.mf.amfi.model.SchemeQuartileRankingAnnualReturns;
import com.mf.amfi.model.SchemeRollingReturns;
import com.mf.amfi.model.Top10FundsByCategory;
import com.mf.amfi.response.AnnualReturnOFFundsResponse;
import com.mf.amfi.response.ApiCommonResponse;
import com.mf.amfi.response.BenchmarkSIPCalcFinalResponse;
import com.mf.amfi.response.BenchmarkSipCalcApiResponse;
import com.mf.amfi.response.DebtYtmChangePercentResponse;
import com.mf.amfi.response.DividendHistoryResponse;
import com.mf.amfi.response.FdVsDebtAPIResponse;
import com.mf.amfi.response.FundPerformanceOverviewAgainstBenchmarkAndCategoryResponse;
import com.mf.amfi.response.HistoricalDividendsResponse;
import com.mf.amfi.response.LatestMutualFundsNAV52WeekHighNavResponse;
import com.mf.amfi.response.LatestNavResponse;
import com.mf.amfi.response.LiquidFundsVsSavingsBankResponse;
import com.mf.amfi.response.LumpsumReturnsAPIResponse;
import com.mf.amfi.response.MutualFundAPIResponse;
import com.mf.amfi.response.MutualFundCategoryMonitorResponse;
import com.mf.amfi.response.MutualFundCategoryReturnsResponse;
import com.mf.amfi.response.MutualFundComparisonWithAssetClassesResponse;
import com.mf.amfi.response.MutualFundPortfolioOverlapRseponse;
import com.mf.amfi.response.MutualFundQuartileRankingApiResponse;
import com.mf.amfi.response.MutualFundSIPReturnsAPIResponse;
import com.mf.amfi.response.MutualFundSchemeAPIResponse;
import com.mf.amfi.response.MutualFundTopConsistentFundResponse;
import com.mf.amfi.response.PPFvsELSSAPIResponse;
import com.mf.amfi.response.PointToPointResponse;
import com.mf.amfi.response.PointToPointReturnsCalculatorAPIResponse;
import com.mf.amfi.response.RollingReturnsMultipleSchemesAPIResponse;
import com.mf.amfi.response.RollingReturnsSummaryResponse;
import com.mf.amfi.response.RollingReturnsVsSensexAndGoldAPIResponse;
import com.mf.amfi.response.SIPReturnsCalculatorAPIAnnualIncreaseResponse;
import com.mf.amfi.response.SIPReturnsCalculatorAPIResponse;
import com.mf.amfi.response.STPCalcResponse;
import com.mf.amfi.response.STPReturnsCalculatorAPIResponse;
import com.mf.amfi.response.SWPReturnsCalculatorAPIResponse;
import com.mf.amfi.response.SchemeByAmcAPIResponse;
import com.mf.amfi.response.SchemeInceptionAndLatestNavDateAPIResponse;
import com.mf.amfi.response.SchemeInfoApiResponse;
import com.mf.amfi.response.SchemePortfolioAnalysisApiResponse;
import com.mf.amfi.response.SchemePortfolioAnalysisResponse;
import com.mf.amfi.response.SchemePortfolioResponse;
import com.mf.amfi.response.SchemeShortNameByCodeResponse;
import com.mf.amfi.response.TopDividendPayingMutualFundsApiResponse;
import com.mf.amfi.response.TopPerformingLumpsumFundsResponse;
import com.mf.amfi.response.TopSWPFundsResponse;
import com.mf.amfi.response.TopSwpFundsApiResponse;
import com.mf.model.DownloadCenter;
import com.mf.response.DownloadCenter2;
import com.mf.response.FactsheetAPIResponse;
import com.mf.response.GoalPortfolioResponse;
import com.mf.response.ModelPortfolioResponse;
import com.mf.response.MultipleSipReturnsSummaryResponse;
import com.mf.response.MutualFundPortfolioAPIResponse;
import com.mf.response.MutualfundInformationAPIResponse;
import com.mf.response.PortfolioAnalysisResponse;
import com.mf.response.TopConsistentMutualFundPerformersApiResponse;
import com.mf.utils.HttpPost;
import com.mf.utils.MfApiAccessor;
import com.mf.utils.MfApiUrls;
import com.mf.utils.UniqueIDProvider;
import com.mf.utils.Utils;

@Controller
@RequestMapping(value="/mutual-funds-research")
public class MutualFundResearchController 
{

	@Value("${hostDomainUrl}")
	private String hostDomainUrl;
	
	
	
	@RequestMapping(value="/getSchemeCategoriesByAmcCompany", method= RequestMethod.POST)
	public void getSchemeCategoriesByAmcCompany(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/Html");
		Gson gson = new Gson();
        String amc = null;
		try 
		{
			String requestUrl = request.getRequestURL().toString();
    		if(!Utils.isValidUrl(requestUrl, "getSchemeCategoriesByAmcCompany"))
    		{
    			response.sendRedirect(request.getContextPath() + "/page-not-found?invalidUrl=" + requestUrl);
    			return;
    		}
            amc = request.getParameter("amc");
	 			 		
	 		String formattedUrl, result = "";
	 		
	 		HashMap<String, String> hashMap = new HashMap<String, String>();
	 		hashMap.put("amc", amc);
	 		
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllSchemeCategoriesByAmc, hashMap);
	 		
	 		result = HttpPost.SendHttpPost(formattedUrl);	 		
	 		MutualFundAPIResponse mutualFundAPIResponse = new Gson().fromJson(result, MutualFundAPIResponse.class); 		
			List<String> schemeCategories = mutualFundAPIResponse.getList();
			
    		writer.print(gson.toJson(schemeCategories));
		    writer.close();
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/getSchemeByAmc", method= RequestMethod.POST)
	public void getSchemeByAmc(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("text/Html");
		Gson gson = new Gson();
        
		try 
		{
			String requestUrl = request.getRequestURL().toString();
    		if(!Utils.isValidUrl(requestUrl, "getSchemeByAmc"))
    		{
    			response.sendRedirect(request.getContextPath() + "/page-not-found?invalidUrl=" + requestUrl);
    			return;
    		}
    		String amc = request.getParameter("amc");
    		
	 		String formattedUrl, result = "";
	 		
	 		HashMap<String, String> hashMap = new HashMap<String, String>();
	 		hashMap.put("amc", amc);
	 		
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSchemeByAmcApi, hashMap);
	 		//System.out.println("formattedUrl-->"+formattedUrl);
	 		result = HttpPost.SendHttpPost(formattedUrl);	 		
	 		SchemeByAmcAPIResponse mutualFundAPIResponse = new Gson().fromJson(result, SchemeByAmcAPIResponse.class); 		
			List<String> schemes_list = mutualFundAPIResponse.getSchemes_list();
    		
    		writer.print(gson.toJson(schemes_list));
		    writer.close();
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/top-performing-mutual-funds")
	public String top_performing_funds(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		 
    	try 
   		{   
    		String category =  request.getParameter("category");
	 		String period = request.getParameter("period");
	 		String type = request.getParameter("type");
	 		String mode = request.getParameter("mode");
	 		String category_name = category;
	 		
	 		if(category == null){category= "Equity: Multi Cap";}
	 		if(category_name == null){category_name= "";}
	 		if(period == null){period= "1y";}
	 		if(type == null){type= "Open";}
	 		if(mode == null){mode= "Growth";}
	 		
	 		category = category.trim();
	 		category_name = category_name.trim();
	 		period = period.trim();
	 		type = type.trim();
	 		mode = mode.trim();

	 		HashMap<String, String> hashMap = new HashMap<String, String>();
	 		//hashMap.put("period", period);
	 		hashMap.put("category", category);
	 		hashMap.put("type", type);
	 		hashMap.put("maxno","1000");
	 		hashMap.put("mode",mode);
	 		
	 		String formattedUrl, result = "";
	 		 
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSchemePerformanceReturns, hashMap);
	 		System.out.println("formattedUrl-->"+formattedUrl);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		//System.out.println("result-->"+result);
	 		MutualFundSchemeAPIResponse mutualFundSchemeAPIResponse = new Gson().fromJson(result, MutualFundSchemeAPIResponse.class); 		
	 		request.setAttribute("benchmark_returns", mutualFundSchemeAPIResponse.getBenchmark_returns());	 	
	 		request.setAttribute("schemePerformances", mutualFundSchemeAPIResponse.getList());	 		
	 		request.setAttribute("category_returns", mutualFundSchemeAPIResponse.getCategory_returns());
	 		
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllSchemeCategories, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		MutualFundAPIResponse mutualFundAPIResponse = new Gson().fromJson(result, MutualFundAPIResponse.class);	 		
	     	request.setAttribute("schemeCategories", mutualFundAPIResponse.getList());
	     	
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getLatestNavDate, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);	 		
	 		ApiCommonResponse apiCommonResponse = new Gson().fromJson(result, ApiCommonResponse.class);	 		
	 		request.setAttribute("nav_date", apiCommonResponse.getNav_date());
	 		
	     	request.setAttribute("category", category);
	 		request.setAttribute("category_name", category_name);
	 		request.setAttribute("period", period);
	 		request.setAttribute("type", type);
	 		request.setAttribute("mode", mode);
    		
	     	request.setAttribute("page", "top-performing-mutual-funds");
	     	request.setAttribute("menu", "mf-research");
	     	request.setAttribute("jsp", "../amfi/top-performing-funds.jsp");
	     	
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
    	return "layout/layout";
    }
	
	@RequestMapping(value="/mutual-funds-performance-comparison")
	public String fund_performance(HttpServletRequest request, HttpServletResponse response)
	{
		try 
		{
			String fund = request.getParameter("fund");
			String category = request.getParameter("category");
			
			if(fund == null || StringHelper.isEmpty(fund)){fund= "ICICI Prudential Value Discovery Fund - Growth";}
			if(category == null || StringHelper.isEmpty(category)){category= "Equity: Value";}
			
			fund = fund.trim();
			category = category.trim();
			String formattedUrl , result = "";
			MutualFundAPIResponse mfapiResponse = null;
			
			request.setAttribute("fund", fund);
			request.setAttribute("category", category);
			
			formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllSchemeCategories, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		mfapiResponse = new Gson().fromJson(result, MutualFundAPIResponse.class);	 		
	     	request.setAttribute("schemeCategories", mfapiResponse.getList());
	     	
	     	HashMap<String, String> hashMap = new HashMap<String, String>();
	 		hashMap.put("category", category);
	 		hashMap.put("fund", fund);
	 		
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSchemePerformanceForFundComparison, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		MutualFundSchemeAPIResponse mutualFundSchemeAPIResponse = new Gson().fromJson(result, MutualFundSchemeAPIResponse.class);
	 		
            request.setAttribute("schemePerformances", mutualFundSchemeAPIResponse.getList());
            request.setAttribute("benchmark_returns", mutualFundSchemeAPIResponse.getBenchmark_returns());
            request.setAttribute("category_returns", mutualFundSchemeAPIResponse.getCategory_returns());
            
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getLatestNavDate, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);	 		
	 		ApiCommonResponse apiCommonResponse = new Gson().fromJson(result, ApiCommonResponse.class);	 		
	 		request.setAttribute("nav_date", apiCommonResponse.getNav_date());
			
            request.setAttribute("page", "mutual-funds-performance-comparison");
            request.setAttribute("menu", "mf-research");
            request.setAttribute("jsp", "../amfi/fund-comparison.jsp");
            
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
	@RequestMapping(value="/autoSuggestAllMfSchemes")
	public void autoSuggestAllMfSchemes(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		PrintWriter writer = response.getWriter();
		Gson gson = null;
		
		try 
		{
			gson = new Gson();
			String keyword = request.getParameter("query");
			String category = request.getParameter("category");
			String amc = request.getParameter("amc");
			if(keyword == null || StringHelper.isEmpty(keyword)){keyword = "Ax";}
			if(category == null || StringHelper.isEmpty(category)){category = "All";}
			if(amc == null || StringHelper.isEmpty(amc)){amc = "All";}
	 			 		
	 		String formattedUrl, result = "";
	 		
			HashMap<String, String> hashMap = new HashMap<String, String>();
	 		hashMap.put("query", keyword);
	 		hashMap.put("category", category);
	 		hashMap.put("amc", amc);
	 		
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.autoSuggestAllMfSchemes, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);	 		
	 		MutualFundAPIResponse mutualFundAPIResponse = new Gson().fromJson(result, MutualFundAPIResponse.class); 		
			List<String> schemeList = mutualFundAPIResponse.getList();
			
			response.setContentType("application/json");
			writer.println(gson.toJson(schemeList));
			writer.close();
		}
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/mutual-fund-returns-comparison")
	public String returns_calculator(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
    	try 
   		{
    		String category = request.getParameter("category");
    		String schemes = request.getParameter("schemes");
    		String amount = request.getParameter("amount");
            String startDates = request.getParameter("startDates");
            String endDates = request.getParameter("endDates");
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Calendar cal1 = Calendar.getInstance();
            cal1.add(Calendar.DATE, -1);
            String end_date_str = sdf.format(cal1.getTime());
			cal1.add(Calendar.YEAR, -1);
			cal1.add(Calendar.MONTH, 1);
			String start_date_str = sdf.format(cal1.getTime());
            
			if(category == null || StringHelper.isEmpty(category)){category = "Equity: Multi Cap";}
            if(schemes == null || StringHelper.isEmpty(schemes)){schemes = "HDFC Equity Fund - Growth Option";}
            if(amount == null || StringHelper.isEmpty(amount)){amount = "10000";}
            if(startDates == null || StringHelper.isEmpty(startDates)){startDates = start_date_str;}
            if(endDates == null || StringHelper.isEmpty(endDates)){endDates = end_date_str;}
            
            category = category.trim();
            schemes = schemes.trim();
            amount = amount.trim();
            startDates = startDates.trim();
            endDates = endDates.trim();
            
            request.setAttribute("category", category);
            request.setAttribute("schemes", schemes);
            request.setAttribute("amount", amount);
            request.setAttribute("startDates", startDates);
            request.setAttribute("endDates", endDates);
            
			List<String> start_date_array = new ArrayList<String>(Arrays.asList(startDates.split(",")));
			request.setAttribute("date_size", start_date_array.size());
			
            String formattedUrl, result = "";
            
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllSchemeCategories, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		MutualFundAPIResponse mutualFundAPIResponse = new Gson().fromJson(result, MutualFundAPIResponse.class);
	     	request.setAttribute("schemeCategories", mutualFundAPIResponse.getList());
	     	
	     	HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("amc", "");
	 		hashMap.put("category", category);
	 		hashMap.put("schemes", schemes);
	 		hashMap.put("startdate", startDates);
	 		hashMap.put("enddate", endDates);
	 		hashMap.put("amount", amount);
	 		hashMap.put("isin", "");
	 		
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getPointToPointReturnsComparison, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		PointToPointReturnsCalculatorAPIResponse list = new Gson().fromJson(result, PointToPointReturnsCalculatorAPIResponse.class);
	 		
	 		request.setAttribute("schemePerformances", list.getPointToPointResponseList());
	 		
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getLatestNavDate, new HashMap<String, String>());
		 	result = HttpPost.SendHttpPost(formattedUrl);	 		
		 	ApiCommonResponse apiCommonResponse = new Gson().fromJson(result, ApiCommonResponse.class);	 		
		 	request.setAttribute("nav_date", apiCommonResponse.getNav_date());
            
	     	request.setAttribute("page", "mutual-fund-returns-comparison");
	     	request.setAttribute("menu", "mf-research");
	     	request.setAttribute("jsp", "../amfi/returns-calculator.jsp");
	     	
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
    	return "layout/layout";
	}
	
	@RequestMapping(value="/mutual-fund-sip-investment-calculator")
	 public String sip_calculator(HttpServletRequest request, HttpServletResponse response) throws Exception
	 {
     try
     {
  	   	  String category = request.getParameter("category");
         String fund = request.getParameter("fund");
         String amount = request.getParameter("amount");
         String frequency = request.getParameter("frequency");
         String start_date = request.getParameter("startdate");
         String end_date = request.getParameter("enddate");
         String category_name = category;
        
         SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
         Calendar cal1 = Calendar.getInstance();
         cal1.add(Calendar.DATE, -1);
         String end_date_str = sdf.format(cal1.getTime());
         cal1.add(Calendar.YEAR, -1);
         cal1.add(Calendar.MONTH, 1);
         String start_date_str = sdf.format(cal1.getTime());
        
         if(category == null){category = "Equity: Large Cap";}
         if(category_name == null){category_name = "";}
         if(fund == null){fund = "ICICI Prudential Bluechip Fund - Growth";}
         if(amount == null || !amount.matches("[0-9]+")){amount = "3000";}
         if(frequency == null){frequency = "Monthly";}
         if(start_date == null || StringHelper.isEmpty(start_date) || !start_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){start_date = start_date_str;}
	 	  if(end_date == null || StringHelper.isEmpty(end_date) || !end_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){end_date = end_date_str;}
         
         category = category.trim();
         category_name = category_name.trim();
         fund = fund.trim();
         amount = amount.trim();
         frequency = frequency.trim();
         start_date = start_date.trim();
         end_date = end_date.trim(); 
         
         start_date = start_date.replaceAll("/","-");
         end_date = end_date.replaceAll("/","-");
         
         request.setAttribute("category", category);
         request.setAttribute("category_name", category_name);
         request.setAttribute("fund", fund);
         request.setAttribute("amount", amount);
         request.setAttribute("frequency", frequency);
         request.setAttribute("start_date", start_date);
         request.setAttribute("end_date", end_date);
         
         String formattedUrl, result = "";
         
         formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllSchemeCategories, new HashMap<String, String>());
	      result = HttpPost.SendHttpPost(formattedUrl);
	 	  MutualFundAPIResponse mutualFundAPIResponse = new Gson().fromJson(result, MutualFundAPIResponse.class);
	      request.setAttribute("schemeCategories", mutualFundAPIResponse.getList());
        
         HashMap<String, String> hashMap = new HashMap<String, String>();
         hashMap.put("category", category);
	 	  hashMap.put("fund", fund);
	 	  hashMap.put("startdate", start_date);
	 	  hashMap.put("enddate", end_date);
	 	  hashMap.put("frequency", frequency);
	 	  hashMap.put("amount",amount);
	 		
		  formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSIPReturnCalculator, hashMap);
		 // System.out.println("-->"+formattedUrl);
		  result = HttpPost.SendHttpPost(formattedUrl);
		  Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
		  SIPReturnsCalculatorAPIResponse sip_list = gson.fromJson(result, SIPReturnsCalculatorAPIResponse.class);
		  request.setAttribute("sip_list", sip_list.getList());
		  
		 formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getLatestNavDate, new HashMap<String, String>());
		 result = HttpPost.SendHttpPost(formattedUrl);	 		
		 ApiCommonResponse apiCommonResponse = new Gson().fromJson(result, ApiCommonResponse.class);	 		
		 request.setAttribute("nav_date", apiCommonResponse.getNav_date());
         
         request.setAttribute("page", "mutual-fund-sip-investment-calculator");
         request.setAttribute("menu", "mf-research"); 
         request.setAttribute("jsp", "../amfi/sip-calculator.jsp");
     }
     catch(Exception ex)
     {
     	ex.printStackTrace();
     }
     return "layout/layout";
	} 
	
	
	
	
	@RequestMapping(value="/getSchemeStartAndEndDate")
	public void getSchemeStartAndEndDate(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("application/json");
		Gson gson = null;
		try 
		{	
    		String scheme_amfi = request.getParameter("scheme_name");   
    		if(scheme_amfi == null){scheme_amfi = "";}
    		scheme_amfi = scheme_amfi.trim();
    		
    		scheme_amfi = URLDecoder.decode(scheme_amfi, "UTF-8");
    		
	 		 String formattedUrl, result = "";
	 		 
	         HashMap<String, String> hashMap = new HashMap<String, String>();
	 		 hashMap.put("scheme", scheme_amfi);
		 		
	 		 formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSchemeInceptionAndLatestNavDate, hashMap);
	 		System.out.println(formattedUrl + "formattedUrl");
	 		 result = HttpPost.SendHttpPost(formattedUrl);	 	
	 		 gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		 SchemeInceptionAndLatestNavDateAPIResponse mutualFundSchemeAPIResponse = gson.fromJson(result, SchemeInceptionAndLatestNavDateAPIResponse.class);
    		 List<Date> dateMap = mutualFundSchemeAPIResponse.getList();
    		
	 		writer.print(gson.toJson(dateMap));
		    writer.close();
		    return;
		} 
		catch (Exception ex) 
		{
		    writer.close();
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/top-performing-systematic-investment-plan")
	public String top_performing_sip_funds_new(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		 
    	try 
   		{	 		
    		String category =  request.getParameter("category");
	 		String period = request.getParameter("period");
	 		String amount = request.getParameter("amount");
	 		String category_name = category;
	 		
	 		if(category == null || StringHelper.isEmpty(category)){category= "Equity: Multi Cap";}
	 		if(category_name == null){category_name= "";}
	 		if(period == null || StringHelper.isEmpty(period) || !period.matches("[0-9]+")){period= "1";}
	 		if(amount == null || StringHelper.isEmpty(amount) || !amount.matches("[0-9]+")){amount= "3000";}
	 		
	 		category = category.trim();
	 		category_name = category_name.trim();
	 		period = period.trim();
	 		amount = amount.trim();
	 		String formattedUrl , result = "";
	 		
	 		Format format = com.ibm.icu.text.NumberFormat.getNumberInstance(new Locale("en", "in"));
	 		
	 		HashMap<String, String> hashMap = new HashMap<String, String>();
	 		hashMap.put("period", period);
	 		hashMap.put("category", category);
	 		hashMap.put("amount", amount);
	 		hashMap.put("maxno","1000");	 		
	 		
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSIPReturnsForCategoryPeriodAmount, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		MutualFundSIPReturnsAPIResponse mutualFundAPIResponse = gson.fromJson(result, MutualFundSIPReturnsAPIResponse.class);

	 		request.setAttribute("schemePerformances", mutualFundAPIResponse.getList());
	 		//request.setAttribute("schemePerformances", schemePerformances);
	 		request.setAttribute("category_returns", mutualFundAPIResponse.getCategory_returns());
	 		request.setAttribute("benchmark_returns", mutualFundAPIResponse.getBenchmark_returns());	 		
	 		
	 		request.setAttribute("category", category);
	 		request.setAttribute("category_name", category_name);
	 		request.setAttribute("period", period);
	 		request.setAttribute("amount", amount);
	 		
	 		
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllSchemeCategories, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		MutualFundAPIResponse mfapiResponse = new Gson().fromJson(result, MutualFundAPIResponse.class);	 		
	     	request.setAttribute("schemeCategories", mfapiResponse.getList());
	     	
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getHomePageSIPNavDate, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		ApiCommonResponse apiCommonResponse = new Gson().fromJson(result, ApiCommonResponse.class);	 		
	     	request.setAttribute("nav_date", apiCommonResponse.getNav_date());
	     	
	     	request.setAttribute("page", "top-performing-systematic-investment-plan");
	     	request.setAttribute("menu", "mf-research");
	     	request.setAttribute("jsp", "../amfi/top-performing-sip-funds.jsp");
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
    	return "layout/layout";
	}
	
	@RequestMapping(value="/top-performing-lumpsum-funds")
	public String top_performing_lumpsum_return_funds(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{		 
    	try 
   		{ 		
	 		String category =  request.getParameter("category");
	 		String period = request.getParameter("period");
	 		String amount = request.getParameter("amount");
	 		String category_name = category;
	 		
	 		if(category == null || StringHelper.isEmpty(category))
			{
				category="Equity: Multi Cap";
				request.setAttribute("category_set", "false");
			}
			else
			{
				request.setAttribute("category_set", "true");
			}
	 		
	 		if(category_name == null){category_name= "";}
	 		if(period == null){period= "5";}
	 		if(amount == null){amount= "10000";}
	 		
	 		category = category.trim();
	 		category_name = category_name.trim();
	 		period = period.trim();
	 		amount = amount.trim();
	 		String formattedUrl, result = "";
	 		
	 		HashMap<String, String> hashMap = new HashMap<String, String>();
	 		hashMap.put("period", period);
	 		hashMap.put("category", category);
	 		hashMap.put("amount", amount);
	 		
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getTopPerformingLumpsumFunds, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		TopPerformingLumpsumFundsResponse topPerformingLumpsumFundsResponse = gson.fromJson(result, TopPerformingLumpsumFundsResponse.class); 		
	 		request.setAttribute("schemePerformances", topPerformingLumpsumFundsResponse.getList());
	 		request.setAttribute("benchmark_returns", topPerformingLumpsumFundsResponse.getBenchmark_returns());
	 		
	     	request.setAttribute("category", category);
	 		request.setAttribute("category_name", category_name);
	 		request.setAttribute("period", period);
	 		request.setAttribute("amount", amount);
	 		
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllSchemeCategories, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		MutualFundAPIResponse mutualFundAPIResponse = new Gson().fromJson(result, MutualFundAPIResponse.class);	 		
	     	request.setAttribute("schemeCategories", mutualFundAPIResponse.getList());
	     	
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getHomePageSIPNavDate, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		ApiCommonResponse apiCommonResponse = new Gson().fromJson(result, ApiCommonResponse.class);	 		
	     	request.setAttribute("nav_date", apiCommonResponse.getNav_date());

	     	request.setAttribute("page", "top-performing-lumpsum-funds");
	     	request.setAttribute("menu", "mf-research");
	     	request.setAttribute("jsp", "../amfi/top-performing-lumpsum-funds.jsp");	     	
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
    	return "layout/layout";
	}
	

	@RequestMapping(value="/sip-with-annual-increase/{scheme:.+}")
	public String sip_enhancement_scheme(@PathVariable(value="scheme") String scheme,HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		try 
		{	
			
			String start_date = request.getParameter("start_date");
			String end_date = request.getParameter("end_date");
			String amount =  request.getParameter("amount");
			String frequency = request.getParameter("frequency");
			String enhancement_percentage = request.getParameter("enhancement_percentage");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Calendar cal1 = Calendar.getInstance();
            cal1.add(Calendar.DATE, -1);
            String end_date_str = sdf.format(cal1.getTime());
			cal1.add(Calendar.YEAR, -1);
			cal1.add(Calendar.MONTH, 1);
			String start_date_str = sdf.format(cal1.getTime());
	 		
			if(scheme == null || StringHelper.isEmpty(scheme)){scheme= "HDFC Equity Fund - Growth Option";}
	 		if(amount == null || StringHelper.isEmpty(amount) || !amount.matches("[0-9]+")){amount= "3000";}
	 		if(frequency == null || StringHelper.isEmpty(frequency)){frequency= "Monthly";}
	 		if(start_date == null || StringHelper.isEmpty(start_date) || !start_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){start_date= start_date_str;}
	 		if(end_date == null || StringHelper.isEmpty(end_date) || !end_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){end_date= end_date_str;}
	 		if(enhancement_percentage == null || StringHelper.isEmpty(enhancement_percentage) || !enhancement_percentage.matches("[0-9]+")){enhancement_percentage = "8";}
			
	 		scheme = scheme.trim();
	 		amount = amount.trim();
	 		frequency = frequency.trim();
	 		start_date = start_date.trim();
	 		end_date = end_date.trim();
	 		scheme = scheme.replaceAll("&amp;", "&");
 			enhancement_percentage = enhancement_percentage.trim();
			
			int enhancement_amount = (Integer.parseInt(amount)/100) * Integer.parseInt(enhancement_percentage);
			
			request.setAttribute("scheme", scheme);
			request.setAttribute("start_date", start_date);
			request.setAttribute("end_date", end_date);
			request.setAttribute("amount", amount);
			request.setAttribute("frequency", frequency);
			request.setAttribute("enhancementPercentage", enhancement_percentage);
			request.setAttribute("enhancementAmount", enhancement_amount);
			
            String formattedUrl, result = "";
	     	
	     	HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("scheme", scheme);
            hashMap.put("start_date", start_date);
            hashMap.put("end_date", end_date);
            hashMap.put("amount", amount);
            hashMap.put("frequency", frequency);
            hashMap.put("enhancement_percentage", enhancement_percentage);
	     	
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSIPReturnWithAnnualIncrease, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		SIPReturnsCalculatorAPIAnnualIncreaseResponse list = gson.fromJson(result, SIPReturnsCalculatorAPIAnnualIncreaseResponse.class);
			if(list != null)
			{
				request.setAttribute("sipYearlyEnhancementResponse", list.getSipYearlyEnhancementResponse());
				request.setAttribute("scheme_name", list.getSipYearlyEnhancementResponse().get(0).getScheme_name());
				request.setAttribute("sipNavResponseList", list.getSipNavResponseList());
			}
			
	     	request.setAttribute("menu", "Tools");
	     	request.setAttribute("submenu", "SIP with Annual Increase");
	     	
	     	request.setAttribute("headermenu", "mutual-funds");
	     	request.setAttribute("page", "sip-with-annual-increase");
	     	request.setAttribute("jsp", "../amfi/sip-yearly-enhancement.jsp");
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
	@RequestMapping(value="/sip-with-annual-increase")
	public String sip_with_annual_increase(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		try 
		{	
			String scheme = request.getParameter("scheme");
			if(scheme == null || scheme.isEmpty()) {
		     	HashMap<String, String> hashMap = new HashMap<String, String>();
	       	    hashMap.put("scheme_code", "102594");  
		 		String formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSchemeShortNameBySchemeCode, hashMap);
		 		String result = HttpPost.SendHttpPost(formattedUrl);
		 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
		 		SchemeShortNameByCodeResponse obj = gson.fromJson(result, SchemeShortNameByCodeResponse.class);
		 		scheme = obj.getScheme_name();
	        }
			//String scheme = "Aditya Birla Sun Life Frontline Equity Fund-Growth";
			String start_date = "01-01-2010";
			String end_date = sdf.format(new Date());
			String amount =  "5000";
			String frequency = "Monthly";
			String enhancementPercentage = "10";
			String enhancementAmount = "500";
			
			request.setAttribute("scheme", scheme);
			request.setAttribute("start_date", start_date);
			request.setAttribute("end_date", end_date);
			request.setAttribute("amount", amount);
			request.setAttribute("frequency", frequency);
			request.setAttribute("enhancementPercentage", enhancementPercentage);
			request.setAttribute("enhancementAmount", enhancementAmount);
			
            String formattedUrl, result = "";
	     	
	     	HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("scheme", scheme);
            hashMap.put("start_date", start_date);
            hashMap.put("end_date", end_date);
            hashMap.put("amount", amount);
            hashMap.put("frequency", frequency);
            hashMap.put("enhancement_percentage", enhancementPercentage);
	     	
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSIPReturnWithAnnualIncrease, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		SIPReturnsCalculatorAPIAnnualIncreaseResponse list = gson.fromJson(result, SIPReturnsCalculatorAPIAnnualIncreaseResponse.class);
			if(list != null)
			{
				request.setAttribute("sipYearlyEnhancementResponse", list.getSipYearlyEnhancementResponse());
				request.setAttribute("scheme_name", list.getSipYearlyEnhancementResponse().get(0).getScheme_name());
				request.setAttribute("sipNavResponseList", list.getSipNavResponseList());
			}
	     	
	     	request.setAttribute("menu", "Tools");
	     	request.setAttribute("submenu", "SIP with Annual Increase");
	     	
	     	request.setAttribute("headermenu", "mutual-funds");
	     	request.setAttribute("page", "sip-with-annual-increase");
	     	request.setAttribute("jsp", "../amfi/sip-yearly-enhancement.jsp");
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
	
	
	
	
		
	@RequestMapping(value="/getLumpSumReturnsGraphData")
	public void getLumpSumReturnsGraphData(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
    	PrintWriter writer = response.getWriter();
		response.setContentType("application/json");
		
		try 
		{	
    		String scheme = request.getParameter("scheme");
    	    String amount = request.getParameter("amount");
    		String start_date = request.getParameter("startdate");
            String end_date = request.getParameter("enddate");
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Calendar cal1 = Calendar.getInstance();
            cal1.add(Calendar.DATE, -1);
            String end_date_str = sdf.format(cal1.getTime());
			cal1.add(Calendar.YEAR, -1);
			cal1.add(Calendar.MONTH, 1);
			String start_date_str = sdf.format(cal1.getTime());
            
            if(scheme == null || StringHelper.isEmpty(scheme)){scheme = "Axis Multicap Fund - Regular Plan - Growth";}
            if(amount == null || StringHelper.isEmpty(amount)){amount = "100000";}
            if(start_date == null || StringHelper.isEmpty(start_date) || !start_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){start_date = start_date_str;}
	 		if(end_date == null || StringHelper.isEmpty(end_date) || !end_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){end_date = end_date_str;}
            
            scheme = scheme.trim();
            amount = amount.trim();
            start_date = start_date.trim();
            end_date = end_date.trim();
    		
            scheme = URLDecoder.decode(scheme, "UTF-8");
            
            String formattedUrl, result = "";
            
	     	HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("scheme", scheme);
            hashMap.put("amount", amount);
            hashMap.put("start_date", start_date);
            hashMap.put("enddate", end_date);
	     	
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getLumpSumReturnsGraphData, hashMap);
	     	//System.out.println(formattedUrl);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		LumpsumReturnsAPIResponse list = gson.fromJson(result, LumpsumReturnsAPIResponse.class);
    		
    		String lumpSumReturnsGraphData = list.getLumpSumReturnsGraphData();
    		//System.out.println(lumpSumReturnsGraphData);
    		writer.print(lumpSumReturnsGraphData);
		    writer.close();
		    return;
		} 
		catch (Exception ex) 
		{
		    writer.close();
			ex.printStackTrace();
		}
	}	
	
	
	@RequestMapping(value="/mutual-fund-annual-returns")
	public String mutual_fund_annual_returns(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{	
		String category_name = "";
    	try 
   		{
	 		String category =  request.getParameter("category");
	 		String mode = request.getParameter("mode");
	 		
	 		if(category == null){category= "Equity: Multi Cap";}
	 		if(mode == null){mode= "Growth";}
	 		
	 		category = category.trim();
	 		mode = mode.trim();
	 		
	 		category_name = category;

	 		request.setAttribute("category_url", category);
	 		request.setAttribute("category_name", category_name);	
	 		request.setAttribute("category", category);	 		
	 		request.setAttribute("mode", mode);
	 		
            String formattedUrl, result = "";
            
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllSchemeCategories, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		MutualFundAPIResponse mutualFundAPIResponse = new Gson().fromJson(result, MutualFundAPIResponse.class);
	     	request.setAttribute("schemeCategories", mutualFundAPIResponse.getList());
	     	
			HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("category", category);
            hashMap.put("mode", mode);
	     	
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAnnualReturnOfFunds, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		AnnualReturnOFFundsResponse list = gson.fromJson(result, AnnualReturnOFFundsResponse.class);
	 		
	 		request.setAttribute("schemePerformances", list.getSchemePerformancesList());
	 		request.setAttribute("benchmark_returns", list.getBenchmark_returns());
            request.setAttribute("category_returns", list.getCategory_returns());
            
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getLatestNavDate, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		ApiCommonResponse apiCommonResponse = new Gson().fromJson(result, ApiCommonResponse.class);
	     	request.setAttribute("nav_date", apiCommonResponse.getNav_date());
	     	
	     	request.setAttribute("menu", "Performance");
	     	request.setAttribute("submenu", "Mutual Fund Annual Returns");
	     	
	     	request.setAttribute("headermenu", "mutual-funds");
	     	request.setAttribute("page", "mutual-fund-annual-returns");
	     	request.setAttribute("mf_title", "Mutual Fund Annual Returns");
	     	request.setAttribute("research", "mutual-funds-research");
	     	request.setAttribute("jsp", "../amfi/annual-returns.jsp");
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
    	return "layout/layout";
	}
	
	@RequestMapping(value="/mutual-fund-annual-returns/{category}")
	public String mutual_fund_annual_returns_category(@PathVariable(value="category") String category,
			HttpServletRequest request, HttpServletResponse response) throws IOException 
	{		
		String category_name = "";
    	try 
   		{
	 		String mode = request.getParameter("mode");

	 		if(category == null){category= "Equity: Multi Cap";}
	 		if(mode == null){mode= "Growth";}

	 		category = category.trim();
	 		mode = mode.trim();
	 		
	 		String category_url = category;
	 		request.setAttribute("category_url", category);
	 		
	 		category_name = category;
	 		request.setAttribute("category_name", category_name);
	 		
	 		request.setAttribute("category", category);
	 		request.setAttribute("mode", mode);
	 		
            String formattedUrl, result = "";
            
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllSchemeCategories, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		MutualFundAPIResponse mutualFundAPIResponse = new Gson().fromJson(result, MutualFundAPIResponse.class);
	     	request.setAttribute("schemeCategories", mutualFundAPIResponse.getList());
	     	
			HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("category", category_name );
            hashMap.put("mode", mode);
	     	
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAnnualReturnOfFunds, hashMap);
            //System.out.println(formattedUrl);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		AnnualReturnOFFundsResponse list = gson.fromJson(result, AnnualReturnOFFundsResponse.class);
	 		
	 		request.setAttribute("schemePerformances", list.getSchemePerformancesList());
	 		request.setAttribute("benchmark_returns", list.getBenchmark_returns());
            request.setAttribute("category_returns", list.getCategory_returns());
            
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getLatestNavDate, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		ApiCommonResponse apiCommonResponse = new Gson().fromJson(result, ApiCommonResponse.class);
	     	request.setAttribute("nav_date", apiCommonResponse.getNav_date());
	     	
	     	request.setAttribute("menu", "Performance");
	     	request.setAttribute("submenu", "Mutual Fund Annual Returns");
	     	
	     	request.setAttribute("headermenu", "mutual-funds");
	     	request.setAttribute("page", "mutual-fund-annual-returns");
	     	request.setAttribute("mf_title", "Mutual Fund Annual Returns");
	     	request.setAttribute("research", "mutual-funds-research");
	     	request.setAttribute("jsp", "../amfi/annual-returns.jsp");
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
    	return "layout/layout";
	}

	

	@RequestMapping(value="/top-consistent-mutual-fund-performers")
	public String top_consistent_mutual_fund_performers(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		try 
		{
			String category = request.getParameter("category");
			String start_date = request.getParameter("start_date");
			String period = request.getParameter("period");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Calendar cal1 = Calendar.getInstance();
            cal1.add(Calendar.DATE, -1);
			cal1.add(Calendar.YEAR, -5);
			//cal1.add(Calendar.MONTH, 1);
			String start_date_str = sdf.format(cal1.getTime());
			
			if(category == null || StringHelper.isEmpty(category))
			{
				category="Equity: Multi Cap";
				request.setAttribute("category_set", "false");
			}
			else
			{
				request.setAttribute("category_set", "true");
			}
			
			if(start_date == null || StringHelper.isEmpty(start_date) || !start_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){start_date=start_date_str;}
			if(period == null || StringHelper.isEmpty(period)){period="3 Year";}
						
			category = category.trim();
			start_date = start_date.trim();
			period = period.trim();
			
			request.setAttribute("category", category);
			request.setAttribute("start_date", start_date);
			request.setAttribute("period", period);
			
			//System.out.println("category--->"+category);
			//System.out.println("start_date--->"+start_date);
			//System.out.println("period--->"+period);
	     	
            String formattedUrl, result = "";
	     	
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllSchemeCategories, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		MutualFundAPIResponse mutualFundAPIResponse = new Gson().fromJson(result, MutualFundAPIResponse.class);
	     	request.setAttribute("schemeCategories", mutualFundAPIResponse.getList());
	     	
			HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("category", category);
            hashMap.put("start_date", start_date);
	 		hashMap.put("period", period);
	     	
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getTopConsistentMutualFundPerformers, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		//System.out.println("result-->"+result);
	 		TopConsistentMutualFundPerformersApiResponse list = new Gson().fromJson(result, TopConsistentMutualFundPerformersApiResponse.class);
	     	
	 		/*for (BestRollingReturnsSummaryFinalResponse bestRollingReturnsSummaryFinalResponse : list.getList2()) {
	 			bestRollingReturnsSummaryFinalResponse.setScheme_amfi_url(Utils.getSchemeAmfiUrl(bestRollingReturnsSummaryFinalResponse.getScheme_name()));
			}*/
	 		
	 		////System.out.println("list.getList1()-->"+list.getList1().size());
	 		////System.out.println("list.getList2()-->"+list.getList2().size());
	 		
	 		request.setAttribute("rollingReturnsSummaryList", list.getList1());
			
			request.setAttribute("page", "Top Consistent Mutual Fund Performers");
	     	request.setAttribute("menu", "mf-research");
	     	request.setAttribute("jsp", "../amfi/top-consistent-funds.jsp");
	     	
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
	
	@RequestMapping(value="/getSipEnhancementGraph")
	public void getSipEnhancementGraph(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("application/json");
		try 
		{	
			String scheme_with_parameter = request.getParameter("scheme");
			String start_date = request.getParameter("start_date");
			String end_date = request.getParameter("end_date");
			String amount =  request.getParameter("amount");
			String frequency = request.getParameter("frequency");
			String enhancement_percentage = request.getParameter("enhancement_percentage");

			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Calendar cal1 = Calendar.getInstance();
            cal1.add(Calendar.DATE, -1);
            String end_date_str = sdf.format(cal1.getTime());
			cal1.add(Calendar.YEAR, -1);
			cal1.add(Calendar.MONTH, 1);
			String start_date_str = sdf.format(cal1.getTime());
			
			if(scheme_with_parameter == null || scheme_with_parameter.isBlank()){scheme_with_parameter= "HDFC Equity Fund - Growth Option||false";}
	 		if(amount == null || amount.isBlank() || !amount.matches("[0-9]+")){amount= "3000";}
	 		if(frequency == null || frequency.isBlank()){frequency= "Monthly";}
	 		if(start_date == null || start_date.isBlank() || !start_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){start_date= start_date_str;}
	 		if(end_date == null || end_date.isBlank() || !end_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){end_date= end_date_str;}
	 		if(enhancement_percentage == null || enhancement_percentage.isBlank() || !enhancement_percentage.matches("[0-9]+")){enhancement_percentage= "10";}
			
	 		scheme_with_parameter = scheme_with_parameter.trim();
	 		amount = amount.trim();
	 		frequency = frequency.trim();
	 		start_date = start_date.trim();
	 		end_date = end_date.trim();
	 		enhancement_percentage = enhancement_percentage.trim();
	 		
            String formattedUrl, result = "";
	     	
	     	HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("scheme", scheme_with_parameter);
            hashMap.put("start_date", start_date);
            hashMap.put("end_date", end_date);
            hashMap.put("amount", amount);
            hashMap.put("frequency", frequency);
            hashMap.put("enhancement_percentage", enhancement_percentage);
	     	
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSipEnhancementGraph, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		SIPReturnsCalculatorAPIResponse list = gson.fromJson(result, SIPReturnsCalculatorAPIResponse.class);
	     	String sipReturnsGraphData = list.getSipReturnsGraphData();
	     	
	     	writer.print(sipReturnsGraphData);
		    writer.close();
		    return;
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/mutual-fund-lumpsum-returns-calculator")
	public String lumpsum_returns_calculator(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try 
		{
			String scheme = request.getParameter("scheme");
			String amount = request.getParameter("amount");
			String start_date = request.getParameter("startdate");
			String end_date = request.getParameter("enddate");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			Calendar cal1 = Calendar.getInstance();
			cal1.add(Calendar.DATE, -1);
			String end_date_str = sdf.format(cal1.getTime());
			cal1.add(Calendar.YEAR, -10);
			String start_date_str = sdf.format(cal1.getTime());
			
			if(scheme == null || StringHelper.isEmpty(scheme)){scheme = "ICICI Prudential Bluechip Fund - Growth";}
			if(amount == null || StringHelper.isEmpty(amount)){amount = "100000";}
			if(start_date == null || StringHelper.isEmpty(start_date) || !start_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){start_date = start_date_str;}
			if(end_date == null || StringHelper.isEmpty(end_date) || !end_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){end_date = end_date_str;}
			
			scheme = scheme.trim();
			amount = amount.trim();
			start_date = start_date.trim();
			end_date = end_date.trim();
			
			start_date = start_date.replaceAll("/","-");
			end_date = end_date.replaceAll("/","-");
			
			request.setAttribute("scheme", scheme);
			request.setAttribute("amount", amount);
			request.setAttribute("start_date", start_date);
			request.setAttribute("end_date", end_date);
			
			scheme = scheme.replaceAll("'", "");
			
			String formattedUrl, result = "";
			
			HashMap<String, String> hashMap = new HashMap<String, String>();
			hashMap.put("scheme", scheme);
			hashMap.put("amount", amount);
			hashMap.put("start_date", start_date);
			hashMap.put("end_date", end_date);
			
			formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getLumpSumReturns, hashMap);
			System.out.println("formattedUrl --->"+formattedUrl );
			result = HttpPost.SendHttpPost(formattedUrl);
			Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
			LumpsumReturnsAPIResponse list = gson.fromJson(result, LumpsumReturnsAPIResponse.class);
			request.setAttribute("schemePerformance_list", list.getSchemePerformance_list());
			request.setAttribute("scheme_benchmark_code", list.getScheme_benchmark_code());
			request.setAttribute("scheme_benchmark_name", list.getScheme_benchmark_name());
			
			request.setAttribute("page", "mutual-funds-research");
	     	request.setAttribute("menu", "Lumpsum Return");
	     	request.setAttribute("jsp", "../amfi/lumpsum-calculator.jsp");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
	@RequestMapping(value="/mutual-fund-stp-investment-calculator")
	public String stp_calculator(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
    	try 
   		{
    		String amc = request.getParameter("amc");
            String from_scheme = request.getParameter("from_scheme");
            String to_scheme = request.getParameter("to_scheme");
            String initial_amount = request.getParameter("intial_amount");
            String stp_date = request.getParameter("stp_date");
            String transfer_amount = request.getParameter("transfer_amount");
            String period = request.getParameter("period");
            String from_date = request.getParameter("from_date");
            String to_date = request.getParameter("to_date");
            String init_start_date = request.getParameter("init_start_date");
            String lumpsum_option = request.getParameter("lumpsum_option");
            String lumpsum_year = request.getParameter("lumpsum_year");
            String amc_name = amc;
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Calendar cal1 = Calendar.getInstance();
            cal1.add(Calendar.DATE, -1);
            String end_date_str = sdf.format(cal1.getTime());
            
			if(amc == null || amc.isBlank()){amc = "ICICI Prudential Mutual Fund";}
			if(amc_name == null){amc_name = "";}
            if(from_scheme == null || from_scheme.isBlank()){from_scheme = "ICICI Prudential Liquid Fund - Growth";}
            if(to_scheme == null || to_scheme.isBlank()){to_scheme = "ICICI Prudential Equity & Debt Fund - Growth";}
            if(initial_amount == null || initial_amount.isBlank()){initial_amount = "200000";}
            if(stp_date == null || stp_date.isBlank() || !stp_date.matches("[0-9]+")){stp_date = "5";}
            if(transfer_amount == null || transfer_amount.isBlank()){transfer_amount = "10000";}
            if(period == null || period.isBlank()){period = "Monthly";}
            if(from_date == null || from_date.isBlank() || !from_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){from_date = "05-07-2015";}
	 		if(to_date == null || to_date.isBlank() || !to_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){to_date = end_date_str;}
            if(init_start_date == null || init_start_date.isBlank()){init_start_date = "01-07-2015";}
            if(lumpsum_option == null || lumpsum_option.isBlank()){lumpsum_option = "LAEP";}
            if(lumpsum_year == null || lumpsum_year.isBlank()){lumpsum_year = "1";}
            
            amc = amc.trim();
            amc_name = amc_name.trim();
            from_scheme = from_scheme.trim();
            to_scheme = to_scheme.trim();
            initial_amount = initial_amount.trim();
            stp_date = stp_date.trim();
            transfer_amount = transfer_amount.trim();
            period = period.trim();
            from_date = from_date.trim();
            to_date = to_date.trim();
            init_start_date = init_start_date.trim();
            lumpsum_option = lumpsum_option.trim();
            lumpsum_year = lumpsum_year.trim();
            
            request.setAttribute("amc", amc);
            request.setAttribute("amc_name", amc_name);
            request.setAttribute("from_scheme", from_scheme);
            request.setAttribute("to_scheme", to_scheme);
            request.setAttribute("initial_amount", initial_amount);
            request.setAttribute("stp_date", stp_date);
            request.setAttribute("transfer_amount", transfer_amount);
            request.setAttribute("period", period);
            request.setAttribute("from_date", from_date);
            request.setAttribute("to_date", to_date);
            request.setAttribute("init_start_date", init_start_date);
            request.setAttribute("lumpsum_option", lumpsum_option);
            request.setAttribute("lumpsum_year", lumpsum_year);
            
            String formattedUrl, result = "";
            
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllCompanies, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		MutualFundAPIResponse mutualFundAPIResponse = new Gson().fromJson(result, MutualFundAPIResponse.class);
	     	request.setAttribute("amcCompanies", mutualFundAPIResponse.getList());
	     	
	     	HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("amc", amc);
	     	
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSchemeByAmcApi, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		SchemeByAmcAPIResponse schemes_list = new Gson().fromJson(result, SchemeByAmcAPIResponse.class);
	     	request.setAttribute("schemes", schemes_list.getSchemes_list());
	     	
	     	hashMap = new HashMap<String, String>();
            hashMap.put("amc", amc);
	 		hashMap.put("from_scheme", from_scheme);
	 		hashMap.put("to_scheme", to_scheme);
	 		hashMap.put("initial_amount", initial_amount);
	 		hashMap.put("stp_date", stp_date);
	 		hashMap.put("transfer_amount", transfer_amount);
	 		hashMap.put("period", period);
	 		hashMap.put("from_date", from_date);
	 		hashMap.put("to_date", to_date);
	 		hashMap.put("init_start_date", init_start_date);
	 		hashMap.put("lumpsum_option", lumpsum_option);
	 		hashMap.put("lumpsum_year", lumpsum_year);
	 		
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSTPReturnCalculator, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		STPReturnsCalculatorAPIResponse list = gson.fromJson(result, STPReturnsCalculatorAPIResponse.class);
	     	
	     	request.setAttribute("installments", list.getTo_scheme_installment());
	     	request.setAttribute("trans_amount", list.getTo_scheme_total_amount_invested());
	     	request.setAttribute("total_lumpsum_amount", list.getTotal_invested_amount());
	     	request.setAttribute("from_remain_units", list.getFrom_scheme_remaining_units());
	     	request.setAttribute("to_remain_units", list.getTo_scheme_accumulated_units());
	     	request.setAttribute("from_current_value", list.getFrom_scheme_current_value());
	     	request.setAttribute("from_current_value_date", list.getFrom_scheme_current_value_date());
	     	request.setAttribute("from_final_current_value", list.getFrom_scheme_end_value());
	     	request.setAttribute("from_final_nav_date", list.getFrom_scheme_end_value_date());
	     	request.setAttribute("to_current_value", list.getTo_scheme_current_value());
	     	request.setAttribute("to_current_value_date", list.getTo_scheme_current_value_date());
	     	request.setAttribute("to_final_current_value", list.getTo_scheme_end_value());
	     	request.setAttribute("to_final_nav_date", list.getTo_scheme_end_value_date());
	     	request.setAttribute("from_profit", list.getFrom_scheme_profit());
	     	request.setAttribute("to_profit", list.getTo_scheme_profit());
	     	request.setAttribute("from_returns", list.getFrom_scheme_returns());
	     	request.setAttribute("to_returns", list.getTo_scheme_returns());
	     	request.setAttribute("total_returns", list.getTotal_returns());
	     	request.setAttribute("total_current_value", list.getTotal_current_value());
	     	request.setAttribute("total_profit", list.getTotal_profit());
	     	request.setAttribute("from_scheme_list", list.getFrom_scheme_list());
	     	request.setAttribute("to_scheme_list", list.getTo_scheme_list());
	     	
	     	request.setAttribute("schemeMapping_from", list.getFrom_scheme_schemeMapping());
	     	request.setAttribute("schemeMapping_to", list.getTo_scheme_schemeMapping());
	     	
	     	request.setAttribute("page", "mutual-funds-research");
	     	request.setAttribute("menu", "STP And SWP Return");
	     	request.setAttribute("submenu", "Mutual Fund Investment STP Calculator");
	     	
	     	request.setAttribute("jsp", "../amfi/stp-calculator.jsp");
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
    	return "layout/layout";
	}
	
	@RequestMapping(value="/stp-calculator-profit-transfer")
	public String stp_calculator_profit_transfer(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		String amc = "";
        String from_scheme= "";
        String to_scheme= "";
        String initial_amount= "";
        String period= "";
        String from_date= "";
        String to_date= "";
        String init_start_date= "";
        String amc_name= "";
        String lumpsum_option= "";
        String lumpsum_year = "";
        
    	try 
   		{
	     	amc = request.getParameter("amc");
            from_scheme = request.getParameter("from_scheme");
            to_scheme = request.getParameter("to_scheme");
            initial_amount = request.getParameter("intial_amount");
            period = request.getParameter("period");
            from_date = request.getParameter("from_date");
            to_date = request.getParameter("to_date");
            init_start_date = request.getParameter("init_start_date");
            lumpsum_option = request.getParameter("lumpsum_option");
            lumpsum_year = request.getParameter("lumpsum_year");
            amc_name = amc;
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Calendar cal1 = Calendar.getInstance();
            cal1.add(Calendar.DATE, -1);
            String end_date_str = sdf.format(cal1.getTime());
			cal1.add(Calendar.YEAR, -4);
			String init_date_str = sdf.format(cal1.getTime());
			cal1.add(Calendar.YEAR, 1);
			String start_date_str = sdf.format(cal1.getTime());
            
			if(amc == null || amc.isBlank()){amc = "Mirae Asset Mutual Fund";}
			if(amc_name == null){amc_name = "";}
            if(from_scheme == null || from_scheme.isBlank()){from_scheme = "Mirae Asset Liquid Fund - Regular Plan - Growth";}
            if(to_scheme == null || to_scheme.isBlank()){to_scheme = "Mirae Asset Large Cap Fund - Growth Plan";}
            if(initial_amount == null || initial_amount.isBlank()){initial_amount = "1000000";}
            if(period == null || period.isBlank()){period = "Monthly";}
            if(from_date == null || from_date.isBlank()){from_date = start_date_str;}
            if(to_date == null || to_date.isBlank()){to_date = end_date_str;}
            if(init_start_date == null || init_start_date.isBlank()){init_start_date = init_date_str;}
            if(lumpsum_option == null || lumpsum_option.isBlank()){lumpsum_option = "LAEP";}
            if(lumpsum_year == null || lumpsum_year.isBlank()){lumpsum_year = "1";}  
            
            amc = amc.trim();
            amc_name = amc_name.trim();
            from_scheme = from_scheme.trim();
            to_scheme = to_scheme.trim();
            initial_amount = initial_amount.trim();
            period = period.trim();
            from_date = from_date.trim();
            to_date = to_date.trim();
            init_start_date = init_start_date.trim();
            lumpsum_option = lumpsum_option.trim();
            lumpsum_year = lumpsum_year.trim();
            
            request.setAttribute("amc", amc);
            request.setAttribute("amc_name", amc_name);
            request.setAttribute("from_scheme", from_scheme);
            request.setAttribute("to_scheme", to_scheme);
            request.setAttribute("initial_amount", initial_amount);
            request.setAttribute("period", period);
            request.setAttribute("from_date", from_date);
            request.setAttribute("to_date", to_date);
            request.setAttribute("init_start_date", init_start_date);
            request.setAttribute("lumpsum_option", lumpsum_option);
            request.setAttribute("lumpsum_year", lumpsum_year);     
            
            String formattedUrl, result = "";
            
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllCompanies, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		MutualFundAPIResponse mutualFundAPIResponse = gson.fromJson(result, MutualFundAPIResponse.class);
	     	request.setAttribute("amcCompanies", mutualFundAPIResponse.getList());
	     	
	     	HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("amc", amc);
	     	
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSchemeByAmcApi, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		SchemeByAmcAPIResponse schemes_list = new Gson().fromJson(result, SchemeByAmcAPIResponse.class);
	     	request.setAttribute("schemes", schemes_list.getSchemes_list());
	     	
	     	hashMap = new HashMap<String, String>();
            hashMap.put("amc", amc);
            hashMap.put("from_scheme", from_scheme);
            hashMap.put("to_scheme", to_scheme);
            hashMap.put("initial_amount", initial_amount);
            hashMap.put("period", period);
            hashMap.put("from_date", from_date);
            hashMap.put("to_date", to_date);
            hashMap.put("init_start_date", init_start_date);
            hashMap.put("lumpsum_option", lumpsum_option);
	 		hashMap.put("lumpsum_year", lumpsum_year);
	     	
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSTPCalculatorProfitTransfer, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		//StpProfitTransferApiResponse list = gson.fromJson(result, StpProfitTransferApiResponse.class);
	 		STPReturnsCalculatorAPIResponse list = gson.fromJson(result, STPReturnsCalculatorAPIResponse.class);
	 		
	     	/*request.setAttribute("installments", list.getInstallments());
	     	request.setAttribute("trans_amount", list.getTransfer_amount());
	     	request.setAttribute("total_lumpsum_amount", list.getTotal_lumpsum_amount());
	     	request.setAttribute("from_remain_units", list.getFrom_remain_units());
	     	request.setAttribute("to_remain_units", list.getTo_remain_units());
	     	request.setAttribute("from_current_value", list.getFrom_current_value());
	     	request.setAttribute("to_current_value", list.getTo_current_value());
	     	request.setAttribute("from_profit", list.getFrom_profit());
	     	request.setAttribute("to_profit", list.getTo_profit());
	     	request.setAttribute("from_returns", list.getFrom_returns());
	     	request.setAttribute("to_returns", list.getTo_returns());
	     	request.setAttribute("total_returns", list.getTotal_returns());
	     	request.setAttribute("total_current_value", list.getTotal_current_value());
	     	request.setAttribute("total_profit", list.getTotal_profit());
	     	request.setAttribute("from_scheme_list", list.getFrom_scheme_list());
	     	request.setAttribute("to_scheme_list", list.getTo_scheme_list());
	     	request.setAttribute("from_current_value_date", list.getFrom_current_value_date());
	     	request.setAttribute("to_current_value_date", list.getTo_current_value_date());
	     	request.setAttribute("from_final_current_value", list.getFrom_final_current_value());
	     	request.setAttribute("to_final_current_value", list.getTo_final_current_value());
	     	request.setAttribute("from_final_nav_date", list.getFrom_final_nav_date());
	     	request.setAttribute("to_final_nav_date", list.getTo_final_nav_date());*/
	 		
	 		request.setAttribute("installments", list.getTo_scheme_installment());
	     	request.setAttribute("trans_amount", list.getTo_scheme_total_amount_invested());
	     	request.setAttribute("total_lumpsum_amount", list.getTotal_invested_amount());
	     	request.setAttribute("from_remain_units", list.getFrom_scheme_remaining_units());
	     	request.setAttribute("to_remain_units", list.getTo_scheme_accumulated_units());
	     	request.setAttribute("from_current_value", list.getFrom_scheme_current_value());
	     	request.setAttribute("from_current_value_date", list.getFrom_scheme_current_value_date());
	     	request.setAttribute("from_final_current_value", list.getFrom_scheme_end_value());
	     	request.setAttribute("from_final_nav_date", list.getFrom_scheme_end_value_date());
	     	request.setAttribute("to_current_value", list.getTo_scheme_current_value());
	     	request.setAttribute("to_current_value_date", list.getTo_scheme_current_value_date());
	     	request.setAttribute("to_final_current_value", list.getTo_scheme_end_value());
	     	request.setAttribute("to_final_nav_date", list.getTo_scheme_end_value_date());
	     	request.setAttribute("from_profit", list.getFrom_scheme_profit());
	     	request.setAttribute("to_profit", list.getTo_scheme_profit());
	     	request.setAttribute("from_returns", list.getFrom_scheme_returns());
	     	request.setAttribute("to_returns", list.getTo_scheme_returns());
	     	request.setAttribute("total_returns", list.getTotal_returns());
	     	request.setAttribute("total_current_value", list.getTotal_current_value());
	     	request.setAttribute("total_profit", list.getTotal_profit());
	     	request.setAttribute("from_scheme_list", list.getFrom_scheme_list());
	     	request.setAttribute("to_scheme_list", list.getTo_scheme_list());
	     	
	 		request.setAttribute("schemeMapping_from", list.getFrom_scheme_schemeMapping());
	 		request.setAttribute("schemeMapping_to", list.getTo_scheme_schemeMapping());
	     	
	     	request.setAttribute("page", "mutual-funds-research");
	     	request.setAttribute("menu", "STP And SWP Return");
	     	request.setAttribute("submenu", "STP Calculator Profit Transfer");
	     	
	     	request.setAttribute("jsp", "../amfi/stp-calculator-profit-transfer.jsp");
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
    	return "layout/layout";
	}
	
	
	@RequestMapping(value="/mutual-fund-comparison-with-asset-classes")
	public String mutual_fund_comparison_with_asset_classes(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		Integer currentYear = Year.now().getValue();
		try 
		{
			String scheme = request.getParameter("scheme");
			String amount = request.getParameter("amount");
			String year = request.getParameter("year");
    		
			if(scheme == null || StringHelper.isEmpty(scheme)){scheme = "Franklin India Bluechip Fund-Growth";}
			if(amount == null || StringHelper.isEmpty(amount) || !amount.matches("[0-9]+")){amount = "100000";}
			if(year == null || StringHelper.isEmpty(year) || !year.matches("[0-9]+")){year = "1996";}
            
            scheme = scheme.trim();
            amount = amount.trim();
            year = year.trim();
            
            request.setAttribute("scheme", scheme);
            request.setAttribute("year", year);
            request.setAttribute("amount", amount);
            request.setAttribute("currentYear", currentYear);
            
            String formattedUrl, result = "";
			
			HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("scheme", scheme);
            hashMap.put("year", year);
            hashMap.put("amount", amount);
	     	
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getMutualFundComparisonWithAssetClasses, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		MutualFundComparisonWithAssetClassesResponse list = new Gson().fromJson(result, MutualFundComparisonWithAssetClassesResponse.class);
	     	request.setAttribute("returns_list", list.getList());
	     	
	     	//System.out.println("list size = " + list.getList().size());
			
			request.setAttribute("page", "mutual-funds-research");
	     	request.setAttribute("menu", "Lumpsum Return");
	     	request.setAttribute("jsp", "../amfi/mutual-fund-comparison-with-asset-classes.jsp");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
	
	
	@RequestMapping(value="/latest-NAV-mutual-funds")
	public String latestNavMutualFunds(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		try 
		{		     
	     	String formattedUrl, result = "";
 			String amc = request.getParameter("amc");
 			
 			String category = request.getParameter("category");
 		
			String nature = request.getParameter("nature");
			String type = request.getParameter("type");
	     	
			if(amc == null  || StringHelper.isEmpty(amc)){amc="All";}
			if(category == null  || StringHelper.isEmpty(category)){category="All";}
			if(nature == null  || StringHelper.isEmpty(nature)){nature="Open";}
			if(type == null  || StringHelper.isEmpty(type)){type="Regular";}
			
	     	category = category.trim();
	     	amc = amc.trim();
	     	nature = nature.trim();
	     	type = type.trim();

			MutualFundAPIResponse mfapiResponse = null;
			
 			formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllCompanies, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		mfapiResponse  = new Gson().fromJson(result, MutualFundAPIResponse.class);	 		
	 		request.setAttribute("amcList", mfapiResponse.getList());
    		
	 		HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("amc", "All");
	     	
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllSchemeCategoriesByAmc, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		mfapiResponse = new Gson().fromJson(result, MutualFundAPIResponse.class);
	     	request.setAttribute("schemeCategories", mfapiResponse.getList());
	     	request.setAttribute("nature", nature);
	     	request.setAttribute("type", type);
	 		
	     	hashMap = new HashMap<String, String>();
            hashMap.put("amc", amc);
            hashMap.put("category", category);
            
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getLatestNav, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		LatestNavResponse latestnav = new Gson().fromJson(result, LatestNavResponse.class);
            
	     	/*List<LatestNav> latestnav = mutualFundCommonDAO.getLatestNav(amc, category, nature, type);
	     	for (LatestNav ln : latestnav) {
				ln.setScheme_company_short_name(Utils.getSchemeAmcShortName(ln.getMf_company()));
			}*/
	 		request.setAttribute("latestNavResult", latestnav.getLatestNavList());

    		
    		request.setAttribute("amcname", amc);
    		request.setAttribute("category", category);
    		
			
			request.setAttribute("menu", "Performance");
	     	request.setAttribute("submenu", "Latest NAV");
	     	
	     	request.setAttribute("headermenu", "mutual-funds");
	     	request.setAttribute("page", "latest-NAV");
	     	request.setAttribute("jsp", "../amfi/latest-NAV.jsp");
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
	@RequestMapping(value="/latest-NAV-mutual-funds/{amc}")
	public String latestNavAmc(@PathVariable(value="amc") String amc, HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		try 
		{	
			String formattedUrl, result = "";
 			
			MutualFundAPIResponse mfapiResponse = null;
			
			String category = request.getParameter("category");
	     	if(amc == null  || StringHelper.isEmpty(amc)){amc="All";}
			if(category == null  || StringHelper.isEmpty(category)){category="All";}
	     	category = category.trim();
	     	amc = amc.trim();
	     	
 			formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllCompanies, new HashMap<String, String>());
 			result = HttpPost.SendHttpPost(formattedUrl);
	 		mfapiResponse  = new Gson().fromJson(result, MutualFundAPIResponse.class);	 		
	 		request.setAttribute("amcList", mfapiResponse.getList());
    		
	 		HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("amc", amc);
	     	
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllSchemeCategoriesByAmc, hashMap);
	     	result = HttpPost.SendHttpPost(formattedUrl);
	 		mfapiResponse = new Gson().fromJson(result, MutualFundAPIResponse.class);
	     	request.setAttribute("schemeCategories", mfapiResponse.getList());
	 		
    		request.setAttribute("amcname", amc);
    		request.setAttribute("category", category);

			request.setAttribute("menu", "Performance");
	     	request.setAttribute("submenu", "Latest NAV");
	     	
	     	request.setAttribute("headermenu", "mutual-funds");
	     	request.setAttribute("page", "latest-NAV");
	     	request.setAttribute("jsp", "../amfi/latest-NAV.jsp");
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
	@RequestMapping(value="/getLatestNav")
	public void getLatestNav(HttpServletRequest request, HttpServletResponse response) 
	{	
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		try
		{
		   String sEcho = request.getParameter("sEcho");
		   String sSearch = request.getParameter("sSearch");
		   //String sColumns = request.getParameter("sColumns");
		   String iDisplayStart = request.getParameter("iDisplayStart");
		   String iDisplayLength = request.getParameter("iDisplayLength");
		   //String iColumns = request.getParameter("iColumns");	
		   String amcname = request.getParameter("amcname");
		   String category = request.getParameter("category");
		   
		   if(amcname == null  || StringHelper.isEmpty(amcname)){amcname="All";}
		   if(category == null  || StringHelper.isEmpty(category)){category="All";}
		   if(sSearch == null  || StringHelper.isEmpty(sSearch)){sSearch="";}
		   if(iDisplayStart == null || StringHelper.isEmpty(iDisplayStart)){iDisplayStart="0";}
		   if(iDisplayLength == null || StringHelper.isEmpty(iDisplayLength)){iDisplayLength="25";}
		   
		   String iTotalRecords = "";
		   String iTotalDisplayRecords = "";
		   JsonArray data = new JsonArray();
		   String formattedUrl, result = "";
		   HashMap<String, String> hashMap = new HashMap<String, String>();hashMap = new HashMap<String, String>();
		   
	 	   hashMap.put("amc", amcname);
	 	   hashMap.put("category", category);	 
	 	   hashMap.put("sEcho", sEcho);	
	 	   hashMap.put("sSearch", sSearch);	
	 	   hashMap.put("iDisplayStart", iDisplayStart);	
	 	   hashMap.put("iDisplayLength", iDisplayLength);	
	 		
	 	   formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getLatestNav, hashMap);
	 	   System.err.println("formattedUrl"+formattedUrl);
	 	  result = HttpPost.SendHttpPost(formattedUrl);
	 		
	 	   LatestNavResponse latestNavResponse = new Gson().fromJson(result, LatestNavResponse.class);
	 	   Gson gson = new Gson();
	 	   
		   //LatestNavResponse latestNavResponse = mutualFundNavDAO.getLatestNavByAMC(amcname,category,sSearch,iDisplayStart,iDisplayLength);		
		   if(latestNavResponse != null)
		   {
			   iTotalRecords = latestNavResponse.getNoOfTotalRecords();
			   iTotalDisplayRecords = latestNavResponse.getNoOfRecords();
			   
			   List<LatestNav> latestNavList  = latestNavResponse.getLatestNavList();
			   if(latestNavList != null && latestNavList.size() > 0)
			   {
				   for (LatestNav navList : latestNavList) 
				   {
					   	JsonArray row = new JsonArray();			   	
					   	String html = "<a  class='mutual-funds-anchor'/>" + navList.getScheme_name() + "</a>";

				        row.add(new JsonPrimitive(html));
				        
				        row.add(new JsonPrimitive(navList.getNet_asset_value()));		       		
				        row.add(new JsonPrimitive(sdf.format(navList.getNav_date())));

				        html = "<a  class='mutual-funds-anchor'/><i class='fa fa-share fa-lg' aria-hidden='true'></i></a>";
				        row.add(new JsonPrimitive(html));
				        
				        data.add(row);
				   }
			   }
		   }
		   
		   	gson = new Gson();		   
		   	JsonObject jsonResponse = new JsonObject();
		   	
		    jsonResponse.addProperty("sEcho", sEcho);
		    jsonResponse.addProperty("iTotalRecords", iTotalRecords);
		    jsonResponse.addProperty("iTotalDisplayRecords", iTotalDisplayRecords);
		    jsonResponse.add("aaData", gson.toJsonTree(data));
		
		    response.setContentType("application/Json");
		    response.getWriter().print(jsonResponse.toString());
		}
		catch (Exception ex) 
		{			
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/top-swp-funds")
	public String top_swp_funds(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
    	try 
   		{
	     	String amc = request.getParameter("amc");
            String category = request.getParameter("category");
            String initial_amount = request.getParameter("intial_amount");
            String swp_date = request.getParameter("swp_date");
            String withdrawal_amount = request.getParameter("withdrawal_amount");
            String period = request.getParameter("period");
            String from_date = request.getParameter("from_date");
            String to_date = request.getParameter("to_date");
            String init_start_date = request.getParameter("init_start_date");
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Calendar cal1 = Calendar.getInstance();
            cal1.add(Calendar.DATE, -1);
            String end_date_str = sdf.format(cal1.getTime());
			cal1.add(Calendar.YEAR, -1);
			cal1.add(Calendar.MONTH, 1);
			String start_date_str = sdf.format(cal1.getTime());
            
			if(amc == null || StringHelper.isEmpty(amc)){amc = "All";}
            if(category == null || StringHelper.isEmpty(category)){category = "Equity: Multi Cap";}
            if(initial_amount == null || StringHelper.isEmpty(initial_amount) || !initial_amount.matches("[0-9]+")){initial_amount = "100000";}
            if(swp_date == null || StringHelper.isEmpty(swp_date) || !swp_date.matches("[0-9]+")){swp_date = "10";}
            if(withdrawal_amount == null || StringHelper.isEmpty(withdrawal_amount) || !withdrawal_amount.matches("[0-9]+")){withdrawal_amount= "3000";}
            if(period == null || StringHelper.isEmpty(period)){period = "Monthly";}
            if(init_start_date == null || StringHelper.isEmpty(init_start_date) || !init_start_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){init_start_date = start_date_str;}
            if(from_date == null || StringHelper.isEmpty(from_date) || !from_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){from_date = start_date_str;}
	 		if(to_date == null || StringHelper.isEmpty(to_date) || !to_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){to_date = end_date_str;}
            
            amc = amc.trim();
            category = category.trim();
            initial_amount = initial_amount.trim();
            swp_date = swp_date.trim();
            withdrawal_amount = withdrawal_amount.trim();
            period = period.trim();
            from_date = from_date.trim();
            to_date = to_date.trim();
            
            request.setAttribute("amc", amc);
            request.setAttribute("category", category);
            request.setAttribute("initial_amount", initial_amount);
            request.setAttribute("swp_date", swp_date);
            request.setAttribute("withdrawal_amount", withdrawal_amount);
            request.setAttribute("period", period);
            request.setAttribute("from_date", from_date);
            request.setAttribute("to_date", to_date);
            request.setAttribute("init_start_date", init_start_date);
			
            String formattedUrl, result = "";
            
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllCompanies, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		MutualFundAPIResponse mutualFundAPIResponse = new Gson().fromJson(result, MutualFundAPIResponse.class);
	     	request.setAttribute("amcCompanies", mutualFundAPIResponse.getList());
	     	
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllSchemeCategories, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		mutualFundAPIResponse = new Gson().fromJson(result, MutualFundAPIResponse.class);
	     	request.setAttribute("schemeCategories", mutualFundAPIResponse.getList());
	     	
	     	HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("amc", amc);
            hashMap.put("category", category);
            hashMap.put("initial_amount", initial_amount);
            hashMap.put("withdrawal_amount", withdrawal_amount);
            hashMap.put("swp_date", swp_date);
            hashMap.put("period", period);
            hashMap.put("from_date", from_date);
            hashMap.put("to_date", to_date);
            hashMap.put("init_start_date", init_start_date);
	     	
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getTopSWPFunds, hashMap);
	     	//System.out.println("formattedUrl-->"+formattedUrl);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		//System.out.println("result-->"+result);
	 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		TopSwpFundsApiResponse list = gson.fromJson(result, TopSwpFundsApiResponse.class);
	 		List<TopSWPFundsResponse> topList = list.getList();
	 		
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getHomePageSIPNavDate, new HashMap<String, String>());
		 	result = HttpPost.SendHttpPost(formattedUrl);
		 	ApiCommonResponse apiCommonResponse = new Gson().fromJson(result, ApiCommonResponse.class);	 		
		    request.setAttribute("nav_date", apiCommonResponse.getNav_date());
	 		
	     	request.setAttribute("swp_funds_list", topList);
	     	request.setAttribute("page", "top-swp-funds");
	     	request.setAttribute("menu", "mf-research");
	     	request.setAttribute("jsp", "../amfi/top-swp-funds.jsp");
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
    	return "layout/layout";
	}
	
	
	
	@RequestMapping(value="/mutual-fund-category-returns")
	public String mutual_funds_category_returns(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		try 
		{
			String period = request.getParameter("period");
			
			if(period == null || StringHelper.isEmpty(period)){period="1y";}
			
			period = period.trim();
			
			request.setAttribute("period", period);
			
            String formattedUrl, result = "";
            
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getLatestNavDate, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		ApiCommonResponse apiCommonResponse = new Gson().fromJson(result, ApiCommonResponse.class);
	     	request.setAttribute("nav_date", apiCommonResponse.getNav_date());
	     	
	     	HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("period", period);
	     	
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getMutualFundsCategoryReturns, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		MutualFundCategoryReturnsResponse list = new Gson().fromJson(result, MutualFundCategoryReturnsResponse.class);
	     	request.setAttribute("category_list", list.getList());
					
	             
			Map<String, String> breadCrumbsMap = new LinkedHashMap<String, String>();
			breadCrumbsMap.put("Home", "/");
			breadCrumbsMap.put("Mutual Funds Research", "/mutual-funds-research");
			breadCrumbsMap.put("Mutual Fund Category Returns", "");
			request.setAttribute("breadCrumbsMap", breadCrumbsMap);
	     	
	     	request.setAttribute("menu", "Tools");
	     	request.setAttribute("submenu", "Mutual Fund Category Returns");
	     	
	     	request.setAttribute("headermenu", "mutual-funds");
	     	request.setAttribute("page", "mutual-fund-category-returns");
	     	request.setAttribute("jsp", "../amfi/mutual-fund-category-returns.jsp");     	
   	 	}
   	 	catch(Exception ex)
   	 	{
   	 		ex.printStackTrace();
   	 	}
   	 	return "layout/layout";
	}
	
	@RequestMapping(value="/mutual-fund-information")
	public String fund_information(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		try 
		{
			String scheme = request.getParameter("scheme");
			
			if(scheme == null || StringHelper.isEmpty(scheme)){scheme="HDFC Top 100 Fund - Growth Option - Regular Plan";}
			
			scheme = scheme.trim();
			
			request.setAttribute("scheme", scheme);
			
			String formattedUrl, result = "";
			
			List<String> fund_list = new ArrayList<String>(Arrays.asList(scheme.split(",")));	     	
    		//List<String> mapping_list = mutualFundCommonDAO.getMutualFundSchemeMappingShrtName(fund_list);

    		String fund_final_list = fund_list.toString();
    		fund_final_list = fund_final_list.replace("[", "").replace("]", "");	  	  
    		fund_final_list = fund_final_list.replace(", ", ",");
			
			HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("scheme", fund_final_list);
            hashMap.put("isin", "");
	     	
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getMutualfundInformation, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		MutualfundInformationAPIResponse schemeMapping = gson.fromJson(result, MutualfundInformationAPIResponse.class);
	     	request.setAttribute("schemeMapping", schemeMapping);
	     	
	     	Calendar cal = Calendar.getInstance();
	        cal.add(Calendar.MONTH, 1); 
	        int year = cal.get(Calendar.YEAR);
	        int month = cal.get(Calendar.MONTH);
	        
	        if(month > 3)
	        {
	        	String d1_s = "31 Mar "+(year-1);
	 	        String d1_e = "31 Mar "+year;
	 	        
	 	        String d2_s = "31 Mar "+(year-2);
	 	        String d2_e = "31 Mar "+(year-1);
	 	        
	 	        String d3_s = "31 Mar "+(year-3);
	 	        String d3_e = "31 Mar "+(year-2);
	 	        
	 	       request.setAttribute("d1_s", d1_s);
	 	       request.setAttribute("d1_e", d1_e);
	 	       
	 	       request.setAttribute("d2_s", d2_s);
	 	       request.setAttribute("d2_e", d2_e);
	 	       
	 	       request.setAttribute("d3_s", d3_s);
	 	       request.setAttribute("d3_e", d3_e);
	        }
	        else
	        {
	        	String d1_s_3 = "31 Mar "+(year-2);
	 	        String d1_e_3 = "31 Mar "+(year-1);
	 	        
	 	        String d2_s_3 = "31 Mar "+(year-3);
	 	        String d2_e_3 = "31 Mar "+(year-2);
	 	        
	 	        String d3_s_3 = "31 Mar "+(year-4);
	 	        String d3_e_3 = "31 Mar "+(year-3);
	 	        
	 	       request.setAttribute("d1_s", d1_s_3);
	 	       request.setAttribute("d1_e", d1_e_3);
	 	       
	 	       request.setAttribute("d2_s", d2_s_3);
	 	       request.setAttribute("d2_e", d2_e_3);
	 	       
	 	       request.setAttribute("d3_s", d3_s_3);
	 	       request.setAttribute("d3_e", d3_e_3);
	        }
	     	request.setAttribute("menu", "Tools");
	     	request.setAttribute("submenu", "Mutual Fund Information");
	     	
	     	request.setAttribute("headermenu", "mutual-funds");
	     	request.setAttribute("page", "mutual-fund-category-returns");
	     	request.setAttribute("jsp", "../amfi/mutual-fund-information.jsp");
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		return "layout/layout";
	}
		
	@RequestMapping(value="/fund-card")
	public String fund_card(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		int type_id = 0;
		try
		{	
			request.setAttribute("page", "fund-card");
			
			HashMap<String, String> accountMap = (HashMap<String, String>) request.getSession().getAttribute("accountMap");
         	
            	String scheme = request.getParameter("scheme");
				if(scheme == null || StringHelper.isEmpty(scheme)){scheme = "HDFC Top 100 Fund - Growth Option - Regular Plan";}
	            scheme = scheme.replaceAll("&amp;", "&");
	            scheme = scheme.replaceAll("'", "");
	            scheme = scheme.trim();          
	            String formattedUrl, result = "";
		 		
	            HashMap<String, String> hashMap = new HashMap<String, String>();
		 		hashMap.put("scheme", scheme);
		 		
		 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSchemeInfo, hashMap);
		 		//System.out.println("formattedUrl --> "+formattedUrl);
		 		result = HttpPost.SendHttpPost(formattedUrl);	
		 		////System.out.println("result --> "+result);
		 		SchemeInfoApiResponse schemeInfoApiResponse = new GsonBuilder().setDateFormat("MMM dd, yyyy").create().fromJson(result, SchemeInfoApiResponse.class); 
		 		
		 		SchemeMapping schemeMapping = schemeInfoApiResponse.getSchemeMapping();
		 		SchemePerformances schemePerformances = schemeInfoApiResponse.getSchemePerformances();
		 		
		 		request.setAttribute("schemePerformances", schemePerformances);	
		 		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 		if(schemeInfoApiResponse.getSchemePerformances().getScheme_asset_date() != null) {
		 			request.setAttribute("scheme_aum_date", sdf.parse(schemeInfoApiResponse.getSchemePerformances().getScheme_asset_date()));
		 		}else {
		 			request.setAttribute("scheme_aum_date", "");
		 		}
		 		
		 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getLatestNavDate, new HashMap<String, String>());
		 		//System.out.println("formattedUrl --> "+formattedUrl);
		 		result = HttpPost.SendHttpPost(formattedUrl);	 		
		 		ApiCommonResponse apiCommonResponse = new Gson().fromJson(result, ApiCommonResponse.class);	 		
		 		request.setAttribute("nav_date", apiCommonResponse.getNav_date());
		 		
		 		hashMap = new HashMap<String, String>();
	     		hashMap.put("scheme_name", scheme);
	     		
	     		PortfolioAnalysisResponse analysisResponse = new PortfolioAnalysisResponse();
	     		
	     		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getPortfolioAnalysis, hashMap);
	     		//System.out.println("formattedUrl --> "+formattedUrl);
	     		result = HttpPost.SendHttpPost(formattedUrl);	
	     		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	     		SchemePortfolioAnalysisApiResponse mutualFundSchemeAPIResponse = gson.fromJson(result, SchemePortfolioAnalysisApiResponse.class); 		
	     		SchemePortfolioAnalysisResponse schemePortfolioAnalysisResponse = mutualFundSchemeAPIResponse.getSchemePortfolioAnalysisResponse();
	     		if(schemePortfolioAnalysisResponse.getSectorAllocationMap() != null)
	     			schemePortfolioAnalysisResponse.setSectorAllocationMap((HashMap<String, Double>) Utils.sortByValuesDescending(schemePortfolioAnalysisResponse.getSectorAllocationMap()));
	     		analysisResponse.setSchemePortfolioAnalysisResponse(schemePortfolioAnalysisResponse);
	     		List<SchemePortfolio> schemePortfolioList = schemePortfolioAnalysisResponse.getSchemePortfolioList().stream().limit(10).collect(Collectors.toList());
	     		int schemePortfolioListSize =  schemePortfolioList.size();
	     		
	     		request.setAttribute("schemePortfolioAnalysisResponse", schemePortfolioAnalysisResponse);
	     		
	     		String scheme_amfi_code = "";
	     		String scheme_category = "";
	     		String scheme_company = "";
		 		if(schemeMapping != null)
		 		{
		 			scheme_amfi_code = schemeMapping.getScheme_amfi_code();
		 			scheme_category = schemeMapping.getScheme_advisorkhoj_category();
		 			scheme_company = schemeMapping.getScheme_company();
		 			request.setAttribute("scheme_amfi_code", scheme_amfi_code);
		 			
		 			request.setAttribute("benchmark_returns", schemeInfoApiResponse.getFundPerformanceOverviewAgainstBenchmarkAndCategoryResponse().getSchemePerformancesBenchmark());
		 			
		    		hashMap = new HashMap<String, String>();
			 		hashMap.put("scheme_amfi_common", schemeMapping.getScheme_amfi_common());
			 		
			 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSchemeMarketCapDistribution, hashMap);
			 		System.out.println("formattedUrl --> "+formattedUrl);
			 		result = HttpPost.SendHttpPost(formattedUrl);
			 		SchemePortfolioResponse schemePortfolioResponse = new Gson().fromJson(result, SchemePortfolioResponse.class);
			 		Map<String, Double> stocksMapList = schemePortfolioResponse.getStocksMap();
		    		Map<String, Double> rankedMap = new LinkedHashMap<String, Double>();
		    		
			 		if(stocksMapList.containsKey("Large Cap")) 
		    			rankedMap .put("Large Cap", stocksMapList.get("Large Cap"));
		    		if(stocksMapList.containsKey("Mid Cap")) 
		    			rankedMap .put("Mid Cap", stocksMapList.get("Mid Cap"));
		    		if(stocksMapList.containsKey("Small Cap")) 
		    			rankedMap .put("Small Cap", stocksMapList.get("Small Cap"));
					if(rankedMap.containsKey("Others")) 
						rankedMap .put("Others", stocksMapList.get("Others"));
					
					for (Map.Entry<String,Double> entry : stocksMapList.entrySet()) 
					{  
						if(!rankedMap.containsKey(entry.getKey())) {
							rankedMap .put(entry.getKey(), entry.getValue());
						}
					}
					
			 		request.setAttribute("stocksMapList", rankedMap);
			 		
			 		rankedMap = new LinkedHashMap<String, Double>();
		    		
		    		if(schemePortfolioAnalysisResponse.getAssetAllocationMap().containsKey("Equity")) {
		    			rankedMap .put("Equity", schemePortfolioAnalysisResponse.getAssetAllocationMap().get("Equity"));
		    		}
		    		
		    		for (Map.Entry<String,Double> entry : schemePortfolioAnalysisResponse.getAssetAllocationMap().entrySet()) 
					{  
						if(!rankedMap.containsKey(entry.getKey())) {
							rankedMap .put(entry.getKey(), entry.getValue());
						}
					}
		    		
		    		request.setAttribute("assetAllocationMap", rankedMap);
		 			hashMap = new HashMap<String, String>();
			 		hashMap.put("scheme_code", scheme_amfi_code);
			 		
			 		List<Date> dateMap = new ArrayList<Date>();
			 		
			 		Calendar cal2 = Calendar.getInstance();
			 		cal2.setTime(schemeInfoApiResponse.getScheme_sip_start_date());
			 		cal2.add(Calendar.MONTH, -1);
			 		Date schemeStartDate = cal2.getTime();
			 		dateMap.add(schemeStartDate);
			 		
					if(schemeInfoApiResponse.getScheme_sip_end_date() != null) {
						dateMap.add(schemeInfoApiResponse.getScheme_sip_end_date());
					}
			 		request.setAttribute("dateMap", dateMap);
			 		request.setAttribute("fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse", schemeInfoApiResponse.getFundPerformanceOverviewAgainstBenchmarkAndCategoryResponse());
			 		
			 		hashMap = new HashMap<String, String>();
			 		hashMap.put("scheme_amfi_common", schemeMapping.getScheme_amfi_common());
			 		
			 		if(schemeMapping.getDividend_scheme())
			 		{
			 			request.setAttribute("dividend_list", schemeInfoApiResponse.getDividend_list());
			 		}
			 		Calendar cal = Calendar.getInstance();
			 		cal.add(Calendar.YEAR, -5);
			 		Date rolling_returns_start_date = cal.getTime();
			 		request.setAttribute("rolling_returns_start_date", rolling_returns_start_date);
			 		
			 		request.setAttribute("scheme_benchmark", schemeInfoApiResponse.getScheme_benchmark());
			 		
			 		//request.setAttribute("peerComparisonResponse", schemeInfoApiResponse.getPeerComparisonResponse());
			 		
			 		schemeMapping.setOpen_or_closed(schemeMapping.getOpen_or_closed().replace("Schemes", "Scheme"));
			 		
			 		request.setAttribute("schemeMapping", schemeMapping);
			 		
			 		gson = new Gson();
			 		String jsonString = gson.toJson(schemeMapping);
			 		SchemeMapping bmSchemeMapping = gson.fromJson(jsonString, SchemeMapping.class);
			 		if(Utils.getCategoriesBenchmark1().contains(bmSchemeMapping.getScheme_advisorkhoj_category())) 
			 		{
			 			bmSchemeMapping.setScheme_benchmark("S&P BSE Liquid Rate Index");
			 			bmSchemeMapping.setScheme_benchmark_code("BSELiquidRateIndex");
			 		} else if(Utils.getCategoriesBenchmark2().contains(bmSchemeMapping.getScheme_advisorkhoj_category())) {
			 			bmSchemeMapping.setScheme_benchmark("S&P BSE India 10 Year Sovereign Bond");
			 			bmSchemeMapping.setScheme_benchmark_code("BSEIndiaSovereignBond");
			 		} else if(Utils.getCategoriesBenchmark3().contains(bmSchemeMapping.getScheme_advisorkhoj_category())) {
			 			bmSchemeMapping.setScheme_benchmark("NIFTY 50 TRI");
			 			bmSchemeMapping.setScheme_benchmark_code("NIFTY50");
			 		} else {
			 			if(bmSchemeMapping.getScheme_broad_category().equalsIgnoreCase("Equity Schemes")) {
			 				
			 			} 
			 			else if(bmSchemeMapping.getScheme_advisorkhoj_category().equalsIgnoreCase("ETFs")) {
			 				
			 			} else if(bmSchemeMapping.getScheme_advisorkhoj_category().equalsIgnoreCase("Index Fund")) {
			 				
			 			} else {
			 				bmSchemeMapping.setScheme_benchmark("S&P BSE India Bond Index");
			 				bmSchemeMapping.setScheme_benchmark_code("BSEIndiaBondIndex");
			 			}
			 		}
			 		request.setAttribute("bmSchemeMapping", bmSchemeMapping);
			 		
			 		BenchmarkSipCalcApiResponse bmlist = null;
			 		BenchmarkSIPCalcFinalResponse bmcr = null;
			 		Double current_value = 0.0;
			 		Double invested_amount = 0.0;
			 		Double abs_retn = 0.0;
			 		
			 		//SchemePerformancesBenchmark bmark = mutualfundResearchDAO.getBenchmarkReturns(bmSchemeMapping.getScheme_benchmark());
			 		hashMap = new HashMap<String, String>();
					hashMap.put("benchmark", bmSchemeMapping.getScheme_benchmark());
					
					formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getBenchmarkPerformanceByBenchmark, hashMap);
					//System.out.println("formattedUrl --> "+formattedUrl);
					result = HttpPost.SendHttpPost(formattedUrl);
					//System.out.println("getBenchmarkPerformanceByBenchmark-->"+result);
					ApiCommonResponse apiResponse = new GsonBuilder().setDateFormat("MMM dd, yyyy hh:mm:ss a").create().fromJson(result, ApiCommonResponse.class); 
					SchemePerformancesBenchmark bmark = apiResponse.getBenchmark_returns();
			 		if(bmark == null) {bmark = new SchemePerformancesBenchmark();}
			 		request.setAttribute("bmark", bmark);
			 		
			 		//List<SchemeCategoryAnnualReturns> category_returns = mutualfundResearchDAO.getSchemeCategoryAnnualReturns(schemeMapping.getScheme_advisorkhoj_category());
			 		hashMap = new HashMap<String, String>();
					hashMap.put("category", schemeMapping.getScheme_advisorkhoj_category());
					
					formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getCategoryPerformanceByCategory, hashMap);
					//System.out.println("formattedUrl --> "+formattedUrl);
					result = HttpPost.SendHttpPost(formattedUrl);
					////System.out.println("getCategoryPerformanceByCategory-->"+result);
					gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
					apiResponse = new GsonBuilder().setDateFormat("MMM dd, yyyy hh:mm:ss a").create().fromJson(result, ApiCommonResponse.class); 
					List<SchemeCategoryAnnualReturns> category_returns = apiResponse.getCategory_returns();
			 		request.setAttribute("category_returns", category_returns);
			 		
			 		if(schemeMapping.getScheme_broad_category().equalsIgnoreCase("Debt Schemes")) 
			 		{
			 			hashMap = new HashMap<String, String>();
						hashMap.put("scheme", schemeMapping.getScheme_amfi_common());
						
						formattedUrl = MfApiAccessor.getFormattedUrl("https://mfportfolio.in/api/getIssuerRatingAssetMap", hashMap);
						
						result = HttpPost.SendHttpPost(formattedUrl);
						//System.out.println("result --> "+result);
						gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
						apiResponse = gson.fromJson(result, ApiCommonResponse.class); 
			 			
			 			//Map<String, Double> issuerMap = mutualfundResearchDAO.getIssuerNameWithCount(schemeMapping.getScheme_amfi_common());
						Map<String, Double> issuerMap = apiResponse.getIssuerMap();
			 			request.setAttribute("issuerMap", issuerMap);
			 			
			 			//Map<String, Double> assetMap = mutualfundResearchDAO.getAssetClassWithCount(schemeMapping.getScheme_amfi_common());
			 			Map<String, Double> assetMap = apiResponse.getAssetMap();
			 			if(assetMap != null ) {
			 				request.setAttribute("assetMap", assetMap.entrySet()
				 	  	              .stream()
				 	  	              .sorted(Map.Entry.comparingByValue(Collections.reverseOrder()))
				 	  	              .limit(5)
				 	  	              .collect(Collectors.toMap(
				 	  	                Map.Entry::getKey, 
				 	  	                Map.Entry::getValue, 
				 	  	                (e1, e2) -> e1, 
				 	  	                LinkedHashMap::new
				 	  	              )));
			 			}
			 			
			 			//Map<String, String> ratingMap = mutualfundResearchDAO.getRatingWithCount(schemeMapping.getScheme_amfi_common());
			 			Map<String, String> ratingMap = apiResponse.getRatingMap();
			 			request.setAttribute("ratingMap", ratingMap);
			 			
			 			hashMap = new HashMap<String, String>();
						hashMap.put("scheme", scheme);
						
						formattedUrl = MfApiAccessor.getFormattedUrl("https://mfportfolio.in/api/getDebtYtmChangePercentResponse", hashMap);
						result = HttpPost.SendHttpPost(formattedUrl);
						////System.out.println("getDebtYtmChangePercentResponse-->"+result);
						gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
						apiResponse = gson.fromJson(result, ApiCommonResponse.class);
			 			
			 			//DebtYtmChangePercentResponse debtPercent = mutualfundResearchDAO.getDebtYtmChangePercentResponse(scheme);
						DebtYtmChangePercentResponse debtPercent = apiResponse.getDebtYtmChangePercent();
			 			request.setAttribute("debtPercent", debtPercent);
				 		
			 			dateMap = new ArrayList<Date>();
				 		
				 		cal2 = Calendar.getInstance();
				 		cal2.setTime(schemeInfoApiResponse.getScheme_sip_start_date());
				 		cal2.add(Calendar.MONTH, -1);
				 		schemeStartDate = cal2.getTime();
				 		dateMap.add(schemeStartDate);
				 		
						if(schemeInfoApiResponse.getScheme_sip_end_date() != null) {
							dateMap.add(schemeInfoApiResponse.getScheme_sip_end_date());
						}
				 		request.setAttribute("debtDateMap", dateMap);
			 		}
			 		String additional_benchmark_code = "NIFTY 50 TRI";
			 		//SchemePerformancesBenchmark additional_benchmark_perform = mutualfundResearchDAO.getBenchmarkPerformances(additional_benchmark_code);
			 		
			 		hashMap = new HashMap<String, String>();
					hashMap.put("benchmark", additional_benchmark_code);
					
					formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getBenchmarkPerformanceByBenchmark, hashMap);
					//System.out.println("formattedUrl --> "+formattedUrl);
					result = HttpPost.SendHttpPost(formattedUrl);
					////System.out.println("getBenchmarkPerformanceByBenchmark-->"+result);
					gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
					apiResponse = new GsonBuilder().setDateFormat("MMM dd, yyyy hh:mm:ss a").create().fromJson(result, ApiCommonResponse.class); 
					SchemePerformancesBenchmark additional_benchmark_perform = apiResponse.getBenchmark_returns();
			 		
		    		Double additional_benchmark_inception_returns = additional_benchmark_perform.getReturns_cmp_inception();
		    		Double additional_benchmark_1yr_returns = additional_benchmark_perform.getReturns_abs_1year();
		    		Double additional_benchmark_3yr_returns = additional_benchmark_perform.getReturns_cmp_3year();
		    		Double additional_benchmark_5yr_returns = additional_benchmark_perform.getReturns_cmp_5year();
		    		Double additional_benchmark_10yr_returns = additional_benchmark_perform.getReturns_cmp_10year();
		    		
		    		FundPerformanceOverviewAgainstBenchmarkAndCategoryResponse fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse = schemeInfoApiResponse.getFundPerformanceOverviewAgainstBenchmarkAndCategoryResponse();
		     		
		    		SchemePerformancesCategory category_perform = fundPerformanceOverviewAgainstBenchmarkAndCategoryResponse.getSchemePerformancesCategory();
		    		Double category_inception_returns = category_perform.getReturns_cmp_inception();
		    		Double category_1yr_returns = category_perform.getReturns_abs_1year();
		    		Double category_3yr_returns = category_perform.getReturns_cmp_3year();
		    		Double category_5yr_returns = category_perform.getReturns_cmp_5year();
		    		Double category_10yr_returns = category_perform.getReturns_cmp_10year();
		    		
		    		Date scheme_inception_date = schemeMapping.getScheme_inception_date();
		    		Calendar cal1 = Calendar.getInstance();
		    		cal1.setTime(scheme_inception_date);
		    		int scheme_inception_year = cal1.get(Calendar.YEAR);
		    		int inceptionFrequency = 2021 - scheme_inception_year;
		    		
		    		Double additional_benchmark_1yr_value = Utils.getFutureValue(10000.0, 1, additional_benchmark_1yr_returns);
		    		Double additional_benchmark_3yr_value = Utils.getFutureValue(10000.0, 3, additional_benchmark_3yr_returns);
		    		Double additional_benchmark_5yr_value = Utils.getFutureValue(10000.0, 5, additional_benchmark_5yr_returns);
		    		Double additional_benchmark_10yr_value = Utils.getFutureValue(10000.0, 10, additional_benchmark_10yr_returns);
		    		Double additional_benchmark_inception_value = Utils.getFutureValue(10000.0, inceptionFrequency, additional_benchmark_inception_returns);
		    		
		    		Double category_1yr_value = Utils.getFutureValue(10000.0, 1, category_1yr_returns);
		    		Double category_3yr_value = Utils.getFutureValue(10000.0, 3, category_3yr_returns);
		    		Double category_5yr_value = Utils.getFutureValue(10000.0, 5, category_5yr_returns);
		    		Double category_10yr_value = Utils.getFutureValue(10000.0, 10, category_10yr_returns);
		    		Double category_inception_value = Utils.getFutureValue(10000.0, inceptionFrequency, category_inception_returns);
		    		
		    		request.setAttribute("additional_benchmark", additional_benchmark_code);
		    		request.setAttribute("additional_benchmark_1yr_returns", additional_benchmark_1yr_returns);
		    		request.setAttribute("additional_benchmark_3yr_returns", additional_benchmark_3yr_returns);
		    		request.setAttribute("additional_benchmark_5yr_returns", additional_benchmark_5yr_returns);
		    		request.setAttribute("additional_benchmark_10yr_returns", additional_benchmark_10yr_returns);
		    		request.setAttribute("additional_benchmark_inception_returns", additional_benchmark_inception_returns);
		    		
		    		request.setAttribute("additional_benchmark_1yr_value", additional_benchmark_1yr_value);
		    		request.setAttribute("additional_benchmark_3yr_value", additional_benchmark_3yr_value);
		    		request.setAttribute("additional_benchmark_5yr_value", additional_benchmark_5yr_value);
		    		request.setAttribute("additional_benchmark_10yr_value", additional_benchmark_10yr_value);
		    		request.setAttribute("additional_benchmark_inception_value", additional_benchmark_inception_value);
		    		
		    		request.setAttribute("category_1yr_returns", category_1yr_returns);
		    		request.setAttribute("category_3yr_returns", category_3yr_returns);
		    		request.setAttribute("category_5yr_returns", category_5yr_returns);
		    		request.setAttribute("category_10yr_returns", category_10yr_returns);
		    		request.setAttribute("category_inception_returns", category_inception_returns);
		    		
		    		request.setAttribute("category_1yr_value", category_1yr_value);
		    		request.setAttribute("category_3yr_value", category_3yr_value);
		    		request.setAttribute("category_5yr_value", category_5yr_value);
		    		request.setAttribute("category_10yr_value", category_10yr_value);
		    		request.setAttribute("category_inception_value", category_inception_value);
		    		
		    		//Find SIP Returns
			     	hashMap = new HashMap<String, String>();	 		
			 		hashMap.put("amc", scheme_company);
					hashMap.put("category", scheme_category);
					hashMap.put("period", "3,5,10,15");
			 		hashMap.put("amount", "10000");
			 			 		
			 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSIPReturnsForCategoryPeriodAmountRepBu, hashMap);
			 		//System.out.println("formattedUrl --> "+formattedUrl);
			 		result = HttpPost.SendHttpPost(formattedUrl);
			 		////System.out.println("getSIPReturnsForCategoryPeriodAmountRepBu result......>"+result);
			 		gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
			 		MutualFundSIPReturnsAPIResponse mutualFundAPIResponse = gson.fromJson(result, MutualFundSIPReturnsAPIResponse.class);
			 		List<SchemePerformancesSip> finalList = mutualFundAPIResponse.getList();
			 		////System.out.println("finalList size.......>"+finalList.size());
			 		List<SchemePerformancesSip> benchmark_returns_list = mutualFundAPIResponse.getBenchmark_returns_list();
			 		////System.out.println("benchmark_returns_list size.......>"+benchmark_returns_list.size());
			 		List<SchemePerformancesSip> category_returns_list = mutualFundAPIResponse.getCategory_returns_list();
			 		////System.out.println("category_returns_list size.......>"+category_returns_list.size());
			 		
			 		String schemAmfiCode = scheme_amfi_code;
			 		List<SchemePerformancesSip> sub_list = finalList.stream().filter(x -> x.getScheme_amfi_code().equalsIgnoreCase(schemAmfiCode)).collect(Collectors.toList());
			 		////System.out.println("sub_list size.......>"+sub_list.size());
			 		
			 		MultipleSipReturnsSummaryResponse sipSummaryResponse = new MultipleSipReturnsSummaryResponse();
			 		MultipleSipReturnsSummaryResponse benchmarkSummaryResponse = new MultipleSipReturnsSummaryResponse();
			 		MultipleSipReturnsSummaryResponse categorySummaryResponse = new MultipleSipReturnsSummaryResponse();
			 		
			 		if(sub_list!=null && sub_list.size() > 0)
			 		{
			 			for (SchemePerformancesSip schemePerformancesSip : sub_list) 
				 		{
			 				if(schemePerformancesSip.getPeriod() == 3)	 			
				 			{
			 					sipSummaryResponse = new MultipleSipReturnsSummaryResponse();
			 					sipSummaryResponse.setScheme_name(schemePerformancesSip.getScheme_amfi_short_name());
					 			sipSummaryResponse.setInception_date(schemePerformancesSip.getInception_date());	
					 			sipSummaryResponse.setAum(schemePerformancesSip.getScheme_assets());		
					 			sipSummaryResponse.setTer(schemePerformancesSip.getTer());
					 			
			 					sipSummaryResponse.setThree_yr_inv_amnt(schemePerformancesSip.getCurrent_cost());
								sipSummaryResponse.setThree_yr_curr_val(schemePerformancesSip.getCurrent_value());
								sipSummaryResponse.setThree_yr_returns(schemePerformancesSip.getReturns());		
				 			}
			 				if(schemePerformancesSip.getPeriod() == 5)	 			
				 			{
			 					sipSummaryResponse.setFive_yr_inv_amnt(schemePerformancesSip.getCurrent_cost());
								sipSummaryResponse.setFive_yr_curr_val(schemePerformancesSip.getCurrent_value());
								sipSummaryResponse.setFive_yr_returns(schemePerformancesSip.getReturns());
				 			}
			 				if(schemePerformancesSip.getPeriod() == 10)	 			
				 			{
			 					sipSummaryResponse.setTen_yr_inv_amnt(schemePerformancesSip.getCurrent_cost());
								sipSummaryResponse.setTen_yr_curr_val(schemePerformancesSip.getCurrent_value());
								sipSummaryResponse.setTen_yr_returns(schemePerformancesSip.getReturns());
				 			}
			 				if(schemePerformancesSip.getPeriod() == 15)	 			
				 			{
			 					sipSummaryResponse.setFifteen_yr_inv_amnt(schemePerformancesSip.getCurrent_cost());
								sipSummaryResponse.setFifteen_yr_curr_val(schemePerformancesSip.getCurrent_value());
								sipSummaryResponse.setFifteen_yr_returns(schemePerformancesSip.getReturns());
				 			}
				 		}
			 		}
			 		if(benchmark_returns_list!=null && benchmark_returns_list.size() > 0)
			 		{
			 			for (SchemePerformancesSip schemePerformancesSip : benchmark_returns_list) 
				 		{
			 				if(schemePerformancesSip.getPeriod() == 3)	 			
				 			{
			 					benchmarkSummaryResponse = new MultipleSipReturnsSummaryResponse();
			 					benchmarkSummaryResponse.setScheme_name(schemePerformancesSip.getScheme_name());
			 					benchmarkSummaryResponse.setInception_date(null);	
			 					benchmarkSummaryResponse.setAum(0.0);		
			 					benchmarkSummaryResponse.setTer(0.0);	
			 					
			 					benchmarkSummaryResponse.setThree_yr_inv_amnt(schemePerformancesSip.getCurrent_cost());
			 					benchmarkSummaryResponse.setThree_yr_curr_val(schemePerformancesSip.getCurrent_value());
			 					benchmarkSummaryResponse.setThree_yr_returns(schemePerformancesSip.getReturns());		
				 			}
			 				if(schemePerformancesSip.getPeriod() == 5)	 			
				 			{
			 					benchmarkSummaryResponse.setFive_yr_inv_amnt(schemePerformancesSip.getCurrent_cost());
			 					benchmarkSummaryResponse.setFive_yr_curr_val(schemePerformancesSip.getCurrent_value());
			 					benchmarkSummaryResponse.setFive_yr_returns(schemePerformancesSip.getReturns());
				 			}
			 				if(schemePerformancesSip.getPeriod() == 10)	 			
				 			{
			 					benchmarkSummaryResponse.setTen_yr_inv_amnt(schemePerformancesSip.getCurrent_cost());
			 					benchmarkSummaryResponse.setTen_yr_curr_val(schemePerformancesSip.getCurrent_value());
			 					benchmarkSummaryResponse.setTen_yr_returns(schemePerformancesSip.getReturns());
				 			}
			 				if(schemePerformancesSip.getPeriod() == 15)	 			
				 			{
			 					benchmarkSummaryResponse.setFifteen_yr_inv_amnt(schemePerformancesSip.getCurrent_cost());
			 					benchmarkSummaryResponse.setFifteen_yr_curr_val(schemePerformancesSip.getCurrent_value());
			 					benchmarkSummaryResponse.setFifteen_yr_returns(schemePerformancesSip.getReturns());
				 			}
				 		}
			 		}
			 		if(category_returns_list!=null && category_returns_list.size() > 0)
			 		{
			 			for (SchemePerformancesSip schemePerformancesSip : category_returns_list) 
				 		{
			 				if(schemePerformancesSip.getPeriod() == 3)	 			
				 			{
			 					categorySummaryResponse = new MultipleSipReturnsSummaryResponse();
			 					categorySummaryResponse.setScheme_name(schemePerformancesSip.getScheme_name());
			 					categorySummaryResponse.setInception_date(null);	
			 					categorySummaryResponse.setAum(0.0);		
			 					categorySummaryResponse.setTer(0.0);	
			 					
			 					categorySummaryResponse.setThree_yr_inv_amnt(schemePerformancesSip.getCurrent_cost());
			 					categorySummaryResponse.setThree_yr_curr_val(schemePerformancesSip.getCurrent_value());
			 					categorySummaryResponse.setThree_yr_returns(schemePerformancesSip.getReturns());		
				 			}
			 				if(schemePerformancesSip.getPeriod() == 5)	 			
				 			{
			 					categorySummaryResponse.setFive_yr_inv_amnt(schemePerformancesSip.getCurrent_cost());
			 					categorySummaryResponse.setFive_yr_curr_val(schemePerformancesSip.getCurrent_value());
			 					categorySummaryResponse.setFive_yr_returns(schemePerformancesSip.getReturns());
				 			}
			 				if(schemePerformancesSip.getPeriod() == 10)	 			
				 			{
			 					categorySummaryResponse.setTen_yr_inv_amnt(schemePerformancesSip.getCurrent_cost());
			 					categorySummaryResponse.setTen_yr_curr_val(schemePerformancesSip.getCurrent_value());
			 					categorySummaryResponse.setTen_yr_returns(schemePerformancesSip.getReturns());
				 			}
			 				if(schemePerformancesSip.getPeriod() == 15)	 			
				 			{
			 					categorySummaryResponse.setFifteen_yr_inv_amnt(schemePerformancesSip.getCurrent_cost());
			 					categorySummaryResponse.setFifteen_yr_curr_val(schemePerformancesSip.getCurrent_value());
			 					categorySummaryResponse.setFifteen_yr_returns(schemePerformancesSip.getReturns());
				 			}
				 		}
			 		}
			 		request.setAttribute("sipSummaryResponse", sipSummaryResponse);
			 		request.setAttribute("benchmarkSummaryResponse", benchmarkSummaryResponse);
			 		request.setAttribute("categorySummaryResponse", categorySummaryResponse);
		 		}
		 		request.setAttribute("scheme", scheme);
		 		request.setAttribute("mainMenu", "downloads");
			
            
            request.setAttribute("page", "top-performing-mutual-funds");
	     	request.setAttribute("menu", "mf-research");
	     	request.setAttribute("jsp", "../amfi/fund-card.jsp");
	     	
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
    	return "layout/scheme-layout";
		
	}
	@RequestMapping(value="/getSchemeCategory")
	public void getSchemeCategory(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
    	PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		
		try 
		{	
    		String scheme_amfi = request.getParameter("scheme_name");   
    		if(scheme_amfi == null){scheme_amfi = "";}
    		scheme_amfi = scheme_amfi.trim();
    		
    		scheme_amfi = URLDecoder.decode(scheme_amfi, "UTF-8");
    		
    		if(StringHelper.isNotEmpty(scheme_amfi))
    		{
		 		 String formattedUrl, result = "";
		 		 
		         HashMap<String, String> hashMap = new HashMap<String, String>();
		 		 hashMap.put("scheme_name", scheme_amfi);
			 		
		 		 formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSchemeCategory, hashMap);
	
		 		 result = HttpPost.SendHttpPost(formattedUrl);	 	
		 		 ApiCommonResponse apiCommonResponse = new Gson().fromJson(result, ApiCommonResponse.class);
	    		 String category = apiCommonResponse.getCategory();
    			
	    		 writer.print(category);
     		     writer.close();
     		     return;
    		}else
    		{
    			writer.print("");
    		    writer.close();
    		    return;    			
    		}
		} 
		catch (Exception ex) 
		{
		    writer.close();
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/rolling-returns")
	public String rolling_returns(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		try 
		{	     	
			String category = request.getParameter("category");
			String schemes = request.getParameter("schemes");
			String start_date = request.getParameter("start_date");
			String period = request.getParameter("period");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Calendar cal1 = Calendar.getInstance();
            cal1.add(Calendar.DATE, -1);
			cal1.add(Calendar.YEAR, -5);
			cal1.add(Calendar.MONTH, 1);
			String start_date_str = sdf.format(cal1.getTime());
			
			if(category == null || StringHelper.isEmpty(category))
			{
				category="Equity: Flexi Cap";
				request.setAttribute("category_set", "false");
			}
			else
			{
				request.setAttribute("category_set", "true");
			}
			if(schemes == null || StringHelper.isEmpty(schemes)){schemes="Aditya Birla Sun Life Flexi Cap Fund - Growth - Regular Plan";}
			if(start_date == null || StringHelper.isEmpty(start_date) || !start_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){start_date=start_date_str;}
			if(period == null || StringHelper.isEmpty(period)){period="3 Year";}
			
			schemes = schemes.trim();
			category = category.trim();
			start_date = start_date.trim();
			period = period.trim();
			
			//System.out.println("rolling-returns schemes = "+ schemes);
			//System.out.println("rolling-returns category = "+ category);
			//System.out.println("rolling-returns start_date = "+ start_date);
			//System.out.println("rolling-returns period = "+ period);
			
			request.setAttribute("schemes", schemes);
			request.setAttribute("category", category);
			request.setAttribute("start_date", start_date);
			request.setAttribute("period", period);
	     	
	     	schemes = URLDecoder.decode(schemes, "UTF-8");
	     	
            String formattedUrl, result = "";
            
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllSchemeCategories, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		MutualFundAPIResponse mutualFundAPIResponse = gson.fromJson(result, MutualFundAPIResponse.class);
	     	request.setAttribute("schemeCategories", mutualFundAPIResponse.getList());
	     	
	     	//System.out.println("---mutualFundAPIResponse.getList()-->"+mutualFundAPIResponse.getList().size());
	     	//System.out.println("---mutualFundAPIResponse.getList()-->"+mutualFundAPIResponse.getList());
	     	
	     	HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("category", category);
            hashMap.put("schemes", schemes);
            hashMap.put("isin", "");
            hashMap.put("start_date", start_date);
            hashMap.put("period", period);
	     	
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getRollingReturnsMultipleSchemes, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		RollingReturnsMultipleSchemesAPIResponse list = gson.fromJson(result, RollingReturnsMultipleSchemesAPIResponse.class);
	 		List<RollingReturnsSummaryResponse> rollingReturnsTable = list.getRollingReturnsTable();
	 		if(rollingReturnsTable != null) {
	 			for(RollingReturnsSummaryResponse roll : rollingReturnsTable) {
	 				roll.setScheme_name(Utils.getSchemeAmfiUrl(roll.getScheme_name()));
	 			}
	 		}
	     	request.setAttribute("rollingReturnsSummaryList", rollingReturnsTable);
	     	
	     	
			request.setAttribute("menu", "Rolling Return");
	     	request.setAttribute("submenu", "Rolling Returns");
	     	
	     	request.setAttribute("jsp", "../amfi/rolling-returns.jsp");
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
	@RequestMapping(value="/getRollingReturns")
	public void getRollingReturns(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("application/json");
		Gson gson = null;
		
		try 
		{
			String category = request.getParameter("category");
			String schemes = request.getParameter("schemes");
			String start_date = request.getParameter("start_date");
			String period = request.getParameter("period");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Calendar cal1 = Calendar.getInstance();
            cal1.add(Calendar.DATE, -1);
			cal1.add(Calendar.YEAR, -5);
			cal1.add(Calendar.MONTH, 1);
			String start_date_str = sdf.format(cal1.getTime());
			
			if(category == null || StringHelper.isEmpty(category)){category="Equity: Flexi Cap";}
			if(schemes == null || StringHelper.isEmpty(schemes)){schemes="Aditya Birla Sun Life Equity Fund - Growth - Regular Plan";}
			if(start_date == null || StringHelper.isEmpty(start_date) || !start_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){start_date=start_date_str;}
			if(period == null || StringHelper.isEmpty(period)){period="3 Year";}
			
			category = category.trim();
			schemes = schemes.trim();
			start_date = start_date.trim();
			period = period.trim();
			
			//System.out.println("schemes-1->"+schemes);
			
			schemes = URLDecoder.decode(schemes, "UTF-8");
			
			//System.out.println("schemes-2->"+schemes);
			
			List<String> fund_list = new ArrayList<String>(Arrays.asList(schemes.split(",")));	     	
			//List<String> mapping_list = mutualFundCommonDAO.getMutualFundSchemeMappingShrtName(fund_list);
			
			//System.out.println("getRollingReturns mapping_list = "+ mapping_list.size());

			String fund_final_list = fund_list.toString();
			fund_final_list = fund_final_list.replace("[", "").replace("]", "");	  	  
			fund_final_list = fund_final_list.replace(", ", ",");
			
            String formattedUrl, result = "";
            
           //System.out.println("getRollingReturns schemes = "+ schemes);
			//System.out.println("getRollingReturns category = "+ category);
			//System.out.println("getRollingReturns start_date = "+ start_date);
			//System.out.println("getRollingReturns period = "+ period);
	     	
	     	HashMap<String, String> hashMap = new HashMap<String, String>();
	        hashMap.put("category", category);
            hashMap.put("schemes", fund_final_list);
            hashMap.put("isin", "");
            hashMap.put("start_date", start_date);
            hashMap.put("period", period);
	     	
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getRollingReturnsMultipleSchemes, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		
	 		//System.out.println("result--->"+result);
	 		
	 		gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		RollingReturnsMultipleSchemesAPIResponse list = gson.fromJson(result, RollingReturnsMultipleSchemesAPIResponse.class);
			List<List<SchemeRollingReturns>> rollingReturnsList = list.getList();
			
			//System.out.println("rollingReturnsList--->"+rollingReturnsList.size());
			
			gson = new Gson();
			writer.print(gson.toJson(rollingReturnsList));
		    writer.close();
		    return;
		}  
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	/*
	 * @RequestMapping(value=
	 * "/mutual-fund-rolling-returns-comparison-with-gold-and-sensex") public String
	 * mutualfund_rolling_returns_comparison_gold_sensex(HttpServletRequest request,
	 * HttpServletResponse response) throws IOException { try { String scheme =
	 * request.getParameter("scheme"); String start_date =
	 * request.getParameter("start_date"); String period =
	 * request.getParameter("period");
	 * 
	 * SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy"); Calendar cal1 =
	 * Calendar.getInstance(); cal1.add(Calendar.DATE, -1); cal1.add(Calendar.YEAR,
	 * -5); cal1.add(Calendar.MONTH, 1); String start_date_str =
	 * sdf.format(cal1.getTime());
	 * 
	 * if(scheme == null){
	 * scheme="Aditya Birla Sun Life Balanced Advantage Fund - Regular Plan - Growth Option"
	 * ;} if(start_date == null){start_date=start_date_str;} if(period ==
	 * null){period="3 Year";}
	 * 
	 * scheme = scheme.trim(); start_date = start_date.trim(); period =
	 * period.trim();
	 * 
	 * //System.out.println("scheme = " + scheme);
	 * //System.out.println("start_date = " + start_date);
	 * //System.out.println("period = " + period);
	 * 
	 * request.setAttribute("scheme", scheme); request.setAttribute("start_date",
	 * start_date); request.setAttribute("period", period);
	 * 
	 * 
	 * request.setAttribute("menu", "Rolling Return");
	 * request.setAttribute("submenu", "Rolling Return vs Sensex");
	 * 
	 * request.setAttribute("jsp",
	 * "../amfi/mutual-fund-rolling-returns-comparison-with-gold-and-sensex.jsp"); }
	 * catch (Exception ex) { ex.printStackTrace(); } return "layout/layout"; }
	 */
	
	
	
	
	@RequestMapping(value="/mutual-fund-rolling-returns-comparison-with-gold-and-sensex")
	public String mutualfund_rolling_returns_comparison_gold_sensex(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		try 
		{	     	
			String scheme = request.getParameter("scheme");
			String start_date = request.getParameter("start_date");
			String period = request.getParameter("period");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Calendar cal1 = Calendar.getInstance();
            cal1.add(Calendar.DATE, -1);
			cal1.add(Calendar.YEAR, -5);
			cal1.add(Calendar.MONTH, 1);
			String start_date_str = sdf.format(cal1.getTime());
			
			if(scheme == null || scheme.isEmpty()) {
		     	HashMap<String, String> hashMap = new HashMap<String, String>();
	       	    hashMap.put("scheme_code", "103166");  
		 		String formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSchemeShortNameBySchemeCode, hashMap);
		 		String result = HttpPost.SendHttpPost(formattedUrl);
		 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
		 		SchemeShortNameByCodeResponse obj = gson.fromJson(result, SchemeShortNameByCodeResponse.class);
		 		scheme = obj.getScheme_name();
	        }
			
			//if(scheme == null){scheme="Aditya Birla Sun Life Balanced Advantage Fund - Regular Plan - Growth Option";}
			if(start_date == null){start_date=start_date_str;}
			if(period == null){period="3 Year";}
			
			scheme = scheme.trim();
			start_date = start_date.trim();
			period = period.trim();
			
			request.setAttribute("scheme", scheme);
			request.setAttribute("start_date", start_date);
			request.setAttribute("period", period);
	     	
			request.setAttribute("page", "mutual-funds-research");
			request.setAttribute("menu", "Rolling Return");
	     	request.setAttribute("submenu", "Rolling Return vs Sensex");
	     	
	     	request.setAttribute("jsp", "../amfi/mutual-fund-rolling-returns-comparison-with-gold-and-sensex.jsp");
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
	@RequestMapping(value="/getMutualFundRollingReturnsComparison")
	public void getMFRollingReturnsComparison(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("application/json");
		Gson gson = new Gson();
		
		try 
		{
			String scheme = request.getParameter("scheme");
			String start_date = request.getParameter("start_date");
			String period = request.getParameter("period");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Calendar cal1 = Calendar.getInstance();
            cal1.add(Calendar.DATE, -1);
			cal1.add(Calendar.YEAR, -5);
			cal1.add(Calendar.MONTH, 1);
			String start_date_str = sdf.format(cal1.getTime());
			
			if(scheme == null || scheme.isBlank()){scheme="HDFC Equity Fund - Growth Option";}
			if(start_date == null || start_date.isBlank() || !start_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){start_date=start_date_str;}
			if(period == null || period.isBlank() ){period="3 Year";}
			
			scheme = scheme.trim();
			start_date = start_date.trim();
			period = period.trim();
			
			scheme = URLDecoder.decode(scheme, "UTF-8");
			
			HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("scheme", scheme);
            hashMap.put("start_date", start_date);
            hashMap.put("period", period);
	     	
            String formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getRollingReturnsVsSensexAndGold, hashMap);
            
            String result = HttpPost.SendHttpPost(formattedUrl);
	 		gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		RollingReturnsVsSensexAndGoldAPIResponse list = gson.fromJson(result, RollingReturnsVsSensexAndGoldAPIResponse.class);
			List<List<SchemeRollingReturns>> rollingReturnsResponse = list.getList();
			
			gson = new Gson();
			writer.print(gson.toJson(rollingReturnsResponse));
		    writer.close();
		    return;
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/mutual-fund-portfolio-overlap")
	public String mutual_funds_portfolio_overlap(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		try 
		{
			
			
			String category = request.getParameter("category");
			String schemes = request.getParameter("schemes");
			
			List<String> fund_schems = new ArrayList<String>();
			if(schemes == null || schemes.isEmpty()) {
				HashMap<String, String> hashMap = new HashMap<String, String>();
				hashMap.put("scheme_code", "149167");  
				String formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSchemeShortNameBySchemeCode, hashMap);
				String result = HttpPost.SendHttpPost(formattedUrl);
				Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
				SchemeShortNameByCodeResponse obj = gson.fromJson(result, SchemeShortNameByCodeResponse.class);
				fund_schems.add(obj.getScheme_name());
				hashMap = new HashMap<String, String>();
				hashMap.put("scheme_code", "101764");  
				formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSchemeShortNameBySchemeCode, hashMap);
				result = HttpPost.SendHttpPost(formattedUrl);
				gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
				obj = gson.fromJson(result, SchemeShortNameByCodeResponse.class);
				fund_schems.add(obj.getScheme_name());
				
				 schemes = String.join(",", fund_schems);
				
			}
			
			if(category == null || StringHelper.isEmpty(category)){category="Equity: Value";}
			//if(schemes == null || StringHelper.isEmpty(schemes)){schemes="Axis Value Fund - Regular Plan - Growth,HDFC Value Fund - Growth Plan";}
			
			
			
			
			category = category.trim();
			schemes = schemes.trim();
			
			request.setAttribute("category", category);
			request.setAttribute("schemes", schemes);

			List<String> scheme_array = new ArrayList<String>(Arrays.asList(schemes.split(",")));
			request.setAttribute("scheme_array", scheme_array);
			
			String scheme1 = "";
			String scheme2 = "";
			if(scheme_array.size() > 1)
			{
				scheme1 = scheme_array.get(0);
				scheme2 = scheme_array.get(1);
				request.setAttribute("scheme1", scheme1);
				request.setAttribute("scheme2", scheme2);
			}
			
			String formattedUrl, result = "";
			
			HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("amc", "All");
	     	
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllSchemeCategoriesByAmc, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		MutualFundAPIResponse list = new Gson().fromJson(result, MutualFundAPIResponse.class);
	     	request.setAttribute("schemeCategories", list.getList());
			
	     	hashMap = new HashMap<String, String>();
            hashMap.put("category", category);
            hashMap.put("scheme1", scheme1);
            hashMap.put("scheme2", scheme2);
	     	
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getMutualfundPortfolioOverlap, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		MutualFundPortfolioOverlapRseponse master_list = new Gson().fromJson(result, MutualFundPortfolioOverlapRseponse.class);
	     	
	     	request.setAttribute("scheme1_common_stocks", master_list.getScheme1_common_stocks());
	     	request.setAttribute("scheme2_common_stocks", master_list.getScheme2_common_stocks());
	     	request.setAttribute("scheme1_uncommon_stocks", master_list.getScheme1_uncommon_stocks());
	     	request.setAttribute("scheme2_uncommon_stocks", master_list.getScheme2_uncommon_stocks());
	     	request.setAttribute("scheme1_portfolio_overlap", master_list.getScheme1_portfolio_overlap());
	     	request.setAttribute("scheme2_portfolio_overlap", master_list.getScheme2_portfolio_overlap());
	     	request.setAttribute("average_portfolio_overlap", master_list.getAverage_portfolio_overlap());
	     	request.setAttribute("no_portfolio_overlap", master_list.getNo_portfolio_overlap());
	     	request.setAttribute("no_of_common_stocks", master_list.getNo_of_common_stocks());
	     	request.setAttribute("no_of_uncommon_stocks_scheme1", master_list.getNo_of_uncommon_stocks_scheme1());
	     	request.setAttribute("no_of_uncommon_stocks_scheme2", master_list.getNo_of_uncommon_stocks_scheme2());
	     	request.setAttribute("portfolio_date", master_list.getPortfolio_date());
	     	
	     	
			request.setAttribute("menu", "Advance Tools");
	     	request.setAttribute("submenu", "Mutual Fund Portfolio Overlap");
	     	
	     	request.setAttribute("jsp", "../amfi/mutual-fund-portfolio-overlap.jsp");
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
	@RequestMapping(value="/getMutualFundRollingReturnVsBenchmark")
	public void getMutualFundRollingReturnVsBenchmark(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("application/json");
		Gson gson = new Gson();
		
		try 
		{
			String category = request.getParameter("category");
			String schemes = request.getParameter("schemes");
			String start_date = request.getParameter("start_date");
			String period = request.getParameter("period");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Calendar cal1 = Calendar.getInstance();
            cal1.add(Calendar.DATE, -1);
			cal1.add(Calendar.YEAR, -5);
			cal1.add(Calendar.MONTH, 1);
			String start_date_str = sdf.format(cal1.getTime());
			
			if(category == null || StringHelper.isEmpty(category)){category="Equity: Large Cap";}
			if(schemes == null || StringHelper.isEmpty(schemes)){schemes="ICICI Prudential Bluechip Fund - Growth";}
			if(start_date == null || StringHelper.isEmpty(start_date) || !start_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){start_date=start_date_str;}
			if(period == null || StringHelper.isEmpty(period)){period="3 Year";}
			
			category = category.trim();
			schemes = schemes.trim();
			start_date = start_date.trim();
			period = period.trim();
			
			schemes = URLDecoder.decode(schemes, "UTF-8");
			
			String formattedUrl, result = "";
			
			HashMap<String, String> hashMap = new HashMap<String, String>();
//			hashMap = new HashMap<String, String>();
//			hashMap.put("scheme", schemes);
//			formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getMutualFundSchemeMappingShrtName, hashMap);
//			result = HTTPPost.SendHttpPost(formattedUrl);
//			MutualFundAPIResponse listShrtName = new Gson().fromJson(result, MutualFundAPIResponse.class);
//			List<String> fund_list = listShrtName.getList();
//			
//			String fund_final_list = fund_list.toString();
//			fund_final_list = fund_final_list.replace("[", "").replace("]", "");	  	  
//			fund_final_list = fund_final_list.replace(", ", ",");
			
			
	     	hashMap.put("category", category);
            hashMap.put("schemes", schemes);
            hashMap.put("start_date", start_date);
            hashMap.put("period", period+" Year");
	     	
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getRollingReturnsVsBenchmarkMultipleSchemes, hashMap);
           // System.out.println("formattedUrl-->"+formattedUrl);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		//System.out.println("result-->"+result);
	 		//gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		RollingReturnsMultipleSchemesAPIResponse list = new GsonBuilder().setDateFormat("dd-MM-yyyy").create().fromJson(result, RollingReturnsMultipleSchemesAPIResponse.class);
			List<List<SchemeRollingReturns>> rollingReturnsResponse = list.getList();
			
			writer.print(gson.toJson(rollingReturnsResponse));
		    writer.close();
		    return;
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/mutual-fund-swp-investment-calculator")
	public String swp_calculator(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
    	try 
   		{
    		String amc = request.getParameter("amc");
            String scheme_name = request.getParameter("scheme_name");
            String initial_amount = request.getParameter("intial_amount");
            String swp_date = request.getParameter("swp_date");
            String withdrawal_amount = request.getParameter("withdrawal_amount");
            String period = request.getParameter("period");
            String from_date = request.getParameter("from_date");
            String to_date = request.getParameter("to_date");
            String init_start_date = request.getParameter("init_start_date");
            String scheme = scheme_name;
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Calendar cal1 = Calendar.getInstance();
            cal1.add(Calendar.DATE, -1);
            String end_date_str = sdf.format(cal1.getTime());
            
            if(scheme_name == null || scheme_name.isEmpty()) {
		     	HashMap<String, String> hashMap = new HashMap<String, String>();
	       	    hashMap.put("scheme_code", "100639");  
		 		String formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSchemeShortNameBySchemeCode, hashMap);
		 		String result = HttpPost.SendHttpPost(formattedUrl);
		 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
		 		SchemeShortNameByCodeResponse obj = gson.fromJson(result, SchemeShortNameByCodeResponse.class);
		 		scheme_name = obj.getScheme_name();
	        }
            
            if(scheme == null || scheme.isEmpty()) {
		     	HashMap<String, String> hashMap = new HashMap<String, String>();
	       	    hashMap.put("scheme_code", "100639");  
		 		String formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSchemeShortNameBySchemeCode, hashMap);
		 		String result = HttpPost.SendHttpPost(formattedUrl);
		 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
		 		SchemeShortNameByCodeResponse obj = gson.fromJson(result, SchemeShortNameByCodeResponse.class);
		 		scheme = obj.getScheme_name();
	        }
            
			if(amc == null || StringHelper.isEmpty(amc)){amc = "SBI Mutual Fund";}
            //if(scheme_name == null || StringHelper.isEmpty(scheme_name)){scheme_name = "SBI Magnum Income Fund-Regular Plan-Growth";}
            //if(scheme == null || StringHelper.isEmpty(scheme)){scheme = "SBI Magnum Income Fund-Regular Plan-Growth";}
            if(initial_amount == null || StringHelper.isEmpty(initial_amount) || !initial_amount.matches("[0-9]+")){initial_amount = "1000000";}
            if(swp_date == null || StringHelper.isEmpty(swp_date) || !swp_date.matches("[0-9]+")){swp_date = "10";}
            if(withdrawal_amount == null || StringHelper.isEmpty(withdrawal_amount) || !withdrawal_amount.matches("[0-9]+")){withdrawal_amount= "3000";}
            if(period == null || StringHelper.isEmpty(period)){period = "Monthly";}
            if(init_start_date == null || StringHelper.isEmpty(init_start_date) || !init_start_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){init_start_date = "20-08-2016";}
            if(from_date == null || StringHelper.isEmpty(from_date) || !from_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){from_date = "20-08-2016";}
	 		if(to_date == null || StringHelper.isEmpty(to_date) || !to_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){to_date = end_date_str;}
            
            amc = amc.trim();
            scheme_name = scheme_name.trim();
            scheme = scheme.trim();
            initial_amount = initial_amount.trim();
            swp_date = swp_date.trim();
            withdrawal_amount = withdrawal_amount.trim();
            period = period.trim();
            from_date = from_date.trim();
            to_date = to_date.trim();
            
            request.setAttribute("amc", amc);
            request.setAttribute("scheme_name", scheme_name);
            request.setAttribute("scheme", scheme);
            request.setAttribute("initial_amount", initial_amount);
            request.setAttribute("swp_date", swp_date);
            request.setAttribute("withdrawal_amount", withdrawal_amount);
            request.setAttribute("period", period);
            request.setAttribute("from_date", from_date);
            request.setAttribute("to_date", to_date);
            request.setAttribute("init_start_date", init_start_date);
			
            String formattedUrl, result = "";
            
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllCompanies, new HashMap<String, String>());
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		MutualFundAPIResponse mutualFundAPIResponse = new Gson().fromJson(result, MutualFundAPIResponse.class);
	     	request.setAttribute("amcCompanies", mutualFundAPIResponse.getList());
	     	
	     	HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("amc", amc);
	     	
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSchemeByAmcApi, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		SchemeByAmcAPIResponse schemes_list = new Gson().fromJson(result, SchemeByAmcAPIResponse.class);
	     	request.setAttribute("schemes", schemes_list.getSchemes_list());
	 		
	     	hashMap = new HashMap<String, String>();
            hashMap.put("amc", amc);
            hashMap.put("scheme_name", scheme_name);
            hashMap.put("initial_amount", initial_amount);
            hashMap.put("withdrawal_amount", withdrawal_amount);
            hashMap.put("period", period);
            hashMap.put("from_date", from_date);
            hashMap.put("to_date", to_date);
            hashMap.put("swp_date", swp_date);
            hashMap.put("init_start_date", init_start_date);
	     	
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSWPReturnCalculator, hashMap);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		SWPReturnsCalculatorAPIResponse list = gson.fromJson(result, SWPReturnsCalculatorAPIResponse.class);
	     	
	     	request.setAttribute("transfer_out_count", list.getScheme_installment());
	     	request.setAttribute("total_amount_transferred", list.getScheme_total_withdrawal_amount());
	     	request.setAttribute("total_lumpsum_amount", list.getScheme_investment_amount());
	     	request.setAttribute("from_remain_units", list.getScheme_remaining_units());
	     	request.setAttribute("from_current_value", list.getScheme_current_value());
	     	request.setAttribute("from_profit", list.getScheme_profit());
	     	request.setAttribute("from_returns", list.getScheme_returns());
	     	request.setAttribute("from_scheme_list", list.getScheme_list());
	     	request.setAttribute("from_nav_date", list.getScheme_current_value_date());
	     	
	     	request.setAttribute("date_list", gson.toJson(list.getDate_list()));
        	request.setAttribute("cumulative_withdrawal", gson.toJson(list.getCumulative_withdrawal()));
        	request.setAttribute("current_value_graph", gson.toJson(list.getCurrent_value_graph()));
        	
	     	formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getHomePageSIPNavDate, new HashMap<String, String>());
		 	result = HttpPost.SendHttpPost(formattedUrl);
		 	ApiCommonResponse apiCommonResponse = new Gson().fromJson(result, ApiCommonResponse.class);	 		
		    request.setAttribute("nav_date", apiCommonResponse.getNav_date());
	     	
	     	
	     	request.setAttribute("menu", "STP And SWP Return");
	     	request.setAttribute("submenu", "Mutual Fund Investment SWP Calculator");
	     	
	     	request.setAttribute("jsp", "../amfi/swp-calculator.jsp");
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
    	return "layout/layout";
	}
	
	@RequestMapping(value="/rolling-return-vs-benchmark")
	public String rolling_return_vs_benchmark(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		try 
		{	
			String scheme = request.getParameter("scheme");
			String start_date = request.getParameter("start_date");
			String period = request.getParameter("period");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Calendar cal1 = Calendar.getInstance();
            cal1.add(Calendar.DATE, -1);
			cal1.add(Calendar.YEAR, -5);
			cal1.add(Calendar.MONTH, 1);
			String start_date_str = sdf.format(cal1.getTime());
			
			
			if(scheme == null || scheme.isEmpty()) {
		     	HashMap<String, String> hashMap = new HashMap<String, String>();
	       	    hashMap.put("scheme_code", "103166");  
		 		String formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSchemeShortNameBySchemeCode, hashMap);
		 		String result = HttpPost.SendHttpPost(formattedUrl);
		 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
		 		SchemeShortNameByCodeResponse obj = gson.fromJson(result, SchemeShortNameByCodeResponse.class);
		 		scheme = obj.getScheme_name();
	        }
			
			
			//if(scheme == null || scheme.isBlank()){scheme="ICICI Prudential Bluechip Fund - Growth";}
			if(start_date == null || start_date.isBlank()){start_date=start_date_str;}
			if(period == null || period.isBlank()){period="3";}
			
			scheme = scheme.trim();
			start_date = start_date.trim();
			period = period.trim();
			
			request.setAttribute("scheme", scheme);
			request.setAttribute("start_date", start_date);
			request.setAttribute("period", period);
	     	
			request.setAttribute("page", "mutual-funds-research");
			request.setAttribute("menu", "Rolling Return");
	     	request.setAttribute("submenu", "Rolling Return vs Benchmark");
	     	
	     	request.setAttribute("jsp", "../amfi/rolling-return-vs-benchmark.jsp");
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
	@RequestMapping(value="/getRollingReturnVsBenchmark")
	public void getRollingReturnVsBenchmark(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		PrintWriter writer = response.getWriter();
		response.setContentType("application/json");
		Gson gson = new Gson();
		
		try 
		{
			String scheme = request.getParameter("scheme");
			String start_date = request.getParameter("start_date");
			String period = request.getParameter("period");
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            Calendar cal1 = Calendar.getInstance();
            cal1.add(Calendar.DATE, -1);
			cal1.add(Calendar.YEAR, -5);
			cal1.add(Calendar.MONTH, 1);
			String start_date_str = sdf.format(cal1.getTime());
			
			if(scheme == null || scheme.isBlank()){scheme="ICICI Prudential Multicap Fund - Growth";}
			if(start_date == null || start_date.isBlank() || !start_date.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")){start_date=start_date_str;}
			if(period == null || period.isBlank() || !period.matches("[0-9]+")){period="3";}
			
			scheme = scheme.trim();
			start_date = start_date.trim();
			period = period.trim();
			
			scheme = URLDecoder.decode(scheme, "UTF-8");
			HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("scheme_name", scheme);
            hashMap.put("start_date", start_date);
            hashMap.put("period", period+" Year");
			
			String formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getRollingReturnsVsBenchmark, hashMap);
			//System.out.println("formattedUrl->"+formattedUrl);
			String result = HttpPost.SendHttpPost(formattedUrl);
	 		gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
	 		RollingReturnsMultipleSchemesAPIResponse list = gson.fromJson(result, RollingReturnsMultipleSchemesAPIResponse.class);
			List<List<SchemeRollingReturns>> rollingReturnsResponse = list.getList();	
			gson = new Gson();
			writer.print(gson.toJson(rollingReturnsResponse));
		    writer.close();
		    return;
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/best-performing-mutual-funds")
	public String bestperformingmutualfunds(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		try 
		{
			Map<String, String> breadCrumbsMap = new LinkedHashMap<String, String>();
			breadCrumbsMap.put("Home", "/");
			breadCrumbsMap.put("Mutual Funds Research", "/mutual-funds-research");
			breadCrumbsMap.put("Mutual Fund Selector", "");
			request.setAttribute("breadCrumbsMap", breadCrumbsMap);
			
			
			request.setAttribute("menu", "Performance");
	     	request.setAttribute("submenu", "Best Performing Mutual Funds");
	     	request.setAttribute("jsp", "../amfi/fund-performance.jsp");
	     	
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
}
