<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html >
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>个人加入</title>

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
    <div class="container">
    	<form action="${pageContext.request.contextPath }/originality/saveoriginality_person" method="post" class="form-horizontal" id="formOriginalityCollections">
    		<input type="hidden" name="token" value="${token}" />
    		<div class="form-group">
	    		<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
	    		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
	    			<label for="Name" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label labelOriginalityCollections">姓名</label>
	    			<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
	    				<input class="form-control" type="text" id="Name" name="Name" value="${pd.Name }" placeholder="请输入您的姓名...">
	    			</div>
	    		</div>
    		</div><!-- /Name -->
    		
    		<div class="form-group">
    			<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
    			<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
	    			<label for="Phone" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label labelOriginalityCollections">联系电话</label>
	          		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
	            		<input class="form-control" type="tel" id="Phone" name="Phone" value="${pd.Phone }" placeholder="请输入您的联系电话...">
	          		</div>
	         	</div>
			</div><!-- Phone -->
				
    		<div class="form-group">
    			<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
    			<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
	    			<label for="EMail" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label labelOriginalityCollections">电子邮箱</label>
	          		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
            			<input class="form-control" type="email" id="EMail" name="Email" value="${pd.Email }" placeholder="请输入您的电子邮箱...">
          			</div>
         		</div>
			</div><!-- EMail -->
			
			<div class="form-group">
	    		<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
	    		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
	    			<label for="Description" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label labelOriginalityCollections">创意描述</label>
	    			<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
	    				<textarea class="form-control" rows="10" id="Description" name="Description" placeholder="请输入您的创意描述	..." autofocus></textarea>
	    			</div>
	    		</div>
    		</div><!-- /Description -->
			
			<div class="form-group">
	    		<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
	    		<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
	    			<label for="IntentionManner" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label labelOriginalityCollections">意向合作方式</label>
	    			<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
	    				<textarea class="form-control" rows="10" id="IntentionManner" name="IntentionManner" placeholder="请输入您的意向合作方式	..." autofocus></textarea>
	    			</div>
	    		</div>
    		</div><!-- /IntentionManner -->
			
			<button type="submit" class="btn btn-default center-block">提交</button>
    	</form>
    
    </div>
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
     <script src="${pageContext.request.contextPath }/static/js/jquery.backstretch.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/scripts_originalitycollections.js"></script>
    
  </body>
</html>
