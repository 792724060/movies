package com.saltedfish.test;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.saltedfish.entity.Order;
import com.saltedfish.entity.Schedule;
import com.saltedfish.entity.User;
import com.saltedfish.mapper.OrderMapper;
import com.saltedfish.mapper.ScheduleMapper;
import com.saltedfish.mapper.UserMapper;
import com.saltedfish.utils.MailUtils;

public class stest {

	/*@Test
	public void test() throws IOException {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		UserMapper user = ctx.getBean(UserMapper.class);
		User users = user.selectUserByCode("");
		System.out.println(users);
		User users1 = user.selectOrderByUid(01);
		System.out.println(users);
	}*/
	
	/*@Test
	public void test2() throws Exception {
		MailUtils.sendMail("304847719@qq.com","01","廖汉文童鞋");
		
	}*/

//	@Test
//	public void test1() throws IOException {
//		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
//		ScheduleMapper mapper=ctx.getBean(ScheduleMapper.class);
//		List<Schedule> schedule = mapper.selectMovieByMid(1);
//		
//		System.out.println(schedule);
//
//	}
	
	@Test
	public void test2() throws IOException {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		OrderMapper mapper=ctx.getBean(OrderMapper.class);
		List<Order> order = mapper.sumAmountBYMid();
		System.out.println(order);
		
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		System.out.println(ts);
		String tsStr = "2011-05-09";
		tsStr+=" 00:00:00";
		System.out.println(tsStr);
		ts = Timestamp.valueOf(tsStr);
		System.out.println(ts);
//        Date date = new Date();
//        long times = date.getTime();//时间戳
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        String dateString = formatter.format(date);
//        System.out.println(dateString);
	}
}
