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
<title>江苏明鹿物联技术有限公司网站后台管理系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript">

	$(function() {
		$("#news_list").datagrid({
			width : 'auto',
			height : 'auto',
			nowrap : false,
			striped : true,
			border : true,
			collapsible : false,
			fit : true,
			url : 'adminNews/bind.html',
			remoteSort : false,
			idField : 'id',
			singleSelect : true,
			rownumbers : true,
			toolbar : '#tb',
			pagination : true,
			pageSize : 20,
			onLoadSuccess:function(){
				$("#news_list").datagrid("unselectAll");
			},
			columns:[[
			      {field:'title',title:'标题',width:200},
			      {field:'classes',title:'类型',width:160,
			    	  formatter: function(value,row,index){
			    		  switch(parseInt(value)){
			    		  	case 1:
			    		  		return "解决方案";
			    		  	case 2:
			    		  		return "产品中心-制造业";
			    		  	case 3:
			    		  		return "合作伙伴";
			    		  	case 4:
			    		  		return "关于我们";
			    		  	case 5:
			    		  		return "常用链接";
			    		  	case 6:
			    		  		return "人才招聘";
			    		  	case 7:
			    		  		return "联系我们";
			    		  	case 8:
			    		  		return "产品中心-政府企业";
			    		  	case 9:
			    		  		return "产品中心-MES系统";
			    		  	default:
			    		  		return "公司新闻";
			    		  }
			    	  }
			      },
			      {field:'createtime',title:'创建时间',width:160},    
			      {field:'edittime',title:'修改时间',width:160},    
			      {field:'isindex',title:'是否首页显示',width:100,
			    	formatter: function(value,row,index){
			    	  if(value==1){
			    		  return "是";
			    	  }else{
			    		  return "否";
			    	  }
			      	},
			      	styler:function(value){
			      		if(value==1){
				    		  return 'background-color:#ffee00;color:red;';
				    	}
			      	}
			      }   
			]]
		});
		
		var p = $("#news_list").datagrid('getPager');
		$(p).pagination({
			pageList : [ 5, 10, 15, 20 ],
			beforePageText : '第',
			afterPageText : '页        共{pages}页',
			displayMsg : '当前显示{from}-{to}条记录      共{total}条记录'
		});
		$("#starttime").datetimebox({
			onChange : function() {
				$('#endtime').datetimebox('enableValidation');
			}
		});
	});
	
	function add() {		
		showDialogWH("添加页面明细", "adminNews/adminNewsInfo.html?id=0",'100%','100%');
	}
	
	

	function edit() {
		var row = $("#news_list").datagrid("getSelected");
		if (row == null) {
			$.messager.alert("操作提示", "请选择一条记录再进行操作！", "error");
			return false;
		}
		showDialogWH("编辑页面明细", "adminNews/adminNewsInfo.html?id=" + row.id,'100%','100%');
	}

	function distory() {
		var row = $("#news_list").datagrid("getSelected");
		if (row == null) {
			$.messager.alert("操作提示", "请选择一条记录再进行操作！", "info");
			return false;
		}
		if (row.classes != 0) {
			$.messager.alert("操作提示", "记录除公司新闻外不可删除！", "info");
			return false;
		}
		$.messager.confirm("删除提示", "您确定要执行删除吗？", function(data) {
			if (data) {
				$.ajax({
					type : 'POST',
					url : "adminNews/delete.html",
					data : {
						id : row.id
					},
					success : function() {
						$("#news_list").datagrid("unselectAll");
						$("#news_list").datagrid("reload");
					}
				});
			}
		});
	}
	function selectbig(){	
		$("#news_list").datagrid('load',{		
			starttime: $("#starttime").datetimebox("getValue"),
			endtime: $("#endtime").datetimebox("getValue"),
			classes: $("#classes").combobox("getValue")
		});
		$("#news_list").datagrid("unselectAll");
	}
	function isIndexShow(){
		var row = $("#news_list").datagrid("getSelected");
		if (row == null) {
			$.messager.alert("操作提示", "请选择一条记录再进行操作！", "info");
			return false;
		}
		var message;
		var isindex;
		if(row.isindex==0){
			message="您确定要添加首页显示吗？";
			isindex=1;
		}else{
			message="您确定要移除首页显示吗？";
			isindex=0;
		}
		$.messager.confirm("操作提示", message, function(data) {
			if (data) {
				var data={
						id : row.id,
						isindex:isindex
					};
				$.ajax({
					type : 'POST',
					url : "adminNews/save.html",
					data : {
						"jsonStr" : JSON.stringify(data)
					},
					success : function() {
						$("#news_list").datagrid("unselectAll");
						$("#news_list").datagrid("reload");
					}
				});
			}
		});
		
	}
	var buttons = $.extend([], $.fn.datetimebox.defaults.buttons);
	buttons.splice(0,1,{
		text: '清空',
		handler: function(target){
			$(target).datetimebox("clear");
			$(target).datetimebox("hidePanel");
		}
	});
</script>

</head>

<body class="easyui-layout" id="cc">
	<table id="news_list" cellspacing="0" cellpadding="0"></table>
		<div id="tb" >
			<div class="cz_div_title">
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="add()" data-options="iconCls:'icon-add'" plain="flase">新增</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="edit()" data-options="iconCls:'icon-edit'" plain="flase">编辑</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="distory()" data-options="iconCls:'icon-remove'" plain="flase">删除</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="isIndexShow()" data-options="iconCls:'icon-edit'" plain="flase">首页显示</a>
			</div>
			<div class="cz_div">
				类型：<select id="classes" class="easyui-combobox"  style="width:150px;">  
					<!-- // 0：公司新闻  1：解决方案 2：产品中心 3：合作伙伴 4：关于我们 5：常用链接 6：人才招聘 7：联系我们  -->
					    <option value="0">公司新闻</option>
					    <option value="1">解决方案</option>
					    <option value="2">产品中心-制造业</option>
					    <option value="3">合作伙伴</option>
					    <option value="4">关于我们</option>
					    <option value="5">常用链接</option>
					    <option value="6">人才招聘</option>
					    <option value="7">联系我们</option>
					    <option value="8">产品中心-政府行业</option>
					    <option value="9">产品中心-MES系统</option>
					</select>
				创建时间： <input id="starttime" type="text" class="easyui-datetimebox" data-options="width:160,editable:false,buttons: buttons">
				  	  ~ <input id="endtime" type="text" class="easyui-datetimebox"  data-options="width:160,editable:false,buttons: buttons,validType:['compareDate[starttime]']">
					    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="selectbig()" iconCls="icon-search">查询</a>
			</div>
		</div>
</body>
</html>
