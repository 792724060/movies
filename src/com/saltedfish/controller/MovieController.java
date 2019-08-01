package com.saltedfish.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.saltedfish.entity.Movie;
import com.saltedfish.service.MovieService;

@Controller
public class MovieController {
	@Autowired
	private MovieService movieservice;
	
	@RequestMapping("/view")
	public ModelAndView SelectAllMovie(ModelAndView mv){
		List<Movie> list = movieservice.selectAll();
		mv.addObject("list",list);
		mv.setViewName("movie");
		return mv;
	}
	
	/*@RequestMapping
	public ModelAndView SelectMovie(ModelAndView mv,int mid){
		Movie movie = movieservice.selectMovieByMid(mid);
		mv.addObject("movie",movie);
		return mv;
	}*/
	
	/**
	 * 插入电影
	 * @param movie 电影
	 * @param mv
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("/insertMovie")
	public ModelAndView insertMovie(Movie movie,ModelAndView mv,HttpServletRequest request) throws IllegalStateException, IOException{
		if(movieservice.insertMovie(movie, request)){
			mv.addObject("msg", "插入成功");
		}
		mv.addObject("msg", "插入失败");
		mv.setViewName("text3");
		return mv;
	}
	
	
	
	

	
}
