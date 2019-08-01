package com.saltedfish.service.serviceimpl;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltedfish.entity.User;
import com.saltedfish.mapper.UserMapper;
import com.saltedfish.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper usermapper;
	
	@Override
	public User checkLogin(String uid, String password) {
		// TODO Auto-generated method stub
		User user = usermapper.selectUserByUsernameAndPassword(uid, password);
		if(user != null)
			return user;
		else 
			return null;
	}
	
	@Override
	public void registUser(User user) {
		// TODO Auto-generated method stub
		user.setCode(UUID.randomUUID().toString());
		usermapper.insertUser(user);
	}
	
	@Override
	public boolean activateMail(String code) {
		// TODO Auto-generated method stub
		User user = usermapper.selectUserByCode(code);
		if(user.getState() == 0){
			usermapper.updateStateByCode(code);
			return true;
		}
		else
			return false;
	}
}
