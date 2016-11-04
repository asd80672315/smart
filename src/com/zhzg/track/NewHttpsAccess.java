package com.zhzg.track;

import javax.net.ssl.SSLContext;
import javax.net.ssl.X509TrustManager;
import javax.net.ssl.TrustManager;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.BasicClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;


public class NewHttpsAccess {	
	/**
	 * set headers and parameters
	 */
	public static HttpResponse access(String ip, int port, String url, String method, 
			BasicNameValuePair[] headers, BasicNameValuePair[] parameters) throws Exception {
		List<BasicNameValuePair> headers2 = null;
		List<BasicNameValuePair> parameters2 = null;
		if (null != headers) {
			headers2 = new ArrayList<BasicNameValuePair>();
			for (BasicNameValuePair e : headers) {
				headers2.add(e);
			}
		}
		if (null != parameters) {
			parameters2 = new ArrayList<BasicNameValuePair>();
			for (BasicNameValuePair e : parameters) {
				parameters2.add(e);
			}
		}
		return access(ip, port, url, method, headers2, parameters2);
	}
	
	/**
	 * connect to the host by HttpClient
	 */
	public static HttpResponse access(String ip, int port, String url, String method, 
			List<BasicNameValuePair> headers, List<BasicNameValuePair> parameters) throws Exception {
		//create a connection manager
		X509TrustManager tm = new X509TrustManager() {
			public void checkClientTrusted(X509Certificate[] xcs, String string) {
			}

			public void checkServerTrusted(X509Certificate[] xcs, String string) {
			}

			public X509Certificate[] getAcceptedIssuers() {
				return null;
			}
		};

		//create a SSL connection
		SSLContext sslcontext = SSLContext.getInstance("TLS");
		sslcontext.init(null, new TrustManager[] { tm }, null);
		SSLSocketFactory socketFactory = new SSLSocketFactory(sslcontext, SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);

		SchemeRegistry schemeRegistry = new SchemeRegistry();
		schemeRegistry.register(new Scheme("https", port, socketFactory));
		
		//create a HttpClient to connect to the target host
		HttpClient httpClient = new DefaultHttpClient(new BasicClientConnectionManager(schemeRegistry));

		//set the URL
		url = "https://" + ip + ":" + port + url;
		System.out.println(url);

		//set the method
		HttpUriRequest httpRequest = null;
		if ("PUT".equalsIgnoreCase(method)) {
	    	HttpPut httpPut = new HttpPut(url);
			httpRequest = httpPut;
			if (null != parameters) {
				try {
					UrlEncodedFormEntity tmp = new UrlEncodedFormEntity(parameters, "UTF-8");
					httpPut.setEntity(tmp);
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				}
			}
	    } else if ("POST".equalsIgnoreCase(method)) {
	    	HttpPost httpPost = new HttpPost(url);
			httpRequest = httpPost;
			if (null != parameters) {
				try {
					UrlEncodedFormEntity tmp = new UrlEncodedFormEntity(parameters, "UTF-8");
					httpPost.setEntity(tmp);
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				}
			}
	    } else if ("GET".equalsIgnoreCase(method)) {
			if (null != parameters) {
				url += "?";
				boolean init = false;
				for (BasicNameValuePair e : parameters) {
					if (!init) {
						url += URLEncoder.encode(e.getName(), "UTF-8") + "=" + URLEncoder.encode(e.getValue(), "UTF-8");
						init = true;
					} else {
						url += "&" + URLEncoder.encode(e.getName(), "UTF-8") + "=" + URLEncoder.encode(e.getValue(), "UTF-8");
					}
				}
			}
	    	HttpGet httpGet = new HttpGet(url);
			httpRequest = httpGet;
	    } else if ("DELETE".equalsIgnoreCase(method)) {
			if (null != parameters) {
				url += "?";
				boolean init = false;
				for (BasicNameValuePair e : parameters) {
					if (!init) {
						url += URLEncoder.encode(e.getName(), "UTF-8") + "=" + URLEncoder.encode(e.getValue(), "UTF-8");
						init = true;
					} else {
						url += "&" + URLEncoder.encode(e.getName(), "UTF-8") + "=" + URLEncoder.encode(e.getValue(), "UTF-8");
					}
				}
			}
	    	HttpDelete httpDelete = new HttpDelete(url);
			httpRequest = httpDelete;
	    } else {
	    	return null;
	    }
		
		//set headers
		if (null != headers) {
			for (BasicNameValuePair header : headers) {
				httpRequest.setHeader(header.getName(), header.getValue());
			}
		}
		
		//send the request
		HttpResponse response = httpClient.execute(httpRequest);
		return response;
	}
	
	/**
	 * get the result
	 */
	public static String getResult(HttpResponse response) throws IllegalStateException, IOException {
		InputStream is = response.getEntity().getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is));
		String ret = "";
		String line = "";
		while ((line = br.readLine()) != null) {
			if (!ret.isEmpty()) {
				ret += "\n";
			}
			ret += line;
		}
		return ret;
	} 
}