package com.benqzl.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.benqzl.controller.BasicController;

/** 
* @ClassName: LoginController 
* @Description: TODO(后台首页) 
* @author 冯庆国
* @date 2016年7月13日 下午4:25:58 
*  
*/
@Controller
@RequestMapping("main")
public class MainController extends BasicController{

	public MainController() {
		super(MainController.class);
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
		mv.setViewName("admin/main");
		return mv;
	}

}
