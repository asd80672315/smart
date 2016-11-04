<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>前台登记</title>
    

<!-- 引入 -->
		<script type="text/javascript" src="../js/jquery.js"></script>
		<script type="text/javascript">
			$(function(){
				
				$("#btn1").click(function(){
					var ReservationID = $("#ReservationID").val();
					var url = "<%=basePath%>visitors/findVisitors.do?ReservationID="+ReservationID+"&tm="+new Date().getTim();
					$.ajax({
						type: "POST",
						url: url,
						data: {ReservationID:ReservationID,tm:new Date().getTime()},
						dataType:'json',
						cache: false,
						success: function(data){
							 alert(data);
						}
					});
				});
				
				
			})
		</script>
  </head>
  
  <body>
    <form action="visitors/findVisitors" name="vForm" id="vForm" method="post">
    	
    	<div>

    			<input type="text"  name="ReservationID" id="ReservationID" value="1" maxlength="32" placeholder="这里输入预约号" title="预约号"/>
				<input type="hidden"  name="TYPE" id="tpye" value="1" maxlength="32" placeholder="这里输入用户名" title="用户名"/>
				<input type="text" name="NAME" id="Name"  maxlength="32" placeholder="这里输入姓名" title="姓名" value="${visitor.Name}" />
				<button id="bt1">提交</button> <input type="submit" value="查询">
    	<div>
    </form>
  </body>
</html>
