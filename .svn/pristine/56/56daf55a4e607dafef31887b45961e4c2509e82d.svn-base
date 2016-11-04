<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>个人/团队合作</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">    
    <!-- CSS Files -->
    <link href="${pageContext.request.contextPath }/static/css/style.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
   
  </head>
  <body>
    <!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
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
        </div><!-- div class="navbar-header" -->
      </div><!-- /.container-fluid -->
    </nav><!-- /Navigation --> 
    
    <!-- Register Form -->
		<div class="container">
      <div class="register center-block">
        <form action="${pageContext.request.contextPath }/reservation/saveReservation" method="post" class="form-horizontal formRegister" id="formRegister" onsubmit="return validatePersonalForm()"> 
          <h2>请输入<span class="red"><strong>个人/团队</strong></span> 信息</h2>
          <input type="hidden" name="Type" value="1">
          <input type="hidden" name="State" value="1">
          <input type="hidden" name="token" value="${token}" />
          <input type="hidden" name="url" value="${pageContext.request.contextPath}/reservation/reservation_personal" />
          <div class="form-group">
            <label for="Name" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label"><span class="requiredInputForm">*</span>您的姓名</label>
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
              <input class="form-control" type="text" id="Name" name="Name" value="${pd.Name }" data-toggle="popover" data-placement="right" placeholder="请输入您的姓名..." onblur="validateName()" onfocus="cleanPopover()"><span style="color:red;font-size:10px">${error.name }</span>
            </div>
            
          </div><!-- /#Name -->
          
          <div class="form-group">
           <label for="Phone" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label"><span class="requiredInputForm">*</span>联系电话</label>
           <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
             <input class="form-control" type="text" id="Phone" name="Phone" value="${pd.Phone }" placeholder="请输入您的联系电话..." data-toggle="popover" data-placement="right" onblur="validatePhone()" onfocus="cleanPopover()"><span style="color:red;font-size:10px">${error.phone }</span>
           </div>
         	</div><!-- /#Phone -->
         
          <div class="form-group">
            <label for="Email" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label"><span class="requiredInputForm">*</span>电子邮箱</label>
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
              <input class="form-control" type="text" id="Email" name="Email" value="${pd.Email }" placeholder="请输入您的电子邮箱..." data-toggle="popover" data-placement="right" placeholder="请输入您的姓名..." onblur="validateEmail()" onfocus="cleanPopover()"><span style="color:red;font-size:10px">${error.mail }</span>
            </div>
          </div><!-- /#Mail -->
          
          <div class="form-group">
            <label for="Description" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label"><span class="requiredInputForm">*</span>创意描述</label>
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
              <textarea class="form-control" rows="10" id="Description" name="Description" value="${pd.Description }" placeholder="请输入您的创意描述..."></textarea><span style="color:red;font-size:10px">${error.description }</span>
            </div>
          </div><!-- /#Description -->
          
          <div class="form-group">
            <label for="IntentionManner" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label"><span class="requiredInputForm">*</span>意向合作方式</label>
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
              <textarea class="form-control" rows="10" id="IntentionManner" name="IntentionManner" value="${pd.IntentionManner }" placeholder="请输入您的意向合作方式..."></textarea><span style="color:red;font-size:10px">${error.IntentionManner }</span>
            </div>
          </div><!-- /#Description -->
          
        	<button type="submit" class="center-block">提交</button>
        </form>
      </div><!-- /.register -->
    </div><!-- .container -->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/jquery.backstretch.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/scripts_originalitycollections.js"></script>
    <script id="getcommondataScript" data="occupationid=${pd.OccupationID}&positionid=${pd.PositionID}&industryid=${pd.IndustryID}" src="${pageContext.request.contextPath }/static/js/getcommondata.js"></script>
  </body>
</html>
