package com.zhzg.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.zhzg.util.JDBCUtil;


@WebServlet(description = "嘉宾所在地区统计图", urlPatterns = { "/Statistics/MapController" })
public class MapController extends HttpServlet {
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

		String QDData = "[";

		String sql = "SELECT Region, COUNT(*) AS Count"
				+ "     FROM QingdaoBigData.visitors"
				+ "    GROUP BY Region"
				+ "    ORDER BY CASE WHEN Region IS NULL THEN 0 ELSE 1 END DESC, Count DESC"
				+ "    LIMIT 10;";

		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				QDData += "[{ name: '青岛' }, " + "{ name: '" + rs.getString("Region") + "', value: " + rs.getString("Count") + "}],";
			}
			
			QDData += "]";
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.closeResultSet(rs);
			JDBCUtil.closeStatement(stmt);
			JDBCUtil.closeConnection(conn);
		}

		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");

		/*QDData = "[" + "[{ name: '青岛' }, { name: '北京', value: 95 }],"
				+ "[{ name: '青岛' }, { name: '上海', value: 80 }],"
				+ "[{ name: '青岛' }, { name: '河北', value: 40 }],"
				+ "[{ name: '青岛' }, { name: '河南', value: 10 }],"
				+ "[{ name: '青岛' }, { name: '黑龙江', value: 30 }],"
				+ "[{ name: '青岛' }, { name: '浙江', value: 15 }],"
				+ "[{ name: '青岛' }, { name: '广东', value: 10 }],"
				+ "[{ name: '青岛' }, { name: '海南', value: 10 }],"
				+ "[{ name: '青岛' }, { name: '新疆', value: 10 }],"
				+ "[{ name: '青岛' }, { name: '广西', value: 10 }]," + "]";*/

		String jsonString = JSON.toJSONString(QDData);
		// System.out.println(jsonString);
		PrintWriter write = response.getWriter();
		write.write(jsonString);
		write.flush();
	}

}
