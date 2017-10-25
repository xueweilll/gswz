<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<%@include file="../header.jsp"%>
<title>江苏明鹿物联技术有限公司网站后台管理系统面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
	<input id="newsId" type="hidden" value="${id}" />
	<form id="ffemp" method="post" style="margin:10px;">
		<div align="center">
			<label for="title">标题</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<input id="title"
				name="title" class="easyui-textbox" style="width:600px" data-options="required:true"
				value="${title}" />
		</div>
		<div align="center">
			<textarea id="editor1"></textarea>
		</div>
		<div>
			<div align="center" style="text-align: center;">
				<a id="sub" href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-save'">保存</a>&nbsp;&nbsp;<a id="can"
					href="javascript:void(0)" class="easyui-linkbutton"
					data-options="iconCls:'icon-cancel'">取消</a>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		$(function(){
			var editor = CKEDITOR.replace('editor1',{allowedContent:true});
			CKFinder.setupCKEditor(editor, 'assets/ckfinder/');
			editor.setData("${content}");
			$("#sub").bind("click",
					function() {
						var isValid = $("#ffemp").form('validate');
						if (!isValid) {
							$.messager.progress('close');
							return false;
						}
						var data = {
							"id" : ($("#newsId").val() == "" ? 0 : $(
									"#newsId").val()),
							"title" : $("#title").textbox("getValue"),
							"content":editor.getData()
						};
						$.ajax({
							type : "POST",
							url : "adminNews/save.html",
							dataType : "text",
							data : {
								"jsonStr" : JSON.stringify(data)
							},
							success : function(msg) {
								data = eval('(' + msg + ')');
								if(data.result){reflush();}
								else{$.messager.alert("操作提示",data.msg,"error");}
								$('#dialog').window('close');
							}
						});
					});
			$("#can").bind("click", function() {
				$("#ffemp").form("clear");
			});
		});

		function reflush() {
			document.getElementById('adminNews.html').contentWindow.$('#news_list')
			.datagrid('reload');
			document.getElementById('adminNews.html').contentWindow.$('#news_list')
			.datagrid('unselectAll');
		}
	</script>
</body>
</html>
