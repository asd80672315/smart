package com.zhzg.track;

import java.sql.Timestamp;
import java.util.*;
import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.awt.*;
import java.awt.geom.GeneralPath;
import java.awt.image.*;

import javax.imageio.*;

public class drawTimeline extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 **/
	 public static void drawTrigangle(int sx, int sy, int w, int h, int flag,Graphics2D g2d)  
	 {  
		 
		 GeneralPath triangle = new GeneralPath();  
		 if(flag==0){
			 triangle.moveTo(sx+h, sy);  
		     triangle.lineTo(sx, sy+h);  
		     triangle.lineTo(sx, sy-h);  
		 }
		 else{
			 triangle.moveTo(sx, sy-h);  
		     triangle.lineTo(sx+h, sy);  
		     triangle.lineTo(sx-h, sy);  
		 }
	     triangle.closePath();  
	     g2d.fill(triangle); 
	 }
	 
	public void doGet(HttpServletRequest req, HttpServletResponse response)
			throws ServletException, IOException {
		
		//获取接口参数数据
        String smartBallID = req.getParameter("SmartBallID");
        
        //获取定位时间数据      
        QueryLocation getLocation = new QueryLocation(smartBallID,1);
        int[] roomTime = getLocation.getLocationTime();
        Date startTime = getLocation.getStartTime();
        Date endTime = getLocation.getEndTime();
        
        //获取需记录信息
        int reservationID = getLocation.getReservationID();
        String smartBallMAC = getLocation.getMAC();      
          
        //计算各展厅时间
        int roomcount = QueryLocation.room_num;
		int[] roomID_sql = QueryLocation.roomID;
		
		Timestamp[] startTime_sql = new Timestamp[roomcount];
		Timestamp[] endTime_sql = new Timestamp[roomcount];

        long timecount = startTime.getTime();
        for(int i=0; i<roomcount; i++){
        	startTime_sql[i].setTime(timecount); 
        	timecount += roomTime[i]*1000;
        	endTime_sql[i].setTime(timecount); 
		}
	    //数据写数据库
        OperateDB.InsertAllRoomTime(reservationID, smartBallID, smartBallMAC, 
        		                                    roomID_sql, roomTime, startTime_sql, endTime_sql);
        				
        //开始画图
	    response.setContentType("image/png");
	    // 创建一个 1300X400 的图像
	    int width = 1300, height = 400;
	    int stringLength = 0;
	    int stringHeight = 0;
	    
	    Color lineColor =  new Color(111, 189, 157);
	    Color lineColor2 =  new Color(242, 154, 118);
	    Color rectColor =  new Color(150, 150, 150);
	    Color rectColor2 =  new Color(242, 154, 118);
	    String[] roomName =  QueryLocation.roomName;
	    BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

	    // 创建Java2D对象
	    Graphics2D g2d = image.createGraphics();

	    // 填充白色背景
	    g2d.setColor(Color.WHITE);
	    g2d.fillRect(0, 0, width, height);

	    /**********左侧部分*************/
	    // 绘制图表标题
	    String chartTitle = "体验时间";
	    g2d.setFont(new Font("微软雅黑", Font.PLAIN, 24));
	    g2d.setColor(Color.BLACK);
	    g2d.drawString(chartTitle, 140, 40);
	    //绘制左侧直方图
	    BasicStroke bs = new BasicStroke(4.0f);
	    g2d.setStroke(bs);
	    g2d.setColor(lineColor);

	    //最长时间段序号
	    int maxPart = 0;
	    //找出逗留时间最长的
	    for (int j = 0; j <  roomTime.length; j++)
	    {  
	    	if(roomTime[j]>roomTime[maxPart]){
	    		maxPart = j;
	    	}
	    }
	    //直方图的偏移和预设
	    final int offsetx_L = 100;
	    final int offsety_L = 100;
	    final int rectw_max = 360;
	    final int rect_h = 50;
	    int[] rect_y = new int[]{240,180,120,60,0};
	    int[] rect_x = new int[]{0,140,170};
	    int[] rect_w = new int[]{50,20,360};
	    for (int j = 0; j <  rect_x.length; j++)
	    {  
	    	rect_x[j] += offsetx_L;//偏移放置
	    }
	    for (int j = 0; j <  rect_y.length; j++)
	    {  
	    	rect_y[j] += offsety_L;//偏移放置
	    }
	    for(int i = 0; i<rect_y.length; i++){
	    	for(int j = 0; j<rect_x.length; j++){
	    		int rectw = rect_w[j];
	    		if(2==j)
	    		{
	    		   rectw = (roomTime[i]*rectw_max)/roomTime[maxPart];
	    		}
	    		if(maxPart == i){
	    			g2d.setPaint(rectColor2);
	    		}else{
	    			g2d.setPaint(rectColor);
	    		}	    		
	    		g2d.fillRect(rect_x[j], rect_y[i], rectw, rect_h);
	    	}
	    }
	    // 绘制每个展厅标题
	    g2d.setFont(new Font("微软雅黑", Font.PLAIN, 20));
	    g2d.setColor(Color.BLACK); 
	    for (int i = 0; i < roomName.length; i ++)
	    {
	    	g2d.drawString(roomName[i], rect_x[0]+offsetx_L+70, rect_y[i]+offsety_L);
	    }
	    // 绘制每个展厅逗留时间
	    g2d.setFont(new Font("微软雅黑", Font.PLAIN, 16));
	    g2d.setColor(Color.BLACK); 
	    for (int i = 0; i < roomName.length; i ++)
	    {
	       String temp = roomTime[i]/60 + "m " +  roomTime[i]%60 + "s";	      
	       g2d.drawString(temp, rect_x[2]+offsetx_L, rect_y[i]+offsety_L);
	       temp = "";
	    }
	    
	    /**********右侧部分*************/
	    //图形预设
	    int xLineLength = 450;
	    int yLineLength = 360;
	    int xPartLength = 70;
	    int yPartLength = 60;
	    
	    // 创建虚线笔划
	    float[]dashes = { 8.f };
	    bs = new BasicStroke(1.0f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND, 
	      10, dashes, 3.f);
	    g2d.setStroke(bs);
	    g2d.setFont(new Font("微软雅黑", Font.PLAIN, 18));
	    g2d.setColor(Color.BLACK); 
	    
	    //获取在馆时间数据
	    int start_min = startTime.getMinutes();
	    int end_min = endTime.getMinutes();
	    int start_hour = startTime.getHours();
	    int end_hour = endTime.getHours();
	    //在馆时间实际总长度（分钟）
	    int totalTime = getLocation.getVisitTime()/60;
	    	   
	    //根据总在馆时间计算时间轴坐标起点,终点,个数和间隔
	    int x_num=0, x_dur=0;
	    if(totalTime<=30){//在馆30分钟内的时间坐标
	    	x_num=6;
	    	x_dur=5;
	    }
	    else if(totalTime<=60){	 //30到60分钟的时间坐标  	
	    	x_dur=10;	    	
	    }
	    else if(totalTime<=90){//61-90分钟的时间坐标
	    	x_dur=15;	     	    	
	    }else{//过长时间逗留的情况统一用20分钟间隔
	    	x_dur=20;        
	    }
	    x_num=totalTime/x_dur +1;
	    //在馆时间坐标轴总长度（分钟）
	    int totalTimeLine = x_dur*x_num;
	    //算起点分钟数   
	    int start_timeline = 0;
	    int time_offset = 0;
	    if(x_dur<10){
	    	start_timeline = (start_min/x_dur)*x_dur;
	    	time_offset = start_min%x_dur;
	    }else{
	    	start_timeline = (start_min/10)*10;
	    	time_offset = start_min%10;
	    }	    
	   
	     // 绘制横轴上的时间标示
	    g2d.setFont(new Font("微软雅黑", Font.PLAIN, 16));
	    g2d.setColor(Color.BLACK);
	    int temp_hour = start_hour;
	    int temp_min = start_timeline;
	    String str =Integer.toString(temp_hour) + ":";
	    int xdur = xLineLength/x_num;
	    for (int i = 0; i <= x_num; i++)
	    {
	    	String temp_str;
	    	if(0==temp_min){
	    		temp_str = str +"00";
	    	}else{
	    		temp_str = str + Integer.toString(temp_min);
	    	}	    	
	        stringLength = g2d.getFontMetrics().stringWidth(temp_str);
		    g2d.drawString(temp_str, 80+i * xdur - stringLength / 2, 380);	 
		    temp_min += x_dur;
		    if(temp_min>=60){
		    	temp_min = temp_min%60;
		    	if(temp_hour>=24){
		    	   temp_hour = temp_hour%24;
		    	}else{
		    		temp_hour ++;
		    	}
		    }
		    
	    }
	    
	    // 绘制纵轴上的展馆名称
	    //str = "";
	    g2d.setFont(new Font("微软雅黑", Font.PLAIN, 21));
	    g2d.setColor(Color.BLACK);
	    for (int i = 0; i < roomName.length; i ++)
	    {
	       //stringHeight = g2d.getFontMetrics().getAscent();
	       //stringLength = g2d.getFontMetrics().stringWidth(str);
	       g2d.drawString(roomName[i], 50, 90+i*60 + stringHeight / 2);
	    }
	    int offset = 690;
	    g2d.setColor(lineColor);
	    for (int i = 0; i < 300; i += 30)
	    {
	      // 绘制水平方向虚线
	      g2d.drawLine(120+offset, 60+i, 570+offset, 60+i);
	      
	    }

	    // 绘制坐标轴
	    g2d.setStroke(new BasicStroke(3.0f));
	    //g2d.setColor(new Color(53, 76, 112));
	    g2d.drawLine(120, 50, 120, 360);
	    g2d.drawLine(120, 360, 570, 360);

	    // 绘制纵坐标上的标题
	    //g2d.setFont(new Font("黑体", Font.PLAIN, 15));
	    //g2d.drawString("111", 40, 45);
	    
	    // 绘制坐标轴上的箭头
       // drawTrigangle(570, 360, 3, 8, 0, g2d); // 绘制横坐标轴上的箭头
	   // drawTrigangle(120, 50, 3, 8, 1, g2d); // 绘制纵坐标轴上的箭头
	    	    
	    //根据数据算出坐标点位信息
	    int[] p_y = new int[]{330,330,270,270,210,210,150,150,90,90};    
	    //int[] p_x = new int[]{120,200,220,290,295,370,380,450,460,570};
	    int[] p_x = new int[roomcount*2];
	    
	    for (int i = 0; i <  p_x.length; i++)
	    {  
	    	//计算时间点横坐标
	    	p_x[i] = (time_offset*xLineLength)/totalTimeLine + offset + 120;
	    	i++;
	    	if(roomTime[i/2]%60>=30){
	    		time_offset += roomTime[i/2]/60 +1;
	    	}else{
	    		time_offset += roomTime[i/2]/60;
	    	}
	    	p_x[i] = (time_offset*xLineLength)/totalTimeLine + offset + 120;
	    }
	    
	    g2d.setFont(new Font("Courier New", Font.PLAIN, 12));
	    g2d.setColor(lineColor);
	    bs = new BasicStroke(1.0f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND, 
	  	      10, dashes, 0);
	    // 初始化绘制数据
	    for (int j = 0; j < p_y.length/2; j++)
	    {      
	        int[] temp_y = new int[2];
		    int[] temp_x = new int[2];
		
		    if(j>0){
		    	 temp_y[0]=p_y[j*2-1];
		    	 temp_y[1]=p_y[j*2];
				 temp_x[0]=p_x[j*2-1];
				 temp_x[1]=p_x[j*2];
			    // 重新设置笔划
			    g2d.setStroke(bs);
			    // 绘制虚线
			    g2d.drawPolyline(temp_x, temp_y, temp_y.length);
		    }
	        temp_y[0]=temp_y[1]=p_y[j*2];
		    temp_x[0]=p_x[j*2];
		    temp_x[1]=p_x[j*2+1];
		    // 重新设置笔划
		    g2d.setStroke(new BasicStroke(5.0f));
		    if(j/2 == maxPart){
		    	g2d.setColor(lineColor2);
		    }else{
		    	g2d.setColor(lineColor);
		    }
		    	    
		    // 绘制实线
		    g2d.drawPolyline(temp_x, temp_y, temp_y.length);
		    
	    }
	    // 部署图形
	    g2d.dispose();

	    // 利用ImageIO类的write方法对图像进行编码
	    ServletOutputStream sos = response.getOutputStream();
	    ImageIO.write(image, "PNG", sos);
	    String path = getServletContext().getRealPath("/");
	    path += "static\\img\\123.jpg";
	    ImageIO.write(image, "PNG", new File(path));  
	    sos.close();	    
		
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
