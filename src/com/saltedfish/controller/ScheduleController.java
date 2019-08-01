package com.saltedfish.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.saltedfish.entity.Picture;
import com.saltedfish.entity.Schedule;
import com.saltedfish.entity.SortPage;
import com.saltedfish.service.ScheduleService;

@Controller
public class ScheduleController {
	@Autowired
	private ScheduleService scheduleservice;
	
//	@RequestMapping("/main")
//	public ModelAndView SelectAllMovie(ModelAndView mv){
//		List<Schedule> list = scheduleservice.selectAll();
//		mv.addObject("list",list);
//		mv.setViewName("main");
//		return mv;
//	}
	
	/** ajax
	 * 分页查询
	 * @param curPage 当前页
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/main")
	public Map<String, Object> SelectAllMovie(Integer curPage){
		SortPage sp = new SortPage();
		if(curPage >= ((scheduleservice.ScheduleCount()+6-1)/6))
			curPage = ((scheduleservice.ScheduleCount()+6-1)/6);
		sp.setPage(curPage);
		sp.setPagecount(6);
		sp.setRow(scheduleservice.ScheduleCount());
		sp.setSum((scheduleservice.ScheduleCount()+6-1)/6 );
		List<Schedule> list = scheduleservice.selectSome(((curPage-1)*6));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sortpage", sp);
		map.put("list", list);
		return map;
	}
	
	/**
	 * 模糊查询电影
	 * @param name 电影名
	 * @return
	 */
	@RequestMapping("/name")
	public String SelectMidByName(String name){
		int mid=scheduleservice.selectMidByName(name);
		System.out.println(mid);
		return "redirect:movie?mid="+mid+"";
	}
	
	/**
	 * 查询电影信息
	 * @param mv
	 * @param mid 电影id
	 * @return
	 */
	@RequestMapping("/movie")
	public ModelAndView SelectMovie(ModelAndView mv,int mid){
		Schedule sche = scheduleservice.selectMovieByMid(mid);
		List<Picture> pict = scheduleservice.selectPictureBymid(mid);
		mv.addObject("pict",pict);
		mv.addObject("sche",sche);
		mv.setViewName("JE");
		return mv;
	}
	
	/**
	 * 查询场次信息
	 * @param mv
	 * @param mid 电影id
	 * @return
	 */
	@RequestMapping("/movies")
	public ModelAndView SelectNumber(ModelAndView mv,int mid){
		List<Schedule> list= scheduleservice.selectNumberByMid(mid);
		Schedule sche= scheduleservice.selectMovieByMid(mid);
		mv.addObject("list",list);
		mv.addObject("sche",sche);
		mv.setViewName("XZ");
		return mv;
	}
	
	/**
	 * 查询座位及其信息
	 * @param mv
	 * @param number 产次
	 * @param name 电影名
	 * @return
	 */
	@RequestMapping("/number")
	public ModelAndView SelectAllNumber(ModelAndView mv,int number,String name){
		Schedule sche= scheduleservice.selectAllByNumber(number);
		List<String> seat = scheduleservice.selectSeatByNumber(number);
		mv.addObject("sche",sche);
		mv.addObject("seat",seat);
		mv.addObject("name",name);
		mv.setViewName("seat");
		return mv;
	}
	
	/**
	 * 插入排片
	 * @param mv
	 * @param mid 电影id
	 * @param hid 影厅id
	 * @param price 价格
	 * @param begindatetime 开始时间
	 * @return
	 */
	@RequestMapping("/insertschedule")
	public ModelAndView insertschedule(ModelAndView mv,Integer mid,Integer hid,BigDecimal price,Timestamp begindatetime){
		scheduleservice.insertSchedule(mid,hid,price,begindatetime);
		return mv;
	}
	
	@RequestMapping("/allschedule")
	public ModelAndView selectAll(ModelAndView mv){
		List<Schedule> list = scheduleservice.selectAll();
		mv.addObject("list", list);
		mv.setViewName("schedule");
		return mv;
	}
	
	@RequestMapping("/schedulestate")
	public ModelAndView ScheduleState(int mid,ModelAndView mv){
		scheduleservice.updateStateByScid(mid);
		List<Schedule> list = scheduleservice.selectAll();
		mv.addObject("list", list);
		mv.setViewName("schedule");
		return mv;
	}
}