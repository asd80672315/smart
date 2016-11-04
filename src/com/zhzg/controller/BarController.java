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


@WebServlet(description = "嘉宾来访日-年龄阶段统计图", urlPatterns = { "/Statistics/BarController" })
public class BarController extends HttpServlet {
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

		String sql = "SELECT WeekId,"
				+ "          SUM(CASE WHEN AgeLevel = 1 THEN CT ELSE 0 END) AS AgeLevel_1,"
				+ "          SUM(CASE WHEN AgeLevel = 2 THEN CT ELSE 0 END) AS AgeLevel_2,"
				+ "          SUM(CASE WHEN AgeLevel = 3 THEN CT ELSE 0 END) AS AgeLevel_3,"
				+ "          SUM(CASE WHEN AgeLevel = 4 THEN CT ELSE 0 END) AS AgeLevel_4,"
				+ "          SUM(CASE WHEN AgeLevel = 5 THEN CT ELSE 0 END) AS AgeLevel_5,"
				+ "          SUM(CASE WHEN AgeLevel = 6 THEN CT ELSE 0 END) AS AgeLevel_6"
				+ "     FROM (SELECT WeekId,"
				+ "                  AgeLevel,"
				+ "                  Count(*) AS CT"
				+ "             FROM (SELECT CASE "
				+ "                            WHEN Age <= 20 THEN 1"
				+ "                            WHEN Age >= 21 AND Age <= 30 THEN 2"
				+ "                            WHEN Age >= 31 AND Age <= 40 THEN 3"
				+ "                            WHEN Age >= 41 AND Age <= 50 THEN 4"
				+ "                            WHEN Age >= 51 THEN 5"
				+ "                            WHEN Age IS NULL THEN 6"
				+ "                          END AS AgeLevel,"
				+ "                          DAYOFWEEK(VisitDate) AS WeekId"
				+ "                     FROM QingdaoBigData.visitors"
				+ "                  ) AS V1"
				+ "            GROUP BY WeekId, AgeLevel" + "          ) V2"
				+ "    GROUP BY WeekId;";

		// 21岁以下
		Integer[] val_1 = { 0, 0, 0, 0, 0, 0, 0 };

		// 21岁~30岁
		Integer[] val_2 = { 0, 0, 0, 0, 0, 0, 0 };

		// 31岁~40岁
		Integer[] val_3 = { 0, 0, 0, 0, 0, 0, 0, };

		// 41岁~50岁
		Integer[] val_4 = { 0, 0, 0, 0, 0, 0, 0 };

		// 50岁以上
		Integer[] val_5 = { 0, 0, 0, 0, 0, 0, 0 };

		// 保密
		Integer[] val_6 = { 0, 0, 0, 0, 0, 0, 0 };

		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				switch(rs.getInt("WeekId")){
				case 1:
					val_1[0] = rs.getInt("AgeLevel_1");
					val_2[0] = rs.getInt("AgeLevel_2");
					val_3[0] = rs.getInt("AgeLevel_3");
					val_4[0] = rs.getInt("AgeLevel_4");
					val_5[0] = rs.getInt("AgeLevel_5");
					val_6[0] = rs.getInt("AgeLevel_6");
					break;
				case 2:
					val_1[1] = rs.getInt("AgeLevel_1");
					val_2[1] = rs.getInt("AgeLevel_2");
					val_3[1] = rs.getInt("AgeLevel_3");
					val_4[1] = rs.getInt("AgeLevel_4");
					val_5[1] = rs.getInt("AgeLevel_5");
					val_6[1] = rs.getInt("AgeLevel_6");
					break;
				case 3:
					val_1[2] = rs.getInt("AgeLevel_1");
					val_2[2] = rs.getInt("AgeLevel_2");
					val_3[2] = rs.getInt("AgeLevel_3");
					val_4[2] = rs.getInt("AgeLevel_4");
					val_5[2] = rs.getInt("AgeLevel_5");
					val_6[2] = rs.getInt("AgeLevel_6");
					break;
				case 4:
					val_1[3] = rs.getInt("AgeLevel_1");
					val_2[3] = rs.getInt("AgeLevel_2");
					val_3[3] = rs.getInt("AgeLevel_3");
					val_4[3] = rs.getInt("AgeLevel_4");
					val_5[3] = rs.getInt("AgeLevel_5");
					val_6[3] = rs.getInt("AgeLevel_6");
					break;
				case 5:
					val_1[4] = rs.getInt("AgeLevel_1");
					val_2[4] = rs.getInt("AgeLevel_2");
					val_3[4] = rs.getInt("AgeLevel_3");
					val_4[4] = rs.getInt("AgeLevel_4");
					val_5[4] = rs.getInt("AgeLevel_5");
					val_6[4] = rs.getInt("AgeLevel_6");
					break;
				case 6:
					val_1[5] = rs.getInt("AgeLevel_1");
					val_2[5] = rs.getInt("AgeLevel_2");
					val_3[5] = rs.getInt("AgeLevel_3");
					val_4[5] = rs.getInt("AgeLevel_4");
					val_5[5] = rs.getInt("AgeLevel_5");
					val_6[5] = rs.getInt("AgeLevel_6");
					break;
				case 7:
					val_1[6] = rs.getInt("AgeLevel_1");
					val_2[6] = rs.getInt("AgeLevel_2");
					val_3[6] = rs.getInt("AgeLevel_3");
					val_4[6] = rs.getInt("AgeLevel_4");
					val_5[6] = rs.getInt("AgeLevel_5");
					val_6[6] = rs.getInt("AgeLevel_6");
					break;
				}
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

		Map<String, Object> json = new HashMap<String, Object>();
		json.put("val_1", val_1);
		json.put("val_2", val_2);
		json.put("val_3", val_3);
		json.put("val_4", val_4);
		json.put("val_5", val_5);
		json.put("val_6", val_6);

		String jsonString = JSON.toJSONString(json);
		// System.out.println(jsonString);

		PrintWriter write = response.getWriter();
		write.write(jsonString);
		write.flush();
	}

}
