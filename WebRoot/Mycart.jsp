<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Mycart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link rel="stylesheet" href="css/tasp.css" />
<link href="css/orderconfirm.css" rel="stylesheet" />
<script src="//cdn.staticfile.org/jquery/1.12.3/jquery.min.js"></script>
<script src="js/layer-v3.1.1/layer/layer.js"></script>


  <style>
#page{width:auto;}
#comm-header-inner,#content{width:950px;margin:auto;}
#logo{padding-top:26px;padding-bottom:12px;}
#header .wrap-box{margin-top:-67px;}
#logo .logo{position:relative;overflow:hidden;display:inline-block;width:140px;height:35px;font-size:35px;line-height:35px;color:#f40;}
#logo .logo .i{position:absolute;width:140px;height:35px;top:0;left:0;background:url(http://a.tbcdn.cn/tbsp/img/header/logo.png);}
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
        </style>
        

</head>

<script type="text/javascript">
    
    function getIntervalHour(startDate, endDate) {
            var ms = endDate - startDate.getTime();
            if (ms < 0) return 0;
            return Math.floor(ms/1000/60/60);
        }
      function  GetDateDiff(end,oid,tofp){
            var startDate = new Date();
            end = end.substring(0,19);    
            end = end.replace(/-/g,'/'); 
            var endDate = new Date(end).getTime();
            //endDate.setMonth(endDate.getMonth()+1);
            if(getIntervalHour(startDate,endDate)<1){   
           layer.alert('上映前一个小时不许退票', {
            title:"提示",
        icon:5,
        });
            }else{
            layer.confirm('是否退票', {
         btn: ['是','否'] //按钮
           }, function (){
            window.location.href="orderstate?oid="+oid+"&tofp="+tofp; 
          }, function(){
              layer.close();
          });
            }
        }
    </script>
<body data-spm="1">
<div class="list1">
   <ul>
  <li><a href="main.jsp">主页</a></li>
  <li><a href="https://www.baidu.com">新闻</a></li>
  <li><a href="https://www.baidu.com">社区</a></li>
  <li><a href="https://www.baidu.com">帮助</a></li>
   <li style="float:right" ><a class="active"  id="log" href="Pein.jsp">返回</a></li>
</ul>
</div>

<div id="page">

</div>

 <h3 class="dib">您的订单</h3>
 <table  class="order-table" id="J_OrderTable" >
 <caption style="display: none">统一下单订单信息区域</caption>
 <thead>
 <tr>
 <th class="s-title">电影<hr/></th>
 <th class="s-price">单价(元)<hr/></th>
 <th class="s-amount">数量<hr/></th>
 <th class="s-agio">影厅<hr/></th>
 <th class="s-agio">座位号<hr/></th>
  <th class="s-agio">电影开始时间<hr/></th>
   <th class="s-agio">订票时间<hr/></th>
 <th class="s-total">共计(元)<hr/></th>
  <th class="s-agio">退票<hr/></th>
 </tr>
 </thead>
     



<c:forEach var="list" items="${list}">
<tbody data-spm="3" class="J_Shop" data-tbcbid="0" data-outorderid="47285539868"  data-isb2c="false" data-postMode="2" data-sellerid="1704508670">
<tr class="shop blue-line">  
</tr>
 <tr class="item" data-lineid="19614514619:31175333266:35612993875" data-pointRate="0">
 
 <td class="s-title"> ${list.schedule.movie.name} </td>
   
 <td class="s-price">
         ${list.schedule.price}元
</td>

 <td class="s-amount" data-point-url="">
${list.amount / list.schedule.price}张
 </td>
 <td class="s-agio">
       ${list.hid}厅
   </td>
   <td class="s-agio">
   <c:set var="tofp" value='${fn:replace(list.tofp,"\'","")}'></c:set>
   <c:set var="tofp" value='${fn:replace(tofp,"_","排")}'></c:set>
   <c:set var="tofp" value='${fn:replace(tofp,",","座-")}'></c:set>
   ${tofp}
   </td>
   <td class="s-agio">
   <fmt:formatDate value="${list.schedule.begindatetime}" pattern="YYYY-MM-dd HH:mm"/>
   </td>
 <td class="s-agio">
   <fmt:formatDate value="${list.orderdate}" pattern="YYYY-MM-dd HH:mm:ss"/>
 </td>
 <td class="s-agio">
  ${list.amount}
 </td>	
 <td class="s-agio">
   <c:if test="${list.state == 1}">
	 <c:set var="temp_param" value='${fn:replace(list.tofp,"\'","\\\\\'" )}' /> 
   <input type="submit" onclick="GetDateDiff('${list.schedule.begindatetime}','${list.oid}','${temp_param}')"value="退票" > 
   </c:if>
   <c:if test="${list.state == 0}">
     已退票
   </c:if>
 </td>
</tr>
</tbody>
</c:forEach>
