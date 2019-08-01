<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'text1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/tasp.css" />
    <link href="css/orderconfirm.css" rel="stylesheet" />

  <style>
#page{width:auto;}
#comm-header-inner,#content{width:950px;margin:auto;}
#logo{padding-top:26px;padding-bottom:12px;}
#header .wrap-box{margin-top:-67px;}
#logo .logo{position:relative;overflow:hidden;display:inline-block;width:140px;height:35px;font-size:35px;line-height:35px;color:#f40;}
#logo .logo .i{position:absolute;width:140px;height:35px;top:0;left:0;background:url(http://a.tbcdn.cn/tbsp/img/header/logo.png);}
.box{width:100%;
	 height:46px;
	
}
.box input[type="text"]{
    outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 3px;
    padding: 13px 13px;
    width: 400px;
    font-size: 14px;
    font-weight: 700;
    font-family: "Microsoft soft";
    margin-left:20px;
}
.box input[type="text"]:focus{
    border-color: #66afe9;
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
}
.box input[type="submit"] {
    background-color:#555555; 
    border: none;
    color: white;
    padding: 13px 13px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
</style>
</head>
<body >
<div class="box">
<form action="sbecart" name="form" method="post">
 <input type="text" placeholder="输入查询用户" name="uid">
 <input type="submit" value="查询">
  <input type="submit" value="查询所有" onclick="document.form.action='allcart';document.form.submit()">
 </form>
</div>


<div id="page">

</div>
 <table  class="order-table" id="J_OrderTable" >
 <caption style="display: none">统一下单订单信息区域</caption>
 <thead>
 <tr>
 <th class="s-title">电影<hr/></th>
 <th class="s-price">单价<hr/></th>
 <th class="s-amount">数量<hr/></th>
 <th class="s-agio">影厅<hr/></th>
 <th class="s-agio">座位号<hr/></th>
 <th class="s-total">用户<hr/></th>
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
       ${list.tofp}
   </td>
 <td class="s-price">
          ${list.uid}
</td>
</tr>
</tbody>
</c:forEach>





<tr class="item-service">
 <td colspan="5" class="servicearea" style="display: none"></td>
</tr>

<tr class="blue-line" style="height: 2px;"><td colspan="5"></td></tr>
<tr class="other other-line">
 <td colspan="5">
 
 </td>
</tr>

<tr class="shop-total blue-line">
   
</tr>
</tbody>
  <tfoot>
 <tr>
 <td colspan="5">

<div class="order-go" data-spm="4">
<div class="J_AddressConfirm address-confirm">
 
 </div>

 <div class="J_confirmError confirm-error">
 </div>


 <div class="msg" style="clear: both;">
 
 </div>
 </div>
 </td>
 </tr>
 </tfoot>
 </table>

  
 <input type="hidden" id="J_useSelfCarry" name="useSelfCarry" value="false" />
 <input type="hidden" id="J_selfCarryStationId" name="selfCarryStationId" value="0" />
 <input type="hidden" id="J_useMDZT" name="useMDZT" value="false" />
 <input type="hidden" name="useNewSplit" value="true" />
 <input type="hidden" id="J_sellerIds" name="allSellIds" value="1704508670" />


<div id="footer"></div>

<div style="text-align:center;">
</div>
</body>
</html>
