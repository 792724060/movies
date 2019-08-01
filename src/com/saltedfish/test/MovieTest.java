package com.saltedfish.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.saltedfish.entity.Movie;
import com.saltedfish.mapper.MovieMapper;

public class MovieTest {

	@Test
	public void test1() {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		MovieMapper mapper = ctx.getBean(MovieMapper.class);
		List<Movie> list = mapper.selectAll();
		System.out.println(list.get(1));
		
	}

}
