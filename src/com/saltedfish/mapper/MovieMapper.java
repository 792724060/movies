package com.saltedfish.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.saltedfish.entity.Movie;

@Repository
public interface MovieMapper {
	//插入电影基本信息
	public void insertMovie(Movie movie);
		
		
		
	//加载全部电影信息
	public List<Movie> selectAll();
	//通过Mid获取Movie信息
	public Movie selectMovieByMid(int mid);
}
