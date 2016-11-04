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
        	margin-left:100px;
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
        	height:380px;
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
        
        #dietChinese1{
        	float:left;
        	width:700px;
        	height:430px;
        	margin-left: 50px;
        	background-color: rgba(255,255,255,0.6);
        	color: #fff;
        	padding: 10px 30px;
        	padding-top:30px;
        	border-radius: 5px; 
				  -moz-border-radius: 5px; 
				  -webkit-border-radius: 5px; 
				  -o-border-radius: 5px;
        }
        
        #dietChinese1 p{
        	font-size:1.2em;
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
        <div id="row2" class="row">
            <div>
                <div class="chinese" id="chinese1">
                	<div class="chineseTitle">
	                	<div class="chineseMainTitle">套餐三</div>
	                	<div class="chineseSubTitle">PLAN C</div>
	                </div>
	                <div class="clear"></div>
                	<div class="chineseFood">
                		<div class="chineseFood1">
                			<img id="hongshaorou" alt="红烧肉" src="${pageContext.request.contextPath }/static/img/Image/chinese3/congshaohaishen.jpg" width="117px" height="117px">
                		</div>
                		<div class="chineseFood2">
                			<img id="tangcupaigu" alt="糖醋排骨" src="${pageContext.request.contextPath }/static/img/Image/chinese3/baizhuojiweixia.jpg" width="117px" height="117px">
                		</div>
                		
                		<div class="clear"></div>
                		
                		<div class="chineseFood1Desc">葱烧海参</div>
                		<div class="chineseFood2Desc">白灼基围虾</div>
                		
                		<div class="clear"></div>
                		
                		<div class="chineseFood3">
                			<img id="culiutudousi" alt="醋溜土豆丝" src="${pageContext.request.contextPath }/static/img/Image/chinese3/jiangbaoyouyujuan.jpg" width="117px" height="117px">
                		</div>
                		<div class="chineseFood4">
                			<img id="suanlatang" alt="酸辣汤" src="${pageContext.request.contextPath }/static/img/Image/chinese3/haixiandoufutang.jpg" width="117px" height="117px">
                		</div>
                		
                		<div class="clear"></div>
                		
                		<div class="chineseFood3Desc">酱爆鱿鱼卷</div>
                		<div class="chineseFood4Desc">海鲜豆腐汤</div>
                	</div>
                </div>
                <div id="dietChinese1">
                		<h3>总结：</h3>
                		<p>本套餐中所有食物原材料均可溯源，追踪原产地及种植（养殖）信息，以保证食品安全。请至农业厅了解食品溯源系统详情。</p>
                		<p>您所选取的套餐，总热量较高，蛋白质及维生素、微量元素含量丰富。但其中高嘌呤食材较多，如长期食用有可能诱发痛风等病症。</p>
										<p>用餐建议：</p>
										<p>1.请勿同时食用含酒精类饮品或食品；</p>
										<p>2.适当增加运动，以免造成脂肪囤积。欢迎您到智能游戏体验区进行游戏体验，以消耗多余热量。</p>
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
        
        
        $("#hongshaorou").click( function(){
        	if( tmp==0 ){
        		$("#hongshaorouDesc").css('display','block');
            $("#chinese2").css('margin-top','-140px');
           	$("#chinese2").css('opacity','0.1');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.3');
           	tmp = 1;
        	}else if( tmp==1 ){
        		$("#hongshaorouDesc").css('display','none');
           	$("#tangcupaiguDesc").css('display','none');
           	$("#culiutudousiDesc").css('display','none');
           	$("#suanlatangDesc").css('display','none');
           	$("#chinese2").css('margin-top','0');
           	$("#chinese2").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp = 0;
        	}
        });
        
        $("#tangcupaigu").click( function(){
        	if( tmp==0 ){
        		$("#tangcupaiguDesc").css('display','block');
            $("#chinese2").css('margin-top','-140px');
           	$("#chinese2").css('opacity','0.1');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.3');
           	tmp = 1;
        	}else if( tmp==1 ){
        		$("#hongshaorouDesc").css('display','none');
           	$("#tangcupaiguDesc").css('display','none');
           	$("#culiutudousiDesc").css('display','none');
           	$("#suanlatangDesc").css('display','none');
           	$("#chinese2").css('margin-top','0');
           	$("#chinese2").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp = 0;
        	}
        });
        
        $("#culiutudousi").click( function(){
        	if( tmp==0 ){
        		$("#culiutudousiDesc").css('display','block');
            $("#chinese2").css('margin-top','-140px');
           	$("#chinese2").css('opacity','0.1');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.3');
           	tmp = 1;
        	}else if( tmp==1 ){
        		$("#hongshaorouDesc").css('display','none');
           	$("#tangcupaiguDesc").css('display','none');
           	$("#culiutudousiDesc").css('display','none');
           	$("#suanlatangDesc").css('display','none');
           	$("#chinese2").css('margin-top','0');
           	$("#chinese2").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp = 0;
        	}
        });
        
        $("#suanlatang").click( function(){
        	if( tmp==0 ){
        		$("#suanlatangDesc").css('display','block');
            $("#chinese2").css('margin-top','-140px');
           	$("#chinese2").css('opacity','0.1');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.3');
           	tmp = 1;
        	}else if( tmp==1 ){
        		$("#hongshaorouDesc").css('display','none');
           	$("#tangcupaiguDesc").css('display','none');
           	$("#culiutudousiDesc").css('display','none');
           	$("#suanlatangDesc").css('display','none');
           	$("#chinese2").css('margin-top','0');
           	$("#chinese2").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp = 0;
        	}
        });
        
        
        $("#xiqinbaihe").click( function(){
        	if( tmp==0 ){
        		$("#xiqinbaiheDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.1');
           	tmp = 1;
        	}else if( tmp==1 ){
        		$("#xiqinbaiheDesc").css('display','none');
           	$("#fanqiechaodanDesc").css('display','none');
           	$("#mapodoufuDesc").css('display','none');
           	$("#huluobopaigutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp = 0;
        	}
        });
        
        $("#fanqiechaodan").click( function(){
        	if( tmp==0 ){
        		$("#fanqiechaodanDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.1');
           	tmp = 1;
        	}else if( tmp==1 ){
        		$("#xiqinbaiheDesc").css('display','none');
           	$("#fanqiechaodanDesc").css('display','none');
           	$("#mapodoufuDesc").css('display','none');
           	$("#huluobopaigutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp = 0;
        	}
        });
        
        $("#mapodoufu").click( function(){
        	if( tmp==0 ){
        		$("#mapodoufuDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.1');
           	tmp = 1;
        	}else if( tmp==1 ){
        		$("#xiqinbaiheDesc").css('display','none');
           	$("#fanqiechaodanDesc").css('display','none');
           	$("#mapodoufuDesc").css('display','none');
           	$("#huluobopaigutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp = 0;
        	}
        });
        
        $("#huluobopaigutang").click( function(){
        	if( tmp==0 ){
        		$("#huluobopaigutangDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese3").css('margin-top','-140px');
           	$("#chinese3").css('opacity','0.1');
           	tmp = 1;
        	}else if( tmp==1 ){
           	$("#xiqinbaiheDesc").css('display','none');
           	$("#fanqiechaodanDesc").css('display','none');
           	$("#mapodoufuDesc").css('display','none');
           	$("#huluobopaigutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese3").css('margin-top','0');
           	$("#chinese3").css('opacity','1');
           	tmp = 0;
        	}
        });
        
        $("#congshaohaishen").click( function(){
        	if( tmp==0 ){
        		$("#congshaohaishenDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese2").css('opacity','0.3');
           	tmp = 1;
        	}else if( tmp==1 ){
           	$("#congshaohaishenDesc").css('display','none');
           	$("#baizhuojiweixiaDesc").css('display','none');
           	$("#jiangbaoyouyujuanDesc").css('display','none');
           	$("#haixiandoufutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese2").css('opacity','1');
           	tmp = 0;
        	}
        });
        
        $("#baizhuojiweixia").click( function(){
        	if( tmp==0 ){
        		$("#baizhuojiweixiaDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese2").css('opacity','0.3');
           	tmp = 1;
        	}else if( tmp==1 ){
           	$("#congshaohaishenDesc").css('display','none');
           	$("#baizhuojiweixiaDesc").css('display','none');
           	$("#jiangbaoyouyujuanDesc").css('display','none');
           	$("#haixiandoufutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese2").css('opacity','1');
           	tmp = 0;
        	}
        });
        
        $("#jiangbaoyouyujuan").click( function(){
        	if( tmp==0 ){
        		$("#jiangbaoyouyujuanDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese2").css('opacity','0.3');
           	tmp = 1;
        	}else if( tmp==1 ){
           	$("#congshaohaishenDesc").css('display','none');
           	$("#baizhuojiweixiaDesc").css('display','none');
           	$("#jiangbaoyouyujuanDesc").css('display','none');
           	$("#haixiandoufutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese2").css('opacity','1');
           	tmp = 0;
        	}
        });
        
        $("#haixiandoufutang").click( function(){
        	if( tmp==0 ){
        		$("#haixiandoufutangDesc").css('display','block');
           	$("#chinese1").css('opacity','0.3');
           	$("#chinese2").css('opacity','0.3');
           	tmp = 1;
        	}else if( tmp==1 ){
           	$("#congshaohaishenDesc").css('display','none');
           	$("#baizhuojiweixiaDesc").css('display','none');
           	$("#jiangbaoyouyujuanDesc").css('display','none');
           	$("#haixiandoufutangDesc").css('display','none');
           	$("#chinese1").css('opacity','1');
           	$("#chinese2").css('opacity','1');
           	tmp = 0;
        	}
        });
        
        
    </script>
  </body>
</html>
