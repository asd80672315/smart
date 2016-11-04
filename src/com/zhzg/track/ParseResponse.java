package com.zhzg.track;

import java.util.HashMap;
import java.util.Map;

/**
 * Resolve the JSON format string
 *
 */
public class ParseResponse {
	public static Map<String,String> parseResponse(String input)
    {
        Map<String,String> retMap = new HashMap<String, String>();
        net.sf.json.JSONObject jObject = net.sf.json.JSONObject.fromObject(input);
        
        if (null != jObject.get("code"))
        {
            String i = jObject.get("code").toString();
            retMap.put("code", i);
        }
        if (null != jObject.get("data"))
        {
            String data = jObject.get("data").toString();
            retMap.put("data", data.toString());
        }
        if (null != jObject.get("description"))
        {
            String des = jObject.get("description").toString();
            retMap.put("description", des.toString());
        }
        if (null != jObject.get("result"))
        {
            String res = jObject.get("result").toString();
            retMap.put("result", res.toString());
        }
        return retMap;
    }
}
