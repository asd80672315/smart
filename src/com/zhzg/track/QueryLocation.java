package com.zhzg.track;

import java.util.*;

import net.sf.json.JSONArray;

import org.apache.http.HttpResponse;
import org.apache.http.message.BasicNameValuePair;


public class QueryLocation {
	 private static final String EAM_TYPE = "/rest/openapi/rtls/locationquery";
	 public static final int room_num = 5;
	 public static final String[] roomName =  new String[]{"中央厅","生活厅","城市厅","农业厅","健康厅"};
	 public static final int[] roomID =  new int[]{1,2,3,4,5};
	 String smartBallID;
	 int ReservationID;
	 String MAC;
     Date startTime;
     Date endTime;
     int[] roomCount;
     
	    
     public QueryLocation(String smartBallID, int type){
    	 //获取接口参数数据
    	 this.smartBallID = smartBallID;
    	 GetParameters getUsrPara = new GetParameters();
	     EnumMap<ParaEnum.UserInfo,Object> userInfo = getUsrPara.getUserInfoByName(smartBallID);
         userInfo.entrySet().iterator();
         this.ReservationID =(int)userInfo.get(ParaEnum.UserInfo.ReservationID);
         this.MAC =(String)userInfo.get(ParaEnum.UserInfo.MAC);
         this.startTime = (Date)userInfo.get(ParaEnum.UserInfo.startTime);
         if(type == 0){
        	 this.endTime = new Date(System.currentTimeMillis());        	 
         }else{
        	 this.endTime = (Date)userInfo.get(ParaEnum.UserInfo.endTime);
         }
         roomCount = new int[room_num];
        
     }

	public  String queryLocations()
	        throws Exception
	 {
	    	try {
	 			Login.login();
	 		} catch (Exception e) {
	 			e.printStackTrace();
	 		}
	        //set the URL and method
	        String openidURL = EAM_TYPE;
	        String method = "GET";
	        String param = "{\"starttime\":"+startTime+",\"endtime\":"+endTime+"}";
	        
	        //set headers
	        BasicNameValuePair[] headers = NewRosSecurity.getRosHttpHeader(openidURL, method);
	        //set parameters
	        BasicNameValuePair[] parameters =
	            {
	                new BasicNameValuePair("version", "1.0"),
	                new BasicNameValuePair("param", param),
	                new BasicNameValuePair("terminalid", MAC)
	            };
	        //send the request
	        HttpResponse response =
	            NewHttpsAccess.access(GlobalVar.GLOBAL_IP, GlobalVar.GLOBAL_PORT, openidURL, method, headers, parameters);
	        //get the result
	        String responseData = NewHttpsAccess.getResult(response);
	        Map<String, String> retMap = ParseResponse.parseResponse(responseData);
			return retMap.get("data");
	    }	
	

        //获取停留时间（秒）
        public int[] getLocationTime() {
            //获取定位数据库数据
            int n = 0;
    	    int[] point_x,point_y,point_z;     	    
    	    int[] roomTime = new int[room_num];
            try {
    				String responseData = queryLocations();
    				JSONArray jsonArr = JSONArray.fromObject(responseData);
    				n = jsonArr.size();
    				point_x = new int[n];
    				point_y = new int[n];
    				point_z = new int[n];
    				for (int i = 0; i < n; i++) {
    					net.sf.json.JSONObject jObject = net.sf.json.JSONObject.fromObject(jsonArr.getJSONObject(i).getString("location"));
    					point_x[i] = Integer.parseInt(jObject.get("x").toString());
    					point_y[i] = Integer.parseInt(jObject.get("y").toString());
    					point_z[i] = Integer.parseInt(jObject.get("z").toString());
    				}
    		        ////分析数据////
    				//分room 计数  		        
    		        for (int i = 0; i < n; i++) {
    		        	for (int j =0; j < room_num; j++){
    		        		if(point_z[i] == roomID[j]){
    		        			roomCount[j] ++;
    		        		} 		        			
    		        	}    	 
    		        }
    		        
    		        int visitTime = getVisitTime();
    		        for (int i = 0; i < room_num; i++) {
    		            roomTime[i] =(int) (((float)roomCount[i]/n)*visitTime);
    		        }    		        
    		        return roomTime;
    		        
    		} catch (NumberFormatException e) {
    			e.printStackTrace();
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
			return roomTime;

		}
        
        //总游览时间（秒）
        public int getVisitTime() {
        	long startTime = getStartTime().getTime();
	        long endTime = getEndTime().getTime();
	        int visitTime = (int) ((endTime - startTime)/1000);
			return  visitTime;
		}
        
		 public String getSmartBallID() {
			return smartBallID;
		}
	
		public int getReservationID() {
			return ReservationID;
		}
	
		public String getMAC() {
			return MAC;
		}
	
		public Date getStartTime() {
			return startTime;
		}
	
		public Date getEndTime() {
			return endTime;
		} 
	    
	     public int[] getRoomCount() {
	 		return roomCount;
	 	}
}
