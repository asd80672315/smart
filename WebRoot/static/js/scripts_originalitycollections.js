
jQuery(document).ready(function() {

    /*
        Background slideshow
    */
    $.backstretch([
      "/smart/static/img/backgrounds/1.jpg"
    , "/smart/static/img/backgrounds/2.jpg"
    , "/smart/static/img/backgrounds/3.jpg"
    ], {duration: 3000, fade: 750});
    
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
	var phone = $("#PersonalPhone").val();
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

function validateEmail(){
	var email = $("#Email").val();
	var regEmail=/^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/;
	var tmpReturnValue = false;
	if(email=="" || email==null){
		$("#Email").attr("data-content","电子邮箱不能为空");
		$('#Email').popover('show');
	}else if(!regEmail.test(phone)){
		$("#Email").attr("data-content","请输入格式正确的电子邮箱");
		$('#Email').popover('show');
	}else{
		tmpReturnValue = true;
	}
	return tmpReturnValue;
}


function cleanPopover(){
	$('#Name').popover('destroy');
	$('#Phone').popover('destroy');
	$('#Email').popover('destroy');
	$('#GroupName').popover('destroy');
	$('#GroupNumber').popover('destroy');
	$('#GroupRegion').popover('destroy');
	$('#GroupAge').popover('destroy');
	$('#GroupIndustryID').popover('destroy');
}

function validatePersonalFormReceptionist(){
	if( validateName() && validatePhone() && validateEmail()){
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

function validateGroupPhone(){
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

function validateGroupRegion(){
	var region = $("#GroupRegion").val();
	if( region=="0" ){
		$("#GroupRegion").attr("data-content","请选择嘉宾所在的地区");
		$('#GroupRegion').popover('show');
		return false;
	}else{
		return true;
	}
}

function validateGroupIndustryID(){
	var industryID = $("#GroupIndustryID").val();
	if( industryID=="0" ){
		$("#GroupIndustryID").attr("data-content","请选择嘉宾所属的行业");
		$('#GroupIndustryID').popover('show');
		return false;
	}else{
		return true;
	}
}

function validateGroupFormReceptionist(){
	if( validateGroupName() && validatePhone() && validateGroupNumber() && validateGroupRegion() && validateGroupIndustryID()){
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
