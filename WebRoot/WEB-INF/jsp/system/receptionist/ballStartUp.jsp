<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>取球</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- CSS Files -->
    <link href="${pageContext.request.contextPath }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath }/static/css/normalize_style_ballStartUp.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath }/static/css/style_ballStartUp.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <section class="webdesigntuts-workshop">
			<form action="${pageContext.request.contextPath}/visitors/findvisitor" method="post" class="form-horizontal">
		    	<div style="color:#fff; font-size:18px;">拍照前，请输入预约号</div>
		    	<span style="color:red;font-size:10px">${msg }</span>
		    	<span style="color:red;font-size:10px">${reservationiderror }</span><br>
		    	<input type="hidden" name="url" value="/system/receptionist/ballStartUp" />
		    	
		    	<input type="search" name="ReservationID" value="${reservationid }">
		    	<button type="submit">提交</button>   	
			</form>
		</section>
  </body>
</html>
