<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>江苏明鹿物联技术股份有限公司</title>
<!-- 网站首页 -->
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="shortcut icon" href="img/logo.ico" />
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=hkGbwwp6MpEVxffV1UUFQ1QG"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
<style type="text/css">
a,img {
	border: 0;
}

/* flexslider */
.flexslider {
	position: relative;
	height: 500px;
	overflow: hidden;
	background: url(img/loading.gif) 50% no-repeat;
}

.slides {
	position: relative;
	z-index: 1;
	margin: 0;
	padding: 0;
	list-style-type: none;
}

.slides li {
	height: 500px;
	margin: 0;
	padding: 0;
	list-style-type: none;
}

.flex-control-nav {
	position: absolute;
	bottom: 10px;
	z-index: 2;
	width: 100%;
	text-align: center;
	list-style-type: none;
}

.flex-control-nav li {
	display: inline-block;
	width: 14px;
	height: 14px;
	margin: 0 5px;
	*display: inline;
	zoom: 1;
	list-style-type: none;
}

.flex-control-nav a {
	display: inline-block;
	width: 14px;
	height: 14px;
	line-height: 40px;
	overflow: hidden;
	background: url(img/dot.png) right 0 no-repeat;
	cursor: pointer;
}

.flex-control-nav .flex-active {
	background-position: 0 0;
}

.flex-direction-nav {
	position: absolute;
	z-index: 3;
	width: 100%;
	top: 45%;
	list-style-type: none;
}

.flex-direction-nav li a {
	display: block;
	width: 50px;
	height: 50px;
	overflow: hidden;
	cursor: pointer;
	position: absolute;
	list-style-type: none;
}

.flex-direction-nav li a.flex-prev {
	left: 40px;
	background: url(img/prev.png) center center no-repeat;
	list-style-type: none;
}

.flex-direction-nav li a.flex-next {
	right: 80px;
	background: url(img/next.png) center center no-repeat;
	list-style-type: none;
}



img {
	border: 0;
	margin: 0;
	padding: 0;
	list-style: none;
}
h2{ padding:0px;margin:0px}
.lanren {
	position: absolute;
	right: 0;
	top: 150px;
	z-index:9999;
	margin: 0;
	padding: 0;
	list-style: none;
}

.lanren .slide_min {
	width: 28px;
	height: 112px;
	background:
		url(img/slide_min.jpg)
		no-repeat;
	cursor: pointer;
	
}

.lanren .slide_box {
	width: 154px;
	height: auto;
	overflow: hidden;
	background:
		url(img/slide_box_bg.jpg)
		repeat-y;
	font-size: 12px;
	text-align: center;
	line-height: 130%;
	color: #666;
	border-bottom: 2px solid #76A20D;
	
}

.lanren .slide_box .weixin {
	margin-bottom: 5px;

	padding: 0;
	list-style: none;
}

.lanren .slide_box img {
	cursor: pointer;
	margin: 0;
	padding: 0;
	list-style: none;
}

.lanren .slide_box p {
	text-align: center;
	padding: 5px;
	margin: 5px;
	border-bottom: 1px solid #ddd;
	
	list-style: none;
}

.lanren .slide_box span {
	padding: 5px 10px;
	display: block;
	margin: 0;
	
	list-style: none;
}

