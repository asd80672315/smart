
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
	var regPhone=/^(13[0-9]|147|15[0-3]|15[5-9]|18[0-9]|145|17[0|6|7|8])\d{8}$/;
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

function validateRegion(){
	var region = $("#Region").val();
	if( region=="0" ){
		$("#Region").attr("data-content","请选择嘉宾所在的地区");
		$('#Region').popover('show');
		return false;
	}else{
		return true;
	}
}

function validateIndustryID(){
	var industryID = $("#IndustryID").val();
	if( industryID=="0"){
		$("#IndustryID").attr("data-content","请选择嘉宾所属的行业");
		$('#IndustryID').popover('show');
		return false;
	}else{
		return true;
	}
}

function validateSex(){
	var sex = $("#Sex").val();
	if( sex=="" || sex==null ){
		$("#Sex").attr("data-content","请选择您的性别");
		$('#Sex').popover('show');
		return false;
	}else{
		return true;
	}
}

function validateOccupationID(){
	var occupationID = $("#OccupationID").val();
	if( occupationID=="0" || occupationID==null ){
		$("#OccupationID").attr("data-content","请选择您的职业");
		$('#OccupationID').popover('show');
		return false;
	}else{
		return true;
	}
}

function cleanPopover(){
	$('#Name').popover('destroy');
	$('#Phone').popover('destroy');
	$('#Region').popover('destroy');
	$('#IndustryID').popover('destroy');
	$('#Sex').popover('destroy');
	$('#OccupationID').popover('destroy');
	$('#GroupName').popover('destroy');
	$('#GroupNumber').popover('destroy');
	$('#GroupRegion').popover('destroy');
	$('#GroupIndustryID').popover('destroy');
}

function validatePersonalFormReceptionist(){
	if( validateName() && validatePhone() && validateRegion() && validateIndustryID() &&
			validateSex() && validateOccupationID()){
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
	var regPhone=/^(13[0-9]|15[0|1|3|6|7|8|9]|18[0-9])\d{8}$/;
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
