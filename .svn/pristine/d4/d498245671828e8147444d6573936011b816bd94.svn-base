package com.benqzl.core;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.benqzl.controller.admin.LoginController;
import com.benqzl.pojo.User;
public class LoginInterceptor extends HandlerInterceptorAdapter{
	 private static final String[] IGNORE_URI = {"login/verify","contactUs","cooperator","message/save","home","index","jobs","linking","news","product","solution","news/newsInfo","news/bind"};
	    @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	        boolean flag = false;
	        String requestUrl = request.getRequestURI().replace(".html", "");
	        System.out.println(requestUrl);
	        for (String s : IGNORE_URI) {
	            if (requestUrl.equals("/"+s)){
	                flag = true;
	                break;
	            }
	        }
	        if (!flag) {
	            User user = LoginController.getLoginUser(request);
	            if (user != null){
	            	flag = true;
	            } 
	            else{
	            	response.sendRedirect("/login.html");
	            }
	        }
	        return flag;
	    }
	 
	    @Override  
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {  
	    }  
	    @Override  
	    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {  
	    } 
}
