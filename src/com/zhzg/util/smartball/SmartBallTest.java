package com.zhzg.util.smartball;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SmartBallTest {
	public static void main(String[] args) {
		 //发送 GET 请求
        String s=sendGet("http://120.26.128.114/kaiyi/ballDispatcherAction!produceBall", "deviceID=123");
        System.out.println(s);
        String code=match("<message code=['\"]?(.*?)['\"]",s).get(0);
        String ballID=match("<ballID>([\\s\\S]*?)</ballID>",s).get(0);
        
        System.out.println(code+"---"+ballID);
        
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


