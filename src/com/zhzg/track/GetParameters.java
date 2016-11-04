package com.zhzg.track;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.EnumMap;

import com.zhzg.util.JDBCUtil;

public class GetParameters implements ParaEnum  {  
	 @Override
	public EnumMap<UserInfo, Object> getUserInfoByName(String SmartBallID) {
	        EnumMap<UserInfo,Object> retMap = new EnumMap<UserInfo, Object>(UserInfo.class);
	        
	        retMap.put(UserInfo.SmartBallID,SmartBallID);
	        //读数据库
	        Connection conn = null;
	        PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql_1 = "SELECT ReservationID,startTime,endTime, FROM Visitors WHERE SmartBallID=? AND State=2"; 
			String sql_2 = "SELECT SmartBallMAC FROM BallProperty WHERE SmartBallID=? "; 

			try {
				conn = JDBCUtil.getConnection();
				pstmt = conn.prepareStatement(sql_1);
				pstmt.setString(1,SmartBallID);
				rs = pstmt.executeQuery();
				if(rs.next()){
					
					retMap.put(UserInfo.ReservationID, rs.getInt("ReservationID"));
				    retMap.put(UserInfo.startTime, rs.getDate("startTime"));
				    retMap.put(UserInfo.endTime, rs.getDate("endTime"));
				}
				JDBCUtil.closePrepareStatement(pstmt);
				
				pstmt = conn.prepareStatement(sql_2);
				pstmt.setString(1,SmartBallID);
				if(rs.next()){
					retMap.put(UserInfo.MAC, rs.getString("SmartBallMAC"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.closeResultSet(rs);
				JDBCUtil.closePrepareStatement(pstmt);
				JDBCUtil.closeConnection(conn);
			}	        
			return retMap;
	    }
}
