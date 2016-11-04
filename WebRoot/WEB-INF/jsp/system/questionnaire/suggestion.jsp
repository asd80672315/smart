<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
    <title>个人预约</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">    
    <!-- CSS Files -->
    <link href="${pageContext.request.contextPath }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
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
        </div><!-- /.container-fluid -->
      </nav><!-- /Navigation -->
      <form action="${pageContext.request.contextPath }/originality/saveadvice" method="post" >
	    <input type="hidden" name="token" value="${token}" /> 
	    <div class="container">
	    	<div id="textareaDescription"  style="background-color:#fff; padding:30px;margin-top:7%;-moz-border-radius: 1px;-webkit-border-radius: 1px;">
		    	<h2 style="">请留下您对本馆的意见</h2>
		    	<textarea class="form-control" rows="10" name="Content"></textarea>
		    	<button class="btn btn-default btn-lg" type="submit" style="margin-top:10px;margin-left:93%;">提交</button>
	    	</div>
	    </div>
    </form>
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/jquery.backstretch.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/scripts_receptionist.js"></script>
  </body>
</html>
