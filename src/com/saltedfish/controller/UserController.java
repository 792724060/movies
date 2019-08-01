package com.saltedfish.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.saltedfish.entity.User;
import com.saltedfish.service.UserService;
import com.saltedfish.utils.MailUtils;

@SessionAttributes("uid")
@Controller
public class UserController {
	@Autowired
	private UserService userservice;
	
//	/**
//	 * 登录
//	 * @param user
//	 * @return  视图
//	 */
//	@RequestMapping("/Login")
//	public ModelAndView checkLogin1(User user,ModelAndView mv){
//		user = userservice.checkLogin(user.getUid(), user.getPassword());
//		if(user == null){
//			mv.setViewName("fail");   ////////////////
//			return mv;
//		}else if(user.getState() == 1){
//			mv.addObject("uid");
//			mv.setViewName("success");   ////////////////
//			return mv;
//		}else{
//			mv.setViewName("mail");   ////////////////
//			return mv;
//		}
//	}
	
	/**  ajax
	 * 用户登录
	 * @param user 用户
	 * @param model
	 * @return
	 */
	@ResponseBody
    @RequestMapping(value = "/checkLogin")
    public String checkLogin(@RequestBody User user,ModelMap model){
		user = userservice.checkLogin(user.getUid(), user.getPassword());
		if(user == null){
			return "0";   //用户名或密码错误
		}else if(user.getState() == 0){
			return "1";  //邮箱未激活
		}else{
			model.addAttribute("uid",user.getUid());
//			HttpSession session = request.getSession();
//			session.setAttribute("uid", user.getUid());
			return "2";   
		}
    }
	
	 @RequestMapping("/logout")
	 public String Logout(HttpSession session,SessionStatus sessionstatus){
		 sessionstatus.setComplete();
		 return "main";
	    }
	
	/**  ajax
	 * 注册
	 * @param user
	 * @return 视图
	 */
	@ResponseBody
	@RequestMapping("/doRegist")
	public boolean doRegist(@RequestBody User user){
		try {
			userservice.registUser(user);
			MailUtils.sendMail(user.getEmail(), user.getCode());
			return true;  //注册成功
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("用户已存在");
			e.printStackTrace(); 
			return false;   //注册失败
		}
	}
	
	/**
	 * 激活账号
	 * @param code
	 * @return if(true)激活成功 else已激活
	 */
	@RequestMapping("/activate")
	public ModelAndView activate(String code,ModelAndView mv){
		if(userservice.activateMail(code) == true){
			mv.addObject("msg","激活成功");  ////////////////
		}
		else{
			mv.addObject("msg", "已激活");  ////////////////
		}
		mv.setViewName("main");
		return mv;
	}
}
