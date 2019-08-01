package com.saltedfish.service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import com.saltedfish.entity.Picture;
import com.saltedfish.entity.Schedule;

public interface ScheduleService {
	/**
	 * 加载排片信息
	 * @return Schedule
	 */
	public List<Schedule> selectSome(int curPage);
	
	public int ScheduleCount();
	
	public int selectMidByName(String name);
	/**
	 * 通过Mid获取排片信息
	 * @param mid 电影id号
	 * @return
	 */
	public Schedule selectMovieByMid(int mid);
	
	public List<Picture> selectPictureBymid(int mid);
//	/**
//	 * 通过number获取座位信息
//	 * @param number 场次
//	 * @return
//	 */
//	public Schedule selectSeatByNumber(int number);
    /**
     * 通过mid获取number
     * @param mid
     * @return
     */
	public List<Schedule> selectNumberByMid(int mid); 
	/**
	 * 插入排片
	 * @param schedule
	 * @return
	 */
	public Schedule selectAllByNumber(int number);
	
	public void insertSchedule(Integer mid,Integer hid,BigDecimal price,Timestamp begindatetime);
	
	public List<String> selectSeatByNumber(int number);
	
	public int selectMaxNumber();
	
	
	
	public List<Schedule> selectAll();
	
	public void updateStateByScid(int mid);
}
