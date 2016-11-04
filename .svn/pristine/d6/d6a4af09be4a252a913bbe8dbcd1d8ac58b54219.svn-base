<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>统计图表</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<link href="../static/content/bootstrap.min.css" rel="stylesheet" />
<link href="../static/content/bootstrap-theme.min.css" rel="stylesheet" />
<script src="../static/scripts/jquery-1.9.1.min.js"></script>
<script src="../static/scripts/bootstrap.min.js"></script>

<script src="../static/scripts/echarts.min.js"></script>
<script src="../static/scripts/dark.js"></script>
<script src="../static/scripts/china.js"></script>
<script src="../static/scripts/swiper-3.3.1.min.js"></script>

<link href="../static/content/swiper-3.3.1.min.css" rel="stylesheet" />
<style type="text/css">
html, body {
	position: relative;
	height: 100%;
}

body {
	background: #2c343c;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
}

.swiper-container {
	width: 100%;
	height: 100%;
	background: #2c343c;
}

.swiper-slide {
	font-size: 18px;
	color: #fff;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	padding: 40px 60px;
}

.parallax-bg {
	position: absolute;
	left: 0;
	top: 0;
	width: 130%;
	height: 100%;
	-webkit-background-size: cover;
	background-size: cover;
	background-position: center;
}

.swiper-slide .title {
	font-size: 41px;
	font-weight: 300;
}

.swiper-slide .subtitle {
	font-size: 21px;
}