.lanren .slide_box span a {
	color: #76A20C;
	margin: 0;
	padding: 0;
	list-style: none;
}
</style>
</head>
<body>
	<header>
	<div class="container">
		<div class="nav-brand">
			<img src="img/logo.png" />
		</div>
		<div class="nav-list">
			<ul>
				<li><a href="index.html">公司首页</a></li>
				<li><a href="news.html">公司新闻</a></li>
				<li><a href="solution.html">解决方案</a></li>
				<li><a href="product.html">产品中心</a></li>
				<li><a href="cooperator.html">合作伙伴</a></li>
				<li><a href="home.html">关于我们</a></li>
			</ul>
		</div>
	</div>
	</header>
	<div class="flexslider">
		<ul class="slides">
			<li style="background:url(img/banner2.jpg) 50% 0 no-repeat;"></li>
			<li style="background:url(img/banner.jpg) 50% 0 no-repeat;"></li>
			<!-- <li style="background:url(img/banner.jpg) 50% 0 no-repeat;"></li>
			<li style="background:url(img/banner.jpg) 50% 0 no-repeat;"></li>
			<li style="background:url(img/banner.jpg) 50% 0 no-repeat;"></li> -->
		</ul>
	</div>
	<div class="lanren">
		<div class="slide_min"></div>
		<div class="slide_box" style="display:none;">
			<h2>
				<img
					src="img/slide_box.jpg" />
			</h2>
			<p>
				<a title="点击这里给我发消息"
					href="http://wpa.qq.com/msgrd?v=3&amp;uin=596532977&amp;site=www.cactussoft.cn&amp;menu=yes"
					target="_blank"><img
					src="http://wpa.qq.com/pa?p=2:596532977:41"></a>
			</p>
			<p>
				<!-- <img src="" class="weixin" /><br /> --> <!-- 微信图片链接 --> 
				<b>客户服务热线</b><br /> 0519-85280310
			</p>
			<span><a  href="javascript:$('html,body').animate({scrollTop:$('#contact').offset().top},1000);">给我们留言</a></span>
		</div>
	</div>
	<!-- 幻灯片JS -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('.flexslider').flexslider({
				directionNav : true,
				pauseOnAction : false
			});
		});
	</script>
	<div class="news">
		<p>公司新闻</p>
		<div class="news-upde"></div>
		<div class="news-carousel">
			<ul>
				<li><a href="${url1 }" class="more">更多></a> <a
					class="carousel-img"><img src="${newsimg1 }" width="172px"
						height="128px" /> <span>${news1 }</span> </a></li>
				<li><a href="${url2 }" class="more">更多></a> <a
					class="carousel-img"><img src="${newsimg2 }" width="172px"
						height="128px" /> <span>${news2 }</span> </a></li>
				<li><a href="${url3 }" class="more">更多></a> <a
					class="carousel-img"><img src="${newsimg3 }" width="172px"
						height="128px" /> <span>${news3 }</span> </a></li>
			</ul>
		</div>
	</div>
	<div class="zizhi">
		<p>我们具备</p>
		<a class="zihi-title">领先的物联网技术应用能力</a> <span class="zizhi-line"><img
			src="img/zizhi-line.png" /></span>
		<div class="zizhi-content">
			<ul>
				<li><a><img src="img/yanfa3.png" /></a></li>
				<li><a style="margin-left: 305px;"><img
						src="img/yanfa22.png" /></a></li>
				<li><a style="margin-left: 486px;"><img
						src="img/yanfa33.png" /></a></li>
				<li><a style="margin-left: 667px;"><img
						src="img/yanfa4.png" /></a></li>
				<li><a style="margin-left: 849px;"><img
						src="img/yanfa2.png" /></a></li>
			</ul>
		</div>
	</div>
	<div class="service">
		<p>我们的服务</p>
		<a class="service-title" style="display:none">工业自动化解决方案提供商</a>

		<div class="service-img" style="width:980px">
			<ul>
				<li><a><img src="img/service-img1.png" /></a></li>
				<li><a><img src="img/service-img2.png" /></a></li>
				<li><a><img src="img/service-img4.png" /></a></li>
				<li><a><img src="img/service-img3.png" /></a></li>

			</ul>
		</div>
	</div>
	<div class="product">
		<p>我们的产品</p>
		<a class="product-title" style="display:none">工业自动化解决方案提供商</a> <span
			class="product-line"><img src="img/line.png" /></span>
		<div class="product-content">
			<div class="product-content-img">
				<a href="product.html?id=governmental"><img src="img/pro-img1.png " /> </a> <a href="product.html?id=manufacturing"
					style="margin-left: 420px;"><img src="img/pro-img2.png" /></a> <a href="product.html?id=governmental"
					style="margin-left: 778px;"><img src="img/pro-img3.png" /></a>
			</div>
		</div>
	</div>
	<div class="customer">
		<p>我们的客户</p>

		<div class="customer-content">
			<ul>
				<li><a><span><img src="img/cus-img.png" /></span><i>东风农机集团</i></a></li>
				<li><a><span><img src="img/cus-img.png" /></span><i>常州水利局</i></a></li>
				<li><a><span><img src="img/cus-img.png" /></span><i>中国电信江苏公司</i></a></li>
				<li><a><span><img src="img/cus-img.png" /></span><i>中国石油新疆勘探</i></a></li>
				<li><a><span><img src="img/cus-img.png" /></span><i>江苏华电戚电公司</i></a></li>
				<li><a><span><img src="img/cus-img.png" /></span><i>某舰船军事基地</i></a></li>
				<li><a><span><img src="img/cus-img.png" /></span><i>南瑞集团</i></a></li>
				<li><a><span><img src="img/cus-img.png" /></span><i>中天钢铁集团</i></a></li>
				<li><a><span><img src="img/cus-img.png" /></span><i>克拉玛依通易电气</i></a></li>
				<li><a><span><img src="img/cus-img.png" /></span><i>南方航空</i></a></li>
				<li><a><span><img src="img/cus-img.png" /></span><i>东方航空</i></a></li>
				<li><a><span><img src="img/cus-img.png" /></span><i>某部队后勤军交处</i></a></li>
			</ul>
		</div>
	</div>
	<div class="contact">
		<p>我们的联系方式</p>
		<p class="contact-title">我们期待您的来信，并真诚邀请您的加入，有你的加入我们才更完美</p>
		<div id="map" class="map" style="width:100%;height:400px;"></div>
		<div class="contact-tab" id="contact" >
			<!-- 留言提交功能 -->
			<script type="text/javascript">
				function validate() {
					var result = true;
					var moblie = $("#messagePhone").val();
					var name = $("#messageName").val();
					var memo = $("#messageMemo").val();
					if (!/^1[34578]\d{9}$/.test(moblie)) {
						result = false;
						$("#messagePhone").style.backgroundColor = "red";
					}
					if (name.length<1||name.length>10) {
						result = false;
						$("#messageName").style.backgroundColor = "red";
					}
					if (memo.length<1||memo.length>200) {
						result = false;
						$("#messageMemo").style.backgroundColor = "red";
					}
					if (result) {
						var data = {
							name : name,
							phone : moblie,
							memo : memo
						};
						$.post("message/save.html", {
							"jsonStr" : JSON.stringify(data)
						}, function(msg) {
							data = eval('(' + msg + ')');
							if (data.result) {
								alert("留言提交成功,我们会尽快与您联系！");
							} else {
								alert(data.msg);
							}
						});
					} else {
						alert("AAAAA");
					}
				}
			</script>
			<div class="input-list">
				<input type="text" id="messageName" placeholder="姓名：请输入1~10长度字符" />
				<input type="text" id="messagePhone" class="tel"
					placeholder="手机号码：请输入手机号码" />
				<textarea name="liuyan" id="messageMemo" class="liuyan" cols="500"
					rows="300" placeholder="留言信息：请输入1~200长度字符"></textarea>
				<input type="submit" id="save" onclick="validate()" class="button"
					value="提交" />
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="footer-content">
			<ul>
				<li><a href="cooperator.html">合作伙伴</a><span
					style="padding-left:8px;  vertical-align: middle; color:.htmlfff;">丨</span></li>
				<li><a href="linking.html">常用链接</a><span
					style="padding-left:8px;  vertical-align: middle; color:.htmlfff;">丨</span></li>
				<li><a href="jobs.html">人才招聘</a><span
					style="padding-left:8px;  vertical-align: middle; color:.htmlfff;">丨</span></li>
				<li><a href="javascript:void(0);">公司OA</a><span
					style="padding-left:8px;  vertical-align: middle ; color:.htmlfff;">丨</span></li>
				<li><a href="contactUs.html">联系我们</a></li>
			</ul>
			<a class="copy">©2016 江苏明鹿物联技术股份有限公司 Corporation </a>
		</div>
	</div>


