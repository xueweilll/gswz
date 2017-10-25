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
<!-- 新闻详情 -->
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/news.css" />
<link rel="stylesheet" type="text/css" href="css/news-detical.css" />
<link rel="shortcut icon" href="img/logo.ico" />
</head>
<body>
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
	<div class="news-banner">
		<a><img src="img/news-banner.jpg" /></a>
	</div>
	<div class="news-center">
		<div class="news-left">
			<a class="news-leftimg"> <img src="img/news-left.jpg" style="position:relative"  /> 
			<!-- <span class="gsxw">公司新闻</span> <span class="hyzx">行业资讯</span> -->
			<span style="position:absolute; top:30px; left:50px; color:#fff; font-size:23px">公司新闻</span>
			<p style="position:absolute; top:45px; left:50px; color:#fff; font-size:16px">Press center</p>
			</a>
		</div>
		<div class="news-right news-rightlist">
			<a class="news-left-title"> <span><img
					src="img/shuxian.jpg" /> <i class="current-position">首页>公司新闻</i> </span>
			</a>
			<a class="news-detical-title"><span>${title}</span></a>
			<a class="date">编辑于<span>${date}</span></a>
			<div class="first-line ">${content}</div>
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
			<p class="copy">©2016 江苏明鹿物联技术股份有限公司 Corporation</p>
		</div>
	</div>
</body>
</html>