package com.benqzl.controller.webview;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.benqzl.controller.BasicController;
import com.benqzl.service.NewsService;

/**
 * @ClassName: SolutionController
 * @Description: TODO(解决方案)
 * @author 冯庆国
 * @date 2016年7月14日 下午1:52:56
 * 
 */
@Controller
@RequestMapping("solution")
public class SolutionController extends BasicController {

	@Autowired
	private NewsService service;

	public SolutionController() {
		super(SolutionController.class);
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
		// 0：公司新闻 1：解决方案 2：产品中心 3：合作伙伴 4：关于我们 5：常用链接 6：人才招聘 7：联系我们
		String content = null;
		try {
			content = service.selectByClasses(1);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("content", content);
		mv.setViewName("webview/solution");
		return mv;
	}

}
