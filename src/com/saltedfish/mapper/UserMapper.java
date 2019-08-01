package com.saltedfish.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.saltedfish.entity.User;

@Repository
public interface UserMapper {
	//通过账号密码获取账号密码
	public User selectUserByUsernameAndPassword(@Param("uid") String uid,@Param("password") String password);
	//注册账号
	public void insertUser(User user); /////改
	//通过Code获取User信息
	public User selectUserByCode(@Param("code") String code);
	//激活账号
	public void updateStateByCode(@Param("code") String code);	
}
