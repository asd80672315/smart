<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <link href="${pageContext.request.contextPath }/static/css/style.css" rel="stylesheet" />
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js"></script>
		<script>
		var tmp = 1;
	// 设置事件监听
		$(function() {			
				// 获取文档对象		
					
				var canvas = document.getElementById("canvas");
				var context = canvas.getContext("2d");
				var video = document.getElementById("video");
				var videoObj = {"video" : true};
				var errBack = function(error) {
					if (error.PERMISSION_DENIED) {
                    	alert("用户拒绝了浏览器请求媒体的权限", "提示");
                 	} else if (error.NOT_SUPPORTED_ERROR) {
                    	alert("对不起，您的浏览器不支持拍照功能，请使用其他浏览器", "提示");
                	} else if (error.MANDATORY_UNSATISFIED_ERROR) {
                   		alert("指定的媒体类型未接收到媒体流", "提示");
                	} else {
                     	alert("系统未能获取到摄像头，请确保摄像头已正确安装。或尝试刷新页面，重试", "提示");
            		}
 				};		
				var width = 370;			
				var height = 300;
				
				// 获取视频内容			
				if (navigator.getUserMedia) { // Standard			
					navigator.getUserMedia(videoObj, function(stream) {			
						video.src = stream;			
						video.play();			
					}, errBack);			
				} else if (navigator.webkitGetUserMedia) { // WebKit-prefixed			
					navigator.webkitGetUserMedia(videoObj,function(stream) {			
								video.src = window.webkitURL.createObjectURL(stream);			
								video.play();			
					}, errBack);			
				} else if (navigator.mozGetUserMedia) { // WebKit-prefixed			
					navigator.mozGetUserMedia(videoObj, function(stream) {			
						video.src = window.URL.createObjectURL(stream);			
						video.play();			
					}, errBack);			
				}	
										
				document.getElementById("photo").addEventListener(			
						"click",function() {	
							context.drawImage(video, 0, 0, width,height);	
							$("#divSnap").toggle();
							$("#divVideo").toggle();
						});	
			});	
	
</script>


<style>
	
	
</style>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  	<div class="container" id="mycontainer">
      <div class="row">
          <form action="" method="post" class="form-horizontal myform" id="myform_photo"> 
            <div class="form-group">
            	<label for="ReservationID" class="col-sm-3 control-label"></label>
            	<div class="col-sm-3 ">
	            	<div class="media myMedia">
						        <div id="divVideo">
						          <video id="video" autoplay></video> 
						        </div>
						        <div id="divSnap">
						          <canvas id="canvas"></canvas>
						        </div>
						    </div>
					    	<button class="btn btn-default" type="button" id="photo">拍照</button>
						  </div>
						  
						  <label class="col-sm-6 control-label myLable"></label>
							
              <label for="name" class="col-sm-2 control-label">姓名</label>
              <div class="col-sm-4">
                <input class="form-control" type="text" id="name" name="name" placeholder="请输入您的用户名...">
              </div>
              
              <label class="col-sm-6 control-label myLable"></label>
              
              <label for="name" class="col-sm-2 control-label">签发机关</label>
              <div class="col-sm-4">
                <input class="form-control" type="text" id="name" name="name" readonly value="XXXXX">
              </div>
              
              <label class="col-sm-6 control-label myLable"></label>
              
              <label for="name" class="col-sm-2 control-label">有效期限</label>
              <div class="col-sm-4">
                <input class="form-control" type="text" id="name" name="name" readonly value="XXXX年XX日XX月">
              </div>
              
              <label for="ReservationID" class="col-sm-3 control-label">预约号</label>
              <div class="col-sm-4">
                <input class="form-control" type="text" id="ReservationID" name="ReservationID"  readonly="readonly">
              </div>
              
              <label class="col-sm-6 control-label myLable"></label>
							
              <label for="name" class="col-sm-4 control-label">用户名</label>
              <div class="col-sm-4">
                <input class="form-control" type="text" id="name" name="name" placeholder="请输入您的用户名...">
              </div>
              
              <label class="col-sm-6 control-label myLable"></label>
              
              <label for="sex" class="col-sm-4 control-label">性别</label>
              <div class="col-sm-4">
                <select class="form-control" id="sex" name="sex">
                  <option value="">==请选择性别==</option>
                  <option value="0">保密</option>
                  <option value="1">男</option>
                  <option value="2">女</option>
                </select>
              </div>
              
              <label class="col-sm-6 control-label myLable"></label>
              
              <label for="age" class="col-sm-4 control-label">年龄</label>
              <div class="col-sm-4">
                <input class="form-control" type="text" id="age" name="age" placeholder="请输入您的年龄...">
              </div>
              
              <label class="col-sm-6 control-label myLable"></label>
              
              <label for="occupation" class="col-sm-4 control-label">职业</label>
              <div class="col-sm-4">
                <select class="form-control" id="occupation" name="occupation">
                  <option value="">==请选择职业==</option>
                  <option value="0">保密</option>
                  <option value="1">男</option>
                  <option value="2">女</option>
                </select>
              </div>
              
              <label class="col-sm-6 control-label myLable"></label>
              
              <label for="position" class="col-sm-4 control-label">职务</label>
              <div class="col-sm-4">
                <select class="form-control" id="position" name="position">
                  <option value="">==请选择职务==</option>
                  <option value="0">保密</option>
                  <option value="1">男</option>
                  <option value="2">女</option>
                </select>
              </div>
              
            </div>
            
            <div class="form-group">
              <label for="organization" class="col-sm-4 control-label">工作单位</label>
              <div class="col-sm-4">
                <input class="form-control" type="text" id="organization" name="organization" placeholder="请输入您的工作单位...">
              </div>
              
              <label for="mail" class="col-sm-4 control-label">邮箱</label>
              <div class="col-sm-4">
                <input class="form-control" type="email" id="mail" name="mail" placeholder="请输入您的邮箱...">
              </div>
            </div>
            
            <div class="form-group">
              <label for="region" class="col-sm-4 control-label">地区</label>
              <div class="col-sm-4">
                <input class="form-control" type="text" id="region" name="region" placeholder="请输入您所在的地区...">
              </div>
              <label for="phone" class="col-sm-4 control-label">联系电话</label>
              <div class="col-sm-4">
                <input class="form-control" type="text" id="phone" name="phone" placeholder="请输入您的联系电话...">
              </div>
            </div>
            
            <button type="submit"><a href="thanks/thanks.html" >保存</a></button>
          </form>
        </div>
      </div>

    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>