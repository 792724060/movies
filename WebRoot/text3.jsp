<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'text3.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="js/layer-v3.1.1/layer/layer.js"></script>

  <style type="text/css">
body{
font-family: Tahoma,Verdana, Arial, Helvetica, sans-serif;
font-size:15px;
}
p, h1, form, button{border:0; margin:0; padding:0;}
.spacer{clear:both; height:1px;}
/* ———– My Form ———– */
.myform{
margin:0 auto;
width:400px;
padding:14px;
}
/* ———– stylized ———– */
#stylized{
border:solid 2px #b7ddf2;
background:#ebf4fb;
}
#stylized h1 {
font-size:16px;
font-weight:bold;
margin-bottom:8px;
}
#stylized p{
font-size:12px;
color:#666666;
margin-bottom:20px;
border-bottom:solid 1px #b7ddf2;
padding-bottom:10px;
}
#stylized label{
display:block;
font-weight:bold;
text-align:right;
width:140px;
float:left;
}
#stylized .small{
color:#666666;
display:block;
font-size:11px;
font-weight:normal;
text-align:right;
width:140px;
}
#stylized input{
float:left;
font-size:15px;
padding:4px 2px;
border:solid 1px #aacfe4;
width:200px;
margin:2px 0 20px 10px;
}
#stylized .sub{
clear:both;
margin-left:150px;
width:120px;
height:32px;
line-height:20px;
border:1px solid #8b9c56;
background:url("../images/bt_bg.gif") 0px -64px;
text-align:center;
color:#336600;
font-size:15px;
font-weight:bold;
cursor:pointer;
}
.red{
color:#ff0000;
}
.blue{
color:#0000FF;
}
</style>
</head>
<body>
<div id="stylized" class="myform">
<form method="post" enctype="multipart/form-data" name="fm">
<h1>电影录入</h1>
<p>副标题以及需要<span class="red">注意的 </span> 和 <span class="blue">醒目的 </span>事项</p>
<label>电影名
</label>
<input type="text" name="name" id=""  />

<label>别名</label>
<input type="text" name="engname" id=""  />

<label>电影简介</label>
<input type="text" name="description" id=""  />

<label>导演
</label>
<input type="text" name="director" id=""  />

<label>类型
</label>
<input type="text" name="type" id=""  />
<label>国家
</label>
<input type="text" name="country" id=""  />

<label>主演</label>
<input type="text" name="mainactor" id=""  />

<label>发行公司</label>
<input type="text" name="corporation" id=""  />

<label>时长</label>
<input type="text" name="duration" id="" />


<label>上传</label>
<input type="file" name="file">

<input class="sub" type="button" value="提交" onclick="insertMovie()"/>
<div class="spacer"></div>
</form>
</div>
<script>
$(function (){
    var msg="${msg}"
    if( msg == "插入失败"){
      layer.alert(msg,{
          title:"提示",
          icon:5, 
        });
        }
        if( msg == "插入成功"){
      layer.alert(msg,{
          title:"提示",
          icon:5, 
        });
        }
})
</script>
<script>
function insertMovie(){
    document.fm.action="insertMovie";
    fm.submit();
}
</script>

</body>
</html>
