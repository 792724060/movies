<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'XZ.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/XZ.css" type="text/css" media="all" />
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script src="js/layer-v3.1.1/layer/layer.js"></script>
	<style type="text/css">
	 ul{
list-style-type:none;}   
.wrap{width:100%; margin:20px auto; }
.hide{display:none;}
#tab_t{height:40px; brackground-color:#336699; color:#FFFFFF;}
#tab_t li{float:left; width:100px;
 height:60px; line-height:60px; 
 margin:0 4px; text-align:center;  border-bottom:none; background:#336699; cursor:pointer}
#tab_t .act{ position:relative; height:60px; margin-bottom:-1px; background:#fff; color:#336699;}
#tab_c{border:1px solid #ccc; border-top:none; padding:20px;  height:500px;}
#tab_c img{ width:450px; height:145px;}
.abc{ width:180px; height:90px; border:1px solid #000;margin-left:20px;margin-top:40px;float:left;}
.tab_d {width:119px; height:90px; background-color:#FFCC66; float:left; border-right:1px solid #000;color:#FF6600; text-align:center;
font-size:15px;}
.tab_e{width:59px;  height:90px; background-color:#FFCC66;float:right; color:#FF6600; text-align:center;line-height:90px;font-size:20px;}
 .tab_d h2{  font-size:20px;color:#FF6600;  }
 </style>
  </head>
    <script>
 $(function s(){
        var uid="${empty sessionScope.uid}"
           if( uid == "true" ){
               $("#log").show();
               $("#user").hide();
               $("#logout").hide();
           }
           else {
                $("#log").hide();
                $("#user").show();
                $("#logout").show();
            }
            })
</script>
<script language=javascript>      
function Logout(){
layer.msg('是否注销？', {
  time: 0 //不自动关闭
  ,btn: ['注销', '不注销']
  ,yes: function(index){
    layer.close(index);
    window.location.href="logout"
  }
});
}
</script>
  <body>
    <div class="list">
   <ul>
  <li><a href="main.jsp">主页</a></li>
  <li><a href="https://www.baidu.com">新闻</a></li>
  <li><a href="https://www.baidu.com">社区</a></li>
  <li><a href="https://www.baidu.com">帮助</a></li>
  <li style="float:right" ><a class="active"  id="log" href="ID.html">登录/注册</a></li>
   <li style="float:right"><a class="active" id="user" href="Pein.jsp">${sessionScope.uid}</a></li>
   <li style="float:right" ><a class="active"  id="logout" onclick="Logout()">注销</a></li>
</ul>
</div>
<div class="box">
<div class="box0">
<div class="box1">
<div class="box11">
<img alt="" src="${sche.movie.picture}">
<p>上映：2019年5月24日<br>
类型：${sche.movie.type}<br>
时长：${sche.movie.duration} </p>
 			</div>
</div>
<div class="box2">
<h1>${sche.movie.name}(<fmt:formatDate value="${sche.begindatetime}" pattern="yyyy"/>)</h1> 
<h2>${sche.movie.engname}</h2>
<p>${sche.movie.duration}-${sche.movie.type}-2019年中国上映-3D/IMAX3D/中国巨幕</p> 
          <c:set var="three" value="<%=new Date( new Date().getTime()+2*24*60*60*1000)%>"></c:set>
          <c:set var="four" value="<%=new Date( new Date().getTime()+3*24*60*60*1000)%>"></c:set>
<div class="bax">
<div class="wrap">

    <ul id="tab_t">
        <li class="act">今天</li>
        <li>明天</li>
        <li><fmt:formatDate value="${three}" pattern="MM月dd日"/></li>
        <li><fmt:formatDate value="${four}" pattern="MM月dd日"/></li>
    </ul>
    </div>
    
    <c:set var="nowDate" value="<%=new Date().getTime()%>"></c:set>
         <div id="container">
 <section class="tab_c" >
    <c:forEach var="list" items="${list}">
    <c:if test="${list.begindatetime.time - nowDate < 86400000 && list.begindatetime.time - nowDate > 0}">
        <a href="number.do?number=${list.number}&name=${sche.movie.name}"> <div class="abc"> 
        <div class="tab_d">  <h2><fmt:formatDate value="${list.begindatetime}" pattern="HH:mm"/></h2> ${list.price}RMB
        </div>
        <div class="tab_e">购票</div></div></a>
        </c:if>
   </c:forEach>
        </section>
 <section class="tab_c" >   <c:forEach var="list" items="${list}">
    <c:if test="${list.begindatetime.time - nowDate < 172800000  && list.begindatetime.time - nowDate > 86400000}">
        <a href="number.do?number=${list.number}&name=${sche.movie.name}"> <div class="abc"> 
        <div class="tab_d">  <h2><fmt:formatDate value="${list.begindatetime}" pattern="HH:mm"/></h2> ${list.price}RMB
        </div>
        <div class="tab_e">购票</div></div></a>
        </c:if>
   </c:forEach></section>
 <section class="tab_c" >   <c:forEach var="list" items="${list}">
    <c:if test="${list.begindatetime.time - nowDate < 259200000 && list.begindatetime.time - nowDate > 172800000}">
        <a href="number.do?number=${list.number}&name=${sche.movie.name}"> <div class="abc"> 
        <div class="tab_d">  <h2><fmt:formatDate value="${list.begindatetime}" pattern="HH:mm"/></h2> ${list.price}RMB
        </div>
        <div class="tab_e">购票</div></div></a>
        </c:if>
   </c:forEach></section>
 <section class="tab_c" style="background-color: gold">   <c:forEach var="list" items="${list}">
    <c:if test="${list.begindatetime.time - nowDate < 345600000 && list.begindatetime.time - nowDate > 259200000}">
        <a href="number.do?number=${list.number}&name=${sche.movie.name}"> <div class="abc"> 
        <div class="tab_d">  <h2><fmt:formatDate value="${list.begindatetime}" pattern="HH:mm"/></h2> ${list.price}RMB
        </div>
        <div class="tab_e">购票</div></div></a>
        </c:if>
   </c:forEach></section>
        

 </div>
</div>
</div>
</div>
</div>
<script>
 window.onload=function () {
 var nav=document.getElementById('tab_t');
 var oNav=nav.getElementsByTagName('li');
 
 var container=document.getElementById('container');
 var oDiv=container.getElementsByClassName('tab_c');
 for(var i=0;i<oNav.length;i++){
  oNav[i].index=i;
  oNav[i].onclick=function () {
  for(var i=0;i<oNav.length;i++){
   oNav[i].className='';
   oDiv[i].style.display="none";
  }
  this.className='act';
  oDiv[this.index].style.display="block"
  }
  for(var m=1;m<oNav.length;m++){
   oNav[m].className='';
   oDiv[m].style.display="none";
  }
 }
 };
</script>


  </body>
</html>
