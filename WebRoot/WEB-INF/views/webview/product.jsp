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
<!-- 产品中心 -->
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/news.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="shortcut icon" href="img/logo.ico" />
<style type="text/css">
.news-center .news-leftimg .mes {
    border-bottom: 1px solid #ddd;
    display: inline-block;
    left: 20px;
    line-height: 50px;
    position: absolute;
    top: 288px;
    width: 182px;
}
.news-center .news-leftimg .mes:hover {
    color: #e71f1a;
    cursor: pointer;
}
</style>
</head>
<body >
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
			<span style="position:absolute; top:30px; left:50px; color:#fff; font-size:23px">产品中心</span>
			<p style="position:absolute; top:45px; left:50px; color:#fff; font-size:16px">Product Center</p>
			<span>
				<span class="gsxw" onclick="tabClick(1)">制造业</span>
				<span class="hyzx" onclick="tabClick(2)">政府行业</span>
				<span class="mes" onclick="tabClick(3)">MES系统</span>
			</span>
			</a>
		</div>
		<div class="news-right news-rightlist">
			<a class="news-left-title"> <span><img
					src="img/shuxian.jpg" /> <i class="current-position">首页>产品中心</i> </span>
			</a>
			<script type="text/javascript">
				function tabClick(obj){
					if(obj==1){
						document.getElementById('manufacturing').style.display='';
						document.getElementById('governmental').style.display='none';
						document.getElementById('messystem').style.display='none';
					}else if(obj==2){
						document.getElementById('manufacturing').style.display='none';
						document.getElementById('governmental').style.display='';
						document.getElementById('messystem').style.display='none';
					}else{
						document.getElementById('manufacturing').style.display='none';
						document.getElementById('governmental').style.display='none';
						document.getElementById('messystem').style.display='';
					}
				}
				$(function(){
					var id=getQueryString("id");
					if(id!="manufacturing"){
						document.getElementById('governmental').style.display='';
						document.getElementById('manufacturing').style.display='none';
					}
				});
				function getQueryString(name) {
					var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
					var r = window.location.search.substr(1).match(reg);
					if (r != null)
						return unescape(r[2]);
					return null;
				}
			</script>
			<div class="news-right-list" id="manufacturing">${manufacturingContent }</div>
			<div class="news-right-list" id="governmental" style="display: none;">${governmentalContent}</div>
			<div class="news-right-list" id="messystem" style="display: none;">${messystemContent}</div>
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
			<p class="copy">©2016 江苏明鹿物联技术股份有限公司  Corporation</p>
		</div>
	</div>
</body>
</html>