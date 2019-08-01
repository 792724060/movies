package com.saltedfish.service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;


import com.saltedfish.entity.Order;
import com.saltedfish.entity.User;

public interface OrderService {
	
	public void insertOrder(String uid,Integer hid,Integer scid,String tofp,BigDecimal amount,int number);
//	
//	public void updateActive(String seat,int number);
//	
	public List<Order> selectOrderByUid(String uid);
	
	public List<Order> selectPreOrderByUid(String uid);
	
	public List<Order> selectPreOrderByTime(String uid,String begin,String end);
	
	public void updateStateByOid(int oid,String tofp);
	
	
	public List<Order> selectAllOrder();

	public Boolean CheckTime(String uid,Timestamp begindatetime);
	
    public List<Order> sumAmountBYMid();

}
