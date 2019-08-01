package com.saltedfish.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.saltedfish.entity.User;
import com.saltedfish.mapper.UserMapper;

public class UserTest {

	@Test
	public void test1() {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		UserMapper user = ctx.getBean(UserMapper.class);
		User users = new User();
	}

}
