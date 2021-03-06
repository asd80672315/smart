package com.zhzg.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.zhzg.util.JDBCUtil;

@WebServlet(description = "嘉宾所在行业统计图", urlPatterns = { "/Statistics/PieController" })
public class PieController extends HttpServlet {
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
		List<String> names = new ArrayList<>();
		List<Integer> values = new ArrayList<>();
		int countOther = 0;
		String pieData = "[";

		String sql = "SELECT IFNULL(I.Name, '其他') AS Name, COUNT(*) AS Count"
				+ "     FROM QingdaoBigData.visitors AS V"
				+ "     LEFT JOIN QingdaoBigData.industries AS I ON V.IndustryID = I.IndustryID"
				+ "    GROUP BY I.IndustryID, I.Name"
				+ "    ORDER BY CASE WHEN I.Name IS NULL THEN 0 ELSE 1 END DESC, Count DESC;";

		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				names.add(rs.getString("Name"));
				values.add(rs.getInt("Count"));
			}

			if (names.size() > 5) {
				for (int i = 5; i < names.size(); i++) {
					countOther += values.get(i);
				}
				
				for(int i = 0; i< 5; i++) {
					pieData += "{value : " + values.get(i) + ", name : '" + names.get(i) + "'},";
				}
				pieData += "{value: " + countOther + ", name : '其他'}]";
			} else {
				for (int i = 0; i < names.size(); i++) {
					pieData += "{value : " + values.get(i) + ", name : '" + names.get(i) + "'},";
				}
				pieData += "]";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(stmt);
			JDBCUtil.closeConnection(conn);
		}

		// 抽出来的数据要进行处理，前5条可以直接取来用;
		// 第6条之后的条数要累加，行业名字为'其他'

		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		
		String jsonString = JSON.toJSONString(pieData);
		// System.out.println(jsonString);

		PrintWriter write = response.getWriter();
		write.write(jsonString);
		write.flush();
	}
}
