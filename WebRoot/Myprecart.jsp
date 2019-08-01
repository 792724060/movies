<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script type="text/javascript" src="http://s.59pi.com/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="http://s.59pi.com/js/jquery/laydate/laydate.js"></script>
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
<body >
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

 <h3 class="dib">订单查找 </h3>
 <form action="timequantum" method="post">
    <input class="laydate-icon" name="begintime" value="" placeholder="请输入日期" id="start" type="text">
    <span> - </span>
    <input class="laydate-icon" name="endtime" value="" placeholder="请输入日期" id="end" type="text">
    <input type="submit" value="提交">
    </form>
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
   <th class="s-agio">是否观看<hr/></th>
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
   ${list.schedule.begindatetime}
   </td>
 <td class="s-agio">
  ${list.orderdate}
 </td>
 <td class="s-agio">
  ${list.amount}
  <td class="s-agio">
   <c:if test="${list.state == 1}">
     已观看
   </c:if>
   <c:if test="${list.state == 0}">
     已退票
   </c:if>
 </td>
</tr>
</tbody>
</c:forEach>
</table>
<script type="text/javascript">
      var start = {
       elem: '#start', //id为star的输入框
       format: 'YYYY-MM-DD', 
       max: laydate.now(), //最大日期
       istime: true,
       istoday: false,
       choose: function(datas){
        var now = new Date(laydate.now().replace("-", "-")); //当前日期的date格式
        var add=new Date(datas.replace("-", "-")); //选择的日期
        add= new Date(add.getTime() + 365*24*60*60*1000); //在选择的日期+30天
        if((now.getMonth() + 1)<(add.getMonth() + 1)){ //如果当前月份小于选择月份
            end.max = laydate.now();  //结束日的最大日期为当前日期
        }else if ((now.getMonth() + 1)==(add.getMonth() + 1) &&  now.getDate()<add.getDate()) {
            end.max = laydate.now();//月份相同且当前日小于选择日
        }
        else {
            add=add.getFullYear() + "-" + (add.getMonth() + 1) + "-"+ add.getDate();//转换日期格式
            end.max = add;//结束日的最大日期为选择的日期+30天
        }  
        end.min = datas;//开始日选好后，重置结束日的最小日期
      }
    };
    var end = {
      elem: '#end',
      format: 'YYYY-MM-DD',
      max: laydate.now(),
      istime: true,
      istoday: false,
      choose: function(datas){
        var min=new Date(datas.replace("-", "-")); 
        min= new Date(min.getTime() - 365*24*60*60*1000); //在日期-30天。
        min=min.getFullYear() + "-" + (min.getMonth() + 1) + "-"+ min.getDate(); 
        start.max = datas; //结束日选好后，重置开始日的最大日期
        start.min = min;
      }
    };
    laydate(start);
    laydate(end);
</script>
</body>
