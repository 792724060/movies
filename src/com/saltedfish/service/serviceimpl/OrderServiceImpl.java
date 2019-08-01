package com.saltedfish.service.serviceimpl;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltedfish.entity.Order;
import com.saltedfish.entity.User;
import com.saltedfish.mapper.OrderMapper;
import com.saltedfish.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements  OrderService{

	@Autowired
	private OrderMapper ordermapper;

	@Override
	public void insertOrder(String uid,Integer hid,Integer scid,String tofp,BigDecimal amount,int number) {
		// TODO Auto-generated method stub
		String[] to = tofp.split(",");
		for(int i=0;i<to.length;i++){
			ordermapper.updateActive(to[i],number);
		}
		ordermapper.insertOrder(uid, hid,scid,tofp,amount);
	}

	@Override
	public List<Order> selectOrderByUid(String uid) {
		return ordermapper.selectOrderByUid(uid);
	
	}

	@Override
	public List<Order> selectPreOrderByUid(String uid) {
		// TODO Auto-generated method stub
		return ordermapper.selectPreOrderByUid(uid);
	}

	@Override
	public List<Order> selectPreOrderByTime(String uid, String begin, String end) {
		// TODO Auto-generated method stub
		begin+=" 00:00:00";
		end+=" 00:00:00";
		Timestamp begintime = Timestamp.valueOf(begin);
		Timestamp endtime = Timestamp.valueOf(end);
		return ordermapper.selectPreOrderByTime(uid, begintime, endtime);
	}
	
	@Override
	public void updateStateByOid(int oid,String tofp) {
		// TODO Auto-generated method stub
		String[] to = tofp.split(",");
		for(int i=0;i<to.length;i++){
			ordermapper.dodateActive(to[i]);
		}
		ordermapper.updateStateByOid(oid);
	}
	@Override
	public List<Order> selectAllOrder() {
		// TODO Auto-generated method stub
		return ordermapper.selectAllOrder();
	}

	@Override
	public Boolean CheckTime(String uid,Timestamp begindatetime) {
		// TODO Auto-generated method stub
		List<Date> time = ordermapper.selectTimeByUid(uid);
		Date times = begindatetime;
		for(int i = 0 ; i   < time.size() ; i++){
			long  miao=Math.abs((time.get(i).getTime()-times.getTime())/1000);//除以1000是为了转换成秒 
			System.out.println("miao"+miao);
			long  fen=miao/60;
			if(fen<=150){
				return true;
			}
		}
		return false;
	}

	@Override
	public List<Order> sumAmountBYMid() {
		// TODO Auto-generated method stub
		return ordermapper.sumAmountBYMid();
	}


}
