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
import com.benqzl.pojo.News;
import com.benqzl.service.NewsService;
import com.benqzl.unit.CommonUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

/**
 * @ClassName: AdminNewsController
 * @Description: TODO(后台新闻管理)
 * @author 冯庆国
 * @date 2016年7月14日 下午3:35:07
 * 
 */
@Controller
@RequestMapping("adminNews")
public class AdminNewsController extends BasicController {
	@Autowired
	private NewsService service;

	public AdminNewsController() {
		super(AdminNewsController.class);
	}

	/**
	 * @Title: index
	 * @Description: TODO(主页框架)
	 * @param @return 设定文件
	 * @return ModelAndView 返回类型
	 * @throws
	 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/adminNews");
		return mv;
	}

	@RequestMapping(value = "adminNewsInfo", method = RequestMethod.GET)
	public ModelAndView adminNewsInfo(int id) {
		ModelAndView mv = new ModelAndView();
		if(id==0){
			mv.addObject("id", id);
		}else{
			try {
				News news = service.selectByPrimaryKey(id);
				mv.addObject("title", news.getTitle());
				mv.addObject("content", CommonUtil.htmlToCode(news.getContent()));
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.addObject("id", id);
		}
		mv.setViewName("admin/adminNewsInfo");
		return mv;
	}

	@RequestMapping(value = "bind", method = RequestMethod.POST)
	@ResponseBody
	public String bind(int page, int rows, String classes, String starttime,
			String endtime) {
		String strJson = "";
		page = (page == 0 ? 1 : page);
		rows = (rows == 0 ? 15 : rows);
		int start = (page - 1) * rows;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p1", start);
		map.put("p2", rows);
		if (classes==null) {
			map.put("classes", null);
		} else {
			map.put("classes", Integer.parseInt(classes));
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
		List<News> list = null;
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
		gson = new GsonBuilder().registerTypeAdapter(News.class,
				new JsonSerializer<News>() {
					@Override
					public JsonElement serialize(News arg0, Type arg1,
							JsonSerializationContext arg2) {
						JsonObject json = new JsonObject();
						json.addProperty("id", arg0.getId());
						json.addProperty("title", arg0.getTitle());
						json.addProperty("classes", arg0.getClasses());
						json.addProperty("isindex", arg0.getIsindex());
						json.addProperty("createtime",
								datetimeFormat.format(arg0.getCreatetime()));
						json.addProperty("edittime",
								datetimeFormat.format(arg0.getEdittime()));
						return json;
					}
				}).create();
		strJson = gson.toJson(jsonMap);
		return strJson;
	}

	@RequestMapping(value = "save", method = RequestMethod.POST)
	@ResponseBody
	public String save(String jsonStr) {
		Gson gson = new Gson();
		News news = gson.fromJson(jsonStr, News.class);
		String result="";
		try {
			if (news.getId()==0) {//新增
				news.setClasses(0);
				news.setCreatetime(new Date());
				news.setEdittime(new Date());
				news.setIsindex(0);
				service.insert(news);
			} else {//修改
				news.setEdittime(new Date());
				service.updateByPrimaryKey(news);
			}
			result= "{'result':true}";
		} catch (Exception e) {
			e.printStackTrace();
			result= "{'result':false,'msg':'保存失败'}";
		}

		return result;
	}
	/** 
	* @Title: findByClasses 
	* @Description: TODO(通过类型查询页面内容) 
	* @param @param classes
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws 
	*/
	@RequestMapping(value = "findByClasses", method = RequestMethod.POST)
	@ResponseBody
	public String findByClasses(String classes){
		// 0：公司新闻  1：解决方案 2：产品中心 3：合作伙伴 4：关于我们 5：常用链接 6：人才招聘 7：联系我们
		return classes;
	}
	
	
	/** 
	* @Title: delete 
	* @Description: TODO(删除) 
	* @param @param id
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws 
	*/
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public String delete(int id){
		try {
			News news = service.selectByPrimaryKey(id);
			if(news.getClasses()==0){//除公司新闻外不可删除
				service.deleteByPrimaryKey(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
