package com.mf.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringReader;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.annotations.common.util.StringHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itextpdf.text.Anchor;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.html.simpleparser.HTMLWorker;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.LineSeparator;
import com.mf.utils.Utils;


@Controller
@RequestMapping(value="/tools-and-calculators")
public class FinancialCalculatorController 
{  
	@Value("${hostDomainUrl}")
	private String hostDomainUrl;
	
	@RequestMapping(value="/downloadCrorepatiCalcResult")
   	public void downloadCrorepatiCalcResult(HttpServletRequest request, HttpServletResponse response) throws IOException 
   	{		
   		try 
   		{
   			String requestUrl = request.getRequestURL().toString();
   	 		if(!Utils.isValidUrl(requestUrl, "downloadCrorepatiCalcResult"))
   	 		{
   	 			response.sendRedirect(request.getContextPath() + "/page-not-found?invalidUrl=" + requestUrl);
       			return;
   	 		}
      	   	String wealth_amount = request.getParameter("wealth_amount");
   	   		String current_age = request.getParameter("current_age");
   	   		String wealth_age = request.getParameter("wealth_age");
      	   	String price_increase_rate = request.getParameter("price_increase_rate");
      	   	String rate_of_return = request.getParameter("rate_of_return");
   	   		String savings_amount = request.getParameter("savings_amount");
   	   		
   	   		String target_wealth = request.getParameter("target_wealth");
   	   		String target_savings = request.getParameter("target_savings");
   	   		String target_amount = request.getParameter("target_amount");
      	   	String years = request.getParameter("years");
      	   	String monthly_savings = request.getParameter("monthly_savings");
   	   		String invested_amount = request.getParameter("invested_amount");
   	   		String total_earnings = request.getParameter("total_earnings");
   	   		String url = request.getParameter("url");
   	   		
   	   		String wealth_amount_str = request.getParameter("wealth_amount");
   	   		wealth_amount = wealth_amount.replaceAll(",", "");
   	   		
   			if(wealth_amount == null){wealth_amount = "";}
   			if(current_age == null){current_age = "";}
   			if(wealth_age == null){wealth_age = "";}
   			if(price_increase_rate == null){price_increase_rate = "";}
   			if(rate_of_return == null){rate_of_return = "";}
   			if(savings_amount == null){savings_amount = "";}
   			
   			if(target_wealth == null){target_wealth = "";}
   			if(target_savings == null){target_savings = "";}
   			if(target_amount == null){target_amount = "";}
   			if(years == null){years = "";}
   			if(monthly_savings == null){monthly_savings = "";}
   			if(invested_amount == null){invested_amount = "";}
   			if(total_earnings == null){total_earnings = "";}
   			
   			wealth_amount = wealth_amount.trim();
   			current_age = current_age.trim();
   			wealth_age = wealth_age.trim();
   			price_increase_rate = price_increase_rate.trim();
   			rate_of_return = rate_of_return.trim();
   			savings_amount = savings_amount.trim();
   			
   			target_wealth = target_wealth.trim();
   			target_savings = target_savings.trim();
   			target_amount = target_amount.trim();
   			years = years.trim();
   			monthly_savings = monthly_savings.trim();
   			invested_amount = invested_amount.trim();
   			total_earnings = total_earnings.trim();
   			
   			String html_content = "";
   			html_content += "<html><body>";
   			html_content += "<br/><h4><b>Your Input Values</b></h4><br/>";
   			html_content += "<table width='100%' border='1'><tr><th><b>Particulars</b></th><th><b>Value</b></th></tr>";
   			html_content += "<tr><td>How many Crores (at current value) you would need to consider yourself wealthy (Rs)</td><td>Rs. "+wealth_amount_str+"</td></tr>";
   			html_content += "<tr><td>Your current age (in years)</td><td>"+current_age+" Years</td></tr>";
   			html_content += "<tr><td>The age when you want to become a Crorepati (in years)</td><td>"+wealth_age+" Years</td></tr>";
   			html_content += "<tr><td>The expected rate of inflation over the years (% per annum)</td><td>"+price_increase_rate+"%</td></tr>";
   			html_content += "<tr><td>What rate of return would you expect your SIP investment to generate (% per annum)</td><td>"+rate_of_return+"%</td></tr>";
   			html_content += "<tr><td>How much savings you have now (Rs)</td><td>Rs. "+savings_amount+"</td></tr>";
   			html_content += "</table><br/><br/>";
   			html_content += "<h4><b>Result</b></h4><br/>";
   			html_content += "<table width='100%' border='1'><tr><th><b>Particulars</b></th><th><b>Value</b></th></tr>";
   			html_content += "<tr><td>Your targeted Wealth Amount (Inflation adjusted)</td><td>Rs. "+target_wealth+"</td></tr>";
   			html_content += "<tr><td>Growth of your Savings Amount ("+rate_of_return+"% per annum)</td><td>Rs. "+target_savings+"</td></tr>";
   			html_content += "<tr><td>Final Targeted Amount (Minus growth of your saving amount)</td><td>Rs. "+target_amount+"</td></tr>";
   			html_content += "<tr><td>Number of Years</td><td>"+years+" Years</td></tr>";
   			html_content += "<tr><td>Monthly SIP investment required to become Crorepati</td><td>Rs. "+monthly_savings+"</td></tr>";
   			html_content += "<tr><td>Total Amount Invested through SIP in "+years+" years</td><td>Rs. "+invested_amount+"</td></tr>";
   			html_content += "<tr><td>Total Growth Amount</td><td>Rs. "+total_earnings+"</td></tr>";
   			html_content += "</table></body></html>";
   			
   			String FILE = request.getRealPath("") + File.separator + "download" + File.separator + "Become-A-Crorepati-Calculator.pdf";

   			 OutputStream file = new FileOutputStream(FILE);
               Document document = new Document(PageSize.A4);
               PdfWriter.getInstance(document, file);
               document.open();
              
               String host = hostDomainUrl;
               String logo = hostDomainUrl+"/images/logo/logo1.png";
	            //System.out.println("logo---->"+logo);
				
				Image img = Image.getInstance(logo);
				
				Font headerBold = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
				Font headerBold1 = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
				Font fontNormal = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);
				Font smallFontNormal = new Font(Font.FontFamily.HELVETICA, 9, Font.NORMAL);
				SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, YYYY");
				Calendar cal = Calendar.getInstance();
				Date today_date = cal.getTime(); 
				
				PdfPTable insideTable = new PdfPTable(6);
				insideTable.setWidthPercentage(100);

				PdfPTable tablezz = new PdfPTable(1);
				tablezz.setWidthPercentage(100);
				PdfPCell cell1 = new PdfPCell(img, true);
				cell1.setBorder(0);
				tablezz.addCell(cell1);
				tablezz.completeRow();

				cell1 = new PdfPCell(tablezz);
				cell1.setBorder(0);
				insideTable.addCell(cell1);

				cell1 = new PdfPCell();
				cell1.setBorder(0);
				Paragraph paragraph =  new Paragraph("", fontNormal);
				cell1.addElement(paragraph);
				insideTable.addCell(cell1);

				cell1 = new PdfPCell();
				cell1.setBorder(0);
				paragraph =  new Paragraph("", fontNormal);
				cell1.addElement(paragraph);
				insideTable.addCell(cell1);

				cell1 = new PdfPCell();
				cell1.setBorder(0);
				paragraph =  new Paragraph("", fontNormal);
				cell1.addElement(paragraph);
				insideTable.addCell(cell1);

				cell1 = new PdfPCell();
				cell1.setBorder(0);
				paragraph =  new Paragraph("1/95 , Post Office Road, Vettaikaraniruppu,\nNagapattinam, Tamilnadu - 611112 \n+91-74025 15544 | +91-86678 47016\n+966 541180621 (Saudi Arabia)\nEmail : connect@adcapitalinvestment.com\nWebsite : www.adcapitalinvestment.com", smallFontNormal);
				paragraph.setAlignment(Element.ALIGN_LEFT);
				cell1.addElement(paragraph);
				cell1.setColspan(2);
				insideTable.addCell(cell1);
				
				insideTable.completeRow();
				document.add(insideTable);
				
		        paragraph = new Paragraph("Date: "+sdf.format(today_date), fontNormal); 
		        //paragraph.setSpacingBefore(10);
	            paragraph.setSpacingAfter(5);
	            document.add(paragraph);
	            
	            paragraph = new Paragraph("Become A Crorepati",headerBold);
	            paragraph.setAlignment(Element.ALIGN_CENTER);
	            paragraph.setSpacingAfter(20);
				document.add(paragraph);
                
             
                
               //BaseColor myColor = WebColors.getRGBColor("#A00000");
               BaseColor base = new BaseColor(255,255,255);
               Font font = new Font(Font.FontFamily.TIMES_ROMAN, 12,Font.NORMAL);
               font.setColor(base.BLUE);
               
              	paragraph = new Paragraph("URL",headerBold1);
              	paragraph.setAlignment(Element.ALIGN_LEFT);
	            paragraph.setSpacingAfter(5);
				document.add(paragraph);
				
               Anchor anchor = new Anchor(url,font);
               anchor.setReference(url);
               paragraph = new Paragraph();
               paragraph.add(anchor);
               document.add(paragraph);
               
               HTMLWorker hw = new HTMLWorker(document);
   				hw.parse(new StringReader(html_content));
               
               document.close();
               file.close();
   			
               File f = new File(FILE);
    			FileInputStream fin = new FileInputStream(f);
    			ServletOutputStream outStream = response.getOutputStream();
    			response.setContentType("application/pdf");
    			response.setHeader("Content-Disposition", "attachment;filename=Become-A-Crorepati-Calculator.pdf");
        		byte[] buffer = new byte[1024];
        		int n = 0;
        		while ((n = fin.read(buffer)) != -1) 
        		{
        			outStream.write(buffer, 0, n);
        		}
        		outStream.flush();
        		fin.close();
        		outStream.close();
   		}
   		catch (Exception ex) 
   		{
   			ex.printStackTrace();
   		}
   	}
	
	@RequestMapping(value="/downloadSIPCalcResult")
   	public void downloadSIPCalcResult(HttpServletRequest request, HttpServletResponse response) throws IOException 
   	{		
   		try 
   		{
   			String requestUrl = request.getRequestURL().toString();
   	 		if(!Utils.isValidUrl(requestUrl, "downloadSIPCalcResult"))
   	 		{
   	 			response.sendRedirect(request.getContextPath() + "/page-not-found?invalidUrl=" + requestUrl);
       			return;
   	 		}
      	   	String sipamount = request.getParameter("sipamount");
   	   		String sipinterest = request.getParameter("sipinterest");
   	   		String sipmonth = request.getParameter("sipmonth");
   	   		
   	   		String invest_amount = request.getParameter("invest_amount");
   	   		String interest_total = request.getParameter("interest_total");
   	   		String final_amount = request.getParameter("final_amount");
   	   		String url = request.getParameter("url");
   	   		
   	   		String sipamount_str = request.getParameter("sipamount");
   	   		sipamount = sipamount.replaceAll(",", "");
   	    	String invest_amount_str = request.getParameter("invest_amount");
   	    	invest_amount = invest_amount.replaceAll(",", "");
   	    	String interest_total_str = request.getParameter("interest_total");
   		    interest_total = interest_total.replaceAll(",", "");
   		    String final_amount_str = request.getParameter("final_amount");
   	    	final_amount = final_amount.replaceAll(",", "");
   	   	 	   		
   			if(sipamount == null){sipamount = "";}
   			if(sipinterest == null){sipinterest = "";}
   			if(sipmonth == null){sipmonth = "";}
   			
   			if(invest_amount == null){invest_amount = "";}
   			if(interest_total == null){interest_total = "";}
   			if(final_amount == null){final_amount = "";}
   			
   			sipamount = sipamount.trim();
   			sipinterest = sipinterest.trim();
   			sipmonth = sipmonth.trim();
   			
   			invest_amount = invest_amount.trim();
   			interest_total = interest_total.trim();
   			final_amount = final_amount.trim();
   			
   			String html_content = "";
   			html_content += "<html><body>";
   			html_content += "<br><h4><b>Your Input Values</b></h4><br/>";
   			html_content += "<table width='100%' border='1'><tr><th><b>Particulars</b></th><th><b>Value</b></th></tr>";
   			html_content += "<tr><td>How much you can invest through monthly SIP? (Rs)</td><td>Rs. "+sipamount_str+"</td></tr>";
   			html_content += "<tr><td>How many months will you continue the SIP?</td><td>"+sipmonth+" Months</td></tr>";
   			html_content += "<tr><td>What rate of return do you expect? (% per annum)</td><td>"+sipinterest+"%</td></tr>";
   			html_content += "</table><br/><br/>";
   			html_content += "<h4><b>Result</b></h4><br/>";
   			html_content += "<table width='100%' border='1'><tr><th><b>Particulars</b></th><th><b>Value</b></th></tr>";
   			html_content += "<tr><td>Total SIP Amount Invested</td><td>Rs. "+invest_amount_str+"</td></tr>";
   			html_content += "<tr><td>Total Growth</td><td>Rs. "+interest_total_str+"</td></tr>";
   			html_content += "<tr><td>Total Future Value (Your SIP Investment Amount + Growth)</td><td>Rs. "+final_amount_str+"</td></tr>";
   			html_content += "</table></body></html>";
   			
   			String FILE = request.getRealPath("") + File.separator + "download" + File.separator + "SIP-Calculator.pdf";
   			
   			   OutputStream file = new FileOutputStream(FILE);
               Document document = new Document(PageSize.A4);
               PdfWriter.getInstance(document, file);
               document.open();
                
               String host = hostDomainUrl;
               String logo = hostDomainUrl+"/images/logo/logo1.png";
	            //System.out.println("logo---->"+logo);
				
				Image img = Image.getInstance(logo);
				
				Font headerBold = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
				Font headerBold1 = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
				Font fontNormal = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);
				Font smallFontNormal = new Font(Font.FontFamily.HELVETICA, 9, Font.NORMAL);
				SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, YYYY");
				Calendar cal = Calendar.getInstance();
				Date today_date = cal.getTime(); 
				
				PdfPTable insideTable = new PdfPTable(6);
				insideTable.setWidthPercentage(100);

				PdfPTable tablezz = new PdfPTable(1);
				tablezz.setWidthPercentage(100);
				PdfPCell cell1 = new PdfPCell(img, true);
				cell1.setBorder(0);
				tablezz.addCell(cell1);
				tablezz.completeRow();

				cell1 = new PdfPCell(tablezz);
				cell1.setBorder(0);
				insideTable.addCell(cell1);

				cell1 = new PdfPCell();
				cell1.setBorder(0);
				Paragraph paragraph =  new Paragraph("", fontNormal);
				cell1.addElement(paragraph);
				insideTable.addCell(cell1);

				cell1 = new PdfPCell();
				cell1.setBorder(0);
				paragraph =  new Paragraph("", fontNormal);
				cell1.addElement(paragraph);
				insideTable.addCell(cell1);

				cell1 = new PdfPCell();
				cell1.setBorder(0);
				paragraph =  new Paragraph("", fontNormal);
				cell1.addElement(paragraph);
				insideTable.addCell(cell1);

				cell1 = new PdfPCell();
				cell1.setBorder(0);
				paragraph =  new Paragraph("1/95 , Post Office Road, Vettaikaraniruppu,\nNagapattinam, Tamilnadu - 611112 \n+91-74025 15544 | +91-86678 47016\n+966 541180621 (Saudi Arabia)\nEmail : connect@adcapitalinvestment.com\nWebsite : www.adcapitalinvestment.com", smallFontNormal);
				paragraph.setAlignment(Element.ALIGN_LEFT);
				cell1.addElement(paragraph);
				cell1.setColspan(2);
				insideTable.addCell(cell1);
				
				 // Add a horizontal line
	            LineSeparator ls = new LineSeparator();
	            ls.setLineWidth(2);  // Set the thickness of the line
	            document.add(new Chunk(ls));  // Insert the line = new Paragraph("SIP Calculator",headerBold);
	            paragraph.setAlignment(Element.ALIGN_CENTER);
	            paragraph.setSpacingAfter(20);
				document.add(paragraph);
               
              
                
               //BaseColor myColor = WebColors.getRGBColor("#A00000");
               BaseColor base = new BaseColor(255,255,255);
               Font font = new Font(Font.FontFamily.TIMES_ROMAN, 12,Font.NORMAL);
               font.setColor(base.BLUE);
               
              	paragraph = new Paragraph("URL",headerBold1);
              	paragraph.setAlignment(Element.ALIGN_LEFT);
	            paragraph.setSpacingAfter(5);
				document.add(paragraph);
				
               Anchor anchor = new Anchor(url,font);
               anchor.setReference(url);
               paragraph = new Paragraph();
               paragraph.add(anchor);
               document.add(paragraph);

            
               
               HTMLWorker hw = new HTMLWorker(document);
   			   hw.parse(new StringReader(html_content));
               
               document.close();
               file.close();
   			
               File f = new File(FILE);
    			FileInputStream fin = new FileInputStream(f);
    			ServletOutputStream outStream = response.getOutputStream();
    			response.setContentType("application/pdf");
    			response.setHeader("Content-Disposition", "attachment;filename=SIP-Calculator.pdf");
        		byte[] buffer = new byte[1024];
        		int n = 0;
        		while ((n = fin.read(buffer)) != -1) 
        		{
        			outStream.write(buffer, 0, n);
        		}
        		outStream.flush();
        		fin.close();
        		outStream.close();
   		}
   		catch (Exception ex) 
   		{
   			ex.printStackTrace();
   		}
   	}
	
	
	
	
	 
	
	 
	 
	 
	
	 
	 
	 @RequestMapping(value="/downloadEducationPlannerCalcResult")
	   	public void downloadEducationPlannerCalcResult(HttpServletRequest request, HttpServletResponse response) throws IOException 
	   	{		
	   		try 
	   		{
	   			String requestUrl = request.getRequestURL().toString();
	   	 		if(!Utils.isValidUrl(requestUrl, "downloadEducationPlannerCalcResult"))
	   	 		{
	   	 			response.sendRedirect(request.getContextPath() + "/page-not-found?invalidUrl=" + requestUrl);
	       			return;
	   	 		}
	   		
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
		   		
		   		String child_total_amount = request.getParameter("child_total_amount");
		   		String child_1_year = request.getParameter("child_1_year");
		   		String child_1_increase_amount = request.getParameter("child_1_increase_amount");
		   		String child_total_increase_amount = request.getParameter("child_total_increase_amount");
		   		String child_1_invest_amount = request.getParameter("child_1_invest_amount");
		   		String child_total_invest_amount = request.getParameter("child_total_invest_amount");
		   		String child_1_monthly_amount = request.getParameter("child_1_monthly_amount");
		   		String child_total_monthly_amount = request.getParameter("child_total_monthly_amount");
		   		
		   		String child_2_year = request.getParameter("child_2_year");
		   		String child_2_increase_amount = request.getParameter("child_2_increase_amount");
		   		String child_2_invest_amount = request.getParameter("child_2_invest_amount");
		   		String child_2_monthly_amount = request.getParameter("child_2_monthly_amount");
		   		String url = request.getParameter("url");
		   		
		   		if(childName1 == null){childName1 = "";}
	   			if(childName2 == null){childName2 = "";}
	   			if(childAge1 == null){childAge1 = "";}
	   			if(childAge2 == null){childAge2 = "";}
	   			if(profEduAge1 == null){profEduAge1 = "";}
	   			if(profEduAge2 == null){profEduAge2 = "";}
	   			if(eduAmount1 == null){eduAmount1 = "";}
	   			if(eduAmount2 == null){eduAmount2 = "";}
	   			if(priceIncRate == null){priceIncRate = "";}
	   			if(rateOfReturn == null){rateOfReturn = "";}
	   			if(investAmount == null){investAmount = "";}
	   			
	   			if(child_total_amount == null){child_total_amount = "";}
	   			if(child_1_year == null){child_1_year = "";}
	   			if(child_1_increase_amount == null){child_1_increase_amount = "";}
	   			if(child_total_increase_amount == null){child_total_increase_amount = "";}
	   			if(child_1_invest_amount == null){child_1_invest_amount = "";}
	   			if(child_total_invest_amount == null){child_total_invest_amount = "";}
	   			if(child_1_monthly_amount == null){child_1_monthly_amount = "";}
	   			if(child_total_monthly_amount == null){child_total_monthly_amount = "";}
	   			
	   			if(child_2_year == null){child_2_year = "";}
	   			if(child_2_increase_amount == null){child_2_increase_amount = "";}
	   			if(child_2_invest_amount == null){child_2_invest_amount = "";}
	   			if(child_2_monthly_amount == null){child_2_monthly_amount = "";}
	   			
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
	   			
	   			child_total_amount = child_total_amount.trim();
	   			child_1_year = child_1_year.trim();
	   			child_1_increase_amount = child_1_increase_amount.trim();
	   			child_total_increase_amount = child_total_increase_amount.trim();
	   			child_1_invest_amount = child_1_invest_amount.trim();
	   			child_total_invest_amount = child_total_invest_amount.trim();
	   			child_1_monthly_amount = child_1_monthly_amount.trim();
	   			child_total_monthly_amount = child_total_monthly_amount.trim();
	   			
	   			child_2_year = child_2_year.trim();
	   			child_2_increase_amount = child_2_increase_amount.trim();
	   			child_2_invest_amount = child_2_invest_amount.trim();
	   			child_2_monthly_amount = child_2_monthly_amount.trim();
	   			
	   			String html_content = "";
	   			html_content += "<html><body>";
	   			html_content += "<br/><br/><h4><b>Your Input Values</b></h4><br/>";
	   			html_content += "<table width='100%' border='1'><tr><th><b>Name</b></th><th><b>Value1</b></th><th><b>Value2</b></th></tr>";
	   			html_content += "<tr><td>Enter your children's names</td><td>"+childName1+"</td><td>"+childName2+"</td></tr>";
	   			html_content += "<tr><td>Enter your children's current ages (in years)</td><td>"+childAge1+" Years</td><td>"+childAge2+" Years</td></tr>";
	   			html_content += "<tr><td>Enter the age at which your children's would be ready for professional education (in years)</td><td>"+profEduAge1+" Years</td><td>"+profEduAge2+" Years</td></tr>";
	   			html_content += "<tr><td>Enter the amount you would need at today's cost to fulfil your children's educational needs (Rs)</td><td>Rs. "+eduAmount1+"</td><td>Rs. "+eduAmount2+"</td></tr>";
	   			html_content += "<tr><td>The expected rate of inflation over the years (% per annum)</td><td colspan='2'>"+priceIncRate+" %</td></tr>";
	   			html_content += "<tr><td>What rate of return would you expect your investment? (% per annum)</td><td colspan='2'>"+rateOfReturn+" %</td></tr>";
	   			html_content += "<tr><td>How much savings you have now? (Rs)</td><td colspan='2'>Rs. "+investAmount+"</td></tr>";
	   			
	   			html_content += "</table><br/><br/>";
	   			html_content += "<h4><b>Result</b></h4><br/>";
	   			html_content += "<table width='100%' border='1'><tr><th><b>Education Planner</b></th><th><b>Cost of "+childName1+"'s education</b></th><th><b>Cost of "+childName2+"'s education</b></th><th><b>Total cost for both</b></th></tr>";
	   			html_content += "<tr><td>Amount at today's prices</td><td>Rs. "+eduAmount1+"</td><td>Rs. "+eduAmount2+"</td><td>Rs. "+child_total_amount+"</td></tr>";
	   			html_content += "<tr><td>Your child will take up professional education in</td><td>"+child_1_year+" Years</td><td>"+child_2_year+" Years</td><td>-</td></tr>";
	   			html_content += "<tr><td>Expected rate of return from investments (% per annum)</td><td>"+rateOfReturn+" %</td><td>"+rateOfReturn+" %</td><td>-</td></tr>";
	   			html_content += "<tr><td>Future cost of education (Inflation adjusted)</td><td>Rs. "+child_1_increase_amount+"</td><td>Rs. "+child_2_increase_amount+"</td><td>Rs. "+child_total_increase_amount+"</td></tr>";
	   			html_content += "<tr><td>Your current savings amount</td><td>Rs. "+child_1_invest_amount+"</td><td>Rs. "+child_2_invest_amount+"</td><td>Rs. "+child_total_invest_amount+"</td></tr>";
	   			html_content += "<tr><td>Monthly Savings required</td><td>Rs. "+child_1_monthly_amount+"</td><td>Rs. "+child_2_monthly_amount+"</td><td>Rs. "+child_total_monthly_amount+"</td></tr>";
	   			html_content += "</table></body></html>";
	   			
	   			
	   			String FILE = request.getRealPath("") + File.separator + "download" + File.separator + "Education-Planner.pdf";
	   			
	   			   OutputStream file = new FileOutputStream(FILE);
	               Document document = new Document(PageSize.A4);
	               PdfWriter.getInstance(document, file);
	               document.open();
	                
	               String host = hostDomainUrl;
	               String logo = hostDomainUrl+"/images/logo/logo1.png";
		            //System.out.println("logo---->"+logo);
					
					Image img = Image.getInstance(logo);
					
					Font headerBold = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
					Font headerBold1 = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
					Font fontNormal = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);
					Font smallFontNormal = new Font(Font.FontFamily.HELVETICA, 9, Font.NORMAL);
					SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, YYYY");
					Calendar cal = Calendar.getInstance();
					Date today_date = cal.getTime(); 
					
					PdfPTable insideTable = new PdfPTable(6);
					insideTable.setWidthPercentage(100);

					PdfPTable tablezz = new PdfPTable(1);
					tablezz.setWidthPercentage(100);
					PdfPCell cell1 = new PdfPCell(img, true);
					cell1.setBorder(0);
					tablezz.addCell(cell1);
					tablezz.completeRow();

					cell1 = new PdfPCell(tablezz);
					cell1.setBorder(0);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					Paragraph paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("1/95 , Post Office Road, Vettaikaraniruppu,\nNagapattinam, Tamilnadu - 611112 \n+91-74025 15544 | +91-86678 47016\n+966 541180621 (Saudi Arabia)\nEmail : connect@adcapitalinvestment.com\nWebsite : www.adcapitalinvestment.com", smallFontNormal);
					paragraph.setAlignment(Element.ALIGN_LEFT);
					cell1.addElement(paragraph);
					cell1.setColspan(2);
					insideTable.addCell(cell1);
					
					insideTable.completeRow();
					document.add(insideTable);
					
			        paragraph = new Paragraph("Date: "+sdf.format(today_date), fontNormal); 
			        //paragraph.setSpacingBefore(10);
		            paragraph.setSpacingAfter(5);
		            document.add(paragraph);
		            
		            paragraph = new Paragraph("Education Planner",headerBold);
		            paragraph.setAlignment(Element.ALIGN_CENTER);
		            paragraph.setSpacingAfter(20);
					document.add(paragraph);
	               
	             
	                
	               //BaseColor myColor = WebColors.getRGBColor("#A00000");
	               BaseColor base = new BaseColor(255,255,255);
	               Font font = new Font(Font.FontFamily.TIMES_ROMAN, 12,Font.NORMAL);
	               font.setColor(base.BLUE);
	               
	              	paragraph = new Paragraph("URL",headerBold1);
		            paragraph.setAlignment(Element.ALIGN_LEFT);
		            paragraph.setSpacingAfter(5);
					document.add(paragraph);
					
	               Anchor anchor = new Anchor(url,font);
	               anchor.setReference(url);
	               paragraph = new Paragraph();
	               paragraph.add(anchor);
	               document.add(paragraph);
	               
	               HTMLWorker hw = new HTMLWorker(document);
	   			   hw.parse(new StringReader(html_content));
	               
	               document.close();
	               file.close();
	   			
	                File f = new File(FILE);
	    			FileInputStream fin = new FileInputStream(f);
	    			ServletOutputStream outStream = response.getOutputStream();
	    			response.setContentType("application/pdf");
	    			response.setHeader("Content-Disposition", "attachment;filename=Education-Planner.pdf");
	        		byte[] buffer = new byte[1024];
	        		int n = 0;
	        		while ((n = fin.read(buffer)) != -1) 
	        		{
	        			outStream.write(buffer, 0, n);
	        		}
	        		outStream.flush();
	        		fin.close();
	        		outStream.close();
	   		}
	   		catch (Exception ex) 
	   		{
	   			ex.printStackTrace();
	   		}
	   	}
	 
	
	 
	 
	 @RequestMapping(value="/downloadHumanValueCalcResult")
	   	public void downloadHumanValueCalcResult(HttpServletRequest request, HttpServletResponse response) throws IOException 
	   	{		
	   		try 
	   		{
	   			String requestUrl = request.getRequestURL().toString();
	   	 		if(!Utils.isValidUrl(requestUrl, "/downloadHumanValueCalcResult"))
	   	 		{
	   	 			response.sendRedirect(request.getContextPath() + "/page-not-found?invalidUrl=" + requestUrl);
	       			return;
	   	 		}
	      	   	String amount = request.getParameter("amount");
	   	   		String rate = request.getParameter("rate");
	   	   		String loan_amount = request.getParameter("loan_amount");
	   	   		String year = request.getParameter("year");
	      	   	String res_amount = request.getParameter("res_amount");
	   	   		String res_rate = request.getParameter("res_rate");
	   	   		String res_loan_amount = request.getParameter("res_loan_amount");
	   	   		String res_future_amount = request.getParameter("res_future_amount");
	   	   		String res_insurance_cover = request.getParameter("res_insurance_cover");
	   	   		String url = request.getParameter("url");
	   	   		
	   			if(amount == null){amount = "";}
	   			if(rate == null){rate = "";}
	   			if(loan_amount == null){loan_amount = "";}
	   			if(year == null){year = "";}
	   			if(res_amount == null){res_amount = "";}
	   			if(res_rate == null){res_rate = "";}
	   			if(res_loan_amount == null){res_loan_amount = "";}
	   			if(res_future_amount == null){res_future_amount = "";}
	   			if(res_insurance_cover == null){res_insurance_cover = "";}
	   			
	   			amount = amount.trim();
	   			rate = rate.trim();
	   			loan_amount = loan_amount.trim();
	   			year = year.trim();
	   			res_amount = res_amount.trim();
	   			res_rate = res_rate.trim();
	   			res_loan_amount = res_loan_amount.trim();
	   			res_future_amount = res_future_amount.trim();
	   			res_insurance_cover = res_insurance_cover.trim();

	   			String html_content = "";
	   			html_content += "<html><body>";
	   			html_content += "<br/><br/><h4><b>Your Input Values</b></h4><br/>";
	   			html_content += "<table width='100%' border='1'><tr><th><b>Particulars</b></th><th><b>Value</b></th></tr>";
	   			html_content += "<tr><td>Your Current Annual Income (Rs) </td><td>Rs. "+amount+"</td></tr>";
	   			html_content += "<tr><td>Expected increase in income (% per annum)</td><td>"+rate+" %</td></tr>";
	   			html_content += "<tr><td>Outstanding loan amount (Rs)</td><td>Rs. "+loan_amount+" </td></tr>";
	   			html_content += "<tr><td>Number of Years</td><td>"+year+" </td></tr>";
	   			
	   			html_content += "</table><br/><br/>";
	   			html_content += "<h4><b>Result</b></h4><br/>";
	   			html_content += "<table width='100%' border='1'><tr><th><b>Particulars</b></th><th><b>Value</b></th></tr>";
	   			html_content += "<tr><td>Your Current Annual Income</td><td>Rs. "+res_amount+"</td></tr>";
	   			html_content += "<tr><td>Expected increase in income (% per annum)</td><td>"+res_rate+"</td></tr>";
	   			html_content += "<tr><td>Outstanding loan amount</td><td>Rs. "+res_loan_amount+"</td></tr>";
	   			html_content += "<tr><td>cumulative income that you will have to take care in next "+year+" years</td><td>Rs. "+res_future_amount+"</td></tr>";
	   			html_content += "<tr><td>Your ideal life cover</td><td>Rs. "+res_insurance_cover+"</td></tr>";
	   			html_content += "</table></body></html>";
	   			
	   			
	   			String FILE = request.getRealPath("") + File.separator + "download" + File.separator + "Human-Life-Value-Calculator.pdf";
	   			
	   			   OutputStream file = new FileOutputStream(FILE);
	               Document document = new Document(PageSize.A4);
	               PdfWriter.getInstance(document, file);
	               document.open();
	                
	               String host = hostDomainUrl;
	               String logo = hostDomainUrl+"/images/logo/logo1.png";
		            //System.out.println("logo---->"+logo);
					
					Image img = Image.getInstance(logo);
					
					Font headerBold = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
					Font headerBold1 = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
					Font fontNormal = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);
					Font smallFontNormal = new Font(Font.FontFamily.HELVETICA, 9, Font.NORMAL);
					SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, YYYY");
					Calendar cal = Calendar.getInstance();
					Date today_date = cal.getTime(); 
					
					PdfPTable insideTable = new PdfPTable(6);
					insideTable.setWidthPercentage(100);

					PdfPTable tablezz = new PdfPTable(1);
					tablezz.setWidthPercentage(100);
					PdfPCell cell1 = new PdfPCell(img, true);
					cell1.setBorder(0);
					tablezz.addCell(cell1);
					tablezz.completeRow();

					cell1 = new PdfPCell(tablezz);
					cell1.setBorder(0);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					Paragraph paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("1/95 , Post Office Road, Vettaikaraniruppu,\nNagapattinam, Tamilnadu - 611112 \n+91-74025 15544 | +91-86678 47016\n+966 541180621 (Saudi Arabia)\nEmail : connect@adcapitalinvestment.com\nWebsite : www.adcapitalinvestment.com", smallFontNormal);
					paragraph.setAlignment(Element.ALIGN_LEFT);
					cell1.addElement(paragraph);
					cell1.setColspan(2);
					insideTable.addCell(cell1);
					
					insideTable.completeRow();
					document.add(insideTable);
					
			        paragraph = new Paragraph("Date: "+sdf.format(today_date), fontNormal); 
			        //paragraph.setSpacingBefore(10);
		            paragraph.setSpacingAfter(5);
		            document.add(paragraph);
		            
		            paragraph = new Paragraph("Human Life Value Calculator",headerBold);
		            paragraph.setAlignment(Element.ALIGN_CENTER);
		            paragraph.setSpacingAfter(20);
					document.add(paragraph);
	               
	               
	            
	                
	               //BaseColor myColor = WebColors.getRGBColor("#A00000");
	               BaseColor base = new BaseColor(255,255,255);
	               Font font = new Font(Font.FontFamily.TIMES_ROMAN, 12,Font.NORMAL);
	               font.setColor(base.BLUE);
	               
	           	paragraph = new Paragraph("URL",headerBold1);
	            paragraph.setAlignment(Element.ALIGN_LEFT);
	            paragraph.setSpacingAfter(5);
				document.add(paragraph);
				
	           Anchor anchor = new Anchor(url,font);
	           anchor.setReference(url);
	           paragraph = new Paragraph();
	           paragraph.add(anchor);
	           document.add(paragraph);
	               
	               HTMLWorker hw = new HTMLWorker(document);
	   			   hw.parse(new StringReader(html_content));
	               
	               document.close();
	               file.close();
	   			
	                File f = new File(FILE);
	    			FileInputStream fin = new FileInputStream(f);
	    			ServletOutputStream outStream = response.getOutputStream();
	    			response.setContentType("application/pdf");
	    			response.setHeader("Content-Disposition", "attachment;filename=Human-Life-Value-Calculator.pdf");
	        		byte[] buffer = new byte[1024];
	        		int n = 0;
	        		while ((n = fin.read(buffer)) != -1) 
	        		{
	        			outStream.write(buffer, 0, n);
	        		}
	        		outStream.flush();
	        		fin.close();
	        		outStream.close();
	   		}
	   		catch (Exception ex) 
	   		{
	   			ex.printStackTrace();
	   		}
	   	}
	 
	 
	 
	 
	 @RequestMapping(value="/downloadTargetAmountSipCalcResult")
	   	public void downloadTargetAmountSipCalcResult(HttpServletRequest request, HttpServletResponse response) throws IOException 
	   	{		
	   		try 
	   		{
	   			String requestUrl = request.getRequestURL().toString();
	   	 		if(!Utils.isValidUrl(requestUrl, "downloadTargetAmountSipCalcResult"))
	   	 		{
	   	 			response.sendRedirect(request.getContextPath() + "/page-not-found?invalidUrl=" + requestUrl);
	       			return;
	   	 		}
	      	   	String wealth_amount = request.getParameter("wealth_amount");
	   	   		String current_age = request.getParameter("current_age");
	   	   		String wealth_age = request.getParameter("wealth_age");
	   	   		String price_increase_rate = request.getParameter("price_increase_rate");
	   	   		String rate_of_return = request.getParameter("rate_of_return");
	   	   		/*String savings_amount = request.getParameter("savings_amount");*/
	   	   		
	   	   		String target_wealth = request.getParameter("target_wealth");
	   	   		/*String target_savings = request.getParameter("target_savings");
	   	   		String target_amount = request.getParameter("target_amount");*/
	      	   	String years = request.getParameter("years");
	      	   	String monthly_savings = request.getParameter("monthly_savings");
	   	   		String invested_amount = request.getParameter("invested_amount");
	   	   		String total_earnings = request.getParameter("total_earnings");
	   	   		String url = request.getParameter("url");
	   	   		
	   			if(wealth_amount == null){wealth_amount = "";}
	   			if(current_age == null){current_age = "";}
	   			if(wealth_age == null){wealth_age = "";}
	   			if(price_increase_rate == null){price_increase_rate = "";}
	   			if(rate_of_return == null){rate_of_return = "";}
	   			/*if(savings_amount == null){savings_amount = "";}*/
	   			
	   			if(target_wealth == null){target_wealth = "";}
	   			/*if(target_savings == null){target_savings = "";}
	   			if(target_amount == null){target_amount = "";}*/
	   			if(years == null){years = "";}
	   			if(monthly_savings == null){monthly_savings = "";}
	   			if(invested_amount == null){invested_amount = "";}
	   			if(total_earnings == null){total_earnings = "";}
	   			
	   			wealth_amount = wealth_amount.trim();
	   			current_age = current_age.trim();
	   			wealth_age = wealth_age.trim();
	   			price_increase_rate = price_increase_rate.trim();
	   			rate_of_return = rate_of_return.trim();
	   			/*savings_amount = savings_amount.trim();*/
	   			
	   			target_wealth = target_wealth.trim();
	   			/*target_savings = target_savings.trim();
	   			target_amount = target_amount.trim();*/
	   			years = years.trim();
	   			monthly_savings = monthly_savings.trim();
	   			invested_amount = invested_amount.trim();
	   			total_earnings = total_earnings.trim();
	   			
	   			String html_content = "";
	   			html_content += "<html><body>";
	   			html_content += "<br/><br/><h4><b>Your Input Values</b></h4><br/>";
	   			html_content += "<table width='100%' border='1'><tr><th><b>Name</b></th><th><b>Value</b></th></tr>";
	   			html_content += "<tr><td>How many Crores (at current value) you would need to consider yourself wealthy (Rs)</td><td>Rs. "+wealth_amount+"</td></tr>";
	   			html_content += "<tr><td>Your current age (in years)</td><td>"+current_age+" Years</td></tr>";
	   			html_content += "<tr><td>The age when you want to become a Crorepati (in years)</td><td>"+wealth_age+" Years</td></tr>";
	   			html_content += "<tr><td>The expected rate of inflation over the years (% per annum)</td><td>"+price_increase_rate+"%</td></tr>";
	   			html_content += "<tr><td>What rate of return would you expect your SIP investment to generate (% per annum)</td><td>"+rate_of_return+"%</td></tr>";
	   			/*html_content += "<tr><td>How much savings you have now (Rs)</td><td>Rs. "+savings_amount+"</td></tr>";*/
	   			html_content += "</table><br/><br/>";
	   			html_content += "<h4><b>Result</b></h4><br/>";
	   			html_content += "<table width='100%' border='1'><tr><th><b>Name</b></th><th><b>Value</b></th></tr>";
	   			html_content += "<tr><td>Your targeted Wealth Amount (Inflation adjusted)</td><td>Rs. "+target_wealth+"</td></tr>";
	   			/*html_content += "<tr><td>Growth of your Savings Amount ("+rate_of_return+"% per annum)</td><td>Rs. "+target_savings+"</td></tr>";
	   			html_content += "<tr><td>Final Targeted Amount (Minus growth of your saving amount)</td><td>Rs. "+target_amount+"</td></tr>";*/
	   			html_content += "<tr><td>Number of Years</td><td>"+years+" Years</td></tr>";
	   			html_content += "<tr><td>Monthly SIP investment required to become Crorepati</td><td>Rs. "+monthly_savings+"</td></tr>";
	   			html_content += "<tr><td>Total Amount Invested through SIP in "+years+" years</td><td>Rs. "+invested_amount+"</td></tr>";
	   			html_content += "<tr><td>Total Growth Amount</td><td>Rs. "+total_earnings+"</td></tr>";
	   			html_content += "</table></body></html>";
	   			
	   			String FILE = request.getRealPath("") + File.separator + "download" + File.separator + "Become-A-Crorepati-Calculator.pdf";
	   			
	   			OutputStream file = new FileOutputStream(FILE);
	               Document document = new Document(PageSize.A4);
	               PdfWriter.getInstance(document, file);
	               document.open();
	               
	               String host = hostDomainUrl;
	               String logo = hostDomainUrl+"/images/logo/logo1.png";
		            //System.out.println("logo---->"+logo);
					
					Image img = Image.getInstance(logo);
					
					Font headerBold1 = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
					Font headerBold = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
					Font fontNormal = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);
					Font smallFontNormal = new Font(Font.FontFamily.HELVETICA, 9, Font.NORMAL);
					SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, YYYY");
					Calendar cal = Calendar.getInstance();
					Date today_date = cal.getTime(); 
					
					PdfPTable insideTable = new PdfPTable(6);
					insideTable.setWidthPercentage(100);

					PdfPTable tablezz = new PdfPTable(1);
					tablezz.setWidthPercentage(100);
					PdfPCell cell1 = new PdfPCell(img, true);
					cell1.setBorder(0);
					tablezz.addCell(cell1);
					tablezz.completeRow();

					cell1 = new PdfPCell(tablezz);
					cell1.setBorder(0);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					Paragraph paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("1/95 , Post Office Road, Vettaikaraniruppu,\nNagapattinam, Tamilnadu - 611112 \n+91-74025 15544 | +91-86678 47016\n+966 541180621 (Saudi Arabia)\nEmail : connect@adcapitalinvestment.com\nWebsite : www.adcapitalinvestment.com", smallFontNormal);
					paragraph.setAlignment(Element.ALIGN_LEFT);
					cell1.addElement(paragraph);
					cell1.setColspan(2);
					insideTable.addCell(cell1);
					
					insideTable.completeRow();
					document.add(insideTable);
					
			        paragraph = new Paragraph("Date: "+sdf.format(today_date), fontNormal); 
			        //paragraph.setSpacingBefore(10);
		            paragraph.setSpacingAfter(5);
		            document.add(paragraph);
		            
		            paragraph = new Paragraph("Target Amount SIP Calculator",headerBold);
		            paragraph.setAlignment(Element.ALIGN_CENTER);
		            paragraph.setSpacingAfter(20);
					document.add(paragraph);
	               
	            
	                
	               //BaseColor myColor = WebColors.getRGBColor("#A00000");
	               BaseColor base = new BaseColor(255,255,255);
	               Font font = new Font(Font.FontFamily.TIMES_ROMAN, 12,Font.NORMAL);
	               font.setColor(base.BLUE);
	               
	              	paragraph = new Paragraph("URL",headerBold1);
		            paragraph.setAlignment(Element.ALIGN_LEFT);
		            paragraph.setSpacingAfter(5);
					document.add(paragraph);
					
	               Anchor anchor = new Anchor(url,font);
	               anchor.setReference(url);
	               paragraph = new Paragraph();
	               paragraph.add(anchor);
	               document.add(paragraph);
	               
	               HTMLWorker hw = new HTMLWorker(document);
	   			hw.parse(new StringReader(html_content));
	               
	               document.close();
	               file.close();
	   			
	               File f = new File(FILE);
	    			FileInputStream fin = new FileInputStream(f);
	    			ServletOutputStream outStream = response.getOutputStream();
	    			response.setContentType("application/pdf");
	    			response.setHeader("Content-Disposition", "attachment;filename=Target-Amount-Sip-Calculator.pdf");
	        		byte[] buffer = new byte[1024];
	        		int n = 0;
	        		while ((n = fin.read(buffer)) != -1) 
	        		{
	        			outStream.write(buffer, 0, n);
	        		}
	        		outStream.flush();
	        		fin.close();
	        		outStream.close();
	   		}
	   		catch (Exception ex) 
	   		{
	   			ex.printStackTrace();
	   		}
	   	}
	 
		
	 
	 @RequestMapping(value="/downloadSIPStepUpCalcResult")
	   	public void downloadSIPStepUpCalcResult(HttpServletRequest request, HttpServletResponse response) throws IOException 
	   	{		
	   		try 
	   		{
	   			String requestUrl = request.getRequestURL().toString();
	   	 		if(!Utils.isValidUrl(requestUrl, "downloadSIPStepUpCalcResult"))
	   	 		{
	   	 			response.sendRedirect(request.getContextPath() + "/page-not-found?invalidUrl=" + requestUrl);
	       			return;
	   	 		}
	      	   	String sipAmount = request.getParameter("sipAmount");
	   	   		String rateofReturn = request.getParameter("rateofReturn");
	   	   		String sipMonth = request.getParameter("sipMonth");
	   	   		String sipstepup = request.getParameter("sipstepup");

	   	   		String invested_amount = request.getParameter("invested_amount");
	   	   		String growth_value = request.getParameter("growth_value");
	   	   		String maturity_amount = request.getParameter("maturity_amount");
	   	   		String stepup_invested_amount = request.getParameter("stepup_invested_amount");
	   			String stepup_growth_value = request.getParameter("stepup_growth_value");
	   			String stepup_maturity_amount = request.getParameter("stepup_maturity_amount");
	   	   		String url = request.getParameter("url");
	   	   	 	   		
	   			if(sipAmount == null){sipAmount = "";}
	   			if(rateofReturn == null){rateofReturn = "";}
	   			if(sipMonth == null){sipMonth = "";}
	   			if(sipstepup == null){sipstepup = "";}
	   			
	   			if(invested_amount == null){invested_amount = "";}
	   			if(growth_value == null){growth_value = "";}
	   			if(maturity_amount == null){maturity_amount = "";}
	   			if(stepup_invested_amount == null){stepup_invested_amount = "";}
	   			if(stepup_maturity_amount == null){stepup_maturity_amount = "";}
	   			if(stepup_growth_value == null){stepup_growth_value = "";}
	   			
	   			sipAmount = sipAmount.trim();
	   			rateofReturn = rateofReturn.trim();
	   			sipMonth = sipMonth.trim();
	   			sipstepup = sipstepup.trim();
	   			
	   			invested_amount = invested_amount.trim();
	   			growth_value = growth_value.trim();
	   			maturity_amount = maturity_amount.trim();
	   			stepup_invested_amount = stepup_invested_amount.trim();
	   			stepup_maturity_amount = stepup_maturity_amount.trim();
	   			stepup_growth_value = stepup_growth_value.trim();
	   			
	   			String html_content = "";
	   			html_content += "<html><body>";
	   			html_content += "<br><h4><b>Your Input Values</b></h4><br/>";
	   			html_content += "<table width='100%' border='1'><tr><th><b>Particulars</b></th><th><b>Value</b></th></tr>";
	   			html_content += "<tr><td>How much you can invest through monthly SIP? (Rs)</td><td>Rs. "+sipAmount+"/-</td></tr>";
	   			html_content += "<tr><td>How many months will you continue the SIP?</td><td>"+sipMonth+" Months</td></tr>";
	   			html_content += "<tr><td>What rate of return do you expect? (% per annum)</td><td>"+rateofReturn+"%</td></tr>";
	   			html_content += "<tr><td>How much percentage step up monthly SIP? (% per annum)</td><td>"+sipstepup+"%</td></tr>";
	   			html_content += "</table><br/><br/>";
	   			html_content += "<h4><b>Result</b></h4><br/>";
	   			html_content += "<table width='100%' border='1'><tr><th><b>Particulars</b></th><th><b>Value</b></th></tr>";
	   			html_content += "<tr><td>Total SIP Amount Invested with out step up</td><td>Rs. "+invested_amount+"/-</td></tr>";
	   			html_content += "<tr><td>Total Growth with out step up</td><td>Rs. "+growth_value+"/-</td></tr>";
	   			html_content += "<tr><td>Total Future Value(Your SIP Investment Amount + Growth) with out step up</td><td>Rs. "+maturity_amount+"/-</td></tr>";
	   			html_content += "<tr><td>Total SIP Amount Invested with step up</td><td>Rs. "+stepup_invested_amount+"/-</td></tr>";
	   			html_content += "<tr><td>Total Growth with step up</td><td>Rs. "+stepup_growth_value+"/-</td></tr>";
	   			html_content += "<tr><td>Total Future Value(Your SIP Investment Amount + Growth) with step up</td><td>Rs. "+stepup_maturity_amount+"/-</td></tr>";
	   			html_content += "</table></body></html>";
	   			
	   			String FILE = request.getRealPath("") + File.separator + "download" + File.separator + "SIP-Step-Up-Calculator.pdf";
	   			
	   			   OutputStream file = new FileOutputStream(FILE);
	               Document document = new Document(PageSize.A4);
	               PdfWriter.getInstance(document, file);
	               document.open();


	               
	               String host = hostDomainUrl;
	               String logo = hostDomainUrl+"/images/logo/logo1.png";
		            //System.out.println("logo---->"+logo);
					
					Image img = Image.getInstance(logo);
					
					Font headerBold = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
					Font headerBold1 = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
					Font fontNormal = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);
					Font smallFontNormal = new Font(Font.FontFamily.HELVETICA, 9, Font.NORMAL);
					SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, YYYY");
					Calendar cal = Calendar.getInstance();
					Date today_date = cal.getTime(); 
					
					PdfPTable insideTable = new PdfPTable(6);
					insideTable.setWidthPercentage(100);

					PdfPTable tablezz = new PdfPTable(1);
					tablezz.setWidthPercentage(100);
					PdfPCell cell1 = new PdfPCell(img, true);
					cell1.setBorder(0);
					tablezz.addCell(cell1);
					tablezz.completeRow();

					cell1 = new PdfPCell(tablezz);
					cell1.setBorder(0);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					Paragraph paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("1/95 , Post Office Road, Vettaikaraniruppu,\nNagapattinam, Tamilnadu - 611112 \n+91-74025 15544 | +91-86678 47016\n+966 541180621 (Saudi Arabia)\nEmail : connect@adcapitalinvestment.com\nWebsite : www.adcapitalinvestment.com", smallFontNormal);
					paragraph.setAlignment(Element.ALIGN_LEFT);
					cell1.addElement(paragraph);
					cell1.setColspan(2);
					insideTable.addCell(cell1);
					
					insideTable.completeRow();
					document.add(insideTable);
					
			        paragraph = new Paragraph("Date: "+sdf.format(today_date), fontNormal); 
			        //paragraph.setSpacingBefore(10);
		            paragraph.setSpacingAfter(10);
		            document.add(paragraph);
		            
		            
		            paragraph = new Paragraph("SIP Step Up Calculator",headerBold);
		            paragraph.setAlignment(Element.ALIGN_CENTER);
		            paragraph.setSpacingBefore(10);
		            paragraph.setSpacingAfter(10);
					document.add(paragraph);
	               
					
	                
	               //BaseColor myColor = WebColors.getRGBColor("#A00000");
	               BaseColor base = new BaseColor(255,255,255);
	               Font font = new Font(Font.FontFamily.TIMES_ROMAN, 12,Font.NORMAL);
	               font.setColor(base.BLUE);
	               
	              	paragraph = new Paragraph("URL",headerBold1);
	              	paragraph.setAlignment(Element.ALIGN_LEFT);
		            paragraph.setSpacingAfter(5);
					document.add(paragraph);
					
	               Anchor anchor = new Anchor(url,font);
	               anchor.setReference(url);
	               paragraph = new Paragraph();
	               paragraph.add(anchor);
	               document.add(paragraph);

	            
	               
	               HTMLWorker hw = new HTMLWorker(document);
	   			   hw.parse(new StringReader(html_content));
	               
	               document.close();
	               file.close();
	   			
	               File f = new File(FILE);
	    			FileInputStream fin = new FileInputStream(f);
	    			ServletOutputStream outStream = response.getOutputStream();
	    			response.setContentType("application/pdf");
	    			response.setHeader("Content-Disposition", "attachment;filename=SIP-Calculator.pdf");
	        		byte[] buffer = new byte[1024];
	        		int n = 0;
	        		while ((n = fin.read(buffer)) != -1) 
	        		{
	        			outStream.write(buffer, 0, n);
	        		}
	        		outStream.flush();
	        		fin.close();
	        		outStream.close();
	   		}
	   		catch (Exception ex) 
	   		{
	   			ex.printStackTrace();
	   		}
	   	}
	 	 
	 @RequestMapping(value="/downloadLumpsumTargetCalcResult")
	   	public void downloadLumpsumTargetCalcResult(HttpServletRequest request, HttpServletResponse response) throws IOException 
	   	{		
	   		try 
	   		{
	   			String requestUrl = request.getRequestURL().toString();
	   	 		if(!Utils.isValidUrl(requestUrl, "downloadLumpsumTargetCalcResult"))
	   	 		{
	   	 			response.sendRedirect(request.getContextPath() + "/page-not-found?invalidUrl=" + requestUrl);
	       			return;
	   	 		}
	      	   	
		   	 	String dream_amount = request.getParameter("dream_amount");
	   	   		String years = request.getParameter("years");
	   	   		String rateofReturn = request.getParameter("rateofReturn");	
	   	   		
	   	   		String res_dream_amount = request.getParameter("res_dream_amount");
	   	   		String res_years = request.getParameter("res_years");
	   	   		String res_lumpsum_amount = request.getParameter("res_lumpsum_amount");
	   	   		String url = request.getParameter("url");
	   	   		  	   		
	   			if(dream_amount == null){dream_amount = "";}
	   			if(years == null){years = "";}
	   			if(rateofReturn == null){rateofReturn = "";}
	   			
	   			if(res_dream_amount == null){res_dream_amount = "";}
	   			if(res_years == null){res_years = "";}
	   			if(res_lumpsum_amount == null){res_lumpsum_amount = "";}
	   			
	   			dream_amount = dream_amount.trim();
	   			years = years.trim();
	   			rateofReturn = rateofReturn.trim();
	   			
	   			res_dream_amount = res_dream_amount.trim();
	   			res_years = res_years.trim();
	   			res_lumpsum_amount = res_lumpsum_amount.trim();
	   			
	   			String html_content = "";
	   			html_content += "<html><body>";
				html_content += "<br/><h4><b>Your Input Values</b></h4><br/>";
				html_content += "<table width='100%' border='1'><tr><th><b>Name</b></th><th><b>Value</b></th></tr>";
				html_content += "<tr><td>How much amount you want to save (Rs)</td><td>Rs. "+dream_amount+"</td></tr>";
				html_content += "<tr><td>How many years after you need this amount (Years)</td><td>"+years+" Years</td></tr>";
				html_content += "<tr><td>Expected rate of return (% per annum)</td><td>"+rateofReturn+"%</td></tr>";
				
				html_content += "</table><br/><br/>";
				html_content += "<h4><b>Result</b></h4><br/>";
				html_content += "<table width='100%' border='1'><tr><th><b>Name</b></th><th><b>Value</b></th></tr>";
				html_content += "<tr><td>Your targeted Amount</td><td>Rs. "+res_dream_amount+"</td></tr>";
				html_content += "<tr><td>Number of years to achieve your goal</td><td>"+res_years+" Years</td></tr>";
				html_content += "<tr><td>Lumpsum Investment Amount</td><td>Rs. "+res_lumpsum_amount+"</td></tr>";
				html_content += "</table></body></html>";	
	   			
				String FILE = request.getRealPath("") + File.separator + "download" + File.separator + "Lumpsum-Target-Calculator.pdf";

	   			OutputStream file = new FileOutputStream(FILE);
	               Document document = new Document(PageSize.A4);
	               PdfWriter.getInstance(document, file);
	               document.open();
	               
	               String host = hostDomainUrl;
	               String logo = hostDomainUrl+"/images/logo/logo1.png";
		            //System.out.println("logo---->"+logo);
					
					Image img = Image.getInstance(logo);
					
					Font headerBold = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
					Font headerBold1 = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
					Font fontNormal = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);
					Font smallFontNormal = new Font(Font.FontFamily.HELVETICA, 9, Font.NORMAL);
					SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, YYYY");
					Calendar cal = Calendar.getInstance();
					Date today_date = cal.getTime(); 
					
					PdfPTable insideTable = new PdfPTable(6);
					insideTable.setWidthPercentage(100);

					PdfPTable tablezz = new PdfPTable(1);
					tablezz.setWidthPercentage(100);
					PdfPCell cell1 = new PdfPCell(img, true);
					cell1.setBorder(0);
					tablezz.addCell(cell1);
					tablezz.completeRow();

					cell1 = new PdfPCell(tablezz);
					cell1.setBorder(0);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					Paragraph paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("1/95 , Post Office Road, Vettaikaraniruppu,\nNagapattinam, Tamilnadu - 611112 \n+91-74025 15544 | +91-86678 47016\n+966 541180621 (Saudi Arabia)\nEmail : connect@adcapitalinvestment.com\nWebsite : www.adcapitalinvestment.com", smallFontNormal);
					paragraph.setAlignment(Element.ALIGN_LEFT);
					cell1.addElement(paragraph);
					cell1.setColspan(2);
					insideTable.addCell(cell1);
					
					 // Add a horizontal line
		            LineSeparator ls = new LineSeparator();
		            ls.setLineWidth(2);  // Set the thickness of the line
		            document.add(new Chunk(ls));  // Insert the line
		            
		            paragraph = new Paragraph("Lumpsum Target Calculator",headerBold);
		            paragraph.setAlignment(Element.ALIGN_CENTER);
		            paragraph.setSpacingBefore(10);
		            paragraph.setSpacingAfter(10);
					document.add(paragraph);
	                
	             
	                
	               //BaseColor myColor = WebColors.getRGBColor("#A00000");
	               BaseColor base = new BaseColor(255,255,255);
	               Font font = new Font(Font.FontFamily.TIMES_ROMAN, 12,Font.NORMAL);
	               font.setColor(base.BLUE);
	               
	              	paragraph = new Paragraph("URL",headerBold1);
		            paragraph.setAlignment(Element.ALIGN_LEFT);
		            paragraph.setSpacingAfter(5);
					document.add(paragraph);
					
	               Anchor anchor = new Anchor(url,font);
	               anchor.setReference(url);
	               paragraph = new Paragraph();
	               paragraph.add(anchor);
	               document.add(paragraph);
	               
	               HTMLWorker hw = new HTMLWorker(document);
	   				hw.parse(new StringReader(html_content));
	               
	               document.close();
	               file.close();
	   			
	               File f = new File(FILE);
	    			FileInputStream fin = new FileInputStream(f);
	    			ServletOutputStream outStream = response.getOutputStream();
	    			response.setContentType("application/pdf");
	    			response.setHeader("Content-Disposition", "attachment;filename=Lumpsum-Target-Calculator.pdf");
	        		byte[] buffer = new byte[1024];
	        		int n = 0;
	        		while ((n = fin.read(buffer)) != -1) 
	        		{
	        			outStream.write(buffer, 0, n);
	        		}
	        		outStream.flush();
	        		fin.close();
	        		outStream.close();
	   		}
	   		catch (Exception ex) 
	   		{
	   			ex.printStackTrace();
	   		}
	   	}
 
	 @RequestMapping(value="/downloadExpensePlannerCalcResult")
	   	public void downloadExpensePlannerCalcResult(HttpServletRequest request, HttpServletResponse response) throws IOException 
	   	{		
	   		try 
	   		{
	   			String requestUrl = request.getRequestURL().toString();
	   	 		if(!Utils.isValidUrl(requestUrl, "downloadExpensePlannerCalcResult"))
	   	 		{
	   	 			response.sendRedirect(request.getContextPath() + "/page-not-found?invalidUrl=" + requestUrl);
	       			return;
	   	 		}
	      	   	String years = request.getParameter("years");
	   	   		String dream_amount = request.getParameter("dream_amount");
	   	   		String interest = request.getParameter("interest");
	   	   		String rateofReturn = request.getParameter("rateofReturn");
	   	   		String increase = request.getParameter("increase");
	   	   		/*String savings_amount = request.getParameter("savings_amount");*/
	   	  
	   	   		
	   	   		String dreamAmount = request.getParameter("dreamAmount");
	   	   		/*String target_savings = request.getParameter("target_savings");
	   	   		String target_amount = request.getParameter("target_amount");*/
	      	   	String year = request.getParameter("year");
	      	   	String SIPAmount = request.getParameter("SIPAmount");
	   	   		String stepup_invested_amount = request.getParameter("stepup_invested_amount");
	   	   		String stepup_growth_value = request.getParameter("stepup_growth_value");
	   	   		String stepup_maturity_amount = request.getParameter("stepup_maturity_amount");
	   	   		String url = request.getParameter("url");
	   	   		
	   	   		
	   			if(years == null){years = "";}
	   			if(dream_amount == null){dream_amount = "";}
	   			if(interest == null){interest = "";}
	   			if(rateofReturn == null){rateofReturn = "";}
	   			if(increase == null){increase = "";}
	   			/*if(savings_amount == null){savings_amount = "";}*/
	   			
	   			if(dreamAmount == null){dreamAmount = "";}
	   			/*if(target_savings == null){target_savings = "";}
	   			if(target_amount == null){target_amount = "";}*/
	   			if(year == null){year = "";}
	   			if(SIPAmount == null){SIPAmount = "";}
	   			if(stepup_invested_amount == null){stepup_invested_amount = "";}
	   			if(stepup_growth_value == null){stepup_growth_value = "";}
	   			if(stepup_maturity_amount == null){stepup_maturity_amount = "";}
	   			
	   			years = years.trim();
	   			dream_amount = dream_amount.trim();
	   			interest = interest.trim();
	   			rateofReturn = rateofReturn.trim();
	   			increase = increase.trim();
	   			/*savings_amount = savings_amount.trim();*/
	   			
	   			dreamAmount = dreamAmount.trim();
	   			/*target_savings = target_savings.trim();
	   			target_amount = target_amount.trim();*/
	   			year = year.trim();
	   			SIPAmount = SIPAmount.trim();
	   			stepup_invested_amount = stepup_invested_amount.trim();
	   			stepup_growth_value = stepup_growth_value.trim();
	   			stepup_maturity_amount = stepup_maturity_amount.trim();
	   			
	   			String html_content = "";
	   			html_content += "<html><body>";
	   			html_content += "<br/><br/><br/>";
	   			html_content += "<table width='100%' border='1'><tr><th><b>Name</b></th><th><b>Value</b></th></tr>";
	   			html_content += "<tr><td>Your Financial Goal (Rs)</td><td>Rs. "+dream_amount+"</td></tr>";
	   			html_content += "<tr><td>Investment Period (Years)</td><td>"+years+" Years</td></tr>";
	   			html_content += "<tr><td>Expected Rate of Return (% per annum)</td><td>"+interest+"%</td></tr>";
	   			html_content += "<tr><td>SIP Top-Up (% per annum)</td><td>"+increase+"</td></tr>";
	   			
	   			html_content += "</table><br/><br/>";
	   			html_content += "<h4><b>Result</b></h4><br/>";
	   			html_content += "<table width='100%' border='1'><tr><th><b>Name</b></th><th><b>Value</b></th></tr>";
	   			html_content += "<tr><td>Your targeted Amount (Inflation adjusted)</td><td>Rs. "+dreamAmount+"</td></tr>";
	   			html_content += "<tr><td>Number of years to achieve your goal</td><td>"+year+" Years</td></tr>";
	   			html_content += "<tr><td>Monthly Savings required</td><td>Rs. "+SIPAmount+"</td></tr>";
	   			html_content += "<tr><td>Total Amount Invested in "+year+" years</td><td>Rs. "+stepup_invested_amount+"</td></tr>";
	   			html_content += "<tr><td>Total Growth Amount</td><td>Rs. "+stepup_growth_value+"</td></tr>";
	   			html_content += "<tr><td>Final Amount</td><td>Rs. "+stepup_maturity_amount+"</td></tr>";
	   			html_content += "</table></body></html>";
	   			
	   			String FILE = request.getRealPath("") + File.separator + "download" + File.separator + "goal-based-top-up-sip.pdf";
	   			
	   			OutputStream file = new FileOutputStream(FILE);
	               Document document = new Document(PageSize.A4);
	               PdfWriter.getInstance(document, file);
	               document.open();
	               
	               String host = hostDomainUrl;
	               String logo = hostDomainUrl+"/images/logo/logo1.png";
		            //System.out.println("logo---->"+logo);
					
					Image img = Image.getInstance(logo);
					
					Font headerBold = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
					Font headerBold1 = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
					Font fontNormal = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);
					Font smallFontNormal = new Font(Font.FontFamily.HELVETICA, 9, Font.NORMAL);
					SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, YYYY");
					Calendar cal = Calendar.getInstance();
					Date today_date = cal.getTime(); 
					
					PdfPTable insideTable = new PdfPTable(6);
					insideTable.setWidthPercentage(100);

					PdfPTable tablezz = new PdfPTable(1);
					tablezz.setWidthPercentage(100);
					PdfPCell cell1 = new PdfPCell(img, true);
					cell1.setBorder(0);
					tablezz.addCell(cell1);
					tablezz.completeRow();

					cell1 = new PdfPCell(tablezz);
					cell1.setBorder(0);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					Paragraph paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("1/95 , Post Office Road, Vettaikaraniruppu,\nNagapattinam, Tamilnadu - 611112 \n+91-74025 15544 | +91-86678 47016\n+966 541180621 (Saudi Arabia)\nEmail : connect@adcapitalinvestment.com\nWebsite : www.adcapitalinvestment.com", smallFontNormal);
					paragraph.setAlignment(Element.ALIGN_LEFT);
					cell1.addElement(paragraph);
					cell1.setColspan(2);
					insideTable.addCell(cell1);
					
					 // Add a horizontal line
		            LineSeparator ls = new LineSeparator();
		            ls.setLineWidth(2);  // Set the thickness of the line
		            document.add(new Chunk(ls));  // Insert the line
		            
		            paragraph = new Paragraph("Goal based Top Up SIP",headerBold);
		            paragraph.setAlignment(Element.ALIGN_CENTER);
		            paragraph.setSpacingBefore(10);
		            paragraph.setSpacingAfter(10);
					document.add(paragraph);
	               
	            
	                
	               //BaseColor myColor = WebColors.getRGBColor("#A00000");
	               BaseColor base = new BaseColor(255,255,255);
	               Font font = new Font(Font.FontFamily.TIMES_ROMAN, 12,Font.NORMAL);
	               font.setColor(base.BLUE);
	               
	              	paragraph = new Paragraph("URL",headerBold1);
		            paragraph.setAlignment(Element.ALIGN_LEFT);
		            paragraph.setSpacingAfter(5);
					document.add(paragraph);
					
	               Anchor anchor = new Anchor(url,font);
	               anchor.setReference(url);
	               paragraph = new Paragraph();
	               paragraph.add(anchor);
	               document.add(paragraph);
	               
	               HTMLWorker hw = new HTMLWorker(document);
	   			hw.parse(new StringReader(html_content));
	               
	               document.close();
	               file.close();
	   			
	               File f = new File(FILE);
	    			FileInputStream fin = new FileInputStream(f);
	    			ServletOutputStream outStream = response.getOutputStream();
	    			response.setContentType("application/pdf");
	    			response.setHeader("Content-Disposition", "attachment;filename=Goal-based-top-up-sip.pdf");
	        		byte[] buffer = new byte[1024];
	        		int n = 0;
	        		while ((n = fin.read(buffer)) != -1) 
	        		{
	        			outStream.write(buffer, 0, n);
	        		}
	        		outStream.flush();
	        		fin.close();
	        		outStream.close();
	   		}
	   		catch (Exception ex) 
	   		{
	   			ex.printStackTrace();
	   		}
	   	}
	 
		
	 
	 
	 @RequestMapping(value="/downloadLumpsumCalcResult")
	   	public void downloadLumpsumCalcResult(HttpServletRequest request, HttpServletResponse response) throws IOException 
	   	{		
	   		try 
	   		{
	   			String requestUrl = request.getRequestURL().toString();
	   	 		if(!Utils.isValidUrl(requestUrl, "downloadLumpsumCalcResult"))
	   	 		{
	   	 			response.sendRedirect(request.getContextPath() + "/page-not-found?invalidUrl=" + requestUrl);
	       			return;
	   	 		}
		   	 	String amount = request.getParameter("amount");
	   	   		String years = request.getParameter("years");
	   	   		String interest = request.getParameter("interest");
	      	   	
	      	   	
	      	   	String res_amount = request.getParameter("res_amount");
	   	   		String res_years = request.getParameter("res_years");
	   	   		String res_future_amount = request.getParameter("res_future_amount");
	   	   	    String url = request.getParameter("url");
		   		
	   	   	    if(amount == null){amount = "";}
				if(years == null){years = "";}
				if(interest == null){interest = "";}
				
				
				if(res_amount == null){res_amount = "";}
				if(res_years == null){res_years = "";}
				if(res_future_amount == null){res_future_amount = "";}
				
				amount = amount.trim();
	   			interest = interest.trim();
	   			years = years.trim();
	   			
	   			res_amount = res_amount.trim();
	   			res_years = res_years.trim();
	   			res_future_amount = res_future_amount.trim();
				
	   			String html_content = "";
	   			html_content += "<html><body>";
	   			html_content += "<br/><br/><h4><b>Your Input Values</b></h4><br/>";
	   			html_content += "<table width='100%' border='1'><tr><th><b>Name</b></th><th><b>Value</b></th></tr>";
	   			html_content += "<tr><td>How much lumpsum amount you want to invest (Rs)</td><td>Rs. "+amount+"</td></tr>";
	   			html_content += "<tr><td>How many years after you need this amount (Years)</td><td>"+years+" Year</td></tr>";
	   			html_content += "<tr><td>Expected rate of return (% per annum)</td><td>"+interest+"%</td></tr>";
	   			
	   			html_content += "</table><br/><br/>";
	   			html_content += "<h4><b>Result</b></h4><br/>";
	   			html_content += "<table width='100%' border='1'><tr><th><b>Name</b></th><th><b>Value</b></th></tr>";
	   			html_content += "<tr><td>Your Lumpsum Amount</td><td>Rs. "+amount+"</td></tr>";
	   			html_content += "<tr><td>Number of years to achieve your goal</td><td>"+years+" Year</td></tr>";
	   			html_content += "<tr><td>Your Future Amount</td><td>Rs."+res_future_amount+"</td></tr>";
	   			html_content += "</table></body></html>";
	   			
	   			String FILE = request.getRealPath("") + File.separator + "download" + File.separator + "lumpsum-calculator.pdf";
	
	   			OutputStream file = new FileOutputStream(FILE);
	               Document document = new Document(PageSize.A4);
	               PdfWriter.getInstance(document, file);
	               document.open();
	               
	               String host = hostDomainUrl;
	               String logo = hostDomainUrl+"/images/logo/logo1.png";
		            //System.out.println("logo---->"+logo);
					
					Image img = Image.getInstance(logo);
					
					Font headerBold = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
					Font headerBold1 = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
					Font fontNormal = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);
					Font smallFontNormal = new Font(Font.FontFamily.HELVETICA, 9, Font.NORMAL);
					SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, YYYY");
					Calendar cal = Calendar.getInstance();
					Date today_date = cal.getTime(); 
					
					PdfPTable insideTable = new PdfPTable(6);
					insideTable.setWidthPercentage(100);

					PdfPTable tablezz = new PdfPTable(1);
					tablezz.setWidthPercentage(100);
					PdfPCell cell1 = new PdfPCell(img, true);
					cell1.setBorder(0);
					tablezz.addCell(cell1);
					tablezz.completeRow();

					cell1 = new PdfPCell(tablezz);
					cell1.setBorder(0);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					Paragraph paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("1/95 , Post Office Road, Vettaikaraniruppu,\nNagapattinam, Tamilnadu - 611112 \n+91-74025 15544 | +91-86678 47016\n+966 541180621 (Saudi Arabia)\nEmail : connect@adcapitalinvestment.com\nWebsite : www.adcapitalinvestment.com", smallFontNormal);
					paragraph.setAlignment(Element.ALIGN_LEFT);
					cell1.addElement(paragraph);
					cell1.setColspan(2);
					insideTable.addCell(cell1);
					
					insideTable.completeRow();
					document.add(insideTable);
					
			        paragraph = new Paragraph("Date: "+sdf.format(today_date), fontNormal); 
			        //paragraph.setSpacingBefore(10);
		            paragraph.setSpacingAfter(5);
		            document.add(paragraph);
		            
		            paragraph = new Paragraph("Lumpsum Calculator",headerBold);
		            paragraph.setAlignment(Element.ALIGN_CENTER);
		            paragraph.setSpacingAfter(20);
					document.add(paragraph);
	                
	             
	                
	               //BaseColor myColor = WebColors.getRGBColor("#A00000");
	               BaseColor base = new BaseColor(255,255,255);
	               Font font = new Font(Font.FontFamily.TIMES_ROMAN, 12,Font.NORMAL);
	               font.setColor(base.BLUE);
	               
	              	paragraph = new Paragraph("URL",headerBold1);
		            paragraph.setAlignment(Element.ALIGN_LEFT);
		            paragraph.setSpacingAfter(5);
					document.add(paragraph);
					
	               Anchor anchor = new Anchor(url,font);
	               anchor.setReference(url);
	               paragraph = new Paragraph();
	               paragraph.add(anchor);
	               document.add(paragraph);
	               
	               HTMLWorker hw = new HTMLWorker(document);
	   				hw.parse(new StringReader(html_content));
	               
	               document.close();
	               file.close();
	   			
	               File f = new File(FILE);
	    			FileInputStream fin = new FileInputStream(f);
	    			ServletOutputStream outStream = response.getOutputStream();
	    			response.setContentType("application/pdf");
	    			response.setHeader("Content-Disposition", "attachment;filename=lumpsum-calculator.pdf");
	        		byte[] buffer = new byte[1024];
	        		int n = 0;
	        		while ((n = fin.read(buffer)) != -1) 
	        		{
	        			outStream.write(buffer, 0, n);
	        		}
	        		outStream.flush();
	        		fin.close();
	        		outStream.close();
	   		}
	   		catch (Exception ex) 
	   		{
	   			ex.printStackTrace();
	   		}
	   	}
	 
	 
	
	 
	 @RequestMapping(value="/downloadFutureValueCalcResult")
	   	public void downloadFutureValueCalcResult(HttpServletRequest request, HttpServletResponse response) throws IOException 
	   	{		
	   		try 
	   		{
	   			String requestUrl = request.getRequestURL().toString();
	   	 		if(!Utils.isValidUrl(requestUrl, "downloadFutureValueCalcResult"))
	   	 		{
	   	 			response.sendRedirect(request.getContextPath() + "/page-not-found?invalidUrl=" + requestUrl);
	       			return;
	   	 		}
	      	   	String current_amount = request.getParameter("current_amount");
	   	   		String inflation = request.getParameter("inflation");
	   	   		String year = request.getParameter("year");
	      	   	
	      	   	
	      	   	String res_current_amount = request.getParameter("res_current_amount");
	   	   		String res_inflation = request.getParameter("res_inflation");
	   	   		String res_year = request.getParameter("res_year");
	   	   		String res_future_amount = request.getParameter("res_future_amount");
	   	   		String url = request.getParameter("url");
	   	   		
	   			if(current_amount == null){current_amount = "";}
	   			if(inflation == null){inflation = "";}
	   			if(year == null){year = "";}
	   			
	   			
	   			if(res_current_amount == null){res_current_amount = "";}
	   			if(res_inflation == null){res_inflation = "";}
	   			if(res_year == null){res_year = "";}
	   			if(res_future_amount == null){res_future_amount = "";}
	   			
	   			current_amount = current_amount.trim();
	   			inflation = inflation.trim();
	   			year = year.trim();
	   			
	   			
	   			res_current_amount = res_current_amount.trim();
	   			res_inflation = res_inflation.trim();
	   			res_year = res_year.trim();
	   			res_future_amount = res_future_amount.trim();

	   			String html_content = "";
	   			html_content += "<html><body>";
	   			html_content += "<br/><br/><h4><b>Your Input Values</b></h4><br/>";
	   			html_content += "<table width='100%' border='1'><tr><th><b>Name</b></th><th><b>Value</b></th></tr>";
	   			html_content += "<tr><td>Current amount</td><td>Rs. "+res_current_amount+"</td></tr>";
	   			html_content += "<tr><td>Inflation (% per annum)</td><td>"+res_inflation+" %</td></tr>";
	   			html_content += "<tr><td>Number Of Years (in years)</td><td>"+res_year+" Years</td></tr>";
	   			
	   			html_content += "</table><br/><br/>";
	   			html_content += "<h4><b>Result</b></h4><br/>";
	   			html_content += "<table width='100%' border='1'><tr><th><b>Name</b></th><th><b>Value</b></th></tr>";
	   			html_content += "<tr><td>Current amount</td><td>Rs. "+res_current_amount+"</td></tr>";
	   			html_content += "<tr><td>Inflation (% per annum)</td><td>"+res_inflation+" %</td></tr>";
	   			html_content += "<tr><td>Number Of Years</td><td>"+res_year+" Years</td></tr>";
	   			html_content += "<tr><td>Future Amount</td><td>Rs. "+res_future_amount+"</td></tr>";
	   			html_content += "</table></body></html>";
	   			
	   			
	   				String FILE = request.getRealPath("") + File.separator + "download" + File.separator + "Future-Value-Calculator.pdf";
	   			
	   			   OutputStream file = new FileOutputStream(FILE);
	               Document document = new Document(PageSize.A4);
	               PdfWriter.getInstance(document, file);
	               document.open();
	               String host = hostDomainUrl;
	               String logo = hostDomainUrl+"/images/logo/logo1.png";
		            //System.out.println("logo---->"+logo);
					
					Image img = Image.getInstance(logo);
					
					Font headerBold = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
					Font headerBold1 = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
					Font fontNormal = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);
					Font smallFontNormal = new Font(Font.FontFamily.HELVETICA, 9, Font.NORMAL);
					SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, YYYY");
					Calendar cal = Calendar.getInstance();
					Date today_date = cal.getTime(); 
					
					PdfPTable insideTable = new PdfPTable(6);
					insideTable.setWidthPercentage(100);

					PdfPTable tablezz = new PdfPTable(1);
					tablezz.setWidthPercentage(100);
					PdfPCell cell1 = new PdfPCell(img, true);
					cell1.setBorder(0);
					tablezz.addCell(cell1);
					tablezz.completeRow();

					cell1 = new PdfPCell(tablezz);
					cell1.setBorder(0);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					Paragraph paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("", fontNormal);
					cell1.addElement(paragraph);
					insideTable.addCell(cell1);

					cell1 = new PdfPCell();
					cell1.setBorder(0);
					paragraph =  new Paragraph("1/95 , Post Office Road, Vettaikaraniruppu,\nNagapattinam, Tamilnadu - 611112 \n+91-74025 15544 | +91-86678 47016\n+966 541180621 (Saudi Arabia)\nEmail : connect@adcapitalinvestment.com\nWebsite : www.adcapitalinvestment.com", smallFontNormal);
					paragraph.setAlignment(Element.ALIGN_LEFT);
					cell1.addElement(paragraph);
					cell1.setColspan(2);
					insideTable.addCell(cell1);
					
					insideTable.completeRow();
					document.add(insideTable);
					
			        paragraph = new Paragraph("Date: "+sdf.format(today_date), fontNormal); 
			        //paragraph.setSpacingBefore(10);
		            paragraph.setSpacingAfter(5);
		            document.add(paragraph);
		            
		            paragraph = new Paragraph("Future Value Calculator",headerBold);
		            paragraph.setAlignment(Element.ALIGN_CENTER);
		            paragraph.setSpacingAfter(20);
					document.add(paragraph);
	               
	              //BaseColor myColor = WebColors.getRGBColor("#A00000");
	               BaseColor base = new BaseColor(255,255,255);
	               Font font = new Font(Font.FontFamily.TIMES_ROMAN, 12,Font.NORMAL);
	               font.setColor(base.BLUE);
	               
	               paragraph = new Paragraph("URL",headerBold1);
	       		   paragraph.setAlignment(Element.ALIGN_LEFT);
	       		   paragraph.setSpacingAfter(5);
	           	   document.add(paragraph);
				
		           Anchor anchor = new Anchor(url,font);
		           anchor.setReference(url);
		           paragraph = new Paragraph();
		           paragraph.add(anchor);
		           document.add(paragraph);
	               
	               HTMLWorker hw = new HTMLWorker(document);
	   			   hw.parse(new StringReader(html_content));
	               
	               document.close();
	               file.close();
	   			
	                File f = new File(FILE);
	    			FileInputStream fin = new FileInputStream(f);
	    			ServletOutputStream outStream = response.getOutputStream();
	    			response.setContentType("application/pdf");
	    			response.setHeader("Content-Disposition", "attachment;filename=Future-Value-Calculator.pdf");
	        		byte[] buffer = new byte[1024];
	        		int n = 0;
	        		while ((n = fin.read(buffer)) != -1) 
	        		{
	        			outStream.write(buffer, 0, n);
	        		}
	        		outStream.flush();
	        		fin.close();
	        		outStream.close();
	   		}
	   		catch (Exception ex) 
	   		{
	   			ex.printStackTrace();
	   		}
	   	}
	 	 
		
	 
	 
	 
	 
	 @RequestMapping(value="/downloadAssetAllocationCalcResult")
	 public void downloadAssetAllocationCalcResult(HttpServletRequest request, HttpServletResponse response) throws IOException 
	 {		
	 	try 
	 	{
	 		String requestUrl = request.getRequestURL().toString();
	 		if(!Utils.isValidUrl(requestUrl, "downloadAssetAllocationCalcResult"))
	 		{
	 			response.sendRedirect(request.getContextPath() + "/page-not-found?invalidUrl=" + requestUrl);
	 			return;
	 		}
	 		
	 		String asset_age = request.getParameter("asset_age");
	 		String asset_risk = request.getParameter("asset_risk");
	 		String asset_horizon = request.getParameter("asset_horizon");
	 		String asset_caps = request.getParameter("asset_caps");
	 		
	 		String debt = request.getParameter("debt");
	 		String equity = request.getParameter("equity");
	 		String url = request.getParameter("url");
	 		
	 		
	 		if(asset_age == null){asset_age = "";}
	 		if(asset_risk == null){asset_risk = "";}
	 		if(asset_horizon == null){asset_horizon = "";}
	 		if(asset_caps == null){asset_caps = "";}
	 		
	 		if(debt == null){debt = "";}
	 		if(equity == null){equity = "";}
	 		
	 		asset_age = asset_age.trim();
	 		asset_risk = asset_risk.trim();
	 		asset_horizon = asset_horizon.trim();
	 		asset_caps = asset_caps.trim();
	 		
	 		debt = debt.trim();
	 		equity = equity.trim();
	 		
	 		String html_content = "";
	 		html_content += "<html><body>";
	 		html_content += "<br/><br/><br/>";
	 		html_content += "<table width='100%' border='1'><tr><th><b>Name</b></th><th><b>Value</b></th></tr>";
	 		html_content += "<tr><td>Your current Age (Years)</td><td>"+asset_age+"</td></tr>";
	 		html_content += "<tr><td>How much risk you can take?</td><td>"+asset_risk+"</td></tr>";
	 		html_content += "<tr><td>Your investment Horizon (Years)</td><td>"+asset_horizon+"</td></tr>";
	 		html_content += "<tr><td>Do you know that mid & small caps generate better return in logn term</td><td>"+asset_caps+"</td></tr>";
	 		
	 		html_content += "</table><br/><br/>";
	 		html_content += "<h4><b>Result</b></h4><br/>";
	 		html_content += "<table width='100%' border='1'><tr><th><b>Name</b></th><th><b>Value</b></th></tr>";
	 		html_content += "<tr><td>Debt</td><td>"+debt+"%</td></tr>";
	 		html_content += "<tr><td>Equity</td><td>"+equity+"%</td></tr>";
	 		html_content += "</table></body></html>";
	 		
	 		String FILE = request.getRealPath("") + File.separator + "download" + File.separator + "Asset-Allocation-Calculator.pdf";
  			
			   OutputStream file = new FileOutputStream(FILE);
           Document document = new Document(PageSize.A4);
           PdfWriter.getInstance(document, file);
           document.open();
            
           String logo = hostDomainUrl+"/images/logo/logo1.png";
	            ////System.out.println("logo---->"+logo);
				
           Image img = Image.getInstance(logo);
			
			Font headerBold = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
			Font headerBold1 = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
			Font fontNormal = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);
			Font smallFontNormal = new Font(Font.FontFamily.HELVETICA, 9, Font.NORMAL);
			SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, YYYY");
			Calendar cal = Calendar.getInstance();
			Date today_date = cal.getTime(); 
			
			PdfPTable insideTable = new PdfPTable(6);
			insideTable.setWidthPercentage(100);

			PdfPTable tablezz = new PdfPTable(1);
			tablezz.setWidthPercentage(100);
			PdfPCell cell1 = new PdfPCell(img, true);
			cell1.setBorder(0);
			tablezz.addCell(cell1);
			tablezz.completeRow();

			cell1 = new PdfPCell(tablezz);
			cell1.setBorder(0);
			insideTable.addCell(cell1);

			cell1 = new PdfPCell();
			cell1.setBorder(0);
			Paragraph paragraph =  new Paragraph("", fontNormal);
			cell1.addElement(paragraph);
			insideTable.addCell(cell1);

			cell1 = new PdfPCell();
			cell1.setBorder(0);
			paragraph =  new Paragraph("", fontNormal);
			cell1.addElement(paragraph);
			insideTable.addCell(cell1);

			cell1 = new PdfPCell();
			cell1.setBorder(0);
			paragraph =  new Paragraph("", fontNormal);
			cell1.addElement(paragraph);
			insideTable.addCell(cell1);

			cell1 = new PdfPCell();
			cell1.setBorder(0);
			paragraph =  new Paragraph("1/95 , Post Office Road, Vettaikaraniruppu,\nNagapattinam, Tamilnadu - 611112 \n+91-74025 15544 | +91-86678 47016\n+966 541180621 (Saudi Arabia)\nEmail : connect@adcapitalinvestment.com\nWebsite : www.adcapitalinvestment.com", smallFontNormal);
			paragraph.setAlignment(Element.ALIGN_LEFT);
			cell1.addElement(paragraph);
			cell1.setColspan(2);
			insideTable.addCell(cell1);
				
				insideTable.completeRow();
				document.add(insideTable);
				
		        paragraph = new Paragraph("Date: "+sdf.format(today_date), fontNormal); 
		        //paragraph.setSpacingBefore(10);
	            paragraph.setSpacingAfter(5);
	            document.add(paragraph);
	            
	            paragraph = new Paragraph("Asset Allocation Calculator",headerBold);
	            paragraph.setAlignment(Element.ALIGN_CENTER);
	            paragraph.setSpacingAfter(20);
				document.add(paragraph);
           
          
            
           //BaseColor myColor = WebColors.getRGBColor("#A00000");
           BaseColor base = new BaseColor(255,255,255);
           Font font = new Font(Font.FontFamily.TIMES_ROMAN, 12,Font.NORMAL);
           font.setColor(base.BLUE);
           
          	paragraph = new Paragraph("URL",headerBold1);
	            paragraph.setAlignment(Element.ALIGN_LEFT);
	            paragraph.setSpacingAfter(5);
				document.add(paragraph);
				
           Anchor anchor = new Anchor(url,font);
           anchor.setReference(url);
           paragraph = new Paragraph();
           paragraph.add(anchor);
           document.add(paragraph);

        
           
           HTMLWorker hw = new HTMLWorker(document);
			   hw.parse(new StringReader(html_content));
           
           document.close();
           file.close();
			
           File f = new File(FILE);
			FileInputStream fin = new FileInputStream(f);
			ServletOutputStream outStream = response.getOutputStream();
			response.setContentType("application/pdf");
			response.setHeader("Content-Disposition", "attachment;filename=Asset-Allocation-Calculator.pdf");
    		byte[] buffer = new byte[1024];
    		int n = 0;
    		while ((n = fin.read(buffer)) != -1) 
    		{
    			outStream.write(buffer, 0, n);
    		}
    		outStream.flush();
    		fin.close();
    		outStream.close();
	 	}
	 	catch (Exception ex) 
	 	{
	 		ex.printStackTrace();
	 	}
	 }
	  
	
	 
	 
	 
}

