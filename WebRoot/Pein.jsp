<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Pein.jsp' starting page</title>
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.list1{
	margin: 0;
    padding: 0;
}
.list1 ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #FF6600;
}
 
.list1 li {
    float: left;
}
 
.list1 li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
 

.list1 li a:hover {
    background-color: #111;
}

.box{ width:100%;
	  height:100%;
	  background-color:#D0D0D0;

  }
  .box0{
     width:900px;
	  height:400px;
	  position: absolute;
	left:25%;
	top:18%;
	background-color:#FFFFFF;
	box-shadow: 10px 10px 5px #888888;
	 border-radius:15px;      
  }
  .box1{width:250px;
	  height:300px;
	  position: absolute;
	left:5%;
	top:10%;
	
  
  }
  .box1 img{width: 100%;
    height: 100%;
    border-radius: 15px;
   
    }
  .box2{width:350px;
	  height:300px;
	  position: absolute;
	left:35%;
	top:10%;
	border: 2px solid #000000;
  
  }
  .box2 p{
    font-size:15px;
	font-weight:bold;}
  .xx{width:100%;height:0;
border-bottom:#000000 1px dashed;
}
.box2 input[type="submit"] {
    background-color:#555555; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin-top:40px;
    margin-left:25px;
}
.box2 input[type="submit"]:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}
</style>

  </head>
  
  <body>
   <div class="list1">
   <ul>
  <li><a href="main.jsp">主页</a></li>
  <li><a href="https://www.baidu.com">新闻</a></li>
  <li><a href="https://www.baidu.com">社区</a></li>
  <li><a href="https://www.baidu.com">帮助</a></li>
   <li style="float:right"><a class="active" href="index.html">登录/注册</a></li>
</ul>
</div>
   <div class="box">
   <div class="box0">
   <div class="box1"> <img src="images/30.png"> </div>
   <div class="box2">
   <p> 用户名：${sessionScope.uid}</p>
   <div class="xx"></div>
    <p> 邮箱：</p>
   <div class="xx"></div>
    <p> 个人信息：略</p>
   <div class="xx"></div>
   <input name="" type="submit" value="最近订单"  onclick="window.location.href='mycart' " /> 
   <input name="" type="submit" value="历史订单" onClick="window.location.href='myprecart'" /> 
   </div>
   </div>
   </div>

  </body>
</html>
