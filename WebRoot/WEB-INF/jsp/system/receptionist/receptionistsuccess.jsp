<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	      <div class="png-fix overlay" id="personal">
			    <div class="reservationSuccess">访客登记成功</div>
		 			<div class="reservationInfo">预约号码为：<div class="reservationNumber">${pd.ReservationID }</div>请务必记住该号码，这是您进入场馆的凭证。</div>
	      </div>
	      <div class="png-fix overlay" id="group">
			    <div class="reservationSuccess">团体登记成功</div>
		 			<div class="reservationInfo">预约号码为：<div class="reservationNumber">${pd.BeginNumber }</div>到
		 				<div class="reservationNumber">${pd.EndNumber }</div>请务必记住该号码，这是您进入场馆的凭证。</div>
	      </div>
	    </div>
	    <br>
	    <br>
	    <div>
	    	<a href="govisitors" class="backToReceptionist">返回访客登记页面</a>
	    </div>
	  </div>
  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/custom.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/pngFix.js"></script>
	  <script>
    	var type = "${pd.Type}";
			if(type == "1"){
		 		$("#personal").css('display', 'block');
    		$("#group").css('display', 'none');
		 	}else if(type == "2"){
		 		$("#personal").css('display', 'none');
    		$("#group").css('display', 'block');
		 	}
		</script>
  </body>
</html>
