package com.saltedfish.service;

import com.saltedfish.entity.User;


public interface UserService {
	/**
	 * 检查用户登录
	 * @param uid 账号
	 * @param password 密码
	 * @return 
	 */
	public User checkLogin(String uid,String password);
	/**
	 * 注册
	 * 随机UUID，赋值给code作为激活码
	 * @param user 用户bean
	 */
	public void registUser(User user);
	/**
	 * 发送邮箱激活
	 * @param receiveMailAccount 收件人邮箱
	 * @param code 激活码
	 * @param uid 收件人账号
	 */
	public boolean activateMail(String code);
	
}
