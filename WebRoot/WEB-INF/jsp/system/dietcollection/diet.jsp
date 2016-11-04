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

        #row2 {
            height: 80%;
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
    </style>
  </head>
  
  <body>
    <div id="main" class="container linear">
        <div id="row1" class="row">
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">

            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 right" style="padding:20px 0px 0px 70px;">
                <img src="${pageContext.request.contextPath }/static/img/Image/hpe.png" alt="HPE" width="180" style="padding-left:10px; padding-top:10px;" />
            </div>
        </div>
        <div id="row2" class="row">
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1" style="height:80%;">
                <div class="left shine_red">
                    <div class="text">
                        <p>
                            亲爱的<span>${pd.Name}</span>：
                        </p>
                        <p>
                            欢迎您莅临惠普大数据应用中心，这里是惠普大数据应用的一小步，是青岛迈向世界的一大步，未来的智能生活通过您的指尖与舌尖开启。
                        </p>
                        <br />
                        <p>
                            现在请您体验本次生活展厅智能点餐系统......
                        </p>
                    </div>
                </div>
                <hr />

            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                <div class="row" style="padding:140px 0px 0px 80px;">
                    <a href="${pageContext.request.contextPath }/diet/dietChinese?ReservationID=${pd.ReservationID}" class="btn customerColor" role="button" style="font-size: 2em; border-radius: 10px 8px; padding-top:8px;">中 餐</a>
                    <hr />
                </div>
                <div class="row" style="padding:110px 0px 0px 80px;">
                    <a href="${pageContext.request.contextPath }/diet/dietWestern?ReservationID=${pd.ReservationID}" class="btn customerColor" role="button" style="font-size: 2em; border-radius: 10px 8px; padding-top:8px;">西 餐</a>
                    <hr />
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath }/static/jquery/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script>
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
    </script>
  </body>
</html>
