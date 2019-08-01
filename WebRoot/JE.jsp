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
    
    <title>My JSP 'JE.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/JE.css" type="text/css" media="all" />
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="js/layer-v3.1.1/layer/layer.js"></script>
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
<button class="loginto_to" type="submit" name="login" onclick="window.location.href='movies?mid=${sche.movie.mid}'">  
 			选座购票</button>  
 			</div>
</div>
<div class="box2">
<h1>${sche.movie.name}(<fmt:formatDate value="${sche.begindatetime}" pattern="yyyy"/>)</h1>
<h2> ${sche.movie.engname}</h2>
<p>${sche.movie.duration}-${sche.movie.type}-2019年中国上映-3D/IMAX3D/中国巨幕</p>
<div class="list1">
   <ul>
  <li><a href="https://www.baidu.com">13个视频</a></li>
  <li><a href="https://www.baidu.com">40张图片</a></li>
  <li><a href="https://www.baidu.com">243个演员</a></li>
  <li><a href="https://www.baidu.com">200条影评</a></li>
  <li><a href="https://www.baidu.com">41条新闻</a></li>
 </ul>
 <div class="gs"> 导演：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${sche.movie.director}</div><div class="xx"></div>
 <div class="gs"> 演员：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${sche.movie.mainactor}</div><div class="xx"></div>
 <div class="gs"> 国家地区：${sche.movie.country}</div><div class="xx"></div>
 <div class="gs"> 发行公司：${sche.movie.corporation}</div> <div class="xx"></div>

<div class="gs">剧情：</div>
  ${sche.movie.description}
</div>
</div>
<div class="jz"> 
<c:forEach var="pict" items="${pict}">
<div class="jz1"><img alt="" src="${pict.picture}"></div>
</c:forEach>
</div>
</div>
</div>
  </body>
</html>
