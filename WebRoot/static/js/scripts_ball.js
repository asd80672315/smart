
jQuery(document).ready(function() {

    /*
        Background slideshow
    */
    $.backstretch([
      "/smart/static/img/backgrounds/1.jpg"
    , "/smart/static/img/backgrounds/2.jpg"
    , "/smart/static/img/backgrounds/3.jpg"
    ], {duration: 3000, fade: 750});
    
    /*	
	$("#myModal").modal({
		show:true,
	backdrop:'static'
	
	});	
	*/		
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
	var width = document.getElementById("video").getAttribute("width");			
	var height = document.getElementById("video").getAttribute("height");
	
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
				// 生成图片	
				var Pic = document.getElementById("canvas").toDataURL("image/png");		
				Pic = Pic.replace(/^data:image\/(png|jpg);base64,/, "");
				$("#Pic").val(Pic);
				$("#divSnap").toggle();
				$("#divVideo").toggle();
			});	
    
});

function validateName(){
	var name = $("#Name").val();
	var tmpReturnValue = false;
	if(name=="" || name==null){
		$("#Name").attr("data-content","嘉宾姓名不能为空");
		$('#Name').popover('show');
	}else if(name.length > 20){
		$("#Name").attr("data-content","嘉宾姓名长度必须小于20");
		$('#Name').popover('show');
	}else{
		tmpReturnValue = true;
	}
	return tmpReturnValue;
}

function validatePhone(){
	var phone = $("#Phone").val();
	var regPhone=/^(13[0-9]|15[0|1|3|6|7|8|9]|18[8|9])\d{8}$/;
	var tmpReturnValue = false;
	if(phone=="" || phone==null){
		$("#Phone").attr("data-content","电话号码不能为空");
		$('#Phone').popover('show');
	}else if(!regPhone.test(phone)){
		$("#Phone").attr("data-content","请输入格式正确的电话号码");
		$('#Phone').popover('show');
	}else{
		tmpReturnValue = true;
	}
	return tmpReturnValue;
}

function cleanPopover(){
	$('#Name').popover('destroy');
	$('#Phone').popover('destroy');
	$('#GroupName').popover('destroy');
	$('#GroupNumber').popover('destroy');
}

function validatePersonalFormReceptionist(){
	if( validateName() && validatePhone() ){
		return true;
	}else{
		return false;
	}
}

function validateGroupName(){
	var groupname = $("#GroupName").val();
	var tmpReturnValue = false;
	if(groupname=="" || groupname==null){
		$("#GroupName").attr("data-content","团队姓名不能为空");
		$('#GroupName').popover('show');
	}else if(groupname.length > 20){
		$("#GroupName").attr("data-content","团队姓名长度必须小于20");
		$('#GroupName').popover('show');
	}else{
		tmpReturnValue = true;
	}
	return tmpReturnValue;
}

function validatePhone(){
	var phone = $("#GroupPhone").val();
	var regPhone=/^(13[0-9]|15[0|1|3|6|7|8|9]|18[8|9])\d{8}$/;
	var tmpReturnValue = false;
	if(phone=="" || phone==null){
		$("#GroupPhone").attr("data-content","电话号码不能为空");
		$('#GroupPhone').popover('show');
	}else if(!regPhone.test(phone)){
		$("#GroupPhone").attr("data-content","请输入格式正确的电话号码");
		$('#GroupPhone').popover('show');
	}else{
		tmpReturnValue = true;
	}
	return tmpReturnValue;
}

function validateGroupNumber(){
	var groupnumber = $("#GroupNumber").val();
	var regNumber=/^\+?[1-9][0-9]*$/;
	var tmpReturnValue = false;
	if(groupnumber=="" || groupnumber==null){
		$("#GroupNumber").attr("data-content","团队人数不能为空");
		$('#GroupNumber').popover('show');
	}else if(!regNumber.test(groupnumber)){
		$("#GroupNumber").attr("data-content","人数必须为大于0的正整数");
		$('#GroupNumber').popover('show');
	}else{
		tmpReturnValue = true;
	}
	return tmpReturnValue;
}

function validateGroupFormReceptionist(){
	if( validateGroupName() && validatePhone() && validateGroupNumber()){
		return true;
	}else{
		return false;
	}
}

function personalDisplay(){
	$("#personalID").css('display', 'block');
    $("#groupID").css('display', 'none');
}
  
function groupDisplay(){
   	$("#personalID").css('display', 'none');
    $("#groupID").css('display', 'block');
}
