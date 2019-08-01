package com.saltedfish.mapper;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.saltedfish.entity.Order;
import com.saltedfish.entity.User;

@Repository
public interface OrderMapper {
	//提交订单
	public void insertOrder(@Param("uid")String uid,@Param("hid") Integer hid,@Param("scid") Integer scid,@Param("tofp")String tofp,@Param("amount") BigDecimal amount);
	//获取用户订单
	public List<Order> selectOrderByUid(String uid);
	//获取用户历史订单
	public List<Order> selectPreOrderByUid(String uid);
	//获取用户历史时间段之间
	public List<Order> selectPreOrderByTime(@Param("uid") String uid,@Param("begintime")Timestamp begintime,@Param("endtime")Timestamp endtime);
	//更新订单退票信息
	public void updateStateByOid(int oid);
	//更新座位已被订信息
	public void updateActive(@Param("seat")String seat,@Param("number")int number);
	//更新退票座位返还
	public void dodateActive(@Param("seat")String seat);
	//获取用户订票时间
	public List<Date> selectTimeByUid(String uid);
	
	
    //↓↓↓管理员↓↓↓//
    //查询所有订单
	public List<Order> selectAllOrder();
	//获取票房
    public List<Order> sumAmountBYMid();
}
