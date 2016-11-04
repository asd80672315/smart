package com.zhzg.track;

import org.apache.http.HttpResponse;
import org.apache.http.message.BasicNameValuePair;



/**
 * Log Out
 */
public class Loginout {
	public static void main(String[] args) throws Exception {
		Loginout test = new Loginout();
		test.logoutTest();
	}
	public void logoutTest() throws Exception
	{
		Login.login();
		
		//set the URL and method
		String openidURL = "/rest/openapi/sm/session";
		String method = "DELETE";
		
		//set headers
		BasicNameValuePair[] headers = NewRosSecurity.getRosHttpHeader(openidURL, method);
		//set parameters
		BasicNameValuePair[] parameters =
        {
                new BasicNameValuePair("openid", GlobalVar.globalOpenid)
        };
		
		//send the request
		HttpResponse response = NewHttpsAccess.access(GlobalVar.GLOBAL_IP, GlobalVar.GLOBAL_PORT, openidURL, method, 
				headers, parameters);
		//get the result
		String ret = NewHttpsAccess.getResult(response);
		System.out.println(ret);
	}  
}