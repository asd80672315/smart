package com.zhzg.track;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import com.zhzg.util.JDBCUtil;

public class OperateDB {

	public static void InsertVisitorBallMapping(int reservationID, String smartBallID, String smartBallMAC) {
   
        //读数据库
        Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement("INSERT INTO visitorBallMapping"+
					"(ReservationID,SmartBallID,SmartBallMAC) values (?,?,?)");
			pstmt.setInt(1,reservationID);
			pstmt.setString(2,smartBallID);
			pstmt.setString(3,smartBallMAC);
			rs = pstmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closePrepareStatement(pstmt);
			JDBCUtil.closeConnection(conn);
		}	        

    }
	
	public static void InsertVisitorRoomTime(int reservationID, int roomID, int stayTime, 
			Date startTime, Date endTime) {
		   
        //读数据库
        Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement("INSERT INTO visitorRoomTime"+
					"(ReservationID,RoomID,StayTime,StartTime,EndTime) values (?,?,?,?,?)");
			pstmt.setInt(1,reservationID);
			pstmt.setInt(2,roomID);
			pstmt.setInt(3,stayTime);
			Timestamp t1 = new Timestamp(startTime.getTime());
			pstmt.setTimestamp(4, t1);
			Timestamp t2 = new Timestamp(endTime.getTime());
			pstmt.setTimestamp(5, t2);
			rs = pstmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closePrepareStatement(pstmt);
			JDBCUtil.closeConnection(conn);
		}	        

    }
	
	public static void InsertAllRoomTime(int reservationID,String smartBallID, String smartBallMAC,
			int[] roomID, int[] stayTime, Timestamp[] startTime, Timestamp[] endTime) {
		   
        //读数据库
        Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql_1 = "INSERT INTO visitorBallMapping (ReservationID,SmartBallID,SmartBallMAC) values (?,?,?)"; 
		String sql_2 = "INSERT INTO visitorRoomTime (ReservationID,RoomID,StayTime,StartTime,EndTime) values (?,?,?,?,?)"; 

		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement(sql_1);
			pstmt.setInt(1,reservationID);
			pstmt.setString(2,smartBallID);
			pstmt.setString(3,smartBallMAC);
			rs = pstmt.executeQuery();
			
			JDBCUtil.closePrepareStatement(pstmt);
			
			pstmt = conn.prepareStatement(sql_2);
			for (int i = 0; i < stayTime.length; i++){
				pstmt.setInt(1,reservationID);
				pstmt.setInt(2,roomID[i]);
				pstmt.setInt(3,stayTime[i]);			
				pstmt.setTimestamp(4, startTime[i]);			
				pstmt.setTimestamp(5, endTime[i]);
				rs = pstmt.executeQuery();
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closePrepareStatement(pstmt);
			JDBCUtil.closeConnection(conn);
		}	        

    }
}
