<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>团队预约</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- CSS Files -->
    <link href="${pageContext.request.contextPath }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
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
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="menu">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="${pageContext.request.contextPath }/index.jsp">Home</a></li>			
            <li><a href="http://www.hpe.com/">About</a></li>
          </ul>
        </div><!-- /.Navbar-collapse -->
      </div><!-- /.container -->
    </nav><!-- /Navigation -->
    
    <!-- Register Form -->
    <div class="container">
	    <div class="register center-block">
	      <form action="${pageContext.request.contextPath }/reservation/saveReservation" method="post" class="form-horizontal formRegister" id="formRegister" onsubmit="validateGroupForm()"> 
	        <h2>请输入<span class="red"><strong>预约</strong></span>信息 </h2>
	        <div class="form-group">
	          <input type="hidden" name="Type" value="2"><span style="color:red;font-size:10px">${error.type }</span>
	          <input type="hidden" name="State" value="1"><span style="color:red;font-size:10px">${error.state }</span>
	          <input type="hidden" name="token" value="${token}" />
	          <input type="hidden" name="url" value="${pageContext.request.contextPath}/reservation/reservation_group" />
	          <label for="GroupName" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label"><span class="requiredInputForm">*</span>团体名称</label>
	          <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
	            <input class="form-control" type="text" id="GroupName" name="GroupName" value="${pd.GroupName }" placeholder="请输入您的团体名称..." data-toggle="popover" data-placement="right" onblur="validateGroupName()" onfocus="cleanPopover()"><span style="color:red;font-size:10px">${error.groupName }</span>
	          </div>
	        </div><!-- /GroupName -->
	        
	        <div class="form-group">
	          <label for="BookingDate" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label"><span class="requiredInputForm">*</span>预约日期</label>
	          <div class="input-group date form_date col-xs-8 col-sm-8 col-md-8 col-lg-8" >
	            <input class="form-control" type="text" id="BookingDate" name="BookingDate" value="${pd.BookingDate }" readonly  onblur="validateBookingDate()" onfocus="cleanPopover()" placeholder="请选择您的预约日期"><span style="color:red;font-size:10px">${error.bookingDate }</span>
	            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	          </div>
	        </div><!-- /BookingDate -->
	        
	        <div class="form-group">
	          <label for="Phone" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label"><span class="requiredInputForm">*</span>联系电话</label>
	          <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
	            <input class="form-control" type="text" id="Phone" name="Phone" value="${pd.Phone }" placeholder="请输入您的联系电话..." data-toggle="popover" data-placement="right" onblur="validatePhone()" onfocus="cleanPopover()"><span style="color:red;font-size:10px">${error.phone }</span>
	          </div>
	        </div><!-- Phone -->
	        
	        <div class="form-group">
	          <label for="GroupNumber" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label"><span class="requiredInputForm">*</span>团体人数</label>
	          <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
	            <input class="form-control" type="text" id="GroupNumber" name="GroupNumber" value="${pd.GroupNumber }" placeholder="请输入您的团体人数..." data-toggle="popover" data-placement="right" onblur="validateGroupNumber()" onfocus="cleanPopover()"><span style="color:red;font-size:10px">${error.groupNumber }</span>
	          </div>
	        </div><!-- /GroupNumber -->
	        
	        <div class="form-group">
	          <label for="Region" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label"><span class="requiredInputForm">*</span>所在地区</label>
	          <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
	            <select class="form-control" id="Region" name="Region" data-toggle="popover" data-placement="right" onblur="validateRegion()" onfocus="cleanPopover()">
								<option value="" ${pd.Region==''?'selected':''}>==请选择您所在的地区==</option>
								<option value="北京" ${pd.Region=='北京'?'selected':''}>北京</option>
								<option value="上海" ${pd.Region=='上海'?'selected':''}>上海</option>
								<option value="天津" ${pd.Region=='天津'?'selected':''}>天津</option>
								<option value="重庆" ${pd.Region=='重庆'?'selected':''}>重庆</option>
								<option value="河北" ${pd.Region=='河北'?'selected':''}>河北</option>
								<option value="山西" ${pd.Region=='山西'?'selected':''}>山西</option>
								<option value="陕西" ${pd.Region=='陕西'?'selected':''}>陕西</option>
								<option value="山东" ${pd.Region=='山东'?'selected':''}>山东</option>
								<option value="河南" ${pd.Region=='河南'?'selected':''}>河南</option>
								<option value="辽宁" ${pd.Region=='辽宁'?'selected':''}>辽宁</option>
								<option value="吉林" ${pd.Region=='吉林'?'selected':''}>吉林</option>
								<option value="黑龙江" ${pd.Region=='黑龙江'?'selected':''}>黑龙江</option>
								<option value="江苏" ${pd.Region=='江苏'?'selected':''}>江苏</option>
								<option value="浙江" ${pd.Region=='浙江'?'selected':''}>浙江</option>
								<option value="安徽" ${pd.Region=='安徽'?'selected':''}>安徽</option>
								<option value="江西" ${pd.Region=='江西'?'selected':''}>江西</option>
								<option value="福建" ${pd.Region=='福建'?'selected':''}>福建</option>
								<option value="湖北" ${pd.Region=='湖北'?'selected':''}>湖北</option>
								<option value="湖南" ${pd.Region=='湖南'?'selected':''}>湖南</option>
								<option value="四川" ${pd.Region=='四川'?'selected':''}>四川</option>
								<option value="贵州" ${pd.Region=='贵州'?'selected':''}>贵州</option>
								<option value="云南" ${pd.Region=='云南'?'selected':''}>云南</option>
								<option value="广东" ${pd.Region=='广东'?'selected':''}>广东</option>
								<option value="海南" ${pd.Region=='海南'?'selected':''}>海南</option>
								<option value="甘肃" ${pd.Region=='甘肃'?'selected':''}>甘肃</option>
								<option value="青海" ${pd.Region=='青海'?'selected':''}>青海</option>
								<option value="台湾" ${pd.Region=='台湾'?'selected':''}>台湾</option>
								<option value="内蒙古" ${pd.Region=='内蒙古'?'selected':''}>内蒙古</option>
								<option value="新疆" ${pd.Region=='新疆'?'selected':''}>新疆</option>
								<option value="西藏" ${pd.Region=='西藏'?'selected':''}>西藏</option>
								<option value="广西" ${pd.Region=='广西'?'selected':''}>广西</option>
								<option value="宁夏" ${pd.Region=='宁夏'?'selected':''}>宁夏</option>
								<option value="香港" ${pd.Region=='香港'?'selected':''}>香港</option>
								<option value="澳门" ${pd.Region=='澳门'?'selected':''}>澳门</option>
	         		</select>
	          </div><!-- Region -->
	        </div>
	        
	        <div class="form-group">
            <label for="IndustryID" class="col-xs-3 col-sm-3 col-md-3 col-lg-3 control-label"><span class="requiredInputForm">*</span>所属行业</label>
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
            	<select class="form-control" id="IndustryID" name="IndustryID" data-toggle="popover" data-placement="right" onblur="validateIndustryID()" onfocus="cleanPopover()">
            		<option value="">==请选择您的行业==</option>
            	</select><span style="color:red;font-size:10px">${error.industry }</span>
            </div>
          </div><!-- /#IndustryID -->
          
	        <button type="submit" class="center-block">预约</button>
	      </form>
	    </div>
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/jquery.backstretch.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/scripts_reservation.js"></script>
		<script src="${pageContext.request.contextPath }/static/js/bootstrap-datetimepicker.js"></script>
		<script id="getcommondataScript" data="occupationid=${pd.OccupationID}&positionid=${pd.PositionID}&industryid=${pd.IndustryID}" src="${pageContext.request.contextPath }/static/js/getcommondata.js"></script>

  </body>
</html>