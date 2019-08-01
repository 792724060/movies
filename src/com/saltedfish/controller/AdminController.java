package com.saltedfish.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	/**
	 * 发布员登录
	 * @param username
	 * @param password
	 * @param mv
	 * @return
	 */
	@RequestMapping("/plogin")
	public ModelAndView checkPadmin(String username,String password,ModelAndView mv){
		if(username == "0416" && password == "123"){
			mv.setViewName("index");
		}else{
			mv.addObject("msg", "账号或密码错误");
			mv.setViewName("plogin");
		}
		return mv;
	}
	/**
	 * 经理登录
	 * @param username
	 * @param password
	 * @param mv
	 * @return
	 */
	@RequestMapping("/mlogin")
	public ModelAndView checkMadmin(String username,String password,ModelAndView mv){
		if(username == "0418" && password == "123"){
			mv.setViewName("");
		}else{
			mv.addObject("msg", "账号或密码错误");
			mv.setViewName("mlogin");
		}
		return mv;
	}
}
