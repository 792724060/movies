package com.saltedfish.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Order {
	@Override
	public String toString() {
		return "Order [oid=" + oid + ", orderdate=" + orderdate + ", tofo=" + tofp + ", amount=" + amount + ", user="
				+ user + ", schedule=" + schedule + "]";
	}
	private int oid;
	private Timestamp orderdate;
	private String tofp;
	private BigDecimal amount;
	private int state;
	
	private String uid;
	private int hid;
	
	private User user;
	
	private Schedule schedule;
	
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public Timestamp getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Timestamp orderdate) {
		this.orderdate = orderdate;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getTofp() {
		return tofp;
	}
	public void setTofp(String tofp) {
		this.tofp = tofp;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Schedule getSchedule() {
		return schedule;
	}
	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}
}
