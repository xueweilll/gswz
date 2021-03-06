/**
 * 弹出对话框
 */
// title标题 ，url页面路径
function getQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
}
function getDate() {
	var curr_time = new Date();
	var strDate = curr_time.getFullYear() + "-";
	strDate += curr_time.getMonth() + 1 + "-";
	strDate += curr_time.getDate();
	return strDate;
}
function getDateTime() {
	var curr_time = new Date();
	var strDate = curr_time.getFullYear() + "-";
	strDate += curr_time.getMonth() + 1 + "-";
	strDate += curr_time.getDate() + " ";
	strDate += curr_time.getHours() + ":";
	strDate += curr_time.getMinutes() + ":";
	strDate += curr_time.getSeconds();
	return strDate;
}

function showDialog(title, url) {
	window.parent.showDialog(title, url);
}

function showDialogWH(title, url, width, height) {
	window.parent.showDialogWH(title, url, width, height);
}

function showDialogWHIntval(title, url, width, height) {
	window.parent.showDialogWHIntval(title, url, width, height);
}

function showDialogWHH(title, url, width, height) {
	window.parent.showDialogWHH(title, url, width, height);
}
$
		.extend(
				$.fn.validatebox.defaults.rules,
				{
					phone : {
						validator : function(value) {
							// var
							// rex=/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
							// 区号：前面一个0，后面跟2-3位数字 ： 0\d{2,3}
							// 电话号码：7-8位数字： \d{7,8
							// 分机号：一般都是3位数字： \d{3,}
							// 这样连接起来就是验证电话的正则表达式了：/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/
							// var rex2 = /^((0\d{3}))(\d{8})?$/;
							// var rex2= /^((0\[1-8]))(\d{10})?$/;
							var rex2 = /^0[1-9]+\d{10}$/;
							if (rex2.test(value)) {
								// alert('t'+value);
								return true;
							} else {
								// alert('false '+value);
								return false;
							}

						},
						message : '请输入正确电话格式'
					},
					mobile : {
						validator : function(value) {
							var rex = /^1[3-8]+\d{9}$/;
							if (rex.test(value)) {
								// alert('t'+value);
								return true;
							} else {
								// alert('false '+value);
								return false;
							}

						},
						message : '请输入正确手机格式'
					},
					userName : {
						validator : function(value, param) {
							return /^[\u0391-\uFFE5\w]+$/.test(value);
						},
						message : '用户名名称只允许汉字、英文字母、数字及下划线。'
					},
					englishOrNum : {// 只能输入英文和数字
						validator : function(value) {
							return /^[a-zA-Z0-9_]{1,}$/.test(value);
						},
						message : '请输入英文、数字、下划线'
					},
					minLength : { // 判断最小长度
						validator : function(value, param) {
							value = $.trim(value); // 去空格
							return value.length >= param[0];
						},
						message : '最少输入 {0} 个字符。'
					},
					maxLength : { // 判断最小长度
						validator : function(value, param) {
							value = $.trim(value); // 去空格
							return value.length <= param[0];
						},
						message : '最少输入 {0} 个字符。'
					},
					minValue : { // 判断最小值
						validator : function(value, param) {
							value = $.trim(value); // 去空格
							return value >= param[0];
						},
						message : '最少输入 {0} 个字符。'
					},
					length : {
						validator : function(value, param) {
							var len = $.trim(value).length;
							return len >= param[0] && len <= param[1];
						},
						message : "输入大小不正确"
					},
					idcard : {// 验证身份证
						validator : function(value) {
							return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value);
						},
						message : '身份证号码格式不正确'
					},
					intOrFloat : {// 验证整数或小数
						validator : function(value) {
							return /^\d+(\.\d+)?$/i.test(value);
						},
						message : '请输入数字，并确保格式正确'
					},
					currency : {// 验证货币
						validator : function(value) {
							return /^\d+(\.\d+)?$/i.test(value);
						},
						message : '货币格式不正确'
					},
					qq : {// 验证QQ,从10000开始
						validator : function(value) {
							return /^[1-9]\d{4,9}$/i.test(value);
						},
						message : 'QQ号码格式不正确'
					},
					integer : {// 验证整数
						validator : function(value) {
							return /^[+]?[1-9]+\d*$/i.test(value);
						},
						message : '请输入整数'
					},
					chinese : {// 验证中文
						validator : function(value) {
							return /^[\u0391-\uFFE5]+$/i.test(value);
						},
						message : '请输入中文'
					},
					english : {// 验证英语
						validator : function(value) {
							return /^[A-Za-z]+$/i.test(value);
						},
						message : '请输入英文'
					},
					unnormal : {// 验证是否包含空格和非法字符
						validator : function(value) {
							return /.+/i.test(value);
						},
						message : '输入值不能为空和包含其他非法字符'
					},
					faxno : {// 验证传真
						validator : function(value) {
							// return /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[
							// ]){1,12})+$/i.test(value);
							return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i
									.test(value);
						},
						message : '传真号码不正确'
					},
					zip : {// 验证邮政编码
						validator : function(value) {
							return /^[1-9]\d{5}$/i.test(value);
						},
						message : '邮政编码格式不正确'
					},
					ip : {// 验证IP地址
						validator : function(value) {
							return /d+.d+.d+.d+/i.test(value);
						},
						message : 'IP地址格式不正确'
					},
					name : {// 验证姓名，可以是中文或英文
						validator : function(value) {
							return /^[\u0391-\uFFE5]+$/i.test(value)
									| /^\w+[\w\s]+\w+$/i.test(value);
						},
						message : '请输入姓名'
					},
					carNo : {
						validator : function(value) {
							return /^[\u4E00-\u9FA5][\da-zA-Z]{6}$/.test(value);
						},
						message : '车牌号码无效（例：粤J12350）'
					},
					carenergin : {
						validator : function(value) {
							return /^[a-zA-Z0-9]{16}$/.test(value);
						},
						message : '发动机型号无效(例：FG6H012345654584)'
					},
					email : {
						validator : function(value) {
							return /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
									.test(value);
						},
						message : '请输入有效的电子邮件账号(例：abc@126.com)'
					},
					msn : {
						validator : function(value) {
							return /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
									.test(value);
						},
						message : '请输入有效的msn账号(例：abc@hotnail(msn/live).com)'
					},
					same : {
						validator : function(value, param) {
							if ($("#" + param[0]).val() != "" && value != "") {
								return $("#" + param[0]).val() == value;
							} else {
								return true;
							}
						},
						message : '两次输入的密码不一致！'
					},
					warnmintime : { // 判断告警的值只能一级一级的增加，最小值
						validator : function(value, param) {
							value = $.trim(value); // 去空格
							if (value != "")
								for (var i = 0; i < param.length; i++) {
									$(param[i]).val();
									if ($(param[i]).combobox('getValue')) {
										var temp = $.trim($(param[i]).combobox(
												'getValue'));
										if (temp != ""
												&& !isNaN(temp)
												&& parseInt(value) <= parseInt(temp))
											return false;
									}
								}
							return true;
						},
						message : '不能小于当前告警的前一级的告警时间'
					},
					warnmaxtime : { // 判断告警的值只能一级一级的增加，最大值
						validator : function(value, param) {
							value = $.trim(value); // 去空格
							if (value != "")
								for (var i = 0; i < param.length; i++) {
									$(param[i]).val();
									if ($(param[i]).combobox('getValue')) {
										var temp = $.trim($(param[i]).combobox(
												'getValue'));
										if (temp != ""
												&& !isNaN(temp)
												&& parseInt(value) >= parseInt(temp))
											return false;
									}
								}
							return true;
						},
						message : '不能大于当前告警的后一级的告警时间'
					},
					compareDate : {
						validator : function(value, param) {
							return dateCompare($(param[0]).datetimebox(
									'getValue'), value); // 注意easyui
															// 时间控制获取值的方式
						},
						message : '开始日期不能大于结束日期'
					},
					checkname : {
						validator : function(value, param) {
							var checkR = "";
							$.ajax({
								async : false,
								type : 'post',
								url : param[1],
								dataType : 'text',
								data : {
									'id' : $(param[0]).val(),
									'name' : value
								},
								success : function(data) {
									checkR = data;
								}
							});
							return checkR === "true";
						},
						message : '您输入的内容已存在，请重新输入！'
					}
				});

function dateCompare(startLogTime, endLogTime) {
	if (startLogTime == "") {
		return true;
	}
	var endLogTimeDate = new Date(Date.parse(endLogTime.replace(/-/g, "/")));
	var startLogTimeDate = new Date(Date.parse(startLogTime.replace(/-/g, "/")));
	if (endLogTimeDate.getTime() > startLogTimeDate.getTime()) {
		return true;

	} else {
		return false;

	}
}