package com.zhzg.track;

import java.io.FileInputStream;
import java.io.IOException;

import javax.imageio.*;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.awt.*;
import java.awt.image.*;

import net.sf.json.JSONArray;



public class drawline extends HttpServlet {	

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		//获取接口参数数据
        String smartBallID = req.getParameter("SmartBallID");
        
	    res.setContentType("image/png");
	    String path = getServletContext().getRealPath("/");
	    path += "static\\img\\base.jpg";
	    BufferedImage image = ImageIO.read(new FileInputStream(path));
	    // 创建Java2D对象
	    Graphics2D g2d = image.createGraphics();
   
	    //在这里要获取全部轨迹点位数据
	    int n = 0;
	    int[] point_x,point_y,point_z;
	     
	    try {
	    	 
	    	QueryLocation getLocation = new QueryLocation(smartBallID, 0);
	    	String responseData = getLocation.queryLocations();
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
		    //这里需要对数据进行简单的优化，例如抛弃抖动过大的误差数据（应该对数据案例进行分析后再决定算法）
		    
		    //展厅边界限制，越界数据初步检查，暂不考虑躲避墙体等复杂算法
		    
		    //最终形成点位数组绘图
		    g2d.setFont(new Font("Courier New", Font.PLAIN, 12));
		    
		      // 坐标点位偏移
		    int offset_x = 0;
		    int offset_y = 0;
		    for (int j = 0; j < point_y.length; j++)
		    { 
		        point_x[j] += offset_x;
		        point_y[j] += offset_y;
		        
		     }
		      /*
		      int rd1 = 0;
		      int rd2 = 0;
		      for (int j = 0; j < point_y.length; j++)
		      {
		    	rd1 = 800+(int)(Math.random() * 2500);
		        rd2 = 40+(int)(Math.random() * 600);
		        
		        point_x[j] = rd1;
		        point_y[j] = rd2 * 3;
		        
		      }
		      */
		      // 重新设置笔划
		      g2d.setStroke(new BasicStroke(5.0f));
		      // Color[] bookColor = { Color.RED, Color.ORANGE };
		      g2d.setColor(Color.ORANGE);

		      // 绘制折线
		      g2d.drawPolyline(point_x, point_y, point_y.length);

		    // 部署图形
		    g2d.dispose();

		    // 利用ImageIO类的write方法对图像进行编码
		    ServletOutputStream sos = res.getOutputStream();
		    ImageIO.write(image, "PNG", sos);
		    sos.close();
		   	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
/*
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
	*/
}
