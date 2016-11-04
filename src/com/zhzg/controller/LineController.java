package com.zhzg.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.zhzg.util.JDBCUtil;


@WebServlet(description = "互动项目人数-平均时间统计图", urlPatterns = { "/Statistics/LineController" })
public class LineController extends HttpServlet implements Servlet {
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

		String sql = "SELECT IC.No, COUNT(DISTINCT ReservationID) AS PeopleCount, IFNULL(ROUND(AVG(TIMESTAMPDIFF(SECOND, Begintimestamp , Endtimestamp ))), 0) AS AvgTimes"
				+ "     FROM QingdaoBigData.items AS I"
				+ "     LEFT JOIN QingdaoBigData.itemcollections AS IC ON I.No = IC.No"
				+ "    GROUP BY IC.No" + "    ORDER BY IC.No";

		// 项目名称
		List<String> itemNames = new ArrayList<>();
		// 互动人数
		List<Integer> peoples = new ArrayList<>();
		// 平均时间
		List<Integer> times = new ArrayList<>();

		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				//itemNames.add(rs.getString("Name"));
				peoples.add(rs.getInt("PeopleCount"));
				times.add(rs.getInt("AvgTimes"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeStatement(stmt);
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeConnection(conn);
		}

		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");

		Map<String, Object> json = new HashMap<String, Object>();
		json.put("itemNames", itemNames);
		json.put("peoples", peoples);
		json.put("times", times);

		String jsonString = JSON.toJSONString(json);
		// System.out.println(jsonString);

		PrintWriter write = response.getWriter();
		write.write(jsonString);
		write.flush();
	}

}