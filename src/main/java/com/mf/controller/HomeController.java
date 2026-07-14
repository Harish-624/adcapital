package com.mf.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.Year;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.hibernate.internal.util.StringHelper;
import org.owasp.esapi.ESAPI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.mf.amfi.model.SchemePerformances;
import com.mf.amfi.response.ApiTop50FundsResponse;
import com.mf.amfi.response.MutualFundAPIResponse;
import com.mf.amfi.response.MutualFundSchemeAPIResponse;
import com.mf.model.BridgePlanSubscription;
import com.mf.model.ContactFeedback;
import com.mf.model.UsersBridgeEmailer;
import com.mf.response.ApiBlogCenterResponse;
import com.mf.response.ApiBlogDetailsWebsiteResponse;
import com.mf.response.ApiBlogsResponse;
import com.mf.response.ApiNewsCenterResponse;
import com.mf.response.ApiNewsDetailsResponse;
import com.mf.response.ApiNewsResponse;
import com.mf.response.CommonResponse;
import com.mf.response.FactsheetAPIResponse;
import com.mf.response.MutualFundPortfolioAPIResponse;
import com.mf.utils.CommonUtils;
import com.mf.utils.HttpPost;
import com.mf.utils.MfApiAccessor;
import com.mf.utils.MfApiUrls;
import com.mf.utils.ProjectUtils;

import com.mf.utils.StatusCodesAndMessages;
import com.mf.utils.StatusMessage;
import com.mf.utils.UniqueIDProvider;
import com.mf.utils.Utils;

@Controller
public class HomeController 
{
	
	
	@RequestMapping({"", "/", "/home"})
	public String welcome(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{	
		
			String category = "Equity: Flexi Cap";
	 		String period = "1y";
	 		String type = "Open";
	 		String mode = "Growth";

	 		String formattedUrl, result = "";
	 		
	 		
	 		

	 		HashMap<String, String> hashMap = new HashMap<String, String>();	 			 		
	 		Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();	 				 	
	 		
	 		
	        
			String pageid = request.getParameter("pageid");
			hashMap.put("pageid", String.valueOf(pageid));
			hashMap.put("category", "All");
			hashMap.put("key", "103ee40d-cbb2-4849-b6c5-e5f500a60bc5");
			
			
			formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllBlogs, hashMap);
			if (result != null && !result.trim().isEmpty()) {
	 			try {
	 				ApiBlogCenterResponse apiBlogCenterResponse = new Gson().fromJson(result, ApiBlogCenterResponse.class);
	 				if (apiBlogCenterResponse != null && apiBlogCenterResponse.getList() != null) {
	 					request.setAttribute("blogsPageCount", apiBlogCenterResponse.getPageCount());
	 					List<ApiBlogsResponse> blogsList = apiBlogCenterResponse.getList()
	 							.stream().limit(3).collect(Collectors.toList());
	 					request.setAttribute("blogsList", blogsList);
	 				} else {
	 					System.out.println("Skipping getLatestBlogs - response invalid");
	 				}
	 			} catch (Exception ex) {
	 				System.out.println("Skipping getLatestBlogs - parse error: " + ex.getMessage());
	 			}
	 		} else {
	 			System.out.println("Skipping getLatestBlogs - result is null or empty");
	 		}
			
            
           	hashMap = new HashMap<String, String>();
            hashMap.put("pageid", pageid);
            hashMap.put("category", "Mutual Fund");
           	
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllNews, hashMap);
           if (result != null && !result.trim().isEmpty()) {
      			try {
      				ApiNewsCenterResponse apiNewsCenterResponse = new Gson().fromJson(result, ApiNewsCenterResponse.class);
      				if (apiNewsCenterResponse != null && apiNewsCenterResponse.getList() != null) {
      					List<ApiNewsResponse> news = apiNewsCenterResponse.getList()
      							.stream().limit(3).collect(Collectors.toList());
      					request.setAttribute("newslist", news);
      				} else {
      					System.out.println("Skipping getAllNews - response invalid");
      				}
      			} catch (Exception ex) {
      				System.out.println("Skipping getAllNews - parse error: " + ex.getMessage());
      			}
      		} else {
      			System.out.println("Skipping getAllNews - result is null or empty");
      		}
			
	     	request.setAttribute("page", "home");
	     	request.setAttribute("jsp", "../common/home.jsp");
	     	
