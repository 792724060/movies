package com.saltedfish.entity;

public class Seat {
	
	@Override
	public String toString() {
		return "Seat [sid=" + sid + ", number=" + number + ", seat=" + seat + ", isActive=" + isActive + ", hall="
				+ hall + "]";
	}
	private int sid;
	private int number;
	private String seat;
	private String isActive;
	
	private Hall hall;
	
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getIsActive() {
		return isActive;
	}
	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
	public Hall getHall() {
		return hall;
	}
	public void setHall(Hall hall) {
		this.hall = hall;
	}
	
}
