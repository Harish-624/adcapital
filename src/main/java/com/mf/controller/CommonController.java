package com.mf.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.hibernate.internal.util.StringHelper;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.mf.model.Users;
import com.mf.response.CommonResponse;
import com.mf.utils.MfApiAccessor;
import com.mf.utils.MfApiUrls;

import com.mf.utils.StatusCodesAndMessages;
import com.mf.utils.StatusMessage;

@Controller
public class CommonController {
	

	
	
	
	
	
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
			
			request.getSession().invalidate();
			
			return "forward:/";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "user.home";
	}
	
	@RequestMapping("/services/mutual-fund")
	public String mutual_fund(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "mutual-fund");
		request.setAttribute("jsp", "../common/mutual-fund.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/insurance-renewal")
	public String insurance_renewal(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "insurance-renewal");
		request.setAttribute("jsp", "../common/insurance-renewal.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/fixed-income-products")
	public String fixed_income_products(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "fixed-income-products");
		request.setAttribute("jsp", "../common/fixed-income-products.jsp");
		return "layout/layout";
	}
	
	
	
	
	@RequestMapping("/services/tax-planning-services")
	public String tax_planning(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "tax-planning");
		request.setAttribute("jsp", "../common/tax-planning.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/health-insurance")
	public String health_insurance(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "health-insurance");
		request.setAttribute("jsp", "../common/health-insurance.jsp");
		return "layout/layout";
	}

	@RequestMapping("/services/life-insurance")
	public String life_insurance(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "life-insurance");
		request.setAttribute("jsp", "../common/life-insurance.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/general-insurance")
	public String general_insurance(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "general-insurance");
		request.setAttribute("jsp", "../common/general-insurance.jsp");
		return "layout/layout";
	}
	
	
	@RequestMapping("/services/business-insurance")
	public String business_insurance(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "general-insurance");
		request.setAttribute("jsp", "../common/business-insurance.jsp");
		return "layout/layout";
	}
	@RequestMapping("/services/aif")
	public String aif(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "aif");
		request.setAttribute("jsp", "../common/aif.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/gift-city")
	public String gift_city(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "gift-city");
		request.setAttribute("jsp", "../common/gift-city.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/will-and-estate-planning")
	public String will_estate_planning(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "will-estate-planning");
		request.setAttribute("jsp", "../common/will-estate-planning.jsp");
		return "layout/layout";
	}
	
	
	
	@RequestMapping("/services/stock")
	public String equities_stocks_and_shares(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "stock");
		request.setAttribute("jsp", "../common/stock.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/fixed-deposit")
	public String fixed_deposit(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "fixed-deposit");
		request.setAttribute("jsp", "../common/fixed-deposit.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/bonds")
	public String bonds(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "bonds");
		request.setAttribute("jsp", "../common/bonds.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/loans")
	public String loans(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "loans");
		request.setAttribute("jsp", "../common/loan.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/important-books-and-links")
	public String important_books_and_links(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "important_books_and_links");
		request.setAttribute("jsp", "../common/links-and-books.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/our-process")
	public String our_process(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "important_books_and_links");
		request.setAttribute("activeTab", "process");
		request.setAttribute("jsp", "../common/links-and-books.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/investment-awareness-training-workshops")
	public String investment_awareness_training_workshops(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "investment-awareness-training-workshops");
		request.setAttribute("jsp", "../common/investment-awareness-training-workshops.jsp");
		return "layout/layout";
	}

	@RequestMapping("/services/income-tax-filing")
	public String income_tax_consultancy(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "income-tax-filing");
		request.setAttribute("jsp", "../common/income-tax-filing.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/succession-planning")
	public String succession_planning(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "succession-planning");
		request.setAttribute("jsp", "../common/succession-planning.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/portfolio-management-schemes")
	public String portfolio_management_schemes(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "portfolio-management-schemes");
		request.setAttribute("jsp", "../common/pms.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/pan-services")
	public String pan_services(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "pan_services");
		request.setAttribute("jsp", "../common/panservice.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/incometax-returns-filing")
	public String incometax_returns_filing(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "incometax-returns-filing");
		request.setAttribute("jsp", "../common/incometax-returns-filings.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/credit-card")
	public String credit_card(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "credit_card");
		request.setAttribute("jsp", "../common/creditcard.jsp");
		return "layout/layout";
	}

	@RequestMapping("/services/small-savings")
	public String small_savings(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "small-savings");
		request.setAttribute("jsp", "../common/small-savings.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/national-pension-scheme")
	public String national_pension_scheme(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "national-pension-scheme");
		request.setAttribute("jsp", "../common/national-pension-scheme.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/home-and-personal-loans")
	public String home_and_personal_loans(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "home-and-personal-loans");
		request.setAttribute("jsp", "../common/home-and-personal-loans.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/vehicle-Insurance")
	public String vehicle_insurance(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "vehicle-Insurance");
		request.setAttribute("jsp", "../common/motor-insurance.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/goal-planning")
	public String goal_planning(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "goal-planning");
		request.setAttribute("jsp", "../common/goal-planning.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/child-education")
	public String child_education(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "child-education");
		request.setAttribute("jsp", "../common/child-education-planning.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/retirement-planning")
	public String retirement_planning(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "retirement-planning");
		request.setAttribute("jsp", "../common/retirement-planning.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services/financial-planning")
	public String financial_planning(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "financial-planning");
		request.setAttribute("jsp", "../common/financial-planning-service.jsp");
		return "layout/layout";
	}
}
