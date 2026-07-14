package com.mf.utils;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;


public class MfApiAccessor {
	
	@Autowired
    private static String api_key = "103ee40d-cbb2-4849-b6c5-e5f500a60bc5";

	@SuppressWarnings("rawtypes")
	public static String getFormattedUrl(String url, HashMap<String, String> hashMap)
	{
		try
		{        
		   String queryString = "";
	       
		   HashMap<String, String> sortedParameterMap = null;
		   if(hashMap.get("key") != null) {
			   hashMap.put("key", hashMap.get("key"));
		   }else {
			   hashMap.put("key", api_key);
		   }
		   //hashMap.put("source", "Bridge Website");
		   sortedParameterMap = (HashMap<String, String>) sortByKeys(hashMap);
		            
		   Iterator it = sortedParameterMap.entrySet().iterator();
		       while (it.hasNext()) {
		           Entry pairs = (Entry)it.next();
		           if(it.hasNext())
		              {
		               queryString += URLEncoder.encode(String.valueOf(pairs.getKey()),"UTF-8") + "=" + URLEncoder.encode(URLDecoder.decode(String.valueOf(pairs.getValue()), StandardCharsets.UTF_8.name()),"UTF-8") + "&";
		              }
		              else
		              {
		               queryString += URLEncoder.encode(String.valueOf(pairs.getKey()),"UTF-8") + "=" + URLEncoder.encode(URLDecoder.decode(String.valueOf(pairs.getValue()), StandardCharsets.UTF_8.name()),"UTF-8");
		              }
		           it.remove(); // avoids a ConcurrentModificationException
		       }
	
		       String formattedUrl = url + "?" + queryString;
	
		       
		       return formattedUrl;
		}
		catch(Exception ex)
		{
		   ex.printStackTrace();
		}
		return null;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static <K extends Comparable,V extends Comparable> Map<K,V> sortByKeys(Map<K,V> map)
	   {
	       List<K> keys = new LinkedList<K>(map.keySet());
	       Collections.sort(keys);
	    
	       //LinkedHashMap will keep the keys in the order they are inserted
	       //which is currently sorted on natural ordering
	       Map<K,V> sortedMap = new LinkedHashMap<K,V>();
	       for(K key: keys){
	           sortedMap.put(key, map.get(key));
	       }

	       return sortedMap;
	   }

	   /*
	    * Java method to sort Map in Java by value e.g. HashMap or Hashtable
	    * throw NullPointerException if Map contains null values
	    * It also sort values even if they are duplicates
	   */
	   @SuppressWarnings({"rawtypes", "unchecked"})
	   public static <K extends Comparable,V extends Comparable> Map<K,V> sortByValues(Map<K,V> map){
	       List<Entry<K,V>> entries = new LinkedList<Entry<K,V>>(map.entrySet());
	    
	       Collections.sort(entries, new Comparator<Entry<K,V>>() {

	       @Override
	           public int compare(Entry<K, V> o1, Entry<K, V> o2) {
	               return o1.getValue().compareTo(o2.getValue());
	           }
	       });
	    
	       //LinkedHashMap will keep the keys in the order they are inserted
	       //which is currently sorted on natural ordering
	       Map<K,V> sortedMap = new LinkedHashMap<K,V>();
	    
	       for(Entry<K,V> entry: entries){
	           sortedMap.put(entry.getKey(), entry.getValue());
	       }
	    
	       return sortedMap;
	   }
}
