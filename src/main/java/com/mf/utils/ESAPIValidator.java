package com.mf.utils;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.owasp.esapi.ESAPI;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class ESAPIValidator 
{
	public static String checkParameter(String param) 
	{
        if (param == null) 
        {
            return "";
        }
        return param.trim();
    }
	
	// isValidParameters Returns == -1 then it is valid.
	public static int isValidParameters(String[][] param_and_pattern) 
	{
		try
		{
			if(param_and_pattern != null && param_and_pattern.length > 0)
			{
				for (int i = 0; i < param_and_pattern.length; i++) 
				{
					if (!ESAPI.validator().isValidInput(param_and_pattern[i][0], param_and_pattern[i][0],param_and_pattern[i][1], 1500, true)) 
					{
						return i;
					}
				}
			}
			
		}catch (Exception e) 
		{
			e.printStackTrace();
		}
		return -1;
	}
	
}