.swiper-slide .text {
	font-size: 14px;
	max-width: 400px;
	line-height: 1.3;
}
</style>
</head>
<body>
	<!-- Swiper -->
	<div class="swiper-container">
		<div class="parallax-bg" data-swiper-parallax="-23%"></div>
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<div class="title" data-swiper-parallax="-100">嘉宾所在地区统计图Top10</div>
				<div id="map" class="center-block" style="height: 700px;"></div>
			</div>
			<div class="swiper-slide">
				<div class="title" data-swiper-parallax="-100">嘉宾来访日-年龄阶段统计图</div>
				<div id="bar" class="center-block" style="height: 600px;"></div>
			</div>
			<div class="swiper-slide">
				<div class="title" data-swiper-parallax="-100">嘉宾所在行业统计图Top5</div>
				<div id="pie" class="center-block" style="height: 600px;"></div>
			</div>
			<div class="swiper-slide">
				<div class="title" data-swiper-parallax="-100">互动项目人数-时间统计图</div>
				<div id="line" class="center-block" style="height: 600px;"></div>
			</div>
			<div class="swiper-slide">
				<div class="title" data-swiper-parallax="-100">当前在馆人数统计图</div>
				<div id="dashboard" class="center-block" style="height: 600px;"></div>
			</div>
		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
		<!-- Add Navigation -->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
	</div>

	<script src="../scripts/swiper-3.3.1.min.js"></script>
	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper('.swiper-container', {
			pagination : '.swiper-pagination',
			paginationClickable : true,
			nextButton : '.swiper-button-next',
			prevButton : '.swiper-button-prev',
			parallax : true,
			speed : 800,
			autoplay : 10000,
			autoplayDisableOnInteraction : false
		});
	</script>

	<!-- ********************************************************************** Map **********************************************************************-->
	<script type="text/javascript">
		var myChartMap = echarts.init(document.getElementById('map'));

		var geoCoordMap = {
			// 直辖市
			'北京' : [ 116.4551, 40.2539 ],
			'上海' : [ 121.4648, 31.2891 ],
			'天津' : [ 117.4219, 39.4189 ],
			'重庆' : [ 107.7539, 30.1904 ],
			// 省
			'河北' : [ 114.4995, 38.1006 ], // 石家庄坐标
			'山西' : [ 112.3352, 37.9413 ], // 太原坐标
			'陕西' : [ 109.1162, 34.2004 ], // 西安坐标
			'山东' : [ 117.1582, 36.8701 ], // 济南坐标
			'河南' : [ 113.4668, 34.6234 ], // 郑州坐标
			'辽宁' : [ 123.1238, 42.1216 ], // 沈阳坐标
			'吉林' : [ 125.8154, 44.2584 ], // 长春坐标
			'黑龙江' : [ 127.9688, 45.368 ], // 哈尔滨坐标
			'江苏' : [ 118.8062, 31.9208 ], // 南京坐标
			'浙江' : [ 119.5313, 29.8773 ], // 杭州坐标
			'安徽' : [ 117.29, 32.0581 ], // 合肥坐标
			'江西' : [ 116.0046, 28.6633 ], // 南昌坐标
			'福建' : [ 119.4543, 25.9222 ], // 福州坐标
			'湖北' : [ 114.3896, 30.6628 ], // 武汉坐标
			'湖南' : [ 113.0823, 28.2568 ], // 长沙坐标
			'四川' : [ 103.9526, 30.7617 ], // 成都坐标
			'贵州' : [ 106.6992, 26.7682 ], // 贵阳坐标
			'云南' : [ 102.9199, 25.4663 ], // 昆明坐标
			'广东' : [ 113.5107, 23.2196 ], // 广州坐标
			'海南' : [ 110.3893, 19.8516 ], // 海口坐标
			'甘肃' : [ 103.5901, 36.3043 ], // 兰州坐标
			'青海' : [ 101.4038, 36.8207 ], // 西宁坐标
			'台湾' : [ 121.5365, 25.0192 ], // 台北坐标
			// 自治区
			'内蒙古' : [ 111.4124, 40.4901 ], // 呼和浩特坐标
			'新疆' : [ 87.9236, 43.5883 ], // 乌鲁木齐坐标
			'西藏' : [ 91.1865, 30.1465 ], // 拉萨坐标
			'广西' : [ 108.479, 23.1152 ], // 南宁坐标
			'宁夏' : [ 106.3586, 38.1775 ], // 银川坐标
			'香港' : [ 114.1000, 22.2000 ],
			'澳门' : [ 113.3556, 22.1417 ],
			// 目标城市青岛坐标
			'青岛' : [ 120.4651, 36.3373 ]
		};

		mapDisplay(myChartMap);

		setInterval(mapDisplay, 300000);

		function mapDisplay(echart) {
			var QDData = [];
			$.ajax({
				type : "post",
				url : "../Statistics/MapController",
				dataType : "json",
				async : false,
				success : function(data) {
					QDData = eval("(" + data + ")");
				},
				error : function() {
					alert("请求出错");
				}
			});

			var planePath = 'path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z';

			var convertData = function(data) {
				var res = [];
				for (var i = 0; i < data.length; i++) {
					var dataItem = data[i];
					var fromCoord = geoCoordMap[dataItem[0].name];
					var toCoord = geoCoordMap[dataItem[1].name];
					if (fromCoord && toCoord) {
						res.push({
							fromName : dataItem[0].name,
							toName : dataItem[1].name,
							coords : [ toCoord, fromCoord ]
						});
					}
				}
				return res;
			};

			var color = [ '#a6c84c', '#ffa022', '#46bee9' ];
			var series = [];

			[ [ '青岛', QDData ] ].forEach(function(item, i) {
				series.push({

					type : 'lines',
					zlevel : 1,
					effect : {
						show : true,
						period : 6,
						trailLength : 0.7,
						color : '#fff',
						symbolSize : 3
					},
					lineStyle : {
						normal : {
							color : color[i],
							width : 0,
							curveness : 0.2
						}
					},
					data : convertData(item[1])
				}, {
					type : 'lines',
					zlevel : 2,
					effect : {
						show : true,
						period : 6,
						trailLength : 0,
						symbol : planePath,
						symbolSize : 15
					},
					lineStyle : {
						normal : {
							color : color[i],
							width : 1,
							opacity : 0.4,
							curveness : 0.2
						}
					},
					data : convertData(item[1])
				}, {
					type : 'effectScatter',
					coordinateSystem : 'geo',
					zlevel : 2,
					rippleEffect : {
						brushType : 'stroke'
					},
					label : {
						normal : {
							show : true,
							position : 'right',
							formatter : '{b}'
						}
					},
					symbolSize : function(val) {
						return val[2] / 8;
					},
					itemStyle : {
						normal : {
							color : color[i]
						}
					},
					data : item[1].map(function(dataItem) {
						return {
							name : dataItem[1].name,
							value : geoCoordMap[dataItem[1].name]
									.concat([ dataItem[1].value ])
						};
					})
				});
			});

			option = {
				backgroundColor : '#2c343c',
				geo : {
					map : 'china',
					label : {
						emphasis : {
							show : false
						}
					},
					roam : true,
					itemStyle : {
						normal : {
							areaColor : '#323c48',
							borderColor : '#404a59'
						},
						emphasis : {
							areaColor : '#2a333d'
						}
					}
				},
				series : series
			};

			myChartMap.setOption(option);
		}
	</script>

	<!-- ********************************************************************** Bar **********************************************************************-->
	<script type="text/javascript">
		var myChartBar = echarts.init(document.getElementById('bar'), 'dark');

		barDisplay(myChartBar);

		setInterval(barDisplay, 300000);

		function barDisplay(echart) {
			$.ajax({
				type : "post",
				url : "../Statistics/BarController",
				dataType : "json",
				async : false,
				success : function(data) {
					option = {
						backgroundColor : '#2c343c',
						tooltip : {
							trigger : 'axis',
							axisPointer : { // 坐标轴指示器，坐标轴触发有效
								type : 'shadow' // 默认为直线，可为：'line' | 'shadow'
							}
						},
						legend : {
							data : [ '21岁以下', '21~30岁', '31~40岁', '41~50岁',
									'50以上', '保密' ]
						},
						grid : {
							left : '3%',
							right : '4%',
							bottom : '3%',
							containLabel : true
						},
						xAxis : [ {
							type : 'category',
							data : [ '周日', '周一', '周二', '周三', '周四', '周五', '周六' ]
						} ],
						yAxis : [ {
							type : 'value'
						} ],
						series : [ {
							name : '21岁以下',
							type : 'bar',
							barWidth : 20,
							data : data.val_1
						}, {
							name : '21~30岁',
							type : 'bar',
							stack : '组',
							barWidth : 20,
							data : data.val_2
						}, {
							name : '31~40岁',
							type : 'bar',
							stack : '组',
							barWidth : 20,
							data : data.val_3
						}, {
							name : '41~50岁',
							type : 'bar',
							stack : '组',
							barWidth : 20,
							data : data.val_4
						}, {
							name : '50以上',
							type : 'bar',
							barWidth : 20,
							data : data.val_5
						}, {
							name : '保密',
							type : 'bar',
							barWidth : 20,
							data : data.val_6,
							markLine : {
								lineStyle : {
									normal : {
										type : 'dashed'
									}
								},
								data : [ [ {
									type : 'min'
								}, {
									type : 'max'
								} ] ]
							}
						} ]
					};
				},
				error : function() {
					alert("请求出错");
				}
			});

			myChartBar.setOption(option);
		}
	</script>

	<!-- ********************************************************************** Pie **********************************************************************-->
	<script type="text/javascript">
		var myChartPie = echarts.init(document.getElementById('pie'), 'dark');

		pieDisplay(myChartPie);

		setInterval(mapDisplay, 300000);

		var pieData = [];

		function pieDisplay(echart) {
			$.ajax({
				type : "post",
				url : "../Statistics/PieController",
				dataType : "json",
				async : false,
				success : function(data) {
					pieData = eval("(" + data + ")");
				},
				error : function() {
					alert("请求出错");
				}
			});

			option = {
				backgroundColor : '#2c343c',
				tooltip : {
					trigger : 'item',
					formatter : "{a} <br/>{b} : {c} ({d}%)"
				},

/* 				visualMap : {
					show : false,
					min : 0,
					max : 13,
					inRange : {
						colorLightness : [ 0, 1 ]
					}
				}, */
				series : [ {
					name : '所属行业',
					type : 'pie',
					radius : '60%',
					center : [ '50%', '50%' ],
					data : pieData.sort(function(a, b) {
						return a.value - b.value
					}),
					roseType : 'angle',
					label : {
						normal : {
							textStyle : {
								color : 'rgba(255, 255, 255, 0.3)',
								fontSize : 18
							}
						}
					},
					labelLine : {
						normal : {
							lineStyle : {
								color : 'rgba(255, 255, 255, 0.3)'
							},
							smooth : 0.1,
							length : 20,
							length2 : 30
						}
					},
					itemStyle : {
						normal : {
							color : '#c23531',
							shadowBlur : 200,
							shadowColor : 'rgba(0, 0, 0, 0.5)'
						}
					}
				} ]
			};

			myChartPie.setOption(option);
		}
	</script>

	<!-- ********************************************************************** Line **********************************************************************-->
	<script type="text/javascript">
		var myChartLine = echarts.init(document.getElementById('line'), 'dark');

		lineDisplay(myChartLine);

		setInterval(mapDisplay, 300000);

		function lineDisplay(echart) {

			var peoples = [];
			var times = [];

			$.ajax({
				type : "post",
				url : "../Statistics/LineController",
				dataType : "json",
				async : false,
				success : function(data) {
					option = {
						backgroundColor : '#2c343c',
						tooltip : {
							trigger : 'axis'
						},
						legend : {
							data : [ '参与人数', '平均时间' ]
						},
						xAxis : [ {
							type : 'category',
							data : data.itemNames
						} ],
						yAxis : [ {
							type : 'value',
							name : '参与人数',
							axisLabel : {
								formatter : '{value}'
							}
						}, {
							type : 'value',
							name : '平均时间',
							axisLabel : {
								formatter : '{value}s'
							}
						} ],
						series : [ {
							name : '参与人数',
							type : 'bar',
							barWidth : 40,
							data : data.peoples
						}, {
							name : '平均时间',
							type : 'line',
							yAxisIndex : 1,
							data : data.times
						} ]
					};
				},
				error : function() {
					alert("请求出错");
				}
			});

			myChartLine.setOption(option);
		}
	</script>

	<!-- ********************************************************************** Dashboard **********************************************************************-->
	<script type="text/javascript">
		var myChartDashboard = echarts.init(document
				.getElementById('dashboard'));

		dashboardDisplay(myChartDashboard);
		
		setInterval(dashboardDisplay, 3000);

		function dashboardDisplay(echart) {
			option = {
				backgroundColor : '#2c343c',
				tooltip : {
					formatter : "{a} <br/>{c} {b}"
				},
				toolbox : {
					show : true
				},
				series : [
						{
							name : 'VIP',
							type : 'gauge',
							center : [ '50%', '55%' ], // 默认全局居中
							min : 0,
							max : 50,
							splitNumber : 10,
							radius : '60%',
							axisLine : { // 坐标轴线
								lineStyle : { // 属性lineStyle控制线条样式
									color : [ [ 0.09, 'lime' ],
											[ 0.82, '#1e90ff' ],
											[ 1, '#ff4500' ] ],
									width : 3,
									shadowColor : '#fff', //默认透明
									shadowBlur : 10
								}
							},
							axisLabel : { // 坐标轴小标记
								textStyle : { // 属性lineStyle控制线条样式
									fontWeight : 'bolder',
									color : '#fff',
									shadowColor : '#fff', //默认透明
									shadowBlur : 10
								}
							},
							axisTick : { // 坐标轴小标记
								length : 15, // 属性length控制线长
								lineStyle : { // 属性lineStyle控制线条样式
									color : 'auto',
									shadowColor : '#fff', //默认透明
									shadowBlur : 10
								}
							},
							splitLine : { // 分隔线
								length : 25, // 属性length控制线长
								lineStyle : { // 属性lineStyle（详见lineStyle）控制线条样式
									width : 3,
									color : '#fff',
									shadowColor : '#fff', //默认透明
									shadowBlur : 10
								}
							},
							pointer : { // 分隔线
								shadowColor : '#fff', //默认透明
								shadowBlur : 5
							},
							title : {
								textStyle : { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
									fontWeight : 'bolder',
									fontSize : 20,
									fontStyle : 'italic',
									color : '#fff',
									shadowColor : '#fff', //默认透明
									shadowBlur : 10
								}
							},
							detail : {
								backgroundColor : 'rgba(30,144,255,0.8)',
								borderWidth : 1,
								borderColor : '#fff',
								shadowColor : '#fff', //默认透明
								shadowBlur : 5,
								offsetCenter : [ '-4%', '70%' ], // x, y，单位px
								textStyle : { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
									fontWeight : 'bolder',
									color : '#fff'
								}
							},
							data : [ {value : 0, name : 'VIP'} ]
						},

						{
							name : '个人',
							type : 'gauge',
							center : [ '20%', '60.4%' ], // 默认全局居中
							min : 0,
							max : 200,
							splitNumber : 10,
							radius : '45%',
							axisLine : { // 坐标轴线
								lineStyle : { // 属性lineStyle控制线条样式
									color : [ [ 0.09, 'lime' ],
											[ 0.82, '#1e90ff' ],
											[ 1, '#ff4500' ] ],
									width : 3,
									shadowColor : '#fff', //默认透明
									shadowBlur : 10
								}
							},
							axisLabel : { // 坐标轴小标记
								textStyle : { // 属性lineStyle控制线条样式
									fontWeight : 'bolder',
									color : '#fff',
									shadowColor : '#fff', //默认透明
									shadowBlur : 10
								}
							},
							axisTick : { // 坐标轴小标记
								length : 15, // 属性length控制线长
								lineStyle : { // 属性lineStyle控制线条样式
									color : 'auto',
									shadowColor : '#fff', //默认透明
									shadowBlur : 10
								}
							},
							splitLine : { // 分隔线
								length : 25, // 属性length控制线长
								lineStyle : { // 属性lineStyle（详见lineStyle）控制线条样式
									width : 3,
									color : '#fff',
									shadowColor : '#fff', //默认透明
									shadowBlur : 10
								}
							},
							pointer : { // 分隔线
								shadowColor : '#fff', //默认透明
								shadowBlur : 5
							},
							title : {
								textStyle : { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
									fontWeight : 'bolder',
									fontSize : 20,
									fontStyle : 'italic',
									color : '#fff',
									shadowColor : '#fff', //默认透明
									shadowBlur : 10
								}
							},
							detail : {
								backgroundColor : 'rgba(30,144,255,0.8)',
								borderWidth : 1,
								borderColor : '#fff',
								shadowColor : '#fff', //默认透明
								shadowBlur : 5,
								offsetCenter : [ '-6%', '70%' ], // x, y，单位px
								textStyle : { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
									fontWeight : 'bolder',
									color : '#fff'
								}
							},
							data : [ {value : 0, name : '个人'} ]
						},

						{
							name : '团体',
							type : 'gauge',
							center : [ '80%', '60.4%' ], // 默认全局居中
							min : 0,
							max : 200,
							splitNumber : 10,
							radius : '45%',
							axisLine : { // 坐标轴线
								lineStyle : { // 属性lineStyle控制线条样式
									color : [ [ 0.09, 'lime' ],
											[ 0.82, '#1e90ff' ],
											[ 1, '#ff4500' ] ],
									width : 3,
									shadowColor : '#fff', //默认透明
									shadowBlur : 10
								}
							},
							axisLabel : { // 坐标轴小标记
								textStyle : { // 属性lineStyle控制线条样式
									fontWeight : 'bolder',
									color : '#fff',
									shadowColor : '#fff', //默认透明
									shadowBlur : 10
								}
							},
							axisTick : { // 坐标轴小标记
								length : 15, // 属性length控制线长
								lineStyle : { // 属性lineStyle控制线条样式
									color : 'auto',
									shadowColor : '#fff', //默认透明
									shadowBlur : 10
								}
							},
							splitLine : { // 分隔线
								length : 25, // 属性length控制线长
								lineStyle : { // 属性lineStyle（详见lineStyle）控制线条样式
									width : 3,
									color : '#fff',
									shadowColor : '#fff', //默认透明
									shadowBlur : 10
								}
							},
							pointer : { // 分隔线
								shadowColor : '#fff', //默认透明
								shadowBlur : 5
							},
							title : {
								textStyle : { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
									fontWeight : 'bolder',
									fontSize : 20,
									fontStyle : 'italic',
									color : '#fff',
									shadowColor : '#fff', //默认透明
									shadowBlur : 10
								}
							},
							detail : {
								backgroundColor : 'rgba(30,144,255,0.8)',
								borderWidth : 1,
								borderColor : '#fff',
								shadowColor : '#fff', //默认透明
								shadowBlur : 5,
								offsetCenter : [ '-6%', '70%' ], // x, y，单位px
								textStyle : { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
									fontWeight : 'bolder',
									color : '#fff'
								}
							},
							data : [ {value : 0, name : '团体'} ]
						} ]
			};

			myChartDashboard.setOption(option);
			
			$.ajax({
				type : "post",
				url : "../Statistics/DashboardController",
				dataType : "json",
				async : false,
				success : function(data) {
					option.series[0].data[0].value = data.vip;
					option.series[1].data[0].value = data.individual;
					option.series[2].data[0].value = data.group;
					myChartDashboard.setOption(option);
				},
				error : function() {
					alert("请求出错");
				}
			});
			
		}
	</script>
</body>
</html>