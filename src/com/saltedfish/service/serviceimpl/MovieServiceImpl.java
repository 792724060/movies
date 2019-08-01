package com.saltedfish.service.serviceimpl;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.saltedfish.entity.Movie;
import com.saltedfish.mapper.MovieMapper;
import com.saltedfish.service.MovieService;

@Service("movieService")
public class MovieServiceImpl implements MovieService{
	@Autowired
	private MovieMapper moviemapper;

	@Override
	public boolean insertMovie(Movie movie,HttpServletRequest request){
		// TODO Auto-generated method stub
		CommonsMultipartResolver multipartResolver =new CommonsMultipartResolver(request.getSession().getServletContext());
		//检查form中是否有enctype="multipart/form-data"
		if(multipartResolver.isMultipart(request))
		{
			//将request变成多部分的request;
			MultipartHttpServletRequest multiRequest =(MultipartHttpServletRequest) request;
			//获取multiRequest中所有文件名
			Iterator iter=multiRequest.getFileNames();
			while(iter.hasNext())
            {
                //一次遍历所有文件
                MultipartFile file=multiRequest.getFile(iter.next().toString());
                if(file!=null)
                {
                    String path="/Users/sa/Workspaces/MyEclipse 2017 CI/movies/WebRoot/images";  //绝对路径                  
                    //request.getSession().getServletContext().getRealPath("/WebRoot/imgages");   //相对路径
                    //上传
                    File file1 = new File(path,file.getOriginalFilename());
                    try {
						file.transferTo(file1);
	                    movie.setPicture("images/"+file.getOriginalFilename());
	                    moviemapper.insertMovie(movie);
	                    return true;
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						return false;
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						return false;
					}
                }
            }
		}
		return false;
	}

	@Override
	public List<Movie> selectAll() {
		// TODO Auto-generated method stub
		return moviemapper.selectAll();
	}



}
