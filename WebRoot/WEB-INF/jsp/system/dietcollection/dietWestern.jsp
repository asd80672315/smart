<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>菜单</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">    
    <link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
   	<style>
   			a,
   			a:hover,
				a:focus {
				    text-decoration: none;	/* 没有下划线 */
				    color:#fff;
				}
        .linear {
            background: -webkit-gradient(linear, 0% 0%, 0% 100%,from(#0f3e46), to(#4dc4a8)); /*谷歌*/
        }

        #row1 {
            height: 20%;
        }
        
        #row2{
        	position: relative;
        	z-index:10;
        }
				
        .left {
            /*border: 1px solid #00ff90;*/
            height: 100%;
            border-radius: 20px 15px;
        }

        .right {
            height: 80%;
        }

        p {
            /*font-family: 'Microsoft YaHei' 'Times New Roman', Times, serif;*/
            font-size: 1.7em;
            font-weight: 600;
            color: white;
            line-height: 2em;
        }

        .text {
            padding: 100px 60px 0px 60px;
        }

        @-webkit-keyframes shineRed {
            from {
                -webkit-box-shadow: 0 0 5px #074e45;
            }

            50% {
                -webkit-box-shadow: 0 0 10px #00ffff;
            }

            to {
                -webkit-box-shadow: 0 0 5px #074e45;
            }
        }

        .shine_red {
            -webkit-animation-name: shineRed;
            -webkit-animation-duration: 2s;
            -webkit-animation-iteration-count: infinite;
        }

        hr {
            border: 0px solid #40a48c;
            box-shadow: 5px 4px 10px 2px #494747;
        }

        a {
            width: 140px;
            height: 60px;
        }

        a + hr{
            width:140px;
            margin-left:0px;
            box-shadow: 1px -5px 7px 1px #494747;
        }
        
        #chooseChinese${pageContext.request.contextPath }/static/img/Image{
        	float:left;
        	margin-top:-80px;
        	margin-left:50px;
        	margin-right:40px;
        }
        
        .chinese{
        	float:left;
        	width:280px;
        	height:460px;
        	margin:0 50px;
        	z-index:50;
        }
        
        .chineseTitle{
        	float:left;
        	width:240px;
        	height:90px;
        	background-color: RGB(128,129,133);
        	color: #fff;
        	padding:10px;
        	margin-left:20px;
        	margin-bottom:10px;
        	border-radius: 5px; 
				  -moz-border-radius: 5px; 
				  -webkit-border-radius: 5px; 
				  -o-border-radius: 5px;
        }
        
        .chineseMainTitle{
        	float:left;
        	font-family: 'Microsoft YaHei';
        	font-size:2.4em;
        	margin-left:10px;
        }
        
        .chineseTitleButton{
        	float:left;
        	background: RGB(128,129,129);
        	font-size:1em;
        	margin-left: 30px;
        	margin-top:20px;
        	padding: 0 15px;
        	border-color:#fff;
        	border-radius: 20px; 
				  -moz-border-radius: 20px; 
				  -webkit-border-radius: 20px; 
				  -o-border-radius: 20px; 
        }
        
        .chineseSubTitle{
        	clear:both;
        	font-size:1em;
        	margin-left:10px;
        }
        
        .clear{
        	clear:both;
        }
        .chineseFood{
        	width:280px;
        	height:370px;
        	background-color:#fff;
        	margin-top:-50px;
        	border-radius: 5px; 
				  -moz-border-radius: 5px; 
				  -webkit-border-radius: 5px; 
				  -o-border-radius: 5px;
        }
        
        .chineseFood1{
        	float:left;
        	margin-left:20px;
        }
        
        .chineseFood1Desc{
        	float:left;
        	margin-left:20px;
        	width:117px;
        	text-align:center;
        }
        
        .chineseFood2{
        	float:left;
        	margin-left:6px;
        }
        
        .chineseFood2Desc{
        	float:left;
        	margin-left:6px;
        	width:117px;
        	text-align:center;
        }
        
        .chineseFood3{
        	float:left;
        	margin-top:30px;
        	margin-left:20px;
        }
        
        .chineseFood3Desc{
        	float:left;
        	margin-left:20px;
        	width:117px;
        	text-align:center;
        }
        
        .chineseFood4{
        	float:left;
        	margin-top:30px;
        	margin-left:6px;
        }
        
        .chineseFood4Desc{
        	float:left;
        	margin-left:6px;
        	width:117px;
        	text-align:center;
        }
        
        .chineseDesc1{
  				width:200px;
  				margin-left:520px;
  				margin-top:-70px;
        	background-color: rgba(255,255,255,0.6);
        	padding:10px;
        	font-size:0.6em;
        	z-index:100;
        	border-radius: 5px; 
				  -moz-border-radius: 5px; 
				  -webkit-border-radius: 5px; 
				  -o-border-radius: 5px;
        }
        
        #kaisashalaDesc, #heihujiaoniupaiDesc, #fanqieniuweitangDesc, #heisenlindangaoDesc,
        #fashiwoniuDesc, #zhishijulongxiaDesc, #naiyouhaixiantangDesc, #mangguobudingDesc
        {
        	display:none;
        	padding-left:20px;
        }
        
        .chineseDesc2{
        	width:200px;
  				margin-left:900px;
  				margin-top:-70px;
        	background-color: rgba(255,255,255,0.6);
        	padding:10px;
        	font-size:0.6em;
        	z-index:100;
        	border-radius: 5px; 
				  -moz-border-radius: 5px; 
				  -webkit-border-radius: 5px; 
				  -o-border-radius: 5px;
        }
        
    </style>
  </head>
  
  <body>
    <div id="main" class="container linear">
        <div id="row1" class="row">
            <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7  col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">

            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 right" style="padding:20px 0px 0px 70px;">
                <img src="${pageContext.request.contextPath }/static/img/Image/hpe.png" alt="HPE" width="180" style="padding-left:10px; padding-top:10px;" />
            </div>
        </div>
        <div id="chooseChinese${pageContext.request.contextPath }/static/img/Image">
        	<img alt="西餐套餐选项" src="${pageContext.request.contextPath }/static/img/Image/chooseWestern.jpg">
        </div>
        <div id="row2" class="row">
            <div>
                <div class="chinese" id="chinese1">
                	<div class="chineseTitle">
	                	<div class="chineseMainTitle">套餐一</div>
	                	<!-- <a href="dietWestern1.jsp"><button type="button" class="chineseTitleButton">确定</button></a> -->
	                	<form action="${pageContext.request.contextPath }/diet/saveDC">
	                		<input type="hidden" name="MenuID" value="4">
	                		<input type="hidden" name="ReservationID" value="${ pd.ReservationID}">
	                		<button type="submit" class="chineseTitleButton">确定</button>
	                	</form>
	                	<div class="chineseSubTitle">PLAN A</div>
	                </div>
	                <div class="clear"></div>
                	<div class="chineseFood">
                		<div class="chineseFood1">
                			<img id="kaisashala" alt="凯撒沙拉" src="${pageContext.request.contextPath }/static/img/Image/west1/kaisashala.jpg" width="117px" height="117px">
                		</div>
                		<div class="chineseFood2">
                			<img id="heihujiaoniupai" alt="黑胡椒牛排" src="${pageContext.request.contextPath }/static/img/Image/west1/heihujiaoniupai.jpg" width="117px" height="117px">
                		</div>
                		
                		<div class="clear"></div>
                		
                		<div class="chineseFood1Desc">凯撒沙拉</div>
                		<div class="chineseFood2Desc">黑胡椒牛排</div>
                		
                		<div class="clear"></div>
                		
                		<div class="chineseFood3">
                			<img id="fanqieniuweitang" alt="番茄牛尾汤" src="${pageContext.request.contextPath }/static/img/Image/west1/fanqieniuweitang.jpg" width="117px" height="117px">
                		</div>
                		<div class="chineseFood4">
                			<img id="heisenlindangao" alt="黑森林蛋糕" src="${pageContext.request.contextPath }/static/img/Image/west1/heisenlindangao.jpg" width="117px" height="117px">
                		</div>
                		
                		<div class="clear"></div>
                		
                		<div class="chineseFood3Desc">番茄牛尾汤</div>
                		<div class="chineseFood4Desc">黑森林蛋糕</div>
                	</div>
                </div>
                <div id="kaisashalaDesc" class="chineseDesc1">
                		<p>热量(大卡)71.68</p>
                		<p>碳水化合物(克)9.10</p>
                		<p>脂肪(克)2.08</p>
                		<p>蛋白质(克)3.59</p>
                		<p>纤维素(克)1.10</p>
                </div>
                <div id="heihujiaoniupaiDesc" class="chineseDesc1">
               		<p>热量(大卡)123.67</p>
               		<p>碳水化合物(克)6.03</p>
               		<p>脂肪(克)8.21</p>
               		<p>蛋白质(克)7.19</p>
               		<p>纤维素(克)0.84</p>
               	</div>
               	
               	<div id="fanqieniuweitangDesc" class="chineseDesc1">
               		<p>热量(大卡)58.51</p>
               		<p>碳水化合物(克)1.36</p>
               		<p>脂肪(克)2.92</p>
               		<p>蛋白质(克)6.61</p>
               		<p>纤维素(克)0.41</p>
               	</div>
               	
               	<div id="heisenlindangaoDesc" class="chineseDesc1">
               		<p>热量(大卡)350.00</p>
               		<p>碳水化合物(克)40.60</p>
               		<p>脂肪(克)19.30</p>
               		<p>蛋白质(克)3.80</p>
               		<p>纤维素(克)2.80</p>
               	</div>
                	
                	
                <div class="chinese" id="chinese2">
                	<div class="chineseTitle">
	                	<div class="chineseMainTitle">套餐二</div>
	                	<!-- <a href="dietWestern2.jsp"><button type="button" class="chineseTitleButton">确定</button></a> -->
	                	<form action="${pageContext.request.contextPath }/diet/saveDC">
	                		<input type="hidden" name="MenuID" value="5">
	                		<input type="hidden" name="ReservationID" value="${ pd.ReservationID}">
	                		<button type="submit" class="chineseTitleButton">确定</button>
	                	</form>
	                	<div class="chineseSubTitle">PLAN B</div>
	                </div>
	                <div class="clear"></div>
                	<div class="chineseFood">
                		<div class="chineseFood1">
                			<img id="fashiwoniu" alt="法式蜗牛" src="${pageContext.request.contextPath }/static/img/Image/west2/fashiwoniu.jpg" width="117px" height="117px">
                		</div>
                		<div class="chineseFood2">
                			<img id="zhishijulongxia" alt="芝士焗龙虾" src="${pageContext.request.contextPath }/static/img/Image/west2/zhishijulongxia.jpg" width="117px" height="117px">
                		</div>
                		
                		<div class="clear"></div>
                		
                		<div class="chineseFood1Desc">法式蜗牛</div>
                		<div class="chineseFood2Desc">芝士焗龙虾</div>
                		
                		<div class="clear"></div>
                		
                		<div class="chineseFood3">
                			<img id="naiyouhaixiantang" alt="奶油海鲜汤" src="${pageContext.request.contextPath }/static/img/Image/west2/naiyouhaixiantang.jpg" width="117px" height="117px">
                		</div>
                		<div class="chineseFood4">
                			<img id="mangguobuding" alt="芒果布丁" src="${pageContext.request.contextPath }/static/img/Image/west2/mangguobuding.jpg" width="117px" height="117px">
                		</div>
                		
                		<div class="clear"></div>
                		
                		<div class="chineseFood3Desc">奶油海鲜汤</div>
                		<div class="chineseFood4Desc">芒果布丁</div>
                	</div>
                </div>
                
                <div id="fashiwoniuDesc" class="chineseDesc2">
               		<p>热量(大卡)160.13</p>
               		<p>碳水化合物(克)13.30</p>
               		<p>脂肪(克)9.60</p>
               		<p>蛋白质(克)5.00</p>
               		<p>纤维素(克)0.00</p>
               	</div>
               	
               	<div id="zhishijulongxiaDesc" class="chineseDesc2">
               		<p>热量(大卡)161.73</p>
               		<p>碳水化合物(克)2.58</p>
               		<p>脂肪(克)9.62</p>
               		<p>蛋白质(克)16.56</p>
               		<p>纤维素(克)0.45</p>
               	</div>
               	
               	<div id="naiyouhaixiantangDesc" class="chineseDesc2">
               		<p>热量(大卡)49.05</p>
               		<p>碳水化合物(克)3.97</p>
               		<p>脂肪(克)2.65</p>
               		<p>蛋白质(克)2.44</p>
               		<p>纤维素(克)0.06</p>
               	</div>
               	
               	<div id="mangguobudingDesc" class="chineseDesc2">
               		<p>热量(大卡)87.25</p>
               		<p>碳水化合物(克)9.64</p>
               		<p>脂肪(克)5.15</p>
               		<p>蛋白质(克)1.33</p>
               		<p>纤维素(克)0.76</p>
               	</div>
            </div>
        </div>
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script>
    		var tmp = 0;
        var demo = document.getElementById('main');
        demo.style.width = window.innerWidth + "px";
        demo.style.height = window.innerHeight + "px";

        window.onresize = function () {
            var demo = document.getElementById('main');
            demo.style.width = window.innerWidth + "px";
            demo.style.height = window.innerHeight + "px";
        }

        var buttons = document.getElementsByClassName("customerColor");
        for (i = 0; i < buttons.length; i++) {
            buttons[i].onmouseover = handleMouseOver;
            buttons[i].onmouseout = handleMouseOut;
            buttons[i].style.background = "#50c2a9";
            buttons[i].style.color = "white";
        }

        function handleMouseOver(e) {
            e.target.style.background = "#369086";
        }

        function handleMouseOut(e) {
            e.target.style.background = "#50c2a9";
        }
        
        var tmp1 = 0,
						tmp2 = 0,
						tmp3 = 0,
						tmp4 = 0,
						
						tmp5 = 0,
						tmp6 = 0,
						tmp7 = 0,
						tmp8 = 0;
        
        $("#kaisashala").click( function(){
					if( tmp5==1|| tmp6==1 || tmp7==1 || tmp8==1 ){
        		
        	}else if( tmp1==0 ){
        		tmp2 = tmp3 = tmp4 = 0;
        		$("#kaisashalaDesc").css('display','none');
           	$("#heihujiaoniupaiDesc").css('display','none');
           	$("#fanqieniuweitangDesc").css('display','none');
           	$("#heisenlindangaoDesc").css('display','none');
           	$("#chinese2").css('margin-top','0');
           	$("#chinese2").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	
        		$("#kaisashalaDesc").css('display','block');
            $("#chinese2").css('margin-top','-140px');
           	$("#chinese2").css('opacity','0.1');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.3');
           	tmp1 = 1;
        	}else if( tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 ){
        		$("#kaisashalaDesc").css('display','none');
           	$("#heihujiaoniupaiDesc").css('display','none');
           	$("#fanqieniuweitangDesc").css('display','none');
           	$("#heisenlindangaoDesc").css('display','none');
           	$("#chinese2").css('margin-top','0');
           	$("#chinese2").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp1=tmp2=tmp3=tmp4=0;
        	}
        });
        
        $("#heihujiaoniupai").click( function(){
					if( tmp5==1|| tmp6==1 || tmp7==1 || tmp8==1 ){
        		
        	}else if( tmp2==0 ){
        		tmp1 = tmp3 = tmp4 = 0;
        		$("#kaisashalaDesc").css('display','none');
           	$("#heihujiaoniupaiDesc").css('display','none');
           	$("#fanqieniuweitangDesc").css('display','none');
           	$("#heisenlindangaoDesc").css('display','none');
           	$("#chinese2").css('margin-top','0');
           	$("#chinese2").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	
        		$("#heihujiaoniupaiDesc").css('display','block');
            $("#chinese2").css('margin-top','-140px');
           	$("#chinese2").css('opacity','0.1');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.3');
           	tmp2 = 1;
        	}else if( tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 ){
        		$("#kaisashalaDesc").css('display','none');
           	$("#heihujiaoniupaiDesc").css('display','none');
           	$("#fanqieniuweitangDesc").css('display','none');
           	$("#heisenlindangaoDesc").css('display','none');
           	$("#chinese2").css('margin-top','0');
           	$("#chinese2").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp1=tmp2=tmp3=tmp4=0;
        	}
        });
        
        $("#fanqieniuweitang").click( function(){
					if( tmp5==1|| tmp6==1 || tmp7==1 || tmp8==1 ){
        		
        	}else if( tmp3==0 ){
        		tmp1 = tmp2 = tmp4 = 0;
        		$("#kaisashalaDesc").css('display','none');
           	$("#heihujiaoniupaiDesc").css('display','none');
           	$("#fanqieniuweitangDesc").css('display','none');
           	$("#heisenlindangaoDesc").css('display','none');
           	$("#chinese2").css('margin-top','0');
           	$("#chinese2").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	
        		$("#fanqieniuweitangDesc").css('display','block');
            $("#chinese2").css('margin-top','-140px');
           	$("#chinese2").css('opacity','0.1');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.3');
           	tmp3 = 1;
        	}else if( tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 ){
        		$("#kaisashalaDesc").css('display','none');
           	$("#heihujiaoniupaiDesc").css('display','none');
           	$("#fanqieniuweitangDesc").css('display','none');
           	$("#heisenlindangaoDesc").css('display','none');
           	$("#chinese2").css('margin-top','0');
           	$("#chinese2").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp1=tmp2=tmp3=tmp4=0;
        	}
        });
        
        $("#heisenlindangao").click( function(){
					if( tmp5==1|| tmp6==1 || tmp7==1 || tmp8==1 ){
        		
        	}else if( tmp4==0 ){
        		tmp1 = tmp2 = tmp3 = 0;
        		$("#kaisashalaDesc").css('display','none');
           	$("#heihujiaoniupaiDesc").css('display','none');
           	$("#fanqieniuweitangDesc").css('display','none');
           	$("#heisenlindangaoDesc").css('display','none');
           	$("#chinese2").css('margin-top','0');
           	$("#chinese2").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	
        		$("#heisenlindangaoDesc").css('display','block');
            $("#chinese2").css('margin-top','-140px');
           	$("#chinese2").css('opacity','0.1');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.3');
           	tmp4 = 1;
        	}else if( tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 ){
        		$("#kaisashalaDesc").css('display','none');
           	$("#heihujiaoniupaiDesc").css('display','none');
           	$("#fanqieniuweitangDesc").css('display','none');
           	$("#heisenlindangaoDesc").css('display','none');
           	$("#chinese2").css('margin-top','0');
           	$("#chinese2").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp1=tmp2=tmp3=tmp4=0;
        	}
        });
        
        
        $("#fashiwoniu").click( function(){
					if(tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 ){
        		
        	}else	if( tmp5==0 ){
        		tmp6 = tmp7 = tmp8 = 0;
        		$("#fashiwoniuDesc").css('display','none');
           	$("#zhishijulongxiaDesc").css('display','none');
           	$("#naiyouhaixiantangDesc").css('display','none');
           	$("#mangguobudingDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
               	
        		$("#fashiwoniuDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.1');
           	tmp5 = 1;
        	}else if( tmp5==1 || tmp6==1 || tmp7==1 || tmp8==1 ){
        		$("#fashiwoniuDesc").css('display','none');
           	$("#zhishijulongxiaDesc").css('display','none');
           	$("#naiyouhaixiantangDesc").css('display','none');
           	$("#mangguobudingDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp5=tmp6=tmp7=tmp8=0;
        	}
        });
        
        $("#zhishijulongxia").click( function(){
					if(tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 ){
        		
        	}else	if( tmp6==0 ){
        		tmp5 = tmp7 = tmp8 = 0;
        		$("#fashiwoniuDesc").css('display','none');
           	$("#zhishijulongxiaDesc").css('display','none');
           	$("#naiyouhaixiantangDesc").css('display','none');
           	$("#mangguobudingDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
               	
        		$("#zhishijulongxiaDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.1');
           	tmp6 = 1;
        	}else if( tmp5==1 || tmp6==1 || tmp7==1 || tmp8==1 ){
        		$("#fashiwoniuDesc").css('display','none');
           	$("#zhishijulongxiaDesc").css('display','none');
           	$("#naiyouhaixiantangDesc").css('display','none');
           	$("#mangguobudingDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp5=tmp6=tmp7=tmp8=0;
        	}
        });
        
        $("#naiyouhaixiantang").click( function(){
					if(tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 ){
        		
        	}else	if( tmp7==0 ){
        		tmp5 = tmp6 = tmp8 = 0;
        		$("#fashiwoniuDesc").css('display','none');
           	$("#zhishijulongxiaDesc").css('display','none');
           	$("#naiyouhaixiantangDesc").css('display','none');
           	$("#mangguobudingDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
               	
        		$("#naiyouhaixiantangDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.1');
           	tmp7 = 1;
        	}else if( tmp5==1 || tmp6==1 || tmp7==1 || tmp8==1 ){
        		$("#fashiwoniuDesc").css('display','none');
          	$("#zhishijulongxiaDesc").css('display','none');
          	$("#naiyouhaixiantangDesc").css('display','none');
          	$("#mangguobudingDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp5=tmp6=tmp7=tmp8=0;
        	}
        });
        
        $("#mangguobuding").click( function(){
					if(tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 ){
        		
        	}else	if( tmp8==0 ){
        		tmp5 = tmp6 = tmp7 = 0;
        		$("#fashiwoniuDesc").css('display','none');
           	$("#zhishijulongxiaDesc").css('display','none');
           	$("#naiyouhaixiantangDesc").css('display','none');
           	$("#mangguobudingDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
               	
        		$("#mangguobudingDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.1');
           	tmp8 = 1;
        	}else if( tmp5==1 || tmp6==1 || tmp7==1 || tmp8==1 ){
        		$("#fashiwoniuDesc").css('display','none');
           	$("#zhishijulongxiaDesc").css('display','none');
           	$("#naiyouhaixiantangDesc").css('display','none');
           	$("#mangguobudingDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp5=tmp6=tmp7=tmp8=0;
        	}
        
        });
        
        
    </script>
  </body>
</html>
