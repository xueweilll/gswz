package com.benqzl.controller.webview;

import java.lang.reflect.Type;
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
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
/** 
* @ClassName: NewsController 
* @Description: TODO(公司新闻) 
* @author 冯庆国
* @date 2016年7月14日 下午1:52:14 
*  
*/
@Controller
@RequestMapping("news")
public class NewsController extends BasicController{
	@Autowired
	private NewsService service;
	public NewsController() {
		super(NewsController.class);
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
		mv.setViewName("webview/news");
		return mv;
	}
	
	@RequestMapping(value = "newsInfo", method = RequestMethod.GET)
	public ModelAndView newsInfo(Integer id) {
		News news=null;
		try {
			news = service.selectByPrimaryKey(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("webview/news-detical");
		mv.addObject("title", news.getTitle());
		mv.addObject("date", dateFormat.format(news.getCreatetime()));
		mv.addObject("content", news.getContent());
		return mv;
	}
	
	@RequestMapping(value = "bind", method = RequestMethod.POST)
	@ResponseBody
	public String bind(int page, int rows) {
		String strJson = "";
		page = (page == 0 ? 1 : page);
		rows = (rows == 0 ? 15 : rows);
		int start = (page - 1) * rows;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p1", start);
		map.put("p2", rows);
		map.put("classes", 0);
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
						json.addProperty("createtime",
								dateFormat.format(arg0.getCreatetime()));
						return json;
					}
				}).create();
		strJson = gson.toJson(jsonMap);
		return strJson;
	}
}
