<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'seat.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link rel="stylesheet" type="text/css" href="css/jq22.css" />
	 <link rel="stylesheet" href="css/qieh.css" type="text/css" media="all" />
	 <script src="//cdn.staticfile.org/jquery/1.12.3/jquery.min.js"></script>
	 <script src="http://www.jq22.com/jquery/1.9.1/jquery.min.js"></script>
     <script type="text/javascript" src="js/jquery.seat-charts.min.js"></script>
     <script type="text/javascript" src="../js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
    <script src="js/layer-v3.1.1/layer/layer.js"></script>
  </head>
        <style type="text/css">

            .front{width: 300px;margin: 5px 32px 45px 32px;background-color: #f0f0f0;	color: #666;text-align: center;padding: 3px;border-radius: 5px;}

            .booking_area {float: right;position: relative;width:200px;height: 450px; }

            .booking_area h3 {margin: 5px 5px 0 0;font-size: 16px;}

            .booking_area p{line-height:26px; font-size:16px; color:#999}

            .booking_area p span{color:#666}

            div.seatCharts-cell {color: #182C4E;height: 25px;width: 25px;line-height: 25px;margin: 3px;float: left;text-align: center;outline: none;font-size: 13px;}

            div.seatCharts-seat {color: #fff;cursor: pointer;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;}

            div.seatCharts-row {height: 35px;}

            div.seatCharts-seat.available {background-color: #B9DEA0;}

            div.seatCharts-seat.focused {background-color: #76B474;border: none;}

            div.seatCharts-seat.selected {background-color: #E6CAC4;}

            div.seatCharts-seat.unavailable {background-color: #472B34;cursor: not-allowed;}

            div.seatCharts-container {border-right: 1px dotted #adadad;width: 400px;padding: 20px;float: left;}

            div.seatCharts-legend {padding-left: 0px;position: absolute;bottom: 16px;}

            ul.seatCharts-legendList {padding-left: 0px;}

            .seatCharts-legendItem{float:left; width:90px;margin-top: 10px;line-height: 2;}

            span.seatCharts-legendDescription {margin-left: 5px;line-height: 30px;}

            .checkout-button {display: block;width:80px; height:24px; line-height:20px;margin: 10px auto;border:1px solid #999;font-size: 14px; cursor:pointer}

            #seats_chose {max-height: 150px;overflow-y: auto;overflow-x: none;width: 200px;}

            #seats_chose li{float:left; width:72px; height:26px; line-height:26px; border:1px solid #d3d3d3; background:#f7f7f7; margin:6px; font-size:14px; font-weight:bold; text-align:center}

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
<script language=javascript>
 function Checktime(){
      var begindatetime = "${sche.begindatetime}";
   $.ajax({
      url:"checktime",
      type:"get",
      data:"begindatetime="+begindatetime,
      success:function (msg) {
      if(msg==1){
      layer.confirm('您有其他订单在这时间段', {
         btn: ['继续购买','取消购买'] //按钮
      }, function (){
           Remind(tofp);
      }, function(){
           layer.close();
      });
     }else if(msg==0){
          Remind(); 
     }
}
}) 
}
</script>

<script language=javascript>      
function Remind(){
 var tofp = document.getElementById("seats_chose").innerText;
if(tofp != ""){
  layer.confirm('是否提交订单', {
  btn: ['是','否'] //按钮
}, function (){
    document.form.action="submit"   //form为form表单的名字name
    document.form.submit()
}, function(){
   layer.close();
});
}else{
      layer.alert("请选择座位",{
          time:2000,
          title:"提示",
          icon:5, 
        });
}
}

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
<div class="list1">
   <ul>
  <li><a href="main.jsp">主页</a></li>
  <li><a href="https://www.baidu.com">新闻</a></li>
  <li><a href="https://www.baidu.com">社区</a></li>
  <li><a href="https://www.baidu.com">帮助</a></li>
   <li style="float:right"><a class="active" id="user" href="Pein.jsp">${sessionScope.uid}</a></li>
   <li style="float:right" ><a class="active"  id="logout" onclick="Logout()">注销</a></li>
</ul>
</div>


        <div class="container">

          <h2 class="title"><a href="http://www.jq22.com/jquery-info2692">影院在线选座</a></h2>

            <div class="demo clearfix">

                <!---左边座位列表----->

                <div id="seat_area">

                    <div class="front">屏幕</div>					

                </div>

                <!---右边选座信息----->

                <div class="booking_area">

                    <p>电影：<span> ${name}</span></p>

                    <p>时间：<span><fmt:formatDate value="${requestScope.sche.begindatetime}" pattern="MM-dd HH:mm"/></span></p>
                    
                    <p>影厅：<span> ${sche.seatList[1].hall.hid} 厅</span></p>
                    <p>座位：</p>
                    <ul id="seats_chose"></ul>

                    <p>票数：<span id="tickects_num">0</span></p>
                        
                        
                    <p>总价：<b>￥<span id="total_price">0</span></b></p>
                      
                    <form method="post" id="form" name="form"> 
                                        <input type="hidden" id="hid" name="hid">
                                        <input type="hidden" id="scid" name="scid">
                                        <input type="hidden" id="tofp" name="tofp">
                                        <input type="hidden" id="amount" name="amount">
                                        <input type="hidden" id="number" name="number">
                                         <c:set var="tofp" value='${fn:replace(list.tofp,"\'","\\\\\'" )}' /> 
                                        <input type="button" class="btn" value="确定购买" onclick="Checktime()">
</form>
                    <div id="legend"></div>

                </div>

            </div>

        </div>


        <script type="text/javascript">

            
            
            var price = ${sche.price}; //电影票价
  
            $(document).ready(function() {
                
                
                var $cart = $('#seats_chose'), //座位区

                        $tickects_num = $('#tickects_num'), //票数

                        $total_price = $('#total_price'); //票价总额



                var sc = $('#seat_area').seatCharts({

                    map: [//座位结构图 a 代表座位; 下划线 "_" 代表过道

                        'cccccccccc',

                        'cccccccccc',

                        'cccccccccc',

                        'cccccccccc',

                        'cccccccccc',

         
                        
                    ],

                    naming: {//设置行列等信息

                        top: false, //不显示顶部横坐标（行） 

                        getLabel: function(character, row, column) { //返回座位信息 

                            return column;

                        }

                    },

                    legend: {//定义图例

                        node: $('#legend'),

                        items: [

                            ['c', 'available', '可选座'],

                            ['c', 'unavailable', '已售出']

                        ]

                    },

                    click: function() {

                        if (this.status() == 'available'){ //若为可选座状态，添加座位
                            
                            $('<li>' +"'" + (this.settings.row + 1) + '_' + this.settings.label +  "'," +'</li>')

                                    .attr('id', 'cart-item-' + this.settings.id)

                                    .data('seatId', this.settings.id)
                                    
                                    .appendTo($cart);


                            $tickects_num.text(sc.find('selected').length + 1); //统计选票数量

                            $total_price.text(getTotalPrice(sc) + price);//计算票价总金额
                            
                            s();


                            return 'selected';
                            

                        } else if (this.status() == 'selected') { //若为选中状态



                            $tickects_num.text(sc.find('selected').length - 1);//更新票数量

                            $total_price.text(getTotalPrice(sc) - price);//更新票价总金额

                            $('#cart-item-' + this.settings.id).remove();//删除已预订座位
                            
                            s();


                            return 'available';

                        } else if (this.status() == 'unavailable') { //若为已售出状态

                            return 'unavailable';

                        } else {

                            return this.style();

                        }

                    }

                });

                //设置已售出的座位
//['1_3', '1_4', '4_4', '4_5', '4_6', '4_7', '4_8']
                sc.get(${seat}).status('unavailable');
                
                s();
                
            });
            
           


            function getTotalPrice(sc) { //计算票价总额

                var total = 0;

                sc.find('selected').each(function() {

                    total += price;

                });

                return total;

            }
            
            function s(){
                document.getElementById("hid").value="${sche.seatList[1].hall.hid}"
                document.getElementById("scid").value="${sche.scid}"
                var amount = document.getElementById("total_price").innerText;
                document.getElementById("amount").value=amount;
                var tofp = document.getElementById("seats_chose").innerText;
                document.getElementById("tofp").value=tofp;
                
                document.getElementById("number").value="${sche.number}"
            }
            
        
        </script>


    </body>
</html>
