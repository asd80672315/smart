
jQuery(document).ready(function() {

    /*
        Background slideshow
    */
    $.backstretch([
      "/smart/static/img/backgrounds/1.jpg"
    , "/smart/static/img/backgrounds/2.jpg"
    , "/smart/static/img/backgrounds/3.jpg"
    ], {duration: 3000, fade: 750});
    
    var tmpDate = new Date();
    tmpDate = new Date(tmpDate.valueOf() + 1*24*60*60*1000);
    
    $('.form_date').datetimepicker({
		language:  'zh-CN',
		weekStart: 1,	//一周从哪一天开始。0（星期日）到6（星期六）
		format: 'yyyy-mm-dd',
		tomorrowHighlight: false,
		autoclose: 1,	//当选择一个日期之后是否立即关闭此日期时间选择器。
		startView: 2,
		minView: 2,
		startDate:tmpDate,
		initialDate:tmpDate
    });
   
    
    /*
        Form validation
    */
    /*function validateForm(){
    	var isPhone=/^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
        if(!isPhone.test($("Phone").val())){
            alert("请正确填写电话号码，例如:13415764179或0321-4816048");
            return false;
        }
    }*/
    $("#BookingDate").removeAttr('onclick');
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

function validateBookingDate(){
	var date = $("#BookingDate").val();
	if( date=="" || date==null ){
		$("#BookingDate").attr("data-content","预约日期不能为空");
		$('#BookingDate').popover('show');
		return false;
	}else{
		return true;
	}
}

function validatePhone(){
	var phone = $("#Phone").val();
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
	if( region=="" || region==null ){
		$("#Region").attr("data-content","请选择您所在的地区");
		$('#Region').popover('show');
		return false;
	}else{
		return true;
	}
}

function validateIndustryID(){
	var industryID = $("#IndustryID").val();
	if( industryID=="" || industryID==null ){
		$("#IndustryID").attr("data-content","请选择您所属的行业");
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
	if( occupationID=="" || occupationID==null ){
		$("#OccupationID").attr("data-content","请选择您的职业");
		$('#OccupationID').popover('show');
		return false;
	}else{
		return true;
	}
}

function cleanPopover(){
	$('#Name').popover('destroy');
	$('#BookingDate').popover('destroy');
	$('#Phone').popover('destroy');
	$('#Region').popover('destroy');
	$('#IndustryID').popover('destroy');
	$('#Sex').popover('destroy');
	$('#OccupationID').popover('destroy');
	$('#GroupName').popover('destroy');
	$('#GroupNumber').popover('destroy');
}

function validatePersonalForm(){
	if( validateName() && validatePhone() && validateBookingDate() && 
			validateRegion() && validateIndustryID() && validateSex() && validateOccupationID() ){
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

function validateGroupForm(){
	if( validateGroupName() && validatePhone() && validateBookingDate() && validateGroupNumber() && validateRegion() && validateIndustryID()){
		return true;
	}else{
		return false;
	}
}

/*function personalDisplay(){
	$("#personalID").css('display', 'block');
    $("#groupID").css('display', 'none');
}
  
function groupDisplay(){
   	$("#personalID").css('display', 'none');
    $("#groupID").css('display', 'block');
}*/
