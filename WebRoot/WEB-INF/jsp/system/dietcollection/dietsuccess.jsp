<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
    <link href="${pageContext.request.contextPath }/static/css/style_ballSuccess.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
  	<%-- <c:if test="${source==null||source==\"\"}">
  		请不要重复提交请求!5秒后回到业务办理页面。如未跳转，请点击下面链接<br>
  		<a href='${link}'>业务办理页面</a>
  	</c:if>
  	<c:if test="${source!=null&&source!=\"\"}">
  		${source }成功!${reservationinfo}5秒后回到业务办理页面。如未跳转，请点击下面链接<br>
  		<a href='${link}'>业务办理页面</a> --%>
  		
  		<canvas class="canvas"></canvas>

	    <div class="help" style="display:none;">?</div>
	
	    <div class="ui" style="display:none;">
	        <input class="ui-input" type="text" />
	        <span class="ui-return">↵</span>
	    </div>
	
	    <div class="overlay">
	    	<div class="tabs">
	      	<div class="tabs-labels"><span class="tabs-label">Commands</span><span class="tabs-label">Info</span><span class="tabs-label">Share</span></div>
	
	        <div class="tabs-panels">
	          <ul class="tabs-panel commands">
	              <li class="commands-item"><span class="commands-item-title">Text</span><span class="commands-item-info" data-demo="Hello :)">Type anything</span><span class="commands-item-action">Demo</span></li>
	              <li class="commands-item"><span class="commands-item-title">Countdown</span><span class="commands-item-info" data-demo="#countdown 10">#countdown<span class="commands-item-mode">number</span></span><span class="commands-item-action">Demo</span></li>
	              <li class="commands-item"><span class="commands-item-title">Time</span><span class="commands-item-info" data-demo="#time">#time</span><span class="commands-item-action">Demo</span></li>
	              <li class="commands-item"><span class="commands-item-title">Rectangle</span><span class="commands-item-info" data-demo="#rectangle 30x15">#rectangle<span class="commands-item-mode">width x height</span></span><span class="commands-item-action">Demo</span></li>
	              <li class="commands-item"><span class="commands-item-title">Circle</span><span class="commands-item-info" data-demo="#circle 25">#circle<span class="commands-item-mode">diameter</span></span><span class="commands-item-action">Demo</span></li>
	              <li class="commands-item commands-item--gap"><span class="commands-item-title">Animate</span><span class="commands-item-info" data-demo="The time is|#time|#countdown 3|#icon thumbs-up"><span class="commands-item-mode">command1</span>&nbsp;|<span class="commands-item-mode">command2</span></span><span class="commands-item-action">Demo</span></li>
	          </ul>
          </div>
        </div>
	    </div>
  	<%-- </c:if> --%>
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/scripts_ballSuccess.js"></script>
    <script>
    	function show() {
			    window.location.href = "${link}";
			}
    </script>
  </body>
</html>
