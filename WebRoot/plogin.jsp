<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'tlogin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	  <link rel="stylesheet" type="text/css" href="css/style.css">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/vector.js"></script>
    <script src="js/layer-v3.1.1/layer/layer.js"></script>
  </head>
  
  <body>
    <div id="container">
	<div id="output">
		<div class="containerT">
			<h1>发布管理员</h1>
			<form action="plogin" method="post">
	<input name="username" type="text" placeholder="用户名"><br/>
	<input name="password" type="password" placeholder="密码"><br/>
	      <input type="submit" value="登录">
				<div id="prompt" class="prompt"></div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
    $(function(){
        Victor("container", "output");   //登录背景函数
        $("#entry_name").focus();
        $(document).keydown(function(event){
            if(event.keyCode==13){
                $("#entry_btn").click();
            }
        });
    var msg="${msg}"
    if( msg == "账号或密码错误"){
      layer.alert(msg,{
          title:"提示",
          icon:5, 
        });
     }
    });
</script>
  </body>
</html>
