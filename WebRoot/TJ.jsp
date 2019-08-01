<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'TJ.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">    
window.onload = function () {
var list=[];
<c:forEach items="${list}" var="item">
    var dt=Object()
    dt.label ="${item.schedule.movie.name}"
    dt.y=${item.amount}
    list.push(dt);
</c:forEach> 
			
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light1",//"light2", "dark1", "dark2"
	animationEnabled: false, // change to true		
	title:{
		text: "上映票房"
	},
	data: [
	{
		// Change type to "bar", "area", "spline", "pie",etc.
		type: "column",
		
		dataPoints: 
		   list
	}
	]
});
chart.render();

}
</script>
</head>
<body>
<div id="chartContainer" style="height: 800px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"> </script>
</body>
</html>
