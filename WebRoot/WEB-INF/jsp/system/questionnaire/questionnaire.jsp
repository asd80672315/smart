<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
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
        </div><!-- div class="navbar-header" -->
      </div><!-- /.container-fluid -->
    </nav><!-- /Navigation --> 
    
<%--   <form action="${pageContext.request.contextPath }/questions/savequestions" method="post">
  		${questions}
  		${pd }
  			<input type="submit" value="tijiao">
  		</form> --%>
  <form action="${pageContext.request.contextPath }/questions/savequestions" method="post" id="formQuestionnaire">
  	<input type="hidden" name="token" value="${token}" /> 
  	<input type="hidden" name="ReservationID" value="${pd.ReservationID}" />
  	<c:set var="tmpQuestionnaireID" value="1"></c:set>
  	<c:set var="tmpQuestionID" value="1"></c:set>
  	<c:set var="sectionID" value="section"></c:set>
  	<c:set var="sectionIndex" value="1"></c:set>
  	<c:forEach var="question" items="${questions}">
  		<c:if test="${question.QuestionID == tmpQuestionID }">
	  		<section class="mySection" id="section${sectionIndex}" data-section-name="${sectionIndex}">
	  			<div class="container">
		        <div class="row">
		          <div class="col-md-2"></div>
		          <div class="col-md-8">
		            <div class="panel panel-default" >
		              <div class="panel-heading"><c:out value="${question.Content}"/></div>
			              <div class="panel-body">
			              	<c:set var="optionIndex" value="1"></c:set>
			              	<c:forEach var="question" items="${questions}">
				              	<c:if test="${question.QuestionID == tmpQuestionID }">
					              	<div class="checkbox">
					                  <label>
					                    <input type="checkbox" name="question${sectionIndex}" value="option${optionIndex}">
					                    <span><c:out value="${question.ContentO}"/></span>
					                  </label>
		                			</div><!-- div class="checkbox" -->
			                		<c:set var="optionIndex" value="${optionIndex+1}"></c:set>
		            				</c:if>
		            			</c:forEach>
			              </div><!-- div class="panel-body" -->
		              <div class="panel-footer">
		                <button class="btn btn-success btn-lg preButton"  type="button"  id="preButton${sectionIndex}" ><a href="#section${sectionIndex-1}">上一题</a></button>
		                <button class="btn btn-success btn-lg nextButton" type="button"  id="nextButton${sectionIndex}"><a href="#section${sectionIndex+1}">下一题</a></button>
		              </div><!-- div class="panel-footer" -->
		            </div><!-- div class="panel" -->
		          </div><!-- div class="col-md-8" -->
		          <div class="col-md-2"></div>
		        </div><!-- div class="row" -->
	      	</div><!-- div class="container" -->
	  		</section>
	  		<c:set var="tmpQuestionID" value="${tmpQuestionID+1}"></c:set>
			  <c:set var="sectionIndex" value="${sectionIndex+1}"></c:set>
	  	</c:if>
  	</c:forEach>
  	<!-- <input type="submit" id="btn1" value="提交" onclick="submitOptions()"> -->
  	<input type="text" id="txt1" name="questionOption" hidden="hidden">
  </form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/jquery.easing.1.3.js"></script>
		<script src="${pageContext.request.contextPath }/static/js/scrollify.min.js"></script>
		<script src="${pageContext.request.contextPath }/static/js/main.js"></script>
		<script>
			$(function(){
				$("#preButton1").css('display', 'none');
				$("#nextButton"+${sectionIndex-1}).text("提交");
				$("#nextButton"+${sectionIndex-1}).attr("type","submit");
				$("#nextButton"+${sectionIndex-1}).on("click",function(){
				$("form").on("submit", function(){
					alert("submitOptions"); 	
					var list = new Array();
					var questionLength = "${tmpQuestionID-1}";
					for(var i=1; i<=questionLength; i++){
						var obj = new Object();
						var tmpValue = "";
						var tmpQuestionID = "question"+i;
						//alert(tmpQuestionID);
						obj.QuestionID = i;
						obj.QuestionnaireID = "${pd.QuestionnaireID}";
						obj.ReservationID = "${pd.ReservationID}";
						//tmpValue +=","+ tmpQuestionID;
						obj.Answer = "";
						var objOption = document.getElementsByName(tmpQuestionID);
						for(var j=0; j<objOption.length; j++){
							if(objOption[j].checked){
								//tmpOption.push(objOption[j].value);
								if(tmpValue == null || tmpValue== undefined || tmpValue == ''){
									tmpValue = objOption[j].value;
								}else{
									tmpValue += "," + objOption[j].value;
								}
								obj.Answer = tmpValue;
							}
						}
						list.push(obj);
					}
					document.getElementById("txt1").value = JSON.stringify(list);
					alert(JSON.stringify(list));
				});
				});
			});
		</script>
  </body>
</html>