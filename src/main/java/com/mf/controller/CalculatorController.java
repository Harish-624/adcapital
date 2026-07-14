package com.mf.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.protocol.HTTP;
import org.hibernate.internal.util.StringHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.mf.amfi.response.ApiCalculatorAssetAllocation;
import com.mf.amfi.response.ApiCalculatorCompositePlanner;
import com.mf.amfi.response.ApiCalculatorCompounding;
import com.mf.amfi.response.ApiCalculatorEPF;
import com.mf.amfi.response.ApiCalculatorEPFTable;
import com.mf.amfi.response.ApiCalculatorEducationPlanner;
import com.mf.amfi.response.ApiCalculatorGoalBasedTopupSIP;
import com.mf.amfi.response.ApiCalculatorGoalSetting;
import com.mf.amfi.response.ApiCalculatorHumanLifeValue;
import com.mf.amfi.response.ApiCalculatorLumpsum;
import com.mf.amfi.response.ApiCalculatorNetworth;
import com.mf.amfi.response.ApiCalculatorPPF;
import com.mf.amfi.response.ApiCalculatorPPFTable;
import com.mf.amfi.response.MutualFundSchemeAPIResponse;
import com.mf.response.ApiCalculatorCrorepati;
import com.mf.response.ApiCalculatorEMI;
import com.mf.response.ApiCalculatorFutureValue;
import com.mf.response.ApiCalculatorLumpsumTarget;
import com.mf.response.ApiCalculatorSIP;
import com.mf.response.ApiCalculatorSIPStepUp;
import com.mf.response.ApiCalculatorSIPStepUpTable;
import com.mf.response.ApiCalculatorSpendingLess;
import com.mf.response.ApiCalculatorTargetAmountSIPCalc;
import com.mf.utils.HttpPost;
import com.mf.utils.MfApiAccessor;
import com.mf.utils.MfApiUrls;
import com.mf.utils.StatusCodesAndMessages;
import com.mf.utils.StatusMessage;
import com.mf.utils.Utils;
import com.mf.utils.ESAPIValidator;

@Controller
public class CalculatorController {
	
