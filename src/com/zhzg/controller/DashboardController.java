package com.zhzg.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.zhzg.util.JDBCUtil;


@WebServlet(description = "当前在馆人数统计图", urlPatterns = { "/Statistics/DashboardController" })
public class DashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		int individual = 0;
		int vip = 0;
		int group = 0;

		String sql = "SELECT SUM(CASE Type WHEN '1' THEN Count ELSE 0 END) AS 'individual',"
				+ "          SUM(CASE Type WHEN '2' THEN Count ELSE 0 END) AS 'group',"
				+ "          SUM(CASE Type WHEN '3' THEN Count ELSE 0 END) AS 'vip'"
				+ "     FROM (SELECT Type, COUNT(VisitorID) AS Count"
				+ "             FROM QingdaoBigData.Visitors"
				+ "            WHERE State = 2"
				+ "              AND VisitDate = CURRENT_DATE()"
				+ "            GROUP BY Type" + "          ) AS V;";

		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				individual = rs.getInt("individual");
				vip = rs.getInt("vip");
				group = rs.getInt("group");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(stmt);
			JDBCUtil.closeConnection(conn);
		}

		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");

		Map<String, Integer> json = new HashMap<String, Integer>();
		json.put("individual", individual);
		json.put("vip", vip);
		json.put("group", group);

		String jsonString = JSON.toJSONString(json);
		// System.out.println(jsonString);
		PrintWriter write = response.getWriter();
		write.write(jsonString);
		write.flush();
	}

}