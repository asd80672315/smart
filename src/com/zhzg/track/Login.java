package com.zhzg.track;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.message.BasicNameValuePair;

/*
 * log in
 */
public class Login {
	public static void main(String[] args) throws Exception {
		login();
	}

	public static void login() throws Exception
	{
		//set the URL and method
		String openidURL = "/rest/openapi/sm/session";
		String method = "PUT";
		
		//set parameters
		List<BasicNameValuePair> parameters = new ArrayList<BasicNameValuePair>();
		parameters.add(new BasicNameValuePair("userid", GlobalVar.GLOBAL_USERNAME));
		parameters.add(new BasicNameValuePair("value", GlobalVar.GLOBAL_USERVALUE));
		parameters.add(new BasicNameValuePair("ipaddr", GlobalVar.GLOBAL_USERIP));
		
		//send the request
		HttpResponse response = NewHttpsAccess.access(GlobalVar.GLOBAL_IP, GlobalVar.GLOBAL_PORT, openidURL, method, 
				null, parameters);
		//get the result
		String ret = NewHttpsAccess.getResult(response);
		System.out.println(ret);
		
		//resolve the result and get the openid
		Map<String, String> retMap = ParseResponse.parseResponse(ret);
		if (retMap.get("code").equals("0")) {
			String openid = retMap.get("data");
			System.out.println(openid);
			GlobalVar.globalOpenid = openid;
		}
	}  	
}