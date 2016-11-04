<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="refresh" content="5;url=${link }" />
  </head>
  
  <body>
  	<c:if test="${source==null||source==\"\"}">
  		请不要重复提交请求!5秒后回到业务办理页面。如未跳转，请点击下面链接<br>
  		<a href='${link}'>业务办理页面</a>
  	</c:if>
  	<c:if test="${source!=null&&source!=\"\"}">
  		${source }成功!${reservationinfo}5秒后回到业务办理页面。如未跳转，请点击下面链接<br>
  		<a href='${link}'>业务办理页面</a>
  		
  		
  			
  	</c:if>
    
  </body>
</html>
