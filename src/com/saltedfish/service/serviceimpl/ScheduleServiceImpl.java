package com.saltedfish.service.serviceimpl;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltedfish.entity.Picture;
import com.saltedfish.entity.Schedule;
import com.saltedfish.mapper.ScheduleMapper;
import com.saltedfish.service.ScheduleService;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService{
	@Autowired
	private ScheduleMapper schedulemapper;

	@Override
	public List<Schedule> selectSome(int curPage) {
		// TODO Auto-generated method stub
		return schedulemapper.selectSome(curPage);
	}
	
	@Override
	public int ScheduleCount(){
		// TODO Auto-generated method stub
		return schedulemapper.ScheduleCount();
	}
	
	@Override
	public int selectMidByName(String name) {
		// TODO Auto-generated method stub
		return schedulemapper.selectMidByName(name);
	}

	@Override
	public Schedule selectMovieByMid(int mid) {
		// TODO Auto-generated method stub
		return schedulemapper.selectMovieByMid(mid);
	}

//	@Override
//	public Schedule selectSeatByNumber(int number) {
//		// TODO Auto-generated method stub
//		return schedulemapper.selectSeatByNumber(number);
//	}

	@Override
	public List<Schedule> selectNumberByMid(int mid) {
		// TODO Auto-generated method stub
		return schedulemapper.selectNumberByMid(mid);
	}

	@Override
	public void insertSchedule(Integer mid,Integer hid,BigDecimal price,Timestamp begindatetime) {
		// TODO Auto-generated method stub 
		  int number = schedulemapper.selectMaxNumber()+1;
		schedulemapper.insertSchedule(mid,hid,number,price,begindatetime);
		for(int i=1;i<=5;i++){
			for(int j=1;j<=10;j++){
				schedulemapper.insertSeat(hid,number, "'"+i+"_"+j+"'");
			}
		}	
			
	}

	@Override
	public List<String> selectSeatByNumber(int number) {
		// TODO Auto-generated method stub
		return schedulemapper.selectSeatByNumber(number);
	}

	@Override
	public Schedule selectAllByNumber(int number) {
		// TODO Auto-generated method stub
		return schedulemapper.selectAllByNumber(number);
	}

	@Override
	public List<Picture> selectPictureBymid(int mid) {
		// TODO Auto-generated method stub
		return schedulemapper.selectPictureBymid(mid);
	}

	@Override
	public int selectMaxNumber() {
		// TODO Auto-generated method stub
		return schedulemapper.selectMaxNumber();
	}

	
	
	
	
	//↓↓↓管理员↓↓↓//
	@Override
	public List<Schedule> selectAll() {
		// TODO Auto-generated method stub
		return schedulemapper.selectAll();
	}

	@Override
	public void updateStateByScid(int mid) {
		// TODO Auto-generated method stub
		schedulemapper.updateStateByScid(mid);
	}



}