	@RequestMapping(value="/tools-and-calculators/become-a-crorepati")
   	public String crorepati2(HttpServletRequest request, HttpServletResponse response) 
   	{
		try 
   		{
			String current_age = request.getParameter("current_age");
	     	String retirement_age = request.getParameter("retirement_age");
            String wealth_amount = request.getParameter("wealth_amount");
            String inflation_rate = request.getParameter("inflation_rate");
            String expected_return = request.getParameter("expected_return");
            String savings_amount = request.getParameter("savings_amount");
            
            if(current_age == null || StringHelper.isEmpty(current_age)){current_age = "30";}
            if(retirement_age == null || StringHelper.isEmpty(retirement_age)){retirement_age = "60";}
            if(wealth_amount == null || StringHelper.isEmpty(wealth_amount)){wealth_amount = "50000000";}
            if(inflation_rate == null || StringHelper.isEmpty(inflation_rate)){inflation_rate = "5.0";}
            if(expected_return == null || StringHelper.isEmpty(expected_return)){expected_return = "12";}
            if(savings_amount == null || StringHelper.isEmpty(savings_amount)){savings_amount = "2500000";}
                     
            current_age = current_age.trim();
            retirement_age = retirement_age.trim();
            wealth_amount = wealth_amount.trim();
            inflation_rate = inflation_rate.trim();
            expected_return = expected_return.trim();
            savings_amount = savings_amount.trim();
			
			request.setAttribute("current_age", current_age);
			request.setAttribute("retirement_age", retirement_age);
			request.setAttribute("wealth_amount", wealth_amount);
			request.setAttribute("inflation_rate", inflation_rate);
			request.setAttribute("expected_return", expected_return);
			request.setAttribute("savings_amount", savings_amount);
			
			request.setAttribute("page", "tcalc");
			request.setAttribute("menu", "Become A Crorepati");
			request.setAttribute("jsp", "../calculator/become-crorepati.jsp");
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
		
		return "layout/layout";
   	}
	
	@RequestMapping(value="/tools-and-calculators/getCrorepatiResult")
	public void getSIPReturnCalculator(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		PrintWriter writer = null;		
		Gson gson = null;
		String origin = null;
		ApiCalculatorCrorepati finalResult = null;
		String apiresponse = "";
		
		try 
		{	
			writer = response.getWriter();
			gson = new Gson();
			response.setContentType("text/html");
			origin = request.getHeader("Origin");
			if(origin == null){origin="";}
			
			finalResult = new ApiCalculatorCrorepati();
			
			String current_age = request.getParameter("current_age");
	     	String retirement_age = request.getParameter("retirement_age");
            String wealth_amount = request.getParameter("wealth_amount");
            String inflation_rate = request.getParameter("inflation_rate");
            String expected_return = request.getParameter("expected_return");
            String savings_amount = request.getParameter("savings_amount");
            
			if(current_age == null || StringHelper.isEmpty(current_age)){current_age = "";}
            if(retirement_age == null || StringHelper.isEmpty(retirement_age)){retirement_age = "";}
            if(wealth_amount == null || StringHelper.isEmpty(wealth_amount)){wealth_amount = "";}
            if(inflation_rate == null || StringHelper.isEmpty(inflation_rate)){inflation_rate = "";}
            if(expected_return == null || StringHelper.isEmpty(expected_return)){expected_return = "";}
            if(savings_amount == null || StringHelper.isEmpty(savings_amount)){savings_amount = "";}
            
            current_age = current_age.trim();
            retirement_age = retirement_age.trim();
            wealth_amount = wealth_amount.trim();
            inflation_rate = inflation_rate.trim();
            expected_return = expected_return.trim();
            savings_amount = savings_amount.trim();
            
            
            /*ESAPI VALIDATION*/
			String[][] param_and_pattern = {{current_age,"SafeString"},{retirement_age,"SafeString"},{wealth_amount,"SafeString"},{inflation_rate,"SafeString"},{expected_return,"SafeString"},{savings_amount,"SafeString"}};
			
			int invalid_index_para = ESAPIValidator.isValidParameters(param_and_pattern); 
			
			if(invalid_index_para > -1) 
			{
				//String apiresponse = "";
				String[] parameters_name = {"current_age","retirement_age","wealth_amount","inflation_rate","expected_return","savings_amount"};
				String validationErrorMsg = "Invalid "+parameters_name[invalid_index_para];
				finalResult.setStatus(StatusMessage.SuccessCode);
				finalResult.setStatus_msg(StatusMessage.SuccessMessage);
				finalResult.setMsg(validationErrorMsg);
				apiresponse = gson.toJson(finalResult);                                       
				writer.print(apiresponse);/*Esapi FailureResponse*/
				writer.close();
				return;
			}
			/*ESAPI VALIDATION*/
            
            HashMap<String, String> hashMap = new HashMap<String, String>();
	 		hashMap.put("current_age", current_age);
	 		hashMap.put("retirement_age", retirement_age);
	 		hashMap.put("wealth_amount", wealth_amount);
	 		hashMap.put("inflation_rate",inflation_rate);
	 		hashMap.put("expected_return",expected_return);
	 		hashMap.put("savings_amount",savings_amount);
	 		
	 		String formattedUrl, result = "";
	 		 
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getCrorepatiResult, hashMap);
	 		//System.out.println("formattedUrl-->"+formattedUrl);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		//System.out.println("result-->"+result);
	 		ApiCalculatorCrorepati apiCalculatorCrorepati = new Gson().fromJson(result, ApiCalculatorCrorepati.class); 		

	 		finalResult.setStatus(StatusCodesAndMessages.SuccessCode);
	 		finalResult.setStatus_msg(StatusCodesAndMessages.SuccessMessage);
	 		finalResult.setMsg(StatusCodesAndMessages.SuccessMessage);
	 		finalResult.setCurrent_age(apiCalculatorCrorepati.getCurrent_age()); 		
	 		finalResult.setRetirement_age(apiCalculatorCrorepati.getRetirement_age());
	 		finalResult.setWealth_amount(apiCalculatorCrorepati.getWealth_amount());
	 		finalResult.setInflation_rate(apiCalculatorCrorepati.getInflation_rate());
	 		finalResult.setExpected_return(apiCalculatorCrorepati.getExpected_return());
	 		finalResult.setSavings_amount(apiCalculatorCrorepati.getSavings_amount());
	 		finalResult.setTarget_wealth(apiCalculatorCrorepati.getTarget_wealth());
	 		finalResult.setTarget_savings(apiCalculatorCrorepati.getTarget_savings());
	 		finalResult.setTarget_amount(apiCalculatorCrorepati.getTarget_amount());
	 		finalResult.setYears(apiCalculatorCrorepati.getYears());
	 		finalResult.setMonthly_savings(apiCalculatorCrorepati.getMonthly_savings());
	 		finalResult.setInvested_amount(apiCalculatorCrorepati.getInvested_amount());
	 		finalResult.setTotal_earnings(apiCalculatorCrorepati.getTotal_earnings());
        	
            apiresponse = gson.toJson(finalResult);
    		writer.print(apiresponse);
		    writer.close();
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="/tools-and-calculators/systematic-investment-plan-calculator")
   	public String sipCalculator(HttpServletRequest request, HttpServletResponse response) 
   	{
       	try 
   		{	 		
	 		String sip_amount = request.getParameter("sip_amount");
	     	String interest_rate = request.getParameter("interest_rate");
            String period = request.getParameter("period");
            
			if(sip_amount == null || StringHelper.isEmpty(sip_amount)){sip_amount = "25000";}
            if(interest_rate == null || StringHelper.isEmpty(interest_rate)){interest_rate = "12.5";}
            if(period == null || StringHelper.isEmpty(period)){period = "120";}
            
            sip_amount = sip_amount.trim();
            interest_rate = interest_rate.trim();
            period = period.trim();
	 		
			request.setAttribute("sip_amount", sip_amount);
			request.setAttribute("interest_rate", interest_rate);
			request.setAttribute("period", period);
			request.setAttribute("page", "tcalc");
			request.setAttribute("menu", "SIP Calculator");
			request.setAttribute("jsp", "../calculator/sip-calculator.jsp");

   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
       	return "layout/layout";
   	}
	
	@RequestMapping(value="/tools-and-calculators/target-amount-sip-calculator")
	public String target_amount_sip_calculator(HttpServletRequest request, HttpServletResponse response) 
	{
    	try 
		{
 	 		String wealth_amount = request.getParameter("wealth_amount");
            String inflation_rate = request.getParameter("inflation_rate");
            String expected_return = request.getParameter("expected_return");
            String period = request.getParameter("period");
             
            if(wealth_amount == null || StringHelper.isEmpty(wealth_amount)){wealth_amount = "2500000";}
            if(inflation_rate == null || StringHelper.isEmpty(inflation_rate)){inflation_rate = "5";}
            if(expected_return == null || StringHelper.isEmpty(expected_return)){expected_return = "12";}
            if(period == null || StringHelper.isEmpty(period)){period = "30";}
             
            wealth_amount = wealth_amount.trim();
            inflation_rate = inflation_rate.trim();
            expected_return = expected_return.trim();
            period = period.trim();
 			
 			request.setAttribute("wealth_amount", wealth_amount);
 			request.setAttribute("inflation_rate", inflation_rate);
 			request.setAttribute("expected_return", expected_return);
 			request.setAttribute("period", period);
 			
 			request.setAttribute("menu", "target-amount-sip-calculator");
 			request.setAttribute("calculator", "target-amount-sip-calculator");
 			
 			request.setAttribute("page", "tools-calculators");
			request.setAttribute("subpage", "target-amount-sip-calculator");		
			request.setAttribute("jsp", "../calculator/target-amount-sip-calculator.jsp");
		}
    	catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	return "layout/layout";
	}
	
	@RequestMapping(value="/tools-and-calculators/getTargetAmountSIPCalcResult")
	public void getTargetAmountSIPCalcResult(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		PrintWriter writer = null;		
		Gson gson = null;
		String origin = null;
		ApiCalculatorTargetAmountSIPCalc finalResult = null;
		String apiresponse = "";
		
		try 
		{	
			writer = response.getWriter();
			gson = new Gson();
			response.setContentType("text/html");
			origin = request.getHeader("Origin");
			if(origin == null){origin="";}
			finalResult = new ApiCalculatorTargetAmountSIPCalc();
			
			String wealth_amount = request.getParameter("wealth_amount");
            String inflation_rate = request.getParameter("inflation_rate");
            String expected_return = request.getParameter("expected_return");
            String period = request.getParameter("period");
            
            if(wealth_amount == null || StringHelper.isEmpty(wealth_amount)){wealth_amount = "";}
            if(inflation_rate == null || StringHelper.isEmpty(inflation_rate)){inflation_rate = "";}
            if(expected_return == null || StringHelper.isEmpty(expected_return)){expected_return = "";}
            if(period == null || StringHelper.isEmpty(period)){period = "";}
            
            wealth_amount = wealth_amount.trim();
            inflation_rate = inflation_rate.trim();
            expected_return = expected_return.trim();
            period = period.trim();
			
            
            /*ESAPI VALIDATION*/
			String[][] param_and_pattern = {{wealth_amount,"SafeString"},{inflation_rate,"SafeString"},{expected_return,"SafeString"},{period,"SafeString"}};
			
			int invalid_index_para = ESAPIValidator.isValidParameters(param_and_pattern); 
			
			if(invalid_index_para > -1) 
			{
				//String apiresponse = "";
				String[] parameters_name = {"wealth_amount","inflation_rate","expected_return","period"};
				String validationErrorMsg = "Invalid "+parameters_name[invalid_index_para];
				finalResult.setStatus(StatusMessage.SuccessCode);
				finalResult.setStatus_msg(StatusMessage.SuccessMessage);
				finalResult.setMsg(validationErrorMsg);
				apiresponse = gson.toJson(finalResult);                                       
				writer.print(apiresponse);/*Esapi FailureResponse*/
				writer.close();
				return;
			}
			/*ESAPI VALIDATION*/
			
            HashMap<String, String> hashMap = new HashMap<String, String>();
	 		hashMap.put("wealth_amount", wealth_amount);
	 		hashMap.put("inflation_rate", inflation_rate);
	 		hashMap.put("expected_return", expected_return);
	 		hashMap.put("period", period);
	 		
	 		String formattedUrl, result = "";
	 		 
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getTargetAmountSIPCalcResult, hashMap);
	 		//System.out.println("formattedUrl-->"+formattedUrl);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		//System.out.println("result-->"+result);
	 		ApiCalculatorTargetAmountSIPCalc apiCalculatorTargetAmountSIPCalc = new Gson().fromJson(result, ApiCalculatorTargetAmountSIPCalc.class); 	

            
	 		finalResult.setStatus(StatusMessage.SuccessCode);
	 		finalResult.setStatus_msg(StatusMessage.SuccessMessage);
	 		finalResult.setMsg(StatusMessage.SuccessMessage);
	 		finalResult.setWealth_amount(apiCalculatorTargetAmountSIPCalc.getWealth_amount());
	 		finalResult.setInflation_rate(apiCalculatorTargetAmountSIPCalc.getInflation_rate());
	 		finalResult.setExpected_return(apiCalculatorTargetAmountSIPCalc.getExpected_return());
	 		finalResult.setPeriod(apiCalculatorTargetAmountSIPCalc.getPeriod());
	 		finalResult.setTarget_wealth(apiCalculatorTargetAmountSIPCalc.getTarget_wealth());
	 		finalResult.setSip_amount(apiCalculatorTargetAmountSIPCalc.getSip_amount());
	 		finalResult.setInvested_amount(apiCalculatorTargetAmountSIPCalc.getInvested_amount());
	 		finalResult.setGrowth_amount(apiCalculatorTargetAmountSIPCalc.getGrowth_amount());
            
            apiresponse = gson.toJson(finalResult);
    		writer.print(apiresponse);
		    writer.close();
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	 @RequestMapping(value="/tools-and-calculators/getEducationPlannerResult")
		public void getEducationPlannerResult(HttpServletRequest request, HttpServletResponse response) throws IOException
		{
			PrintWriter writer = null;		
			Gson gson = null;
			String origin = null;
			ApiCalculatorEducationPlanner finalResult = null;
			String apiresponse = "";
			
			try 
			{	
				writer = response.getWriter();
				gson = new Gson();
				response.setContentType("text/html");
				origin = request.getHeader("Origin");
				if(origin == null){origin="";}
				finalResult = new ApiCalculatorEducationPlanner();
				
				String child1_name = request.getParameter("child1_name");
		     	String child2_name = request.getParameter("child2_name");
	            String child1_current_age = request.getParameter("child1_current_age");
	            String child2_current_age = request.getParameter("child2_current_age");
	            String child1_education_age = request.getParameter("child1_education_age");
		     	String child2_education_age = request.getParameter("child2_education_age");
	            String child1_education_amount = request.getParameter("child1_education_amount");
	            String child2_education_amount = request.getParameter("child2_education_amount");
	            String inflation_rate = request.getParameter("inflation_rate");
	            String expected_return = request.getParameter("expected_return");
	            String savings_amount = request.getParameter("savings_amount");
	            
				if(child1_name == null || StringHelper.isEmpty(child1_name)){child1_name = "";}
	            if(child2_name == null || StringHelper.isEmpty(child2_name)){child2_name = "";}
	            if(child1_current_age == null || StringHelper.isEmpty(child1_current_age)){child1_current_age = "";}
	            if(child2_current_age == null || StringHelper.isEmpty(child2_current_age)){child2_current_age = "";}
	            if(child1_education_age == null || StringHelper.isEmpty(child1_education_age)){child1_education_age = "";}
	            if(child2_education_age == null || StringHelper.isEmpty(child2_education_age)){child2_education_age = "";}
	            if(child1_education_amount == null || StringHelper.isEmpty(child1_education_amount)){child1_education_amount = "";}
	            if(child2_education_amount == null || StringHelper.isEmpty(child2_education_amount)){child2_education_amount = "";}
	            if(inflation_rate == null || StringHelper.isEmpty(inflation_rate)){inflation_rate = "";}
	            if(expected_return == null || StringHelper.isEmpty(expected_return)){expected_return = "";}
	            if(savings_amount == null || StringHelper.isEmpty(savings_amount)){savings_amount = "";}
	            
	            child1_name = child1_name.trim();
	            child2_name = child2_name.trim();
	            child1_current_age = child1_current_age.trim();
	            child2_current_age = child2_current_age.trim();
	            child1_education_age = child1_education_age.trim();
	            child2_education_age = child2_education_age.trim();
	            child1_education_amount = child1_education_amount.trim();
	            child2_education_amount = child2_education_amount.trim();
	            inflation_rate = inflation_rate.trim();
	            expected_return = expected_return.trim();
	            savings_amount = savings_amount.trim();
	            
	            
	            /*ESAPI VALIDATION*/
				String[][] param_and_pattern = {{child1_name,"SafeString"},{child2_name,"SafeString"},{child1_current_age,"SafeString"},{child2_current_age,"SafeString"},{child1_education_age,"SafeString"},{child2_education_age,"SafeString"},{child1_education_amount,"SafeString"},{child2_education_amount,"SafeString"},{inflation_rate,"SafeString"},{expected_return,"SafeString"},{savings_amount,"SafeString"}};
				
				int invalid_index_para = ESAPIValidator.isValidParameters(param_and_pattern); 
				
				if(invalid_index_para > -1) 
				{
					//String apiresponse = "";
					String[] parameters_name = {"child1_name","child2_name","child1_current_age","child2_current_age","child1_education_age","child2_education_age","child1_education_amount","child2_education_amount","inflation_rate","expected_return","savings_amount"};
					String validationErrorMsg = "Invalid "+parameters_name[invalid_index_para];
					finalResult.setStatus(StatusMessage.SuccessCode);
					finalResult.setStatus_msg(StatusMessage.SuccessMessage);
					finalResult.setMsg(validationErrorMsg);
					apiresponse = gson.toJson(finalResult);                                       
					writer.print(apiresponse);/*Esapi FailureResponse*/
					writer.close();
					return;
				}
				/*ESAPI VALIDATION*/
				
	                        
	            HashMap<String, String> hashMap = new HashMap<String, String>();
		 		hashMap.put("child1_name", child1_name);
		 		hashMap.put("child2_name", child2_name);
		 		hashMap.put("child1_current_age", child1_current_age);
		 		hashMap.put("child2_current_age", child2_current_age);
		 		hashMap.put("child1_education_age", child1_education_age);
		 		hashMap.put("child2_education_age", child1_education_age);
		 		hashMap.put("child1_education_amount", child1_education_amount);
		 		hashMap.put("child2_education_amount", child2_education_amount);
		 		hashMap.put("inflation_rate", inflation_rate);
		 		hashMap.put("expected_return", expected_return);
		 		hashMap.put("savings_amount", savings_amount);
		 		
		 		
		 		String formattedUrl, result = "";
		 		 
		 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getEducationPlannerResult, hashMap);
		 		//System.out.println("formattedUrl-->"+formattedUrl);
		 		result = HttpPost.SendHttpPost(formattedUrl);
		 		//System.out.println("result-->"+result);
		 		ApiCalculatorEducationPlanner apiCalculatorEducationPlanner = new Gson().fromJson(result, ApiCalculatorEducationPlanner.class); 	
	            
		 		finalResult.setStatus(StatusCodesAndMessages.SuccessCode);
		 		finalResult.setStatus_msg(StatusCodesAndMessages.SuccessMessage);
		 		finalResult.setMsg(StatusCodesAndMessages.SuccessMessage);
		 		finalResult.setChild1_name(apiCalculatorEducationPlanner.getChild1_name());
		 		finalResult.setChild2_name(apiCalculatorEducationPlanner.getChild2_name());
		 		finalResult.setChild1_current_age(apiCalculatorEducationPlanner.getChild1_current_age());
		 		finalResult.setChild2_current_age(apiCalculatorEducationPlanner.getChild2_current_age());
		 		finalResult.setChild1_education_age(apiCalculatorEducationPlanner.getChild1_education_age());
		 		finalResult.setChild2_education_age(apiCalculatorEducationPlanner.getChild2_education_age());
		 		finalResult.setChild1_education_amount(apiCalculatorEducationPlanner.getChild1_education_amount());
		 		finalResult.setChild2_education_amount(apiCalculatorEducationPlanner.getChild2_education_amount());
		 		finalResult.setInflation_rate(apiCalculatorEducationPlanner.getInflation_rate());
		 		finalResult.setExpected_return(apiCalculatorEducationPlanner.getExpected_return());
		 		finalResult.setSavings_amount(apiCalculatorEducationPlanner.getSavings_amount());
		 		finalResult.setTotal_education_amount(apiCalculatorEducationPlanner.getTotal_education_amount());
		 		finalResult.setChild1_prof_education_age(apiCalculatorEducationPlanner.getChild1_prof_education_age());
		 		finalResult.setChild2_prof_education_age(apiCalculatorEducationPlanner.getChild2_prof_education_age());
		 		finalResult.setChild1_inflation_adjust_education_amount(apiCalculatorEducationPlanner.getChild1_inflation_adjust_education_amount());
		 		finalResult.setChild2_inflation_adjust_education_amount(apiCalculatorEducationPlanner.getChild2_inflation_adjust_education_amount());
		 		finalResult.setToal_inflation_adjust_education_amount(apiCalculatorEducationPlanner.getToal_inflation_adjust_education_amount());
		 		finalResult.setChild1_savings_amount(apiCalculatorEducationPlanner.getChild1_savings_amount());
		 		finalResult.setChild2_savings_amount(apiCalculatorEducationPlanner.getChild2_savings_amount());
		 		finalResult.setTotal_savings_amount(apiCalculatorEducationPlanner.getTotal_savings_amount());
		 		finalResult.setChild1_monthly_savings(apiCalculatorEducationPlanner.getChild1_monthly_savings());
		 		finalResult.setChild2_monthly_savings(apiCalculatorEducationPlanner.getChild2_monthly_savings());
		 		finalResult.setTotal_monthly_savings(apiCalculatorEducationPlanner.getTotal_monthly_savings());
	        	
	            apiresponse = gson.toJson(finalResult);
	    		writer.print(apiresponse);
			    writer.close();
			} 
			catch (Exception ex) 
			{
				ex.printStackTrace();
			}
	}
	
	@RequestMapping(value="/tools-and-calculators/getSIPCalcResult")
	public void getSIPCalcResult(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		PrintWriter writer = null;		
		Gson gson = null;
		String origin = null;
		ApiCalculatorSIP finalResult = null;
		String apiresponse = "";
		
		try 
		{	
			writer = response.getWriter();
			gson = new Gson();
			response.setContentType("text/html");
			origin = request.getHeader("Origin");
			if(origin == null){origin="";}
			finalResult = new ApiCalculatorSIP();
			
			String sip_amount = request.getParameter("sip_amount");
	     	String interest_rate = request.getParameter("interest_rate");
            String period = request.getParameter("period");
            
			if(sip_amount == null || StringHelper.isEmpty(sip_amount)){sip_amount = "";}
            if(interest_rate == null || StringHelper.isEmpty(interest_rate)){interest_rate = "";}
            if(period == null || StringHelper.isEmpty(period)){period = "";}
            
            sip_amount = sip_amount.trim();
            interest_rate = interest_rate.trim();
            period = period.trim();
            
            /*ESAPI VALIDATION*/
			String[][] param_and_pattern = {{sip_amount,"SafeString"},{interest_rate,"SafeString"},{period,"SafeString"}};
			
			int invalid_index_para = ESAPIValidator.isValidParameters(param_and_pattern); 
			
			if(invalid_index_para > -1) 
			{
				//String apiresponse = "";
				String[] parameters_name = {"sip_amount","interest_rate","period"};
				String validationErrorMsg = "Invalid "+parameters_name[invalid_index_para];
				finalResult.setStatus(StatusMessage.SuccessCode);
				finalResult.setStatus_msg(StatusMessage.SuccessMessage);
				finalResult.setMsg(validationErrorMsg);
				apiresponse = gson.toJson(finalResult);                                       
				writer.print(apiresponse);/*Esapi FailureResponse*/
				writer.close();
				return;
			}
			/*ESAPI VALIDATION*/
            
            HashMap<String, String> hashMap = new HashMap<String, String>();
	 		hashMap.put("sip_amount", sip_amount);
	 		hashMap.put("interest_rate", interest_rate);
	 		hashMap.put("period", period);
	 		
	 		String formattedUrl, result = "";
	 		 
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSIPCalcResult, hashMap);
	 		//System.out.println("formattedUrl-->"+formattedUrl);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		//System.out.println("result-->"+result);
	 		ApiCalculatorSIP apiCalculatorSIP = new Gson().fromJson(result, ApiCalculatorSIP.class); 	
            
	 		finalResult.setStatus(StatusCodesAndMessages.SuccessCode);
	 		finalResult.setStatus_msg(StatusCodesAndMessages.SuccessMessage);
	 		finalResult.setMsg(StatusCodesAndMessages.SuccessMessage);
	 		finalResult.setSip_amount(apiCalculatorSIP.getSip_amount());
	 		finalResult.setInterest_rate(apiCalculatorSIP.getInterest_rate());
	 		finalResult.setPeriod(apiCalculatorSIP.getPeriod());
	 		finalResult.setInvested_amount(apiCalculatorSIP.getInvested_amount());
	 		finalResult.setGrowth_value(apiCalculatorSIP.getGrowth_value());
	 		finalResult.setMaturity_amount(apiCalculatorSIP.getMaturity_amount());
            
            apiresponse = gson.toJson(finalResult);
    		writer.print(apiresponse);
		    writer.close();
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	
	

		
	@RequestMapping(value="/tools-and-calculators/mutual-fund-sip-calculator-step-up")
	public String mutual_fund_sip_calculator_step_up(HttpServletRequest request, HttpServletResponse response) 
	{
    	try 
		{
 	 		
 	 		String sip_amount = request.getParameter("sip_amount");
 	     	String interest_rate = request.getParameter("interest_rate");
            String period = request.getParameter("period");
            String sip_stepup_value = request.getParameter("sip_stepup_value");
             
 			if(sip_amount == null || StringHelper.isEmpty(sip_amount)){sip_amount = "25000";}
            if(interest_rate == null || StringHelper.isEmpty(interest_rate)){interest_rate = "12.5";}
            if(period == null || StringHelper.isEmpty(period)){period = "120";}
            if(sip_stepup_value == null || StringHelper.isEmpty(sip_stepup_value)){sip_stepup_value = "10";}
             
            sip_amount = sip_amount.trim();
            interest_rate = interest_rate.trim();
            period = period.trim();
            sip_stepup_value = sip_stepup_value.trim();
 			
 			request.setAttribute("sip_amount", sip_amount);
 			request.setAttribute("interest_rate", interest_rate);
 			request.setAttribute("period", period);
 			request.setAttribute("sip_stepup_value", sip_stepup_value);
 			
 			request.setAttribute("page", "tools-calculators");
			request.setAttribute("subpage", "step-up-sip-calculator");		
			request.setAttribute("jsp", "../calculator/step_up_sip_calculator.jsp");
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
		
		return "layout/layout";
	}
	
	@RequestMapping(value="/tools-and-calculators/getSIPCalcStepUpResult")
	public void getSIPCalcStepUpResult(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		PrintWriter writer = null;		
		Gson gson = null;
		String origin = null;
		ApiCalculatorSIPStepUp finalResult = null;
		List<ApiCalculatorSIPStepUpTable> list = null;
		ApiCalculatorSIPStepUpTable sip_table = null;
		String apiresponse = "";
		
		try 
		{	
			writer = response.getWriter();
			gson = new Gson();
			response.setContentType("text/html");
			origin = request.getHeader("Origin");
			if(origin == null){origin="";}
			finalResult = new ApiCalculatorSIPStepUp();
			list = new ArrayList<ApiCalculatorSIPStepUpTable>();
			
			String sip_amount = request.getParameter("sip_amount");
	     	String interest_rate = request.getParameter("interest_rate");
            String period = request.getParameter("period");
            String sip_stepup_value = request.getParameter("sip_stepup_value");
            
			if(sip_amount == null || StringHelper.isEmpty(sip_amount)){sip_amount = "";}
            if(interest_rate == null || StringHelper.isEmpty(interest_rate)){interest_rate = "";}
            if(period == null || StringHelper.isEmpty(period)){period = "";}
            if(sip_stepup_value == null || StringHelper.isEmpty(sip_stepup_value)){sip_stepup_value = "";}
            
            sip_amount = sip_amount.trim();
            interest_rate = interest_rate.trim();
            period = period.trim();
            sip_stepup_value = sip_stepup_value.trim();
            
            
            /*ESAPI VALIDATION*/
			String[][] param_and_pattern = {{sip_amount,"SafeString"},{interest_rate,"SafeString"},{period,"SafeString"},{sip_stepup_value,"SafeString"}};
			
			int invalid_index_para = ESAPIValidator.isValidParameters(param_and_pattern); 
			//System.out.println(invalid_index_para);
			if(invalid_index_para > -1) 
			{
				//String apiresponse = "";
				String[] parameters_name = {"sip_amount","interest_rate","period","sip_stepup_value"};
				String validationErrorMsg = "Invalid "+parameters_name[invalid_index_para];
				finalResult.setStatus(StatusMessage.SuccessCode);
				finalResult.setStatus_msg(StatusMessage.SuccessMessage);
				finalResult.setMsg(validationErrorMsg);
				apiresponse = gson.toJson(finalResult);                                       
				writer.print(apiresponse);/*Esapi FailureResponse*/
				writer.close();
				return;
			}
			/*ESAPI VALIDATION*/
            
            HashMap<String, String> hashMap = new HashMap<String, String>();
	 		hashMap.put("sip_amount", sip_amount);
	 		hashMap.put("interest_rate", interest_rate);
	 		hashMap.put("period", period);
	 		hashMap.put("sip_stepup_value", sip_stepup_value);
	 		
	 		
	 		String formattedUrl, result = "";
	 		 
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getSIPCalcStepUpResult, hashMap);
	 		//System.out.println("formattedUrl-->"+formattedUrl);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		//System.out.println("result-->"+result);
	 		ApiCalculatorSIPStepUp apiCalculatorSIPStepUp = new Gson().fromJson(result, ApiCalculatorSIPStepUp.class); 
            
	 		finalResult.setStatus(StatusMessage.SuccessCode);
	 		finalResult.setStatus_msg(StatusMessage.SuccessMessage);
	 		finalResult.setMsg(StatusMessage.SuccessMessage);
	 		finalResult.setSip_amount(apiCalculatorSIPStepUp.getSip_amount());
	 		finalResult.setInterest_rate(apiCalculatorSIPStepUp.getInterest_rate());
	 		finalResult.setPeriod(apiCalculatorSIPStepUp.getPeriod());
	 		finalResult.setSip_stepup_value(apiCalculatorSIPStepUp.getSip_stepup_value());
	 		finalResult.setInvested_amount(apiCalculatorSIPStepUp.getInvested_amount());
	 		finalResult.setGrowth_value(apiCalculatorSIPStepUp.getGrowth_value());
	 		finalResult.setMaturity_amount(apiCalculatorSIPStepUp.getMaturity_amount());
	 		finalResult.setStepup_invested_amount(apiCalculatorSIPStepUp.getStepup_invested_amount());
	 		finalResult.setStepup_growth_value(apiCalculatorSIPStepUp.getStepup_growth_value());
	 		finalResult.setStepup_maturity_amount(apiCalculatorSIPStepUp.getStepup_maturity_amount());
	 		finalResult.setList(apiCalculatorSIPStepUp.getList());
            
            apiresponse = gson.toJson(finalResult);
    		writer.print(apiresponse);
		    writer.close();
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
		
	@RequestMapping(value="/tools-and-calculators/lumpsum-target-calculator")
   	public String lumpsum_target_calculator(HttpServletRequest request, HttpServletResponse response) 
   	{
		try 
   		{
			String target_amount = request.getParameter("target_amount");
	     	String years = request.getParameter("years");
            String expected_return = request.getParameter("expected_return");
            
			if(target_amount == null || StringHelper.isEmpty(target_amount)){target_amount = "5000000";}
            if(years == null || StringHelper.isEmpty(years)){years = "30";}
            if(expected_return == null || StringHelper.isEmpty(expected_return)){expected_return = "12";}
            
            target_amount = target_amount.trim();
            years = years.trim();
            expected_return = expected_return.trim();
			
			request.setAttribute("target_amount", target_amount);
			request.setAttribute("years", years);
			request.setAttribute("expected_return", expected_return);
			
			request.setAttribute("page", "tcalc");
			request.setAttribute("menu", "Become A Crorepati");
			request.setAttribute("jsp", "../calculator/lumpsum-target-calculator.jsp");
   		}
		catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
		
		return "layout/layout";
   	}
	
	@RequestMapping(value="/tools-and-calculators/getLumpsumTargetCalcResult")
	public void getLumpsumTargetCalcResult(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		//source website: http://jagoinvestor.com/calculators/html/Increasing-SIP-Calculator.html
		//Model design http://www.icicipruamc.com/InvestCorrectly/Basics-of-Mutual-Funds/whats-your-number
		PrintWriter writer = null;		
		Gson gson = null;
		String ipAddr = null;
		String origin = null;
		ApiCalculatorLumpsumTarget finalresult = null;
		String apiresponse = "";
		
		try 
		{	
			writer = response.getWriter();
			gson = new Gson();
			response.setContentType("text/html");
			ipAddr = Utils.getIpAddr(request);
			if(ipAddr == null){ipAddr="";}
			origin = request.getHeader("Origin");
			if(origin == null){origin="";}
			finalresult = new ApiCalculatorLumpsumTarget();
			
			String target_amount = request.getParameter("target_amount");
	     	String years = request.getParameter("years");
            String expected_return = request.getParameter("expected_return");
            
			if(target_amount == null || StringHelper.isEmpty(target_amount)){target_amount = "";}
            if(years == null || StringHelper.isEmpty(years)){years = "";}
            if(expected_return == null || StringHelper.isEmpty(expected_return)){expected_return = "";}
            
            target_amount = target_amount.trim();
            years = years.trim();
            expected_return = expected_return.trim();
			
            /*ESAPI VALIDATION*/
			String[][] param_and_pattern = {{target_amount,"SafeString"},{years,"SafeString"},{expected_return,"SafeString"}};
			
			int invalid_index_para = ESAPIValidator.isValidParameters(param_and_pattern); 
			
			if(invalid_index_para > -1) 
			{
				//String apiresponse = "";
				String[] parameters_name = {"target_amount","years","inflation_rate","expected_return"};
				String validationErrorMsg = "Invalid "+parameters_name[invalid_index_para];
				finalresult.setStatus(StatusMessage.SuccessCode);
				finalresult.setStatus_msg(StatusMessage.SuccessMessage);
				finalresult.setMsg(validationErrorMsg);
				apiresponse = gson.toJson(finalresult );                                       
				writer.print(apiresponse);/*Esapi FailureResponse*/
				writer.close();
				return;
			}
			/*ESAPI VALIDATION*/

			
            HashMap<String, String> hashMap = new HashMap<String, String>();
	 		hashMap.put("target_amount", target_amount);
	 		hashMap.put("years", years);
	 		hashMap.put("expected_return", expected_return);
	 		
	 		String formattedUrl, result = "";
	 		 
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getLumpsumTargetCalcResult, hashMap);
	 		//System.out.println("formattedUrl-->"+formattedUrl);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		//System.out.println("result-->"+result);
	 		ApiCalculatorLumpsumTarget apiCalculatorLumpsumTarget = new Gson().fromJson(result, ApiCalculatorLumpsumTarget.class);
	 		
	 		
	 		finalresult.setStatus(StatusMessage.SuccessCode);
	 		finalresult.setStatus_msg(StatusMessage.SuccessMessage);
	 		finalresult.setMsg(StatusMessage.SuccessMessage);
	 		
	 		finalresult.setTarget_amount(apiCalculatorLumpsumTarget.getTarget_amount());
	 		finalresult.setExpected_return(apiCalculatorLumpsumTarget.getExpected_return());
	 		finalresult.setYears(apiCalculatorLumpsumTarget.getYears());
	 		finalresult.setLumpsum_amount(apiCalculatorLumpsumTarget.getLumpsum_amount());      
           
            apiresponse = gson.toJson(finalresult);
    		writer.print(apiresponse);
		    writer.close();
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	
	
	
	
	@RequestMapping(value="/tools-and-calculators/children-education-planner")
   	public String educationplanner(HttpServletRequest request, HttpServletResponse response) 
   	{
       	try 
   		{
	 		
			String childName1 = request.getParameter("childName1");
	     	String childName2 = request.getParameter("childName2");
            String childAge1 = request.getParameter("childAge1");
            String childAge2 = request.getParameter("childAge2");
            String profEduAge1 = request.getParameter("profEduAge1");
	     	String profEduAge2 = request.getParameter("profEduAge2");
            String eduAmount1 = request.getParameter("eduAmount1");
            String eduAmount2 = request.getParameter("eduAmount2");
            String priceIncRate = request.getParameter("priceIncRate");
            String rateOfReturn = request.getParameter("rateOfReturn");
            String investAmount = request.getParameter("investAmount");
            
			if(childName1 == null || StringHelper.isEmpty(childName1)){childName1 = "Raju";}
            if(childName2 == null || StringHelper.isEmpty(childName2)){childName2 = "Rani";}
            if(childAge1 == null || StringHelper.isEmpty(childAge1)){childAge1 = "10";}
            if(childAge2 == null || StringHelper.isEmpty(childAge2)){childAge2 = "5";}
            if(profEduAge1 == null || StringHelper.isEmpty(profEduAge1)){profEduAge1 = "20";}
            if(profEduAge2 == null || StringHelper.isEmpty(profEduAge2)){profEduAge2 = "20";}
            if(eduAmount1 == null || StringHelper.isEmpty(eduAmount1)){eduAmount1 = "500000";}
            if(eduAmount2 == null || StringHelper.isEmpty(eduAmount2)){eduAmount2 = "500000";}
            if(priceIncRate == null || StringHelper.isEmpty(priceIncRate)){priceIncRate = "5";}
            if(rateOfReturn == null || StringHelper.isEmpty(rateOfReturn)){rateOfReturn = "8";}
            if(investAmount == null || StringHelper.isEmpty(investAmount)){investAmount = "10000";}
            
            childName1 = childName1.trim();
            childName2 = childName2.trim();
            childAge1 = childAge1.trim();
            childAge2 = childAge2.trim();
            profEduAge1 = profEduAge1.trim();
            profEduAge2 = profEduAge2.trim();
            eduAmount1 = eduAmount1.trim();
            eduAmount2 = eduAmount2.trim();
            priceIncRate = priceIncRate.trim();
            rateOfReturn = rateOfReturn.trim();
            investAmount = investAmount.trim();
            
            request.setAttribute("childName1", childName1);
			request.setAttribute("childName2", childName2);
			request.setAttribute("childAge1", childAge1);
			request.setAttribute("childAge2", childAge2);
			request.setAttribute("profEduAge1", profEduAge1);
			request.setAttribute("profEduAge2", profEduAge2);
			request.setAttribute("eduAmount1", eduAmount1);
			request.setAttribute("eduAmount2", eduAmount2);
			request.setAttribute("priceIncRate", priceIncRate);
			request.setAttribute("rateOfReturn", rateOfReturn);
			request.setAttribute("investAmount", investAmount);

			request.setAttribute("menu", "Children Education");
			request.setAttribute("page", "tcalc");
			request.setAttribute("jsp", "../calculator/education-planner.jsp");
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
       	return "layout/layout";
   	}
	
	
	
	@RequestMapping(value="/tools-and-calculators/human-life-value-calculator")
	public String humanLifeValue(HttpServletRequest request, HttpServletResponse response) 
	{
       	try 
       	{		
			request.setAttribute("page", "calculators");
			request.setAttribute("menu", "human-life-value-calculator");
			request.setAttribute("jsp", "../calculator/human_life_value_calculator.jsp");
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
       	return "layout/layout";
	}
	
	
	@RequestMapping(value="/tools-and-calculators/human-life-value-calculator_expand")
	public String humanLifeValuedepense(HttpServletRequest request, HttpServletResponse response) 
	{
       	try 
       	{		
			request.setAttribute("page", "calculators");
			request.setAttribute("menu", "human-life-value-calculator");
			request.setAttribute("jsp", "../calculator/human_life_value_expand.jsp");
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
       	return "layout/layout";
	}
	
	
	
	 
	 
	 
	
	 
		@RequestMapping(value="/tools-and-calculators/getHumanLifeValueCalcResult")
		public void getHumanLifeValueCalcResult(HttpServletRequest request, HttpServletResponse response) throws IOException
		{
			PrintWriter writer = null;		
			Gson gson = null;
			ApiCalculatorHumanLifeValue finalresult = null;
			String apirequest = "",apiresponse = "";
			
			try 
			{	
				writer = response.getWriter();
				gson = new Gson();
				response.setContentType("text/html");
				finalresult = new ApiCalculatorHumanLifeValue();
				
				String annual_income_expense = request.getParameter("annual_income_expense");
		     	String expected_increase_income_expense = request.getParameter("expected_increase_income_expense");
	            String loan_amount = request.getParameter("loan_amount");
	            String no_years = request.getParameter("no_years");
	            
				if(annual_income_expense == null || StringHelper.isEmpty(annual_income_expense)){annual_income_expense = "";}
	            if(expected_increase_income_expense == null || StringHelper.isEmpty(expected_increase_income_expense)){expected_increase_income_expense = "";}
	            if(loan_amount == null || StringHelper.isEmpty(loan_amount)){loan_amount = "";}
	            if(no_years == null || StringHelper.isEmpty(no_years)){no_years = "";}
	            
	            annual_income_expense = annual_income_expense.trim();
	            expected_increase_income_expense = expected_increase_income_expense.trim();
	            loan_amount = loan_amount.trim();
	            no_years = no_years.trim();
	            
	            /*ESAPI VALIDATION*/
				String[][] param_and_pattern = {{annual_income_expense,"SafeString"},{expected_increase_income_expense,"SafeString"},{loan_amount,"SafeString"}};
				
				int invalid_index_para = ESAPIValidator.isValidParameters(param_and_pattern); 
				
				if(invalid_index_para > -1) 
				{
					//String apiresponse = "";
					String[] parameters_name = {"annual_income_expense","expected_increase_income_expense","loan_amount"};
					String validationErrorMsg = "Invalid "+parameters_name[invalid_index_para];
					finalresult.setStatus(StatusMessage.SuccessCode);
					finalresult.setStatus_msg(StatusMessage.SuccessMessage);
					finalresult.setMsg(validationErrorMsg);
					apiresponse = gson.toJson(finalresult);                                       
					writer.print(apiresponse);/*Esapi FailureResponse*/
					writer.close();
					return;
				}
				/*ESAPI VALIDATION*/

	            HashMap<String, String> hashMap = new HashMap<String, String>();
		 		hashMap.put("annual_income_expense", annual_income_expense);
		 		hashMap.put("expected_increase_income_expense", expected_increase_income_expense);
		 		hashMap.put("loan_amount", loan_amount);
		 		hashMap.put("no_years",no_years);
		 	
				
	            String formattedUrl, result = "";
		 		 
		 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getHumanLifeValueCalcResult, hashMap);
		 		//System.out.println("formattedUrl-->"+formattedUrl);
		 		result = HttpPost.SendHttpPost(formattedUrl);
		 		//System.out.println("result-->"+result);
		 		ApiCalculatorHumanLifeValue apiCalculatorHumanLifeValue = new Gson().fromJson(result, ApiCalculatorHumanLifeValue.class); 
	        	
	        	
	            apiresponse = gson.toJson(apiCalculatorHumanLifeValue);
	    		writer.print(apiresponse);
			    writer.close();
			} 
			catch (Exception ex) 
			{
				ex.printStackTrace();
			}
		}
	
	
	
	@GetMapping("/tools-and-calculators/lumpsum-calculator")
	public String lumpsumAmountBasedInvestment(HttpServletRequest request, HttpServletResponse response) {
		try {
			
	 		String lumpsum_amount = request.getParameter("lumpsum_amount");
	     	String years = request.getParameter("years");
            String expected_return = request.getParameter("expected_return");
            
			if(lumpsum_amount == null || StringHelper.isEmpty(lumpsum_amount)){lumpsum_amount = "2000000";}
            if(years == null || StringHelper.isEmpty(years)){years = "30";}
            if(expected_return == null || StringHelper.isEmpty(expected_return)){expected_return = "12";}
            
            lumpsum_amount = lumpsum_amount.trim();
            years = years.trim();
            expected_return = expected_return.trim();
			
            request.setAttribute("lumpsum_amount", lumpsum_amount);
			request.setAttribute("years", years);
			request.setAttribute("expected_return", expected_return);
			
			request.setAttribute("page", "calculators");
			request.setAttribute("calculator", "lumpsum-calculator");
			request.setAttribute("jsp", "../calculator/lumpsum-calculator.jsp");
			
		}catch (Exception ex) {
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
	@RequestMapping(value="/tools-and-calculators/getLumpsumCalcResult")
	public void getLumpsumCalcResult(HttpServletRequest request, HttpServletResponse response){
		
		PrintWriter writer = null;		
		Gson gson = null;
		String ipAddr = null;
		String origin = null;
		//ApiCalculatorLumpsum result = null;
		String apiresponse = "";
		
		try 
		{	
			writer = response.getWriter();
			gson = new Gson();
			response.setContentType("text/html");
			if(ipAddr == null){ipAddr="";}
			origin = request.getHeader("Origin");
			if(origin == null){origin="";}
			//String result = new ApiCalculatorLumpsum();
			
			String lumpsum_amount = request.getParameter("lumpsum_amount");
	     	String years = request.getParameter("years");
            String expected_return = request.getParameter("expected_return");
            
			if(lumpsum_amount == null || StringHelper.isEmpty(lumpsum_amount)){lumpsum_amount = "";}
            if(years == null || StringHelper.isEmpty(years)){years = "";}
            if(expected_return == null || StringHelper.isEmpty(expected_return)){expected_return = "";}
            
            lumpsum_amount = lumpsum_amount.trim();
            years = years.trim();
            expected_return = expected_return.trim();
			
            HashMap<String, String> hashMap = new HashMap<String, String>();
	 		hashMap.put("lumpsum_amount", lumpsum_amount);
	 		hashMap.put("years", years);
	 		hashMap.put("expected_return", expected_return);
	 		 
	 		String formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getLumpsumCalcResult, hashMap);
	 		//System.out.println("formattedUrl-->"+formattedUrl);
	 		String result = HttpPost.SendHttpPost(formattedUrl);
	 		//System.out.println("result-->"+result);
	 		ApiCalculatorLumpsum apiCalculatorLumpsum = new Gson().fromJson(result, ApiCalculatorLumpsum.class); 
        	
	 		apiresponse = gson.toJson(apiCalculatorLumpsum);
    		writer.print(apiresponse);
		    writer.close();
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	@GetMapping("/tools-and-calculators/future-value-inflation-calculator")
	public String futureValueinFlationCalc(HttpServletRequest request, HttpServletResponse response) {
		try {	        		
 	 		String current_cost = request.getParameter("current_cost");
 	     	String inflation_rate = request.getParameter("inflation_rate");
            String no_years = request.getParameter("no_years");
             
 			if(current_cost == null || StringHelper.isEmpty(current_cost)){current_cost = "2500000";}
            if(inflation_rate == null || StringHelper.isEmpty(inflation_rate)){inflation_rate = "6";}
            if(no_years == null || StringHelper.isEmpty(no_years)){no_years = "10";}
             
            current_cost = current_cost.trim();
            inflation_rate = inflation_rate.trim();
            no_years = no_years.trim();
 			
            request.setAttribute("current_cost", current_cost);
 			request.setAttribute("inflation_rate", inflation_rate);
 			request.setAttribute("no_years", no_years);
 			
 	 		request.setAttribute("page", "calculators");
 	 		request.setAttribute("jsp", "../calculator/future-value-inflation-calculator.jsp");

		}catch (Exception ex) {
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
	@RequestMapping(value="/tools-and-calculators/getFutureValueCalcResult")
	public void getFutureValueCalcResult(HttpServletRequest request, HttpServletResponse response){
		
		PrintWriter writer = null;		
		Gson gson = null;
		String ipAddr = null;
		String origin = null;
		ApiCalculatorFutureValue finalResult = null;
		String apiresponse = "";
		try 
		{	
			writer = response.getWriter();
			gson = new Gson();
			response.setContentType("text/html");
			ipAddr = Utils.getIpAddr(request);
			if(ipAddr == null){ipAddr="";}
			origin = request.getHeader("Origin");
			if(origin == null){origin="";}
			finalResult = new ApiCalculatorFutureValue();
			
			String current_cost = request.getParameter("current_cost");
	     	String inflation_rate = request.getParameter("inflation_rate");
            String no_years = request.getParameter("no_years");
            
			if(current_cost == null || StringHelper.isEmpty(current_cost)){current_cost = "";}
            if(inflation_rate == null || StringHelper.isEmpty(inflation_rate)){inflation_rate = "";}
            if(no_years == null || StringHelper.isEmpty(no_years)){no_years = "";}
            
            current_cost = current_cost.trim();
            inflation_rate = inflation_rate.trim();
            no_years = no_years.trim();

            HashMap<String, String> hashMap = new HashMap<String, String>();
	 		hashMap.put("current_cost", current_cost);
	 		hashMap.put("inflation_rate", inflation_rate);
	 		hashMap.put("no_years", no_years);
	 		
	 		String formattedUrl, result = "";
	 		 
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getFutureValueCalcResult, hashMap);
	 		//System.out.println("formattedUrl-->"+formattedUrl);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		//System.out.println("result-->"+result);
	 		ApiCalculatorFutureValue apiCalculatorCrorepati = new Gson().fromJson(result, ApiCalculatorFutureValue.class); 	
            
	 		finalResult.setStatus(StatusMessage.SuccessCode);
	 		finalResult.setStatus_msg(StatusMessage.SuccessMessage);
	 		finalResult.setMsg(StatusMessage.SuccessMessage);
	 		finalResult.setCurrent_cost(apiCalculatorCrorepati.getCurrent_cost());
	 		finalResult.setInflation_rate(apiCalculatorCrorepati.getInflation_rate());
	 		finalResult.setNo_years(apiCalculatorCrorepati.getNo_years());
	 		finalResult.setFuture_amount(apiCalculatorCrorepati.getFuture_amount());
            
	 		 apiresponse = gson.toJson(finalResult);
    		writer.print(apiresponse);
		    writer.close();
		} 
		catch (Exception ex){
			ex.printStackTrace();
		}
	}
	
	
	
	
	
	@RequestMapping(value="/tools-and-calculators/sip-with-annual-increase")
   	public String sip_with_annual_increase(HttpServletRequest request, HttpServletResponse response) 
   	{
       	try 
   		{			
			
			request.setAttribute("menu", "sip-with-annual-increase");
			request.setAttribute("jsp", "../calculator/sip_with_annual_increase.jsp");
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
       	return "layout/layout";
   	}
	
	@RequestMapping(value="/tools-and-calculators/asset-allocation")
   	public String assetcalc(HttpServletRequest request, HttpServletResponse response) 
   	{
       	try 
   		{			
	
			request.setAttribute("menu", "asset-allocation");
			request.setAttribute("jsp", "../calculator/asset_allocation_calculator.jsp");
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
       	return "layout/layout";
   	}
	
	@RequestMapping(value="/tools-and-calculators/getAssetAllocationResult")
	public void getAssetAllocationResult(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		PrintWriter writer = null;		
		Gson gson = null;
		ApiCalculatorAssetAllocation finalresult = null;
		String apirequest = "",apiresponse = "";
		
		try 
		{	
			writer = response.getWriter();
			gson = new Gson();
			response.setContentType("text/html");
			finalresult = new ApiCalculatorAssetAllocation();
			
			String current_age = request.getParameter("current_age");
            String risk_profile = request.getParameter("risk_profile");
            String investment_horizon = request.getParameter("investment_horizon");
            String do_you_know = request.getParameter("do_you_know");
            
            if(current_age == null || StringHelper.isEmpty(current_age)){current_age = "";}
            if(risk_profile == null || StringHelper.isEmpty(risk_profile)){risk_profile = "";}
            if(investment_horizon == null || StringHelper.isEmpty(investment_horizon)){investment_horizon = "";}
            if(do_you_know == null || StringHelper.isEmpty(do_you_know)){do_you_know = "";}
            
            current_age = current_age.trim();
            risk_profile = risk_profile.trim();
            investment_horizon = investment_horizon.trim();
            do_you_know = do_you_know.trim();			
            

            HashMap<String, String> hashMap = new HashMap<String, String>();
	 		hashMap.put("current_age", current_age);
	 		hashMap.put("risk_profile", risk_profile);
	 		hashMap.put("investment_horizon", investment_horizon);
	 		hashMap.put("do_you_know",do_you_know);
	 		
			
            String formattedUrl, result = "";
	 		 
	 		formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAssetAllocationResult, hashMap);
	 		//System.out.println("formattedUrl-->"+formattedUrl);
	 		result = HttpPost.SendHttpPost(formattedUrl);
	 		//System.out.println("result-->"+result);
	 		ApiCalculatorAssetAllocation apiCalculatorAssetAllocation = new Gson().fromJson(result, ApiCalculatorAssetAllocation.class); 
           
            
	 		finalresult.setStatus(StatusCodesAndMessages.SuccessCode);
	 		finalresult.setStatus_msg(StatusCodesAndMessages.SuccessMessage);
	 		finalresult.setMsg(StatusCodesAndMessages.SuccessMessage);
	 		finalresult.setCurrent_age(apiCalculatorAssetAllocation.getCurrent_age());
	 		finalresult.setRisk_profile(apiCalculatorAssetAllocation.getRisk_profile());
	 		finalresult.setInvestment_horizon(apiCalculatorAssetAllocation.getInvestment_horizon());
	 		finalresult.setDo_you_know(apiCalculatorAssetAllocation.getDo_you_know());
	 		finalresult.setDebt(apiCalculatorAssetAllocation.getDebt());
	 		finalresult.setEquity(apiCalculatorAssetAllocation.getEquity());
	 		finalresult.setFmp_debt_value(apiCalculatorAssetAllocation.getFmp_debt_value());
	 		finalresult.setLong_term_fixed_value(apiCalculatorAssetAllocation.getLong_term_fixed_value());
	 		finalresult.setCash_liquid_value(apiCalculatorAssetAllocation.getCash_liquid_value());
	 		finalresult.setMid_small_cap_value(apiCalculatorAssetAllocation.getMid_small_cap_value());
	 		finalresult.setLarge_cap_value(apiCalculatorAssetAllocation.getLarge_cap_value());
            
            
            apiresponse = gson.toJson(finalresult);
    		writer.print(apiresponse);
		    writer.close();
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	
	
}
