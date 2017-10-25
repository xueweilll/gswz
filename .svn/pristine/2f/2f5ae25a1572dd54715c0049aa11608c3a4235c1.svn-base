package com.benqzl.controller.admin;

import java.lang.reflect.Type;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.benqzl.controller.BasicController;
import com.benqzl.pojo.Message;
import com.benqzl.service.MessageService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
@Controller
@RequestMapping("message")
public class MessageController extends BasicController{
	@Autowired
	private MessageService service;
	
	public MessageController() {
		super(MessageController.class);
	}
	
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/message");
		return mv;
	}
	
	@RequestMapping(value = "messageInfo", method = RequestMethod.GET)
	public ModelAndView messageInfo(Integer id) {
		Message message=null;
		try {
			message = service.selectByPrimaryKey(id);
			if(message!=null&&message.getIsread()==1){//判断消息是否已读，否则更新为已读
				message.setIsread(0);
				message.setIsreadtime(new Date());
				service.updateByPrimaryKey(message);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/messageInfo");
		mv.addObject("message", message.getMemo());
		return mv;
	}

	/** 
	* @Title: bind 
	* @Description: TODO(数据绑定) 
	* @param @param page
	* @param @param rows
	* @param @param name
	* @param @param starttime
	* @param @param endtime
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws 
	*/
	@RequestMapping(value = "bind", method = RequestMethod.POST)
	@ResponseBody
	public String bind(int page, int rows, String name, String starttime,
			String endtime) {
		String strJson = "";
		page = (page == 0 ? 1 : page);
		rows = (rows == 0 ? 15 : rows);
		int start = (page - 1) * rows;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p1", start);
		map.put("p2", rows);
		if (name == null || name.trim().equals("")) {
			map.put("name", null);
		} else {
			map.put("name", name);
		}
		if (starttime == null || starttime.trim().equals("")) {
			map.put("starttime", null);
		} else {
			try {
				map.put("starttime", datetimeFormat.parseObject(starttime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (endtime == null || endtime.trim().equals("")) {
			map.put("endtime", null);
		} else {
			try {
				map.put("endtime", datetimeFormat.parseObject(endtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		List<Message> list = null;
		int count = 0;
		try {
			list = service.findByPage(map);
			count = service.pageCount(map);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", count);
		jsonMap.put("rows", list);
		gson = new GsonBuilder().registerTypeAdapter(Message.class,
				new JsonSerializer<Message>() {
					@Override
					public JsonElement serialize(Message arg0, Type arg1,
							JsonSerializationContext arg2) {
						JsonObject json = new JsonObject();
						json.addProperty("id", arg0.getId());
						json.addProperty("name", arg0.getName());
						json.addProperty("phone", arg0.getPhone());
						json.addProperty("isread", arg0.getIsread());
						json.addProperty("createtime",datetimeFormat.format(arg0.getCreatetime()));
						if(arg0.getIsreadtime()!=null){
							json.addProperty("isreadtime",datetimeFormat.format(arg0.getIsreadtime()));
						}
						return json;
					}
				}).create();
		strJson = gson.toJson(jsonMap);
		return strJson;
	}
	
	/** 
	* @Title: save 
	* @Description: TODO(保存留言信息) 
	* @param @param jsonStr
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws 
	*/
	@RequestMapping(value = "save", method = RequestMethod.POST)
	@ResponseBody
	public String save(String jsonStr) {
		Gson gson = new Gson();
		Message message = gson.fromJson(jsonStr, Message.class);
		String result="";
		try {
			message.setIsread(1);
			message.setCreatetime(new Date());
			service.insert(message);
			result= "{'result':true}";
		} catch (Exception e) {
			e.printStackTrace();
			result= "{'result':false,'msg':'保存失败'}";
		}
		return result;
	}
	/** 
	* @Title: delete 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param id
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws 
	*/
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public String delete(Integer id){
		String result="";
		try {
			service.deleteByPrimaryKey(id);
			result= "{'result':true,'msg':'删除成功'}";
		} catch (Exception e) {
			e.printStackTrace();
			result= "{'result':false,'msg':'删除失败'}";
		}
		return result;
	}

}
