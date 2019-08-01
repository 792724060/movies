package com.saltedfish.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.saltedfish.entity.Movie;

public interface MovieService {
	/**
	 * 插入电影
	 * @param movie
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	public boolean insertMovie(Movie movie,HttpServletRequest request);
	
	public List<Movie> selectAll();
}
