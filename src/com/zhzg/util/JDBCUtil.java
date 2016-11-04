package com.zhzg.util;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class JDBCUtil {
	/**
	 * 获取数据库连接
	 * 
	 * @return 一个Connection类的对象
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException {
		// 注册JDBC驱动程序
		try {
			Class.forName("com.vertica.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		// 构造连接URL
		String dbURL = "jdbc:vertica://192.168.20.218:5433/BigData?useUnicode=true&characterEncoding=utf8&characterSetResults=utf8";
		String userId = "dbadmin";
		String password = "Qwert12345";
		// 获取连接
		Connection conn = DriverManager.getConnection(dbURL, userId, password);
		return conn;
	}

	/**
	 * 关闭数据库连接
	 * 
	 * @param conn
	 */
	public static void closeConnection(Connection conn) {
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 关闭Statement
	 * 
	 * @param stmt
	 */
	public static void closeStatement(Statement stmt) {
		try {
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 关闭PrepareStatement
	 * 
	 * @param stmt
	 */
	public static void closePrepareStatement(PreparedStatement stmt) {
		try {
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 关闭ResultSet
	 * 
	 * @param rs
	 */
	public static void closeResultSet(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
