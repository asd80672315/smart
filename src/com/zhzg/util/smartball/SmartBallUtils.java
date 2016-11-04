package com.zhzg.util.smartball;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.zhzg.util.VisitorUtil;

public class SmartBallUtils {
	public static final String ConfigFileReadError = "配置文件读取错误，请联系工作人员";
	
	private static Properties prop = new Properties();
	static {

		try {
			InputStream in = VisitorUtil.class.getClassLoader()
					.getResourceAsStream("config.properties");
			System.out.println(in);
			if (in != null) {
				prop.load(in);
			} else {
				throw new Exception(ConfigFileReadError);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}
	
	
	public static String getDeviceID(String remoteIP){
		return prop.getProperty(remoteIP);
	}
	
	public static String getServiceURL(){
		return prop.getProperty("getServiceURL");
	}
	public static String[] getSmartBallID(String deviceID){
		 //发送 GET 请求
        String s=sendGet(getServiceURL(), "deviceID="+deviceID);
        System.out.println(s);
        List<String> codeList=match("<message code=['\"]?(.*?)['\"]",s);
        List<String> ballIDList=match("ballID=['\"]?(.*?)['\"]/>",s);
        if(codeList!=null&&ballIDList!=null){
        	return new String[]{codeList.get(0),ballIDList.get(0)};
        }
        return null;
	}
	
	public static String sendGet(String url, String param) {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = url + "?" + param;
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }
	
	 /** 
     * 获取指定HTML标签的指定属性的值 
     * @param source 要匹配的源文本 
     * @param element 标签名称 
     * @param attr 标签的属性名称 
     * @return 属性值列表 
     */  
    public static List<String> match(String reg,String source) {  
        List<String> result = new ArrayList<String>();  
      
        Matcher m = Pattern.compile(reg).matcher(source);  
        while (m.find()) {  
            String r = m.group(1);  
            result.add(r);  
        }  
        return result;  
    }  
}