</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("map");
	var point = new BMap.Point(120.03, 31.81);
	map.centerAndZoom(point, 19);

	var top_left_control = new BMap.ScaleControl({
		anchor : BMAP_ANCHOR_TOP_LEFT
	});// 左上角，添加比例尺
	var top_left_navigation = new BMap.NavigationControl(); //左上角，添加默认缩放平移控件
	var top_right_navigation = new BMap.NavigationControl({
		anchor : BMAP_ANCHOR_TOP_RIGHT,
		type : BMAP_NAVIGATION_CONTROL_SMALL
	}); //右上角，仅包含平移和缩放按钮
	/*缩放控件type有四种类型:
	BMAP_NAVIGATION_CONTROL_SMALL：仅包含平移和缩放按钮；BMAP_NAVIGATION_CONTROL_PAN:仅包含平移按钮；BMAP_NAVIGATION_CONTROL_ZOOM：仅包含缩放按钮*/
	map.addControl(top_left_control);
	map.addControl(top_left_navigation);
	map.addControl(top_right_navigation);

	var marker = new BMap.Marker(new BMap.Point(120.03, 31.81));
	map.addOverlay(marker);
	$(function() {
		var thisBox = $('.lanren');
		var defaultTop = thisBox.offset().top;
		var slide_min = $('.lanren .slide_min');
		var slide_box = $('.lanren .slide_box');
		var closed = $('.lanren .slide_box h2 img');
		slide_min.on('click', function() {
			$(this).hide();
			slide_box.show();
		});
		closed.on('click', function() {
			slide_box.hide().hide();
			slide_min.show();
		});
		// 页面滚动的同时，悬浮框也跟着滚动
		$(window).on('scroll', function() {
			scro();
		});
		$(window).onload = scro();
		function scro() {
			var offsetTop = defaultTop + $(window).scrollTop() + 'px';
			thisBox.animate({
				top : offsetTop
			}, {
				duration : 600, //滑动速度
				queue : false
			//此动画将不进入动画队列
			});
		}
	});
</script>