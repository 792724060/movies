<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form action="doRegist" method="post">
	用户名：<input id="uid" name="uid" type="text"><br/>
	密码：<input id="pass" name="pass" type="password"><br/>
	再次输入密码：<input id="password" name="password" type="password"><br/>
	姓名：<input id="name" name="name" type="text"><br/>
	邮箱：<input id="email" name="email" type="text"><br/>
	<input type="submit" value="注册">
	</form>
  </body>
</html>
