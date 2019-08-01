package com.saltedfish.entity;

public class Movie {
	
	
	@Override
	public String toString() {
		return "Movie [mid=" + mid + ", type=" + type + ", name=" + name + ", engname=" + engname + ", country="
				+ country + ", mainactor=" + mainactor + ", director=" + director + ", corporation=" + corporation
				+ ", duration=" + duration + ", description=" + description + ", picture=" + picture + ", schedule="
				+ schedule + "]";
	}
	private int mid;
	private String type;
	private String name;
	private String engname;
	private String country;
	private String mainactor;
	private String director;
	private String corporation;
	private String duration;
	private String description;
	private String picture;
	
	private Schedule schedule;
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEngname() {
		return engname;
	}
	public void setEngname(String engname) {
		this.engname = engname;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getMainactor() {
		return mainactor;
	}
	public void setMainactor(String mainactor) {
		this.mainactor = mainactor;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getCorporation() {
		return corporation;
	}
	public void setCorporation(String corporation) {
		this.corporation = corporation;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Schedule getSchedule() {
		return schedule;
	}
	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}
}
