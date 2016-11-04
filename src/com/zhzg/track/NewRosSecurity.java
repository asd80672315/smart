package com.zhzg.track;

import org.apache.http.message.BasicNameValuePair;


public class NewRosSecurity {
	public static long nounce = 0;

	private static BasicNameValuePair[] getRosOpenidHeader() {
		BasicNameValuePair[] headers =
        {
				new BasicNameValuePair("openid", GlobalVar.globalOpenid)
        };
		
		return headers;
	}
	
	public static BasicNameValuePair[] getRosHttpHeader(String url, String method) {
		return getRosOpenidHeader();
	}	
}
