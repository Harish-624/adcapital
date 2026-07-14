package com.mf.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.persistence.EntityManager;

public class CommonUtils 
{
	@SuppressWarnings("rawtypes")
	public static <K extends Comparable,V extends Comparable> Map<K,V> sortByValuesDescending(Map<K,V> map){
        List<Map.Entry<K,V>> entries = new LinkedList<Map.Entry<K,V>>(map.entrySet());
     
        Collections.sort(entries, new Comparator<Map.Entry<K,V>>() {

            @SuppressWarnings("unchecked")
			@Override
            public int compare(Entry<K, V> o1, Entry<K, V> o2) {
                return o2.getValue().compareTo(o1.getValue());
            }
        });
     
        //LinkedHashMap will keep the keys in the order they are inserted
        //which is currently sorted on natural ordering
        Map<K,V> sortedMap = new LinkedHashMap<K,V>();
     
        for(Map.Entry<K,V> entry: entries){
            sortedMap.put(entry.getKey(), entry.getValue());
        }
     
        return sortedMap;
    }
	 
	 public static List<Integer> paginator(int page_id, int page_count)
	 {
	    	int beginPaginatorId = 1;  
	        int endPaginatorId = 1; 
	        
	        List<Integer> paginator = new ArrayList<Integer>();
	        
	        if(page_count > 1)
	        {
	        	if(page_id <= 3)
	            {
	            	beginPaginatorId = 1;
	            	endPaginatorId = page_id + 3 + (3 - page_id);
	            }
	            
	            if(page_id > 3 && page_id < (page_count-3))
	            {
	            	beginPaginatorId = page_id - 3;
	            	endPaginatorId = page_id + 3;
	            }
	            
	            if(page_id >= (page_count-3))
	            {
	            	beginPaginatorId = page_id - 3 - ((3 + page_id) - page_count);
	            	endPaginatorId = page_count;
	            }
	            
	            if(beginPaginatorId < 0)
	            {
	            	beginPaginatorId = 1;
	            }
	            if(endPaginatorId > page_count)
	            {
	            	endPaginatorId = page_count;
	            }
	        }
	        
	        paginator.add(beginPaginatorId);
	        paginator.add(endPaginatorId);
	        
	        return paginator;
	    }

	 public static List<String> getCategoriesBenchmark1() {
		List<String> list = new ArrayList<String>();
		
		list.add("Hybrid: Arbitrage");
		list.add("Debt: Overnight");
		list.add("Debt: Liquid");
		list.add("Debt: Ultra Short Duration");
		list.add("Debt: Money Market");
		list.add("Debt: Low Duration");
		
		return list;
	}
	
	public static List<String> getCategoriesBenchmark2() {
		List<String> list = new ArrayList<String>();
		
		list.add("Debt: Gilt");
		list.add("Debt: Gilt Fund with 10 year constant duration");
		list.add("Hybrid: Conservative");
		
		return list;
	}
	
	public static List<String> getCategoriesBenchmark3() {
		List<String> list = new ArrayList<String>();
		
		list.add("Hybrid: Aggressive");
		list.add("Hybrid: Dynamic Asset Allocation");
		list.add("Hybrid: Equity Savings");
		list.add("Hybrid: Multi Asset Allocation");
		
		return list;
	}
	
	public static List<String> getTop50FundsSchemeCode() 
	{
		List<String> scheme_amfi_code_list = new ArrayList<String>();
		
		scheme_amfi_code_list.add("112277"); //Axis Bluechip Fund
		scheme_amfi_code_list.add("113221"); //Canara Robeco Bluechip Fund
		scheme_amfi_code_list.add("113544"); //Bnp Paribas Large Cap Fund
		scheme_amfi_code_list.add("107578"); //Mirae Asset Large Cap Fund
		scheme_amfi_code_list.add("111940"); //Edelwiess Large Cap Fund
		scheme_amfi_code_list.add("112932"); //Mirae Asset Emerging Bluechip Fund
		scheme_amfi_code_list.add("106144"); //Invesco India Growth Opportunities Fund
		scheme_amfi_code_list.add("102920"); //Canara Robeco Emerging Equity Fund
		scheme_amfi_code_list.add("105001"); //Sundaram Large and Middcap Fund
		scheme_amfi_code_list.add("145112"); //Axis Growth Opportunities Fund
		scheme_amfi_code_list.add("114564"); //Axis Midcap Fund
		scheme_amfi_code_list.add("105503"); //Invesco India Midcap Fund
		scheme_amfi_code_list.add("104908"); //Kotak Emerging Equity Fund
		scheme_amfi_code_list.add("147479"); //Mirae Asset Midcap Fund
		scheme_amfi_code_list.add("101922"); //Canara Robeco Emerging Diversified Fund
		scheme_amfi_code_list.add("105875"); //Dsp Equity Fund
		scheme_amfi_code_list.add("112090"); //Kotak Standard Multicap fund
		scheme_amfi_code_list.add("141927"); //Axis Multicap Fund
		scheme_amfi_code_list.add("113460"); //Bnp Paribas Multicap Fund
		scheme_amfi_code_list.add("125350"); //Axis Small Cap Fund
		scheme_amfi_code_list.add("125494"); //Sbi Small Cap Fund
		scheme_amfi_code_list.add("113177"); //Nippon Small Cap Fund
		scheme_amfi_code_list.add("145139"); //Invesco India Small Cap Fund
		scheme_amfi_code_list.add("146127"); //Canara Robeco Small Cap Fund
		scheme_amfi_code_list.add("144636"); //Bnp Paribas Consumption Fund
		scheme_amfi_code_list.add("144838"); //Sundaram Services Fund
		//scheme_amfi_code_list.add("102431"); //Nippon Pharma Fund
		scheme_amfi_code_list.add("108378"); //Invsco India Financial Services Fund
		scheme_amfi_code_list.add("112152"); //Canara Robeco Consumer Trends Fund
		scheme_amfi_code_list.add("102885"); //Sbi Equity Hybrid Fund
		scheme_amfi_code_list.add("106166"); //Canara Robeco Hybrid Fund
		scheme_amfi_code_list.add("100617"); //Sundaram Equity Hybrid Fund
		scheme_amfi_code_list.add("134815"); //Mirae Equity Hybrid Fund
		scheme_amfi_code_list.add("112323"); //AXIS Long Term Equity Fund
		scheme_amfi_code_list.add("111722"); //Canara Robeco Tax Saver
		scheme_amfi_code_list.add("135784"); //Mirae Asset Tax Saver
		scheme_amfi_code_list.add("107745"); //Aditya Birla Sunlife Tax Relief
		scheme_amfi_code_list.add("113463"); //BNP Paribas Long Term Equity
		scheme_amfi_code_list.add("112354"); //Axis Short Term Fund
		scheme_amfi_code_list.add("105185"); //Invesco India Short Term Fund
		scheme_amfi_code_list.add("115077"); //Canara Robeco Short Duration Fund
		scheme_amfi_code_list.add("117953"); //Bnp Paribas Short Term Fund
		scheme_amfi_code_list.add("112423"); //L&T Ultra Short Term Fund
		scheme_amfi_code_list.add("145040"); //HDFC Ultra Short Term Fund
		scheme_amfi_code_list.add("100641"); //SBI Magnum Ultra Short Duration Fund
		scheme_amfi_code_list.add("145723"); //Tata Arbitrage Fund
		scheme_amfi_code_list.add("130205"); //Edelweiss Arbitrage Fund
		scheme_amfi_code_list.add("140385"); //BNP Paribas Arbitrage Fund
		scheme_amfi_code_list.add("112496"); //L&T Mid Cap Fund
		scheme_amfi_code_list.add("141004"); //BNP PARIBAS SUBSTANTIAL EQUITY HYBRID FUND
		
		scheme_amfi_code_list.add("143785"); //Mirae Asset Healthcare Fund Direct Growth
		scheme_amfi_code_list.add("145456"); //DSP Healthcare Fund - Regular Plan - Growth
		scheme_amfi_code_list.add("140283"); //Edelweiss Banking and PSU Debt Fund - Regular Plan - Growth Option
		scheme_amfi_code_list.add("117446"); //Axis Banking & PSU Debt Fund - Regular Plan - Growth option
		scheme_amfi_code_list.add("121280"); //IDFC Banking & PSU Debt Fund-Regular Plan- Growth Option
		scheme_amfi_code_list.add("112410"); //L&T Triple Ace Bond Fund-Regular Plan-Growth
		scheme_amfi_code_list.add("141593"); //Axis Corporate Debt Fund - Regular Plan Growth
		scheme_amfi_code_list.add("100789"); //Sundaram Corporate Bond Fund Regular - Growth
		
		return scheme_amfi_code_list;
	}
}


