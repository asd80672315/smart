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
        
        #chooseChinese{
        	float:left;
        	margin-top:-80px;
        	margin-left:50px;
        	margin-right:40px;
        }
        
        .chinese{
        	float:left;
        	width:280px;
        	height:460px;
        	margin:0 20px;
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
  				margin-left:480px;
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
        
        #hongshaorouDesc, #tangcupaiguDesc, #culiutudousiDesc, #suanlatangDesc,
        #xiqinbaiheDesc, #fanqiechaodanDesc, #mapodoufuDesc, #huluobopaigutangDesc,
        #congshaohaishenDesc, #baizhuojiweixiaDesc, #jiangbaoyouyujuanDesc, #haixiandoufutangDesc
        {
        	display:none;
        	padding-left:20px;
        }
        
        .chineseDesc2{
        	width:200px;
  				margin-left:800px;
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
        
        .chineseDesc3{
        	width:200px;
  				margin-left:1120px;
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
         <div id="chooseChineseImage">
        	<img alt="中餐套餐选项" src="${pageContext.request.contextPath }/static/img/Image/chooseChinese.png">
        </div>
        <div id="row2" class="row">
            <div>
                <div class="chinese" id="chinese1">
                	<div class="chineseTitle">
	                	<div class="chineseMainTitle">套餐一</div>
	                	<!-- <a href="dietChinese1.jsp"><button type="button" class="chineseTitleButton">确定</button></a> -->
	                	<form action="${pageContext.request.contextPath }/diet/saveDC">
	                		<input type="hidden" name="MenuID" value="1">
	                		<input type="hidden" name="ReservationID" value="${ pd.ReservationID}">
	                		<button type="submit" class="chineseTitleButton">确定</button>
	                	</form>
	                	<div class="chineseSubTitle">PLAN A</div>
	                </div>
	                <div class="clear"></div>
                	<div class="chineseFood">
                		<div class="chineseFood1">
                			<img id="hongshaorou" alt="红烧肉" src="${pageContext.request.contextPath }/static/img/Image/chinese1/hongshaorou.jpg" width="117px" height="117px">
                		</div>
                		<div class="chineseFood2">
                			<img id="tangcupaigu" alt="糖醋排骨" src="${pageContext.request.contextPath }/static/img/Image/chinese1/tangcupaigu.jpg" width="117px" height="117px">
                		</div>
                		
                		<div class="clear"></div>
                		
                		<div class="chineseFood1Desc">红烧肉</div>
                		<div class="chineseFood2Desc">糖醋排骨</div>
                		
                		<div class="clear"></div>
                		
                		<div class="chineseFood3">
                			<img id="culiutudousi" alt="醋溜土豆丝" src="${pageContext.request.contextPath }/static/img/Image/chinese1/culiutudousi.jpg" width="117px" height="117px">
                		</div>
                		<div class="chineseFood4">
                			<img id="suanlatang" alt="酸辣汤" src="${pageContext.request.contextPath }/static/img/Image/chinese1/suanlatang.jpg" width="117px" height="117px">
                		</div>
                		
                		<div class="clear"></div>
                		
                		<div class="chineseFood3Desc">醋溜土豆丝</div>
                		<div class="chineseFood4Desc">酸辣汤</div>
                	</div>
                </div>
                <div id="hongshaorouDesc" class="chineseDesc1">
                		<p>热量(大卡)478.01</p>
                		<p>碳水化合物(克)5.01</p>
                		<p>脂肪(克)47.07</p>
                		<p>蛋白质(克)7.50</p>
                		<p>纤维素(克)0.05</p>
                </div>
                <div id="tangcupaiguDesc" class="chineseDesc1">
               		<p>热量(大卡)337.84</p>
               		<p>碳水化合物(克)15.16</p>
               		<p>脂肪(克)25.87</p>
               		<p>蛋白质(克)10.47</p>
               		<p>纤维素(克)0.14</p>
               	</div>
               	
               	<div id="culiutudousiDesc" class="chineseDesc1">
               		<p>热量(大卡)107.57</p>
               		<p>碳水化合物(克)15.38</p>
               		<p>脂肪(克)4.55</p>
               		<p>蛋白质(克)1.90</p>
               		<p>纤维素(克)0.67</p>
               	</div>
               	
               	<div id="suanlatangDesc" class="chineseDesc1">
               		<p>热量(大卡)42.81</p>
               		<p>碳水化合物(克)5.09</p>
               		<p>脂肪(克)1.07</p>
               		<p>蛋白质(克)3.48</p>
               		<p>纤维素(克)0.27</p>
               	</div>
                	
                	
                <div class="chinese" id="chinese2">
                	<div class="chineseTitle">
	                	<div class="chineseMainTitle">套餐二</div>
	                	<!-- <a href="dietChinese2.jsp"><button type="button" class="chineseTitleButton">确定</button></a> -->
	                	<form action="${pageContext.request.contextPath }/diet/saveDC">
	                		<input type="hidden" name="MenuID" value="2">
	                		<input type="hidden" name="ReservationID" value="${ pd.ReservationID}">
	                		<button type="submit" class="chineseTitleButton">确定</button>
	                	</form>
	                	<div class="chineseSubTitle">PLAN B</div>
	                </div>
	                <div class="clear"></div>
                	<div class="chineseFood">
                		<div class="chineseFood1">
                			<img id="xiqinbaihe" alt="西芹百合" src="${pageContext.request.contextPath }/static/img/Image/chinese2/xiqinbaihe.jpg" width="117px" height="117px">
                		</div>
                		<div class="chineseFood2">
                			<img id="fanqiechaodan" alt="番茄炒蛋" src="${pageContext.request.contextPath }/static/img/Image/chinese2/fanqiechaodan.jpg" width="117px" height="117px">
                		</div>
                		
                		<div class="clear"></div>
                		
                		<div class="chineseFood1Desc">西芹百合</div>
                		<div class="chineseFood2Desc">番茄炒蛋</div>
                		
                		<div class="clear"></div>
                		
                		<div class="chineseFood3">
                			<img id="mapodoufu" alt="麻婆豆腐" src="${pageContext.request.contextPath }/static/img/Image/chinese2/mapodoufu.jpg" width="117px" height="117px">
                		</div>
                		<div class="chineseFood4">
                			<img id="huluobopaigutang" alt="胡萝卜排骨汤" src="${pageContext.request.contextPath }/static/img/Image/chinese2/huluobopaigutang.jpg" width="117px" height="117px">
                		</div>
                		
                		<div class="clear"></div>
                		
                		<div class="chineseFood3Desc">麻婆豆腐</div>
                		<div class="chineseFood4Desc">胡萝卜排骨汤</div>
                	</div>
                </div>
                
                <div id="xiqinbaiheDesc" class="chineseDesc2">
               		<p>热量(大卡)78.61</p>
               		<p>碳水化合物(克)14.15</p>
               		<p>脂肪(克)2.84</p>
               		<p>蛋白质(克)1.37</p>
               		<p>纤维素(克)2.25</p>
               	</div>
               	
               	<div id="fanqiechaodanDesc" class="chineseDesc2">
               		<p>热量(大卡)107.67</p>
               		<p>碳水化合物(克)3.50</p>
               		<p>脂肪(克)7.04</p>
               		<p>蛋白质(克)8.06</p>
               		<p>纤维素(克)0.54</p>
               	</div>
               	
               	<div id="mapodoufuDesc" class="chineseDesc2">
               		<p>热量(大卡)132.70</p>
               		<p>碳水化合物(克)3.94</p>
               		<p>脂肪(克)7.13</p>
               		<p>蛋白质(克)12.91</p>
               		<p>纤维素(克)0.58</p>
               	</div>
               	
               	<div id="huluobopaigutangDesc" class="chineseDesc2">
               		<p>热量(大卡)68.14</p>
               		<p>碳水化合物(克)2.22</p>
               		<p>脂肪(克)4.91</p>
               		<p>蛋白质(克)4.45</p>
               		<p>纤维素(克)0.69</p>
               	</div>
                
                <div class="chinese" id="chinese3">
                	<div class="chineseTitle">
	                	<div class="chineseMainTitle">套餐三</div>
	                	<!-- <a href="dietChinese3.jsp"><button type="button" class="chineseTitleButton">确定</button></a> -->
	                	<form action="${pageContext.request.contextPath }/diet/saveDC">
	                		<input type="hidden" name="MenuID" value="3">
	                		<input type="hidden" name="ReservationID" value="${ pd.ReservationID}">
	                		<button type="submit" class="chineseTitleButton">确定</button>
	                	</form>
	                	<div class="chineseSubTitle">PLAN C</div>
	                </div>
	                <div class="clear"></div>
                	<div class="chineseFood">
                		<div class="chineseFood1">
                			<img id="congshaohaishen" alt="葱烧海参" src="${pageContext.request.contextPath }/static/img/Image/chinese3/congshaohaishen.jpg" width="117px" height="117px">
                		</div>
                		<div class="chineseFood2">
                			<img id="baizhuojiweixia" alt="白灼基围虾" src="${pageContext.request.contextPath }/static/img/Image/chinese3/baizhuojiweixia.jpg" width="117px" height="117px">
                		</div>
                		
                		<div class="clear"></div>
                		
                		<div class="chineseFood1Desc">葱烧海参</div>
                		<div class="chineseFood2Desc">白灼基围虾</div>
                		
                		<div class="clear"></div>
                		
                		<div class="chineseFood3">
                			<img id="jiangbaoyouyujuan" alt="酱爆鱿鱼卷" src="${pageContext.request.contextPath }/static/img/Image/chinese3/jiangbaoyouyujuan.jpg" width="117px" height="117px">
                		</div>
                		<div class="chineseFood4">
                			<img id="haixiandoufutang" alt="海鲜豆腐汤" src="${pageContext.request.contextPath }/static/img/Image/chinese3/haixiandoufutang.jpg" width="117px" height="117px">
                		</div>
                		
                		<div class="clear"></div>
                		
                		<div class="chineseFood3Desc">酱爆鱿鱼卷</div>
                		<div class="chineseFood4Desc">海鲜豆腐汤</div>
                	</div>
                </div>
                <div id="congshaohaishenDesc" class="chineseDesc3">
               		<p>热量(大卡)256.12</p>
               		<p>碳水化合物(克)10.21</p>
               		<p>脂肪(克)23.22</p>
               		<p>蛋白质(克)2.25</p>
               		<p>纤维素(克)0.63</p>
               	</div>
               	
               	<div id="baizhuojiweixiaDesc" class="chineseDesc3">
               		<p>热量(大卡)108.91</p>
               		<p>碳水化合物(克)5.61</p>
               		<p>脂肪(克)3.30</p>
               		<p>蛋白质(克)15.97</p>
               		<p>纤维素(克)1.78</p>
               	</div>
               	
               	<div id="jiangbaoyouyujuanDesc" class="chineseDesc3">
               		<p>热量(大卡)227.44</p>
               		<p>碳水化合物(克)15.35</p>
               		<p>脂肪(克)5.66</p>
               		<p>蛋白质(克)29.26</p>
               		<p>纤维素(克)0.89</p>
               	</div>
               	
               	<div id="haixiandoufutangDesc" class="chineseDesc3">
               		<p>热量(大卡)86.59</p>
               		<p>碳水化合物(克)3.72</p>
               		<p>脂肪(克)2.58</p>
               		<p>蛋白质(克)12.26</p>
               		<p>纤维素(克)0.18</p>
               	</div>
            </div>
        </div>
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script>
    		var tmp1 = 0,
    				tmp2 = 0,
    				tmp3 = 0,
    				tmp4 = 0,
    				
    				tmp5 = 0,
         		tmp6 = 0,
         		tmp7 = 0,
         		tmp8 = 0,
         		
         		tmp9 = 0,
         		tmp10 = 0,
         		tmp11 = 0,
         		tmp12 = 0;
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
        
        
        $("#hongshaorou").click( function(){
					if( tmp5==1|| tmp6==1 || tmp7==1 || tmp8==1 ||tmp9==1 || tmp10==1 || tmp11==1 || tmp12==1){
        		
        	}else if( tmp1==0 ){
        		tmp2 = tmp3 = tmp4 = 0;
	        	$("#hongshaorouDesc").css('display','none');
	         	$("#tangcupaiguDesc").css('display','none');
	         	$("#culiutudousiDesc").css('display','none');
	         	$("#suanlatangDesc").css('display','none');
	         	$("#suanlatangDesc").css('display','none');
	         	$("#chinese1").css('margin-top','0');
	         	$("#chinese1").css('opacity','1');
	         	$("#chinese2").css('margin-top','0');
	         	$("#chinese2").css('opacity','1');
	         	$("#chinese3").css('margin-top','0');
	         	$("#chinese3").css('opacity','1');
	         	
        		$("#hongshaorouDesc").css('display','block');
            $("#chinese2").css('margin-top','-140px');
           	$("#chinese2").css('opacity','0.1');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.3');
           	tmp1 = 1;
        	}else if( tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 ){
        		$("#hongshaorouDesc").css('display','none');
	         	$("#tangcupaiguDesc").css('display','none');
	         	$("#culiutudousiDesc").css('display','none');
	         	$("#suanlatangDesc").css('display','none');
	         	$("#suanlatangDesc").css('display','none');
	         	$("#chinese1").css('margin-top','0');
	         	$("#chinese1").css('opacity','1');
	         	$("#chinese2").css('margin-top','0');
	         	$("#chinese2").css('opacity','1');
	         	$("#chinese3").css('margin-top','0');
	         	$("#chinese3").css('opacity','1'); 
           	tmp1=tmp2=tmp3=tmp4=0;
        	}
        });
        
        $("#tangcupaigu").click( function(){
					if( tmp5==1|| tmp6==1 || tmp7==1 || tmp8==1 ||tmp9==1 || tmp10==1 || tmp11==1 || tmp12==1){
        		
        	}else if( tmp2==0 ){
        		tmp1 = tmp3 = tmp4 = 0;
        		$("#hongshaorouDesc").css('display','none');
	         	$("#tangcupaiguDesc").css('display','none');
	         	$("#culiutudousiDesc").css('display','none');
	         	$("#suanlatangDesc").css('display','none');
	         	$("#suanlatangDesc").css('display','none');
	         	$("#chinese1").css('margin-top','0');
	         	$("#chinese1").css('opacity','1');
	         	$("#chinese2").css('margin-top','0');
	         	$("#chinese2").css('opacity','1');
	         	$("#chinese3").css('margin-top','0');
	         	$("#chinese3").css('opacity','1');
	         	
        		$("#tangcupaiguDesc").css('display','block');
            $("#chinese2").css('margin-top','-140px');
           	$("#chinese2").css('opacity','0.1');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.3');
           	tmp2 = 1;
        	}else if( tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 ){
        		$("#hongshaorouDesc").css('display','none');
	         	$("#tangcupaiguDesc").css('display','none');
	         	$("#culiutudousiDesc").css('display','none');
	         	$("#suanlatangDesc").css('display','none');
	         	$("#suanlatangDesc").css('display','none');
	         	$("#chinese1").css('margin-top','0');
	         	$("#chinese1").css('opacity','1');
	         	$("#chinese2").css('margin-top','0');
	         	$("#chinese2").css('opacity','1');
	         	$("#chinese3").css('margin-top','0');
	         	$("#chinese3").css('opacity','1');
	         	tmp1=tmp2=tmp3=tmp4=0;
        	}
        });
        
        $("#culiutudousi").click( function(){
					if( tmp5==1|| tmp6==1 || tmp7==1 || tmp8==1 ||tmp9==1 || tmp10==1 || tmp11==1 || tmp12==1){
        		
        	}else if( tmp3==0 ){
        		tmp1 = tmp2 = tmp4 = 0;
        		$("#hongshaorouDesc").css('display','none');
	         	$("#tangcupaiguDesc").css('display','none');
	         	$("#culiutudousiDesc").css('display','none');
	         	$("#suanlatangDesc").css('display','none');
	         	$("#chinese1").css('margin-top','0');
	         	$("#chinese1").css('opacity','1');
	         	$("#chinese2").css('margin-top','0');
	         	$("#chinese2").css('opacity','1');
	         	$("#chinese3").css('margin-top','0');
	         	$("#chinese3").css('opacity','1');
	         	
        		$("#culiutudousiDesc").css('display','block');
            $("#chinese2").css('margin-top','-140px');
           	$("#chinese2").css('opacity','0.1');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.3');
           	tmp3 = 1;
        	}else if( tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 ){
        		$("#hongshaorouDesc").css('display','none');
	         	$("#tangcupaiguDesc").css('display','none');
	         	$("#culiutudousiDesc").css('display','none');
	         	$("#suanlatangDesc").css('display','none');
	         	$("#chinese1").css('margin-top','0');
	         	$("#chinese1").css('opacity','1');
	         	$("#chinese2").css('margin-top','0');
	         	$("#chinese2").css('opacity','1');
	         	$("#chinese3").css('margin-top','0');
	         	$("#chinese3").css('opacity','1');
	         	tmp1=tmp2=tmp3=tmp4=0;
        	}
        });
        
        $("#suanlatang").click( function(){
					if( tmp5==1|| tmp6==1 || tmp7==1 || tmp8==1 ||tmp9==1 || tmp10==1 || tmp11==1 || tmp12==1){
        		
        	}else if( tmp4==0 ){
        		tmp1 = tmp2 = tmp3 = 0;
        		$("#hongshaorouDesc").css('display','none');
	         	$("#tangcupaiguDesc").css('display','none');
	         	$("#culiutudousiDesc").css('display','none');
	         	$("#suanlatangDesc").css('display','none');
	         	$("#chinese2").css('margin-top','0');
	         	$("#chinese2").css('opacity','1');
	         	$("#chinese3").css('margin-top','0');
	         	$("#chinese3").css('opacity','1');
	         	
        		$("#suanlatangDesc").css('display','block');
            $("#chinese2").css('margin-top','-140px');
           	$("#chinese2").css('opacity','0.1');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.3');
           	tmp4 = 1;
        	}else if( tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 ){
        		$("#hongshaorouDesc").css('display','none');
	         	$("#tangcupaiguDesc").css('display','none');
	         	$("#culiutudousiDesc").css('display','none');
	         	$("#suanlatangDesc").css('display','none');
	         	$("#chinese2").css('margin-top','0');
	         	$("#chinese2").css('opacity','1');
	         	$("#chinese3").css('margin-top','0');
	         	$("#chinese3").css('opacity','1');
	         	tmp1=tmp2=tmp3=tmp4=0;
        	}
        });
        
        
        $("#xiqinbaihe").click( function(){
						if(tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 || tmp9==1|| tmp10==1 || tmp11==1 || tmp12==1){
        		
        	}else	if( tmp5==0 ){
        		tmp6 = tmp7 = tmp8 = 0;
        		$("#xiqinbaiheDesc").css('display','none');
           	$("#fanqiechaodanDesc").css('display','none');
           	$("#mapodoufuDesc").css('display','none');
           	$("#huluobopaigutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	
        		$("#xiqinbaiheDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.1');
           	tmp5 = 1;
        	}else if( tmp5==1 || tmp6==1 || tmp7==1 || tmp8==1 ){
        		$("#xiqinbaiheDesc").css('display','none');
           	$("#fanqiechaodanDesc").css('display','none');
           	$("#mapodoufuDesc").css('display','none');
           	$("#huluobopaigutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp5=tmp6=tmp7=tmp8=0;
        	}
        });
        
        $("#fanqiechaodan").click( function(){
						if(tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 || tmp9==1|| tmp10==1 || tmp11==1 || tmp12==1){
        		
        	}else	if( tmp6==0 ){
        		tmp5 = tmp7 = tmp8 = 0;
        		$("#xiqinbaiheDesc").css('display','none');
           	$("#fanqiechaodanDesc").css('display','none');
           	$("#mapodoufuDesc").css('display','none');
           	$("#huluobopaigutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	
        		$("#fanqiechaodanDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.1');
           	tmp6 = 1;
        	}else if( tmp5==1 || tmp6==1 || tmp7==1 || tmp8==1 ){
        		$("#xiqinbaiheDesc").css('display','none');
           	$("#fanqiechaodanDesc").css('display','none');
           	$("#mapodoufuDesc").css('display','none');
           	$("#huluobopaigutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp5=tmp6=tmp7=tmp8=0;
        	}
        });
        
        $("#mapodoufu").click( function(){
						if(tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 || tmp9==1|| tmp10==1 || tmp11==1 || tmp12==1){
        		
        	}else	if( tmp7==0 ){
        		tmp5 = tmp6 = tmp8 = 0;
        		$("#xiqinbaiheDesc").css('display','none');
           	$("#fanqiechaodanDesc").css('display','none');
           	$("#mapodoufuDesc").css('display','none');
           	$("#huluobopaigutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
               	
        		$("#mapodoufuDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.1');
           	tmp7 = 1;
        	}else if( tmp5==1 || tmp6==1 || tmp7==1 || tmp8==1 ){
        		$("#xiqinbaiheDesc").css('display','none');
           	$("#fanqiechaodanDesc").css('display','none');
           	$("#mapodoufuDesc").css('display','none');
           	$("#huluobopaigutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp5=tmp6=tmp7=tmp8=0;
        	}
        });
        
        $("#huluobopaigutang").click( function(){
						if(tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 || tmp9==1|| tmp10==1 || tmp11==1 || tmp12==1){
        		
        	}else	if( tmp8==0 ){
        		tmp5 = tmp6 = tmp7 = 0;
        		$("#xiqinbaiheDesc").css('display','none');
           	$("#fanqiechaodanDesc").css('display','none');
           	$("#mapodoufuDesc").css('display','none');
           	$("#huluobopaigutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
               	
        		$("#huluobopaigutangDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.1');
           	tmp8 = 1;
        	}else if( tmp5==1 || tmp6==1 || tmp7==1 || tmp8==1 ){
           	$("#xiqinbaiheDesc").css('display','none');
           	$("#fanqiechaodanDesc").css('display','none');
           	$("#mapodoufuDesc").css('display','none');
           	$("#huluobopaigutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp5=tmp6=tmp7=tmp8=0;
        	}
        });
        
        $("#congshaohaishen").click( function(){
					if(tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 || tmp5==1|| tmp6==1 || tmp7==1 || tmp8==1){
        		
        	}else	if( tmp9==0 ){
        		tmp10 = tmp11 = tmp12 = 0;
        		$("#congshaohaishenDesc").css('display','none');
           	$("#baizhuojiweixiaDesc").css('display','none');
           	$("#jiangbaoyouyujuanDesc").css('display','none');
           	$("#haixiandoufutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese2").css('opacity','1');
               	
        		$("#congshaohaishenDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese2").css('opacity','0.3');
           	tmp9 = 1;
        	}else if( tmp9==1 || tmp10==1 || tmp11==1 || tmp12==1 ){
           	$("#congshaohaishenDesc").css('display','none');
           	$("#baizhuojiweixiaDesc").css('display','none');
           	$("#jiangbaoyouyujuanDesc").css('display','none');
           	$("#haixiandoufutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese2").css('opacity','1');
           	tmp9=tmp10=tmp11=tmp12=0;
        	}
        });
        
        $("#baizhuojiweixia").click( function(){
					if(tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 || tmp5==1|| tmp6==1 || tmp7==1 || tmp8==1){
        		
        	}else if( tmp10==0 ){
        		tmp9 = tmp11 = tmp12 = 0;
        		$("#congshaohaishenDesc").css('display','none');
           	$("#baizhuojiweixiaDesc").css('display','none');
           	$("#jiangbaoyouyujuanDesc").css('display','none');
           	$("#haixiandoufutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese2").css('opacity','1');
           	
        		$("#baizhuojiweixiaDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese2").css('opacity','0.3');
           	tmp10 = 1;
        	}else if( tmp9==1 || tmp10==1 || tmp11==1 || tmp12==1 ){
           	$("#congshaohaishenDesc").css('display','none');
           	$("#baizhuojiweixiaDesc").css('display','none');
           	$("#jiangbaoyouyujuanDesc").css('display','none');
           	$("#haixiandoufutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese2").css('opacity','1');
           	tmp9=tmp10=tmp11=tmp12=0;
        	}
        });
        
        $("#jiangbaoyouyujuan").click( function(){
					if(tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 || tmp5==1|| tmp6==1 || tmp7==1 || tmp8==1){
        		
        	}else if( tmp11==0 ){
        		tmp9 = tmp10 = tmp12 = 0;
        		$("#congshaohaishenDesc").css('display','none');
          	$("#baizhuojiweixiaDesc").css('display','none');
          	$("#jiangbaoyouyujuanDesc").css('display','none');
          	$("#haixiandoufutangDesc").css('display','none');
          	$("#chinese1").css('opacity','1');
          	$("#chinese2").css('opacity','1');
        		
        		$("#jiangbaoyouyujuanDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese2").css('opacity','0.3');
           	tmp11 = 1;
        	}else if( tmp9==1 || tmp10==1 || tmp11==1 || tmp12==1 ){
           	$("#congshaohaishenDesc").css('display','none');
           	$("#baizhuojiweixiaDesc").css('display','none');
           	$("#jiangbaoyouyujuanDesc").css('display','none');
           	$("#haixiandoufutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese2").css('opacity','1');
           	tmp9=tmp10=tmp11=tmp12=0;
        	}
        });
        
        $("#haixiandoufutang").click( function(){
					if(tmp1==1 || tmp2==1 || tmp3==1 || tmp4==1 || tmp5==1|| tmp6==1 || tmp7==1 || tmp8==1){
        		
        	}else if( tmp12==0 ){
        		tmp9 = tmp10 = tmp11 = 0;
        		$("#congshaohaishenDesc").css('display','none');
           	$("#baizhuojiweixiaDesc").css('display','none');
           	$("#jiangbaoyouyujuanDesc").css('display','none');
           	$("#haixiandoufutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese2").css('opacity','1');
        		
        		$("#haixiandoufutangDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese2").css('opacity','0.3');
           	tmp12 = 1;
        	}else if( tmp9==1 || tmp10==1 || tmp11==1 || tmp12==1 ){
           	$("#congshaohaishenDesc").css('display','none');
           	$("#baizhuojiweixiaDesc").css('display','none');
           	$("#jiangbaoyouyujuanDesc").css('display','none');
           	$("#haixiandoufutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese2").css('opacity','1');
           	tmp9=tmp10=tmp11=tmp12=0;
        	}
        });
        
        
    </script>
  </body>
</html>
