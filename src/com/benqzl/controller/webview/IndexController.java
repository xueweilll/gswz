package com.benqzl.controller.webview;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.benqzl.controller.BasicController;
import com.benqzl.pojo.News;
import com.benqzl.service.NewsService;
import com.benqzl.unit.CommonUtil;

/** 
* @ClassName: IndexController 
* @Description: TODO(网站首页) 
* @author 冯庆国
* @date 2016年7月13日 下午5:02:25 
*  
*/
@Controller
@RequestMapping("index")
public class IndexController extends BasicController{
	@Autowired
	private NewsService service;
	public IndexController() {
		super(IndexController.class);
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
		List<News> news = new ArrayList<>();
		try {
			news  =service.selectByTopThree();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("webview/index");
		for (int i=1;i<=news.size();i++) {
			mv.addObject("url"+i, "news/newsInfo.html?id="+news.get(i-1).getId());
			String imgstr = CommonUtil.getImgSrc(news.get(i-1).getContent());
			mv.addObject("newsimg"+i, imgstr);
			String str=CommonUtil.delHTMLTag(news.get(i-1).getContent());
			mv.addObject("news"+i,  str.length()>80 ? str.substring(0, 80):str);
		}
		return mv;
	}
	

}
