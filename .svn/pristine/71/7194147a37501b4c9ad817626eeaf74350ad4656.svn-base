package com.benqzl.controller.admin;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.benqzl.controller.BasicController;
import com.benqzl.pojo.User;
import com.benqzl.service.UserService;
import com.benqzl.unit.CommonUtil;

/** 
* @ClassName: LoginController 
* @Description: TODO(登陆控制) 
* @author 冯庆国
* @date 2016年7月13日 下午4:25:58 
*  
*/
@Controller
@RequestMapping("login")
public class LoginController extends BasicController{
	
	@Autowired
	private UserService service;
	
	public LoginController() {
		super(LoginController.class);
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
		mv.setViewName("admin/login");
		return mv;
	}
	
	@RequestMapping(value = "editpwdInfo", method = RequestMethod.GET)
	public ModelAndView editpwdInfo(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/editpwdInfo");
		return mv;
	}
	/** 
	* @Title: login 
	* @Description: TODO(管理员登陆) 
	* @param @param username
	* @param @param userpwd
	* @param @param request
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws 
	*/
	@RequestMapping(value = "verify", method = RequestMethod.POST)
	@ResponseBody
	public String login(String username,String userpwd,HttpServletRequest request){
		String result=null;
		User user=null;
		if(username.trim()!=null){
			user=service.selectByUsername(username);
		}
		if(user.getUserpwd().equals(CommonUtil.GetMD5Code(userpwd))){
			request.getSession().setAttribute("loginUser", user);
			result = "{'result':true}";
		}else{
			result = "{'result':false,'msg':'用户名或密码错误！'}";
		}
		return result;
	}
	
	/** 
	* @Title: editpwd 
	* @Description: TODO(修改密码) 
	* @param @param oldpwd
	* @param @param newpwd
	* @param @param request
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws 
	*/
	@RequestMapping(value = "editpwd", method = RequestMethod.POST)
	@ResponseBody
	public String editpwd(String oldpwd, String newpwd,HttpServletRequest request) {
		User user= (User) request.getSession().getAttribute("loginUser");
		String result=null;
		if(user.getUserpwd().equals(CommonUtil.GetMD5Code(oldpwd))){
			user.setUserpwd(CommonUtil.GetMD5Code(newpwd));
			user.setEdittime(new Date());
			try {
				user.setUserpwd(CommonUtil.GetMD5Code(newpwd));
				request.getSession().setAttribute("loginUser", user);
				service.updateByPrimaryKey(user);
				result= "{'result':true,'msg':'密码修改成功！'}";
			} catch (Exception e) {
				logger.error(e.getMessage());
				result= "{'result':false,'msg':'密码修改失败！'}";
			}
		}else{
			result= "{'result':false,'msg':'旧密码输入有误！'}";
		}
		return result;
	}
	
	/** 
	* @Title: logout 
	* @Description: TODO(退出系统) 
	* @param @param request
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws 
	*/
	@RequestMapping(value = "logout", method = RequestMethod.POST)
	@ResponseBody
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("loginUser");
		return "{'result':true}";
	}
	
	public static User getLoginUser(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("loginUser");
		return user;
	}

}
