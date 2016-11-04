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
    <title>展馆预约</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- CSS Files -->
    <link href="${pageContext.request.contextPath }/static/css/style_originality_collections.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/static/css/animate.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <section class="mainSection">
      <div class="container">
        <div class="row" id="rowmainSectionHeader">
        	<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
        	<div class="col-xs-8 col-sm-8 col-md-8 col-lg-10">
        		<h1 class="animated fadeInDown">青岛-慧与软件全球大数据应用研究及产业示范基地</h1>
          	<p class="animated fadeInUp" id="hezuo">期待与您的合作！</p>
        	</div>
          <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
        </div>
      </div>
      <div class="row" id="rowmainSectionButton">
      	<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"></div>
      	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
      		<a href="${pageContext.request.contextPath }/originality/gooriginality_person" class="btn btn-lg btnmainSection" role="button">个人/团队合作</a>
      	</div>
      	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
        	<a href="${pageContext.request.contextPath }/originality/gooriginality_company" class="btn btn-lg btnmainSection" role="button">企业合作</a>
      	</div>			
    </section>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>


  </body>
</html>