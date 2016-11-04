<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap Base Template</title>
		<!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/static/css/style.css" rel="stylesheet" />
  </head>
  <body>
 		<div class="container" id="container">
	    <div class="row">
	      <div class="png-fix" id="overlay">
			    <div class="reservationSuccess">预约成功!</div>
		 			<div class="reservationInfo">预约号码为：<div class="reservationNumber">
		 			<c:if test="${pd.Type==1 }">
		 			${pd.ReservationID }
		 			</c:if>
		 			<c:if test="${pd.Type==2 }">
		 				${pd.BeginNumber }-${pd.EndNumber } 
		 				<div style="font-size:30px;"><br>请注意：预约号码连续，且号码数量与团队人数相同</div>
		 			</c:if>
		 			
		 			</div><br>请务必记住该号码，这是您进入场馆的凭证。</div>
	      </div>
	    </div>
	  </div>
  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/custom.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/pngFix.js"></script>
  </body>
</html>
