package com.saltedfish.entity;

public class Hall {
    
	@Override
	public String toString() {
		return "Hall [hid=" + hid + ", seats=" + seats + ", description=" + description + "]";
	}
	private int hid;
	private int seats;
	private String description;
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	public int getSeats() {
		return seats;
	}
	public void setSeats(int seats) {
		this.seats = seats;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
