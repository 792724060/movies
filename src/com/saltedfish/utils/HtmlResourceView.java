package com.saltedfish.utils;

import java.io.File;
import java.util.Locale;

import org.springframework.web.servlet.view.InternalResourceView;

/**
 * 解析器类
 * @author sa
 *
 */
public class HtmlResourceView extends InternalResourceView{
	@Override  
    public boolean checkResource(Locale locale) {  
     File file = new File(this.getServletContext().getRealPath("/") + getUrl());  
     return file.exists();// 判断该页面是否存在  
	}
}
