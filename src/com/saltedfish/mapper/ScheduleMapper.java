package com.saltedfish.mapper;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.saltedfish.entity.Picture;
import com.saltedfish.entity.Schedule;

@Repository
public interface ScheduleMapper {
	//加载排片信息
	public List<Schedule> selectSome(@Param("curPage") int curPage);
	//获取排片总数
	public int ScheduleCount();
	//通过电影名获取电影id
	public int selectMidByName(String name);
	//通过Mid获取排片信息
	public Schedule selectMovieByMid(@Param("mid") int mid);
    //通过number获取座位信息
    public Schedule selectAllByNumber(@Param("number") int number);
	//通过mid获取number
	public List<Schedule> selectNumberByMid(@Param("mid") int mid);
	
	public List<Picture> selectPictureBymid(int mid);
	
	//
	public void insertSchedule(@Param("mid") Integer mid,
			                               @Param("hid") Integer hid,
			                               @Param("number") Integer number,
			                               @Param("price") BigDecimal price,
			                               @Param("begindatetime") Timestamp begindatetime);
	
	//获取number场次最大值
	public int selectMaxNumber();
	
	//通过number获取座位信息
	public List<String> selectSeatByNumber(int number);
	
	public Schedule selectAllByMid(int mid);
	//插入座位
	public void insertSeat(@Param("hid") int hid,@Param("number") int number,@Param("seat") String seat);
	
	
	//↓↓↓管理员↓↓↓//
	//获取所有排片信息
	public List<Schedule> selectAll();
	//下映
	public void updateStateByScid(int mid);
}
