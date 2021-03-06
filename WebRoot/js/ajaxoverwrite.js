/**
 * 重写ajax
 */
(function($) {
	//备份jquery的ajax方法     
	var _ajax = $.ajax;

	//重写jquery的ajax方法     
	$.ajax = function(opt) {
		//备份opt中error和success方法     
		var fn = {
			error : function(XMLHttpRequest, textStatus, errorThrown) {
			},
			success : function(data, textStatus) {
			}
		}
		if (opt.error) {
			fn.error = opt.error;
		}
		if (opt.success) {
			fn.success = opt.success;
		}

		//扩展增强处理     
		var _opt = $.extend(opt, {
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				//错误方法增强处理     
				/*if (layer) {  
				    layer.msg("出错了,请联系管理员!", 2, 3, null, true);  
				} else {  
				    alert("出错了,请联系管理员!");  
				}  */
				$.messager.alert("操作提示", "出错了,请联系管理员！", "error");
				fn.error(XMLHttpRequest, textStatus, errorThrown);
			},
			success : function(data, textStatus) {
				try {
					var info = eval('(' + data + ')');
					//成功回调方法增强处理     
					var error = info.error;
					//console.info(error);
					if (error != undefined && error == true) {
						$.messager.alert("操作提示", "您无此操作权限，请联系管理员授权！", "error");
						$.messager.progress('close');
						return;
					}
				} catch (exception) {

				}
				fn.success(data, textStatus);
			}
		});
		_ajax(_opt);
	};
})(jQuery);