<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    	<div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="navbar-brand" >
            <img src="${pageContext.request.contextPath }/static/img/HPE_log_left_wht.png" alt="惠普Logo">
          </div>
        </div><!-- /.navbar-header -->
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse">
          <form action="${pageContext.request.contextPath }/visitors/findVisitors" method="post"  class="navbar-form" id="searchNavForm" role="search">
            <div class="form-group">
              <input type="text" id="phoneOrName" name="ReservationID" value="${pd.ReservationID }" class="form-control search clearable" placeholder="请输入手机号码或者用户名">
              <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
            </div>
          </form>
         <div class="msg">${msg}</div>
          
        </div><!-- /.collapse navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav><!-- /Navigation -->
    <table border="1" id="tableQueryList" cellspacing="0" width="1000px">
	   <tr>
	   	<td colspan="6">信息列表</td>
	   </tr>
     <tr>
      <td>序号</td>
      <td>姓名</td>
      <td>手机号</td>
      <td>起始预约号</td>
      <td>终止预约号</td>
      <td>预约时间</td>
	  </tr>
	  <c:forEach items="${pd}" var="pd">
		  <tr>
		     <td>${pd.ReservationID}</td>
		     <td>${pd.Name}</td>
		     <td>${pd.Phone}</td>
		     <td>${pd.BeginNumbe}</td>
		     <td>${pd.EndNumber}</td>
		     <td>${pd.BookingDate}</td>
		  </tr>
	  </c:forEach>
	</table>
	
	<script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/jquery.backstretch.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/scripts_queryList.js"></script>
  </body>
</html>
