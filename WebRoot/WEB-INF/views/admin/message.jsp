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
		$("#message_list").datagrid({
			width : 'auto',
			height : 'auto',
			nowrap : false,
			striped : true,
			border : true,
			collapsible : false,
			fit : true,
			url : 'message/bind.html',
			remoteSort : false,
			idField : 'id',
			singleSelect : true,
			rownumbers : true,
			toolbar : '#tb',
			pagination : true,
			pageSize : 20,
			onLoadSuccess:function(){
				$("#message_list").datagrid("unselectAll");
			},
			onDblClickRow:function(rowIndex, rowData){
				searchInfo(rowData);
			},
			columns:[[
			      {field:'name',title:'名称',width:200},    
			      {field:'phone',title:'电话',width:100},    
			      {field:'createtime',title:'创建时间',width:160},    
			      {field:'isread',title:'是否已读',width:100,
			    	formatter: function(value,row,index){
			    	  if(value==0){
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
			      },
			      {field:'isreadtime',title:'阅读时间',width:160}  
			]]
		});
		
		var p = $("#message_list").datagrid('getPager');
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
	
	function distory() {
		var row = $("#message_list").datagrid("getSelected");
		if (row == null) {
			$.messager.alert("操作提示", "请选择一条记录再进行操作！", "error");
			return false;
		}
		$.messager.confirm("删除提示", "您确定要执行删除吗？", function(data) {
			if (data) {
				$.ajax({
					type : 'POST',
					url : "message/delete.html",
					data : {
						id : row.id
					},
					dataType:'text',
					success : function(msg) {
						var data = eval('(' + msg + ')');
						if(data.result){
							$.messager.alert("操作提示", data.msg, "info");
							$("#message_list").datagrid("unselectAll");
							$("#message_list").datagrid("reload");
						}else{
							$.messager.alert("操作提示", data.msg, "warning");
						}
					}
				});
			}
		});
	}
	function selectbig(){	
		$("#message_list").datagrid('load',{		
			starttime: $("#starttime").datetimebox("getValue"),
			endtime: $("#endtime").datetimebox("getValue")
		});
		$("#message_list").datagrid("unselectAll");
	}
	function searchInfo(row){
		showDialogWH("查看留言类容", "message/messageInfo.html?id=" + row.id,400,300);
		$("#message_list").datagrid("reload");
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
	<table id="message_list" cellspacing="0" cellpadding="0"></table>
		<div id="tb" >
			<div class="cz_div_title">
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="distory()" data-options="iconCls:'icon-remove'" plain="flase">删除</a>
			</div>
			<div class="cz_div">
			创建时间： <input id="starttime" type="text" class="easyui-datetimebox" data-options="width:160,editable:false,buttons: buttons">
				  ~ <input id="endtime" type="text" class="easyui-datetimebox"  data-options="width:160,editable:false,buttons: buttons,validType:['compareDate[starttime]']">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="selectbig()" iconCls="icon-search">查询</a>
			</div>
		</div>
</body>
</html>
