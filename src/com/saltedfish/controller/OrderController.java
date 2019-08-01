package com.saltedfish.controller;


import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.saltedfish.entity.Order;
import com.saltedfish.service.OrderService;


@Controller
public class OrderController {
	@Autowired
	private OrderService orderservice;

	/**
	 * 提醒用户 时间冲突
	 * @param begindatetime 电影开始时间
	 * @param session 存着用户id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("checktime")
	public String CheckTime( Timestamp begindatetime,HttpSession session){
		String uid = ((String)session.getAttribute("uid"));
		if(orderservice.CheckTime(uid,begindatetime)){
			return "1";
		}else{
			return "0";
		}
	}
	
	/**
	 * 提交订单
	 * @param session 存着用户id
	 * @param hid 影厅id
	 * @param scid 排片id
	 * @param tofp 座位号
	 * @param amount 总价
	 * @return
	 */
	@RequestMapping("submit")
	public String InsertOrder(HttpSession session,Integer hid,Integer scid,String tofp,BigDecimal amount,int number){
		    String uid = ((String)session.getAttribute("uid"));
			orderservice.insertOrder(uid,hid,scid,tofp,amount,number);
		return "redirect:mycart";
	}
	
	/**
	 * 查询用户 订单
	 * @param session 存着用户id
	 * @param mv
	 * @return
	 */
	@RequestMapping("mycart")
	public ModelAndView MyCart(HttpSession session,ModelAndView mv){
		String uid = ((String)session.getAttribute("uid"));
		List<Order> list = orderservice.selectOrderByUid(uid);
		mv.addObject("list", list);
		mv.setViewName("Mycart");
		return mv;
	}
	
	@RequestMapping("orderstate")
	public String OrderState(int oid,String tofp){
		orderservice.updateStateByOid(oid,tofp);
		return "redirect:mycart";
	}
	
	/**
	 * 查询用户 历史订单
	 * @param session 存着用户id
	 * @param mv
	 * @return
	 */
	@RequestMapping("myprecart")
	public ModelAndView MyPreCart(HttpSession session,ModelAndView mv){
		String uid = ((String)session.getAttribute("uid"));
		List<Order> list = orderservice.selectPreOrderByUid(uid);
		mv.addObject("list", list);
		mv.setViewName("Myprecart");
		return mv;
	}
	
	//begintime=2019-06-06 00:00:00&endtime=2019-06-08 00:00:00
	@RequestMapping("timequantum")
	public ModelAndView TimeQuantum(HttpSession session,ModelAndView mv,String begintime,String endtime){
		String uid = ((String)session.getAttribute("uid"));
		List<Order> list = orderservice.selectPreOrderByTime(uid, begintime, endtime);
		mv.addObject("list", list);
		mv.setViewName("Myprecart");
		return mv;
	}
	
	//↓管理员↓//
	
	/**
	 * 管理员 查询所有订单
	 * @param mv
	 * @return
	 */
	@RequestMapping("allcart")
	public ModelAndView AllCart(ModelAndView mv){
		List<Order> list = orderservice.selectAllOrder();
		mv.addObject("list", list);
		mv.setViewName("text1");
		return mv;
	}
	
	/**
	 * 管理员 查询票房
	 * @param mv
	 * @return
	 */
	@RequestMapping("sum")
	public ModelAndView Sum(ModelAndView mv){
		List<Order> list = orderservice.sumAmountBYMid();
		mv.addObject("list", list);
		mv.setViewName("TJ");
		return mv;
	}
	
	@RequestMapping("sbecart")
	public ModelAndView SomeBodyecart(String uid,ModelAndView mv){
		List<Order> list = orderservice.selectOrderByUid(uid);
		mv.addObject("list", list);
		mv.setViewName("text1");
		return mv;
	}
}
