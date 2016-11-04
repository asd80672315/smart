<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html >
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
    <script src="${pageContext.request.contextPath }/static/js/jatoolsPrinter.js"></script>
		<OBJECT  ID="jatoolsPrinter" CLASSID="CLSID:B43D3361-D075-4BE2-87FE-057188254255" style="display:none;" codebase="jatoolsPrinter.cab#version=5,7,0,0"></OBJECT>
    <script>
    	function doPrint() 
			{ 
       myDoc = {
       		documents:document
       }; 
       jatoolsPrinter.print(myDoc,false);   // 直接打印，不弹出打印机设置对话框       
			}     
    </script>
   
  </head>
  <body>
  	<!-- 后台传回的id信息存储pd中，所玩项目持续时间直接通过项目No来去就可以，如 pd.明星脸 pd.小皮球 -->
  	<div class="container center-block" id="containerIDCard">
  		<div class="row">
	  		<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5"></div>
	  		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" >
			    <img src="${pageContext.request.contextPath }/static/img/hpe_logo.png" id="HPELogoIDCard">
			    <img src="${pageContext.request.contextPath }/static/img/hpe_logo_weixin.png" id="HPELogoIDCardWeixin">
	  		</div>
	  	</div>
	  	<div class="row">
	  		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 "></div>
	  		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
  				<img src="${pageContext.request.contextPath }/static/img/test.png" id="futureIDImage">
	  		</div>
	  		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
  				<div id="infoContentText">未来身份证</div>
  				<div class="infoContent">姓名&nbsp;&nbsp;&nbsp;&nbsp;${pd.Name} ${ pd.明星脸}=== ${ pd.小皮球}</div>
  				<div class="infoContent">ID&nbsp;&nbsp;&nbsp;&nbsp;XXXXXXXX</div>
  				<div class="infoContent">有效期限&nbsp;&nbsp;&nbsp;&nbsp;2020年12月31日</div>
	  		</div>
	  	</div>
	  	<div class="row">
	  		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 "></div>
	  		<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
	  			<div class="StopTmeIDCard">体验时间</div>
	  			<%-- <img src="${pageContext.request.contextPath }/static/img/test1.png"> --%>
	  		</div>
	  	</div>
	  	<div class="row">
	  		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 "></div>
	  		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
	  			<div class="divStopTime">
		  			<div id="cityStopTimeHeader"></div>
		  			<div class="areaStopTime">中央厅</div>
		  			<div class="little"></div>
		  			<div id="cityStopTimeBlock"><span class="blockTime">10'12'03</span></div>
		  		</div>
		  		<div class="divStopTime">
		  			<div id="lifeStopTimeHeader"></div>
		  			<div class="areaStopTime">生活厅</div>
		  			<div class="little"></div>
		  			<div id="lifeStopTimeBlock"><span class="blockTime">15'08'11</span></div>
		  		</div>
		  		<div class="divStopTime">
		  			<div id="farmStopTimeHeader"></div>
		  			<div class="areaStopTime">农业厅</div>
		  			<div class="little"></div>
		  			<div id="farmStopTimeBlock"><span class="blockTime">22'17'26</span></div>
	  			</div>
	  			<div class="divStopTime">
		  			<div id="healthStopTimeHeader"></div>
		  			<div class="areaStopTime">健康厅</div>
		  			<div class="little"></div>
		  			<div id="healthStopTimeBlock"><span class="blockTime">02'58'45</span></div>
		  		</div>
		  		<div class="divStopTime">
		  			<div id="hireStopTimeHeader"></div>
		  			<div class="areaStopTime">招募厅</div>
		  			<div class="little"></div>
		  			<div id="hireStopTimeBlock"><span class="blockTime">09'23'21</span></div>
		  		</div>
	  		</div>
	  	</div>
	  <div class="container">
	  	<div class="row">
	  		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 "></div>
	  		<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
	  			<div id="futureIDLookLike" class="futureIDBottom">
	  				<div class="futureIDBottomTitle"><span>看看你像谁</span></div>
	  				<div class="futureIDBottomBody">
	  					<div class="futureIDBottomBodyLeft">
	  						最相似的明星是<br>
	  						XXX<br><br>
	  						相似度<br>
	  						XX%</div>
	  					<div class="futureIDBottomBodyRight">
	  						<img src="${pageContext.request.contextPath }/static/img/test.png">
	  					</div>
	  				</div>
	  			</div>
	  			
	  			<div id="futureIDLookLike" class="futureIDBottom">
	  				<div class="futureIDBottomTitle"><span>饮食建议</span></div>
	  				<div class="futureIDBottomBody">
	  					<div class="futureIDBottomBodyTmp">
	  						建议您多补充<br>
	  						维生素、蛋白质<br><br>
	  						少摄入<br>
	  						高油高盐食品</div>
	  				</div>
	  			</div>
	  			
	  			<div id="futureIDLookLike" class="futureIDBottom">
	  				<div class="futureIDBottomTitle"><span>展厅热点</span></div>
	  				<div class="futureIDBottomBody">
	  					<div >
	  						<img src="${pageContext.request.contextPath }/static/img/futureidBottom.png" id="futureIDBottomBodyRightTest">
	  					</div>
	  				</div>
	  			</div>
	  		</div>
	 		</div>
 		</div>
  	<img id="printButton" src="${pageContext.request.contextPath }/static/img/button_futureid_print.png" onClick='doPrint()'>
  </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    
    
  </body>
</html>
