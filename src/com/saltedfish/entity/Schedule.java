package com.saltedfish.entity;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

public class Schedule {
	
	@Override
	public String toString() {
		return "Schedule [scid=" + scid + ", number=" + number + ", price=" + price + ", begindatetime=" + begindatetime
				+ ", movie=" + movie + ", hall=" + hall + ", seatList=" + seatList + "]";
	}
	private int scid;
	private int number;
	private BigDecimal price;
	private Timestamp begindatetime;
	private int state;
	
	private int hid;
	private List<Seat> seatList = null;
	
	private Movie movie;
	
	private Hall hall;
	

	
	public int getScid() {
		return scid;
	}
	public void setScid(int scid) {
		this.scid = scid;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public Timestamp getBegindatetime() {
		return begindatetime;
	}
	public void setBegindatetime(Timestamp begindatetime) {
		this.begindatetime = begindatetime;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	public Hall getHall() {
		return hall;
	}
	public void setHall(Hall hall) {
		this.hall = hall;
	}
	
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	public List<Seat> getSeatList() {
		return seatList;
	}
	public void setSeatList(List<Seat> seatList) {
		this.seatList = seatList;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