	     //	request.setAttribute("page", "coming soon");
	     	//request.setAttribute("jsp", "../common/coming-soon.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "layout/home-layout";
	}
	
	
	
	
	@RequestMapping("/contactus")
	public String contactus(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "contactus");
		request.setAttribute("jsp", "../common/contact-us.jsp");
		return "layout/layout";
	}
	
	
	
	
	
	@RequestMapping(value = "/blog")
	public String blog(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
	    try
	    {
	        String pageid = request.getParameter("pageid");
	        
	        if (pageid == null || pageid.trim().isEmpty()) {pageid = "1";}
 
	        int page_id = Integer.parseInt(pageid);
	        request.setAttribute("pageid", pageid);
 
	        HttpSession session = request.getSession();
	        Integer blogsPageCount = (Integer) session.getAttribute("blogsPageCount");
 
	        boolean shouldCallApi = false;
 
	        if (page_id == 1)
	        {
	            shouldCallApi = true;
	        } else
	        {
	            if (blogsPageCount == null)
	            {
	                shouldCallApi = true;
	            } else if (page_id <= blogsPageCount)
	            {
	                shouldCallApi = true;
	            } else
	            {
	                shouldCallApi = false;
	            }
	        }
 
	        if (shouldCallApi)
	        {
	            HashMap<String, String> hashMap = new HashMap<>();
	            hashMap.put("pageid", String.valueOf(page_id));
	            hashMap.put("category", "All");
	            hashMap.put("key", "103ee40d-cbb2-4849-b6c5-e5f500a60bc5");
 
	            String formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllBlogs, hashMap);
	            String result = HttpPost.SendHttpPost(formattedUrl);
 
	            ApiBlogCenterResponse apiBlogCenterResponse = new Gson().fromJson(result, ApiBlogCenterResponse.class);
 
	            if (apiBlogCenterResponse != null && apiBlogCenterResponse.getList() != null) {
	                int blogPageCount = apiBlogCenterResponse.getPageCount();
 
	                request.setAttribute("blogPageCount", blogPageCount);
	                session.setAttribute("blogsPageCount", blogPageCount); // Ensure it’s saved for future pages
 
	                request.setAttribute("blogsList", apiBlogCenterResponse.getList());
 
	                List<Integer> paginator = Utils.paginator(page_id, blogPageCount);
	                int beginPaginatorId = paginator.get(0);
	                int endPaginatorId = paginator.get(1);
 
	                request.setAttribute("beginPaginatorId", beginPaginatorId);
	                request.setAttribute("endPaginatorId", endPaginatorId);
	            } else {
	                request.setAttribute("blogsList", new ArrayList<>());
	            }
	        }
 
	        request.setAttribute("noblog", "noblog");
	        request.setAttribute("shouldCallApi", shouldCallApi);
	        request.setAttribute("jsp", "../common/blog.jsp");
 
	    } catch (Exception ex)
	    {
	        ex.printStackTrace();
	    }
 
	    return "layout/layout";
	}
	
	@RequestMapping(value="/blog/{blogid}")
	public String blogdetails(HttpServletRequest request, HttpServletResponse response,@PathVariable(value="blogid") String blogID) throws Exception 
	{
		try
		{	
		    String pageid = request.getParameter("pageid");
			if(pageid == null){pageid = "1";}
            String formattedUrl, result = "";
            
         	HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("id", blogID);
            hashMap.put("key", "103ee40d-cbb2-4849-b6c5-e5f500a60bc5");
         	
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getBlogByIdWebsite, hashMap);
     		result = HttpPost.SendHttpPost(formattedUrl);
     		//System.out.println("result-->"+result);
     		ApiBlogDetailsWebsiteResponse apiBlogDetailsWebsiteResponse = new Gson().fromJson(result, ApiBlogDetailsWebsiteResponse.class);
     		
     		//System.out.println("name-->"+apiBlogDetailsWebsiteResponse.getAuthor_name());
     		request.setAttribute("blogs", apiBlogDetailsWebsiteResponse); 
     		
     		request.setAttribute("page", "blog-title");
			request.setAttribute("jsp", "../common/blog-details.jsp");
			    
			return "layout/layout";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
	@RequestMapping("/aboutus")
	public String aboutus(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "aboutus");
		request.setAttribute("jsp", "../common/about-us.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/team")
	public String team(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "team");
		request.setAttribute("jsp", "../common/team.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services")
	public String services(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "service");
		request.setAttribute("jsp", "../common/services.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/services-detail")
	public String services_detail(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "service-detail");
		request.setAttribute("jsp", "../common/services-detail.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/faq")
	public String faq(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "faq");
		request.setAttribute("jsp", "../common/mutual-funds-faq.jsp");
		return "layout/layout";
	}
	
	@RequestMapping(value = { "/faq/mutual-funds" }) 
	public String mfq(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("page", "mutual-funds-faq");
		request.setAttribute("jsp", "../common/mutual-funds-faq.jsp");
		return "layout/layout";
	}
	@RequestMapping(value = { "/faq/financial-planning" })
	public String financial_faq(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			request.setAttribute("page", "financial-planning");
			request.setAttribute("jsp", "../common/financial-planning.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
	@RequestMapping(value = { "/faq/nri-corner" })
	public String nri(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			request.setAttribute("page", "nri-corner");
			request.setAttribute("jsp", "../common/nri-corner.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
	@RequestMapping("/plan-a-goal")
	public String plan_a_goal(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "plan-a-goal");
		request.setAttribute("jsp", "../common/plan-a-goal.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/our-offices")
	public String our_offices(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "our-offices");
		request.setAttribute("jsp", "../common/our-offices.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/mission-values")
	public String mission_values(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "mission-values");
		request.setAttribute("jsp", "../common/mission-values.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/testimonials")
	public String testimonials(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "testimonials");
		request.setAttribute("jsp", "../common/testimonials.jsp");
		return "layout/layout";
	}
	
	@RequestMapping(value="/news")
   	public String news(@RequestParam(value="pageid",required=false) String pageid, HttpServletRequest request, HttpServletResponse response)
   	{
		try
		{
	        if (pageid == null || pageid.trim().isEmpty() || !NumberUtils.isNumber(pageid)) {pageid = "1";}
 
	        int page_id = Integer.parseInt(pageid);
	        request.setAttribute("pageid", pageid);
 
	        String category = "Mutual Fund";
	        request.setAttribute("category_name", category);
 
	        HttpSession session = request.getSession();
	        Integer newsPageCount = (Integer) session.getAttribute("newsPageCount");
 
	        boolean shouldCallApi = false;
 
	        if (page_id == 1)
	        {
	            shouldCallApi = true;
	        } else
	        {
	            if (newsPageCount == null)
	            {
	                shouldCallApi = true;
	            } else if (page_id <= newsPageCount)
	            {
	                shouldCallApi = true;
	            } else
	            {
	                shouldCallApi = false;
	            }
	        }
 
	        if (shouldCallApi)
	        {
	            HashMap<String, String> newsHashMap = new HashMap<>();
	            newsHashMap.put("pageid", pageid);
	            newsHashMap.put("category", category);
 
	            String formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getAllNews, newsHashMap);
	            String result = HttpPost.SendHttpPost(formattedUrl);
 
	            ApiNewsCenterResponse apiNewsCenterResponse = new Gson().fromJson(result, ApiNewsCenterResponse.class);
 
	            if (apiNewsCenterResponse != null && apiNewsCenterResponse.getList() != null) {
	                List<ApiNewsResponse> news = apiNewsCenterResponse.getList();
	                request.setAttribute("newslist", news);
 
	                newsPageCount = apiNewsCenterResponse.getPageCount();
	                request.setAttribute("newsPageCount", newsPageCount);
	                session.setAttribute("newsPageCount", newsPageCount);
 
	                int next_page_id = page_id;
	                if (next_page_id == newsPageCount || newsPageCount == 0) {
	                    next_page_id = 0;
	                }
 
	                List<Integer> paginator = Utils.paginator(page_id, newsPageCount);
	                int beginPaginatorId = paginator.get(0);
	                int endPaginatorId = paginator.get(1);
 
	                request.setAttribute("beginPaginatorId", beginPaginatorId);
	                request.setAttribute("endPaginatorId", endPaginatorId);
	            } else
	            {
	                request.setAttribute("newslist", new ArrayList<>());
	                System.out.println("Warning: No news data returned.");
	            }
	        }
	        request.setAttribute("shouldCallApi", shouldCallApi);
	        request.setAttribute("jsp", "../common/news.jsp");
 
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
 
	    return "layout/layout";
   	}
	
	@RequestMapping(value="/news/{category}")
	public String news1(@PathVariable(value="category") String category,@RequestParam(value="pageid",required=false) String pageid,
			HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try
		{
        	if(pageid == null || pageid.equalsIgnoreCase("") || !NumberUtils.isNumber(pageid))
     		{
     			pageid = "1";
     		}
 			
            if(category == null)
 	        {
 	        	category = "all";
 	        }
                
            category = category.trim();
         	category = category.replaceAll("-", " ");
         	
 			request.setAttribute("category_name", category);
 			request.setAttribute("pageid", pageid);
                 
 			//List<News> news = newsRepository.getAllNews(category,Integer.parseInt(pageid) - 1);
            //request.setAttribute("newslist", news);
             
 			//int newsPageCount = newsRepository.getNewsPageCount(category);
             //request.setAttribute("newsPageCount", newsPageCount);
             
             //int next_page_id = Integer.parseInt(pageid);
             /*if(next_page_id == newsPageCount || newsPageCount==0){
             	next_page_id = 0;
             }*/
             
            //List<Blogs> recommandBlogList = blogRepository.getRecommandBlogs("All");
 			//request.setAttribute("recommandArticleList", recommandBlogList);
        	
        	//List<Integer> paginator = Utils.paginator(Integer.parseInt(pageid), newsPageCount);
            //int beginPaginatorId = paginator.get(0);  
            //int endPaginatorId = paginator.get(1);
            
            //request.setAttribute("beginPaginatorId", beginPaginatorId);
            //request.setAttribute("endPaginatorId", endPaginatorId);
            
            request.setAttribute("page", "news");    
            request.setAttribute("jsp", "../common/news.jsp");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	
	 @RequestMapping(value="/news/{category}/{title}")
	 public String news_details(@PathVariable(value="category") String category,
			 @PathVariable(value="title") String title,HttpServletRequest request, HttpServletResponse response) throws Exception 
   	 {		
       	try 
   		{
       		if(category == null)
 	        {
 	        	category = "all";
 	        }
       		
       		title = title.trim();
       		title = title.replaceAll("-", " "); 
       		category = category.trim();
        	category = category.replaceAll("-", " ");
       		
       		request.setAttribute("title_name", title);
       		request.setAttribute("category_name", category);
       		
       		//System.out.println("Testing-->"+category);
       		
       		String formattedUrl, result = "";
            
           	HashMap<String, String> hashMap = new HashMap<String, String>();
            hashMap.put("title", title);
           	
            formattedUrl = MfApiAccessor.getFormattedUrl(MfApiUrls.getNewsByTitle, hashMap);
       		result = HttpPost.SendHttpPost(formattedUrl);
       		//System.out.println("result-->"+result);
       		ApiNewsDetailsResponse apiNewsCenterResponse = new Gson().fromJson(result, ApiNewsDetailsResponse.class);
		    
            request.setAttribute("news", apiNewsCenterResponse);
            
            //List<Blogs> recommandBlogList = blogRepository.getRecommandBlogs("All");
			//request.setAttribute("recommandArticleList", recommandBlogList);
            
			/*if(news != null)
        	{
        		int id = news.getId();
        		List<News> prevAndNextNews = newsRepository.getPrevAndNextNews(id);
        		request.setAttribute("prevAndNextNews", prevAndNextNews);
        	}*/
			
			request.setAttribute("page", "news-title");    
			request.setAttribute("jsp", "../common/news-details.jsp");
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
       	return "layout/layout";
   	}
	
	@RequestMapping(value="/mutual-funds")
   	public String mutual_funds_questions(HttpServletRequest request, HttpServletResponse response)		
   	{
       	try 
   		{    	
       		//List<MutualFunds> list = commonDao.getAllMutualFunds();
            //request.setAttribute("list", list);    
			
			request.setAttribute("page","mutual-funds");
			request.setAttribute("jsp", "../common/mutual-funds.jsp");
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
       	return "layout/layout";
   	}
	
	@RequestMapping(value="/post-your-queries")
   	public String queriess(HttpServletRequest request, HttpServletResponse response) 
   	{
       	try 
   		{
        	
            //List<AnsweredPostQueries> answeredPostQueries = commonDao.getAnsweredPostQueriesAssign("all");
            //request.setAttribute("answeredPostQueries", answeredPostQueries);
			
			request.setAttribute("page", "queries");
			request.setAttribute("jsp", "../common/queries.jsp");
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
       	return "layout/layout";
   	}
	
	@RequestMapping("/financial-planning")
	public String financial_planning(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "financial-planning");
		request.setAttribute("jsp", "../common/financial-planning.jsp");
		return "layout/layout";
	}
	

	
	@RequestMapping("/private-wealth-clients")
	public String private_wealth_clients(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "private-wealth-clients");
		request.setAttribute("jsp", "../common/private-wealth-clients.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/we-can-help-you")
	public String we_can_help_you(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "we-can-help-you");
		request.setAttribute("jsp", "../common/we-can-help-you.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/how-we-invest")
	public String how_we_invest(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "how-we-invest");
		request.setAttribute("jsp", "../common/how-we-invest.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/our-story")
	public String our_story(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "our-story");
		request.setAttribute("jsp", "../common/our-story.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/info-graphics/find-the-best-80c-investment")
	public String infographics(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "infographics");
		request.setAttribute("jsp", "../common/infographics.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/commission-disclosures")
	public String commission_disclosures(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "commission-disclosures");
		request.setAttribute("jsp", "../common/commission-disclosures.jsp");
		return "layout/layout";
	}
	@RequestMapping("/mandatory-disclosures")
	public String disclaimer(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "corporate-disclosures");
		request.setAttribute("jsp", "../common/corporate-disclosures.jsp");
		return "layout/layout";
	}
	@RequestMapping("/privacy-policy")
	public String client_privacy_policy(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "/client-privacy-policy");
		request.setAttribute("jsp", "../common/client-privacy-policy.jsp");
		return "layout/home-layout";
	}
	@RequestMapping("/terms-and-conditions")
	public String terms_and_conditions(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "/terms-and-conditions");
		request.setAttribute("jsp", "../common/terms-and-conditions.jsp");
		return "layout/layout";
	}
	@RequestMapping(value="/associate-registration")
	public String associate_registration(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		try{	
			request.setAttribute("page", "associate-registration");
			request.setAttribute("jsp", "../common/associate-registration.jsp");
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return "layout/layout";
	}
	@RequestMapping("/overview")
	public String overview(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "risk-protection");
		request.setAttribute("jsp", "../common/overview.jsp");
		return "layout/layout";
	}
	@RequestMapping("/risk-protection")
	public String risk_protection(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "risk-protection");
		request.setAttribute("jsp", "../common/risk-protection.jsp");
		return "layout/layout";
	}
	@RequestMapping("/wealth-management")
	public String wealth_management(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "wealth-management");
		request.setAttribute("jsp", "../common/wealth-management.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/real-estate")
	public String real_estate(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "real-estate");
		request.setAttribute("jsp", "../common/real-estate.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/mortgages")
	public String mortgages(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "mortgages");
		request.setAttribute("jsp", "../common/mortgages.jsp");
		return "layout/layout";
	}
	
	@RequestMapping("/meet-plutus")
	public String meet_plutus(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "meet-plutus");
		request.setAttribute("jsp", "../common/meet-plutus.jsp");
		return "layout/layout";
	}
	
	
	
	
	
	@RequestMapping("/become-a-plutus-partner")
	public String become_a_plutus_partner(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "become-a-plutus-partner");
		request.setAttribute("jsp", "../common/become-a-plutus-partner.jsp");
		return "layout/layout";
	}
	
	
	
	
	
	
	
	
	

	
	@RequestMapping("/broking-accounts")
	public String broking_accounts(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("page", "broking-accounts");
		request.setAttribute("jsp", "../common/broking-accounts.jsp");
		return "layout/layout";
	}
	
	@RequestMapping(value="/podcasts")
   	public String podcasts(@RequestParam(value="pageid",required=false) String pageid, HttpServletRequest request, HttpServletResponse response) 
   	{
       	try 
   		{            
            request.setAttribute("page", "podcasts");   
            request.setAttribute("jsp", "../common/podcasts.jsp");
    		
   		}
       	catch(Exception ex)
       	{
       		ex.printStackTrace();
       	}
       	return "layout/layout";
   	}
	
	
	
	
	
	
}
