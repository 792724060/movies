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
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="http://hovertree.com/texiao/css3/39/themes/csslider.default.css" />
    <link rel="stylesheet" href="css/qieh.css" type="text/css" media="all" />
        <script src="js/layer-v3.1.1/layer/layer.js"></script>
    <script>
    
 $(function s(){
        var msg="${msg}"
    if( msg == "激活成功"){
      layer.alert(msg,{
          title:"提示",
          icon:6, 
        });
        }
        if( msg == "已激活"){
      layer.alert(msg,{
          title:"提示",
          icon:5, 
        });
        }
        
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
        var curPage=1;
  $.ajax({
      url:"main",
      type:"post",
      data:"curPage="+curPage,
      success:function (msg) { 
      var str="";   //未定义会出现unde
           $.each(msg.list,function(index,obj){
                str+='<div class="box1"><a href="movie?mid='+obj.movie.mid+'"><img alt="" src="'+obj.movie.picture+'"></a></div>'
         
           })
               str+='<div class="box2"><a href="javascript:void(0);" onclick=page(parseInt('+msg.sortpage.page+')-parseInt(1))>前一页</a><span id="cp" >第'+msg.sortpage.page+'页</span><span>共'+msg.sortpage.sum+'页</span><a href="javascript:void(0);" onclick=page(parseInt('+msg.sortpage.page+')+parseInt(1))>后一页</a></div>'
           document.getElementById("show_data").innerHTML=str;
          /*$('#show_data').html(str); */
      }
      })
      
}
)
</script>
<script type="text/javascript">
   function page(curPage){
      
      $.ajax({
      url:"main",
      type:"post",
      data:"curPage="+curPage,
      success:function (msg) { 
      var str="";   //未定义会出现unde
           $.each(msg.list,function(index,obj){
                str+='<div class="box1"><a href="movie?mid='+obj.movie.mid+'"><img alt="" src="'+obj.movie.picture+'"></a></div>'
         
           })
               str+='<div class="box2"><a href="javascript:void(0);" onclick=page(parseInt('+msg.sortpage.page+')-parseInt(1))>前一页</a><span id="cp" >第'+msg.sortpage.page+'页</span><span>共'+msg.sortpage.sum+'页</span><a href="javascript:void(0);" onclick=page(parseInt('+msg.sortpage.page+')+parseInt(1))>后一页</a></div>'
           document.getElementById("show_data").innerHTML=str;
/*            $('#show_data').html(str); */
      }
      })
   }
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

    <style>
    * {
        margin: 0;
        padding: 0;
    }

    ::-webkit-scrollbar {
        width: 2px;
        background: rgba(255, 255, 255, 0.1);
    }

    ::-webkit-scrollbar-track {
        background: none;
    }

    ::-webkit-scrollbar-thumb {
        background: rgba(74, 168, 0, 0.6);
    }

    ul, ol {
        padding-left: 40px;
    }

    html, body {
        height: 100%;
        text-align: center;
        font: 400 100% 'Raleway', 'Lato';
        background-color: #282828;
        color: #CCC;
    }

    h1 {
        font-weight: 700;
        font-size: 310%;
    }

    h2 {
        font-weight: 400;
        font-size: 120%;
        color: #71AD37;
    }

    #hewenqislider {
        margin: 0px;
        font-family: 'Lato';
        
    }

      

        #hewenqislider > input:nth-of-type(1):checked ~ ul #hovertreebg {
            width: 100%;
            padding: 22px;
            -moz-transition: .5s .5s;
            -o-transition: .5s .5s;
            -webkit-transition: .5s .5s;
            transition: .5s .5s;
        }

            #hewenqislider > input:nth-of-type(1):checked ~ ul #hovertreebg div {
                -moz-transform: translate(0);
                -ms-transform: translate(0);
                -o-transform: translate(0);
                -webkit-transform: translate(0);
                transform: translate(0);
                -moz-transition: .5s .9s;
                -o-transition: .5s .9s;
                -webkit-transition: .5s .9s;
                transition: .5s .9s;
            }
             #hewenqislider > input:nth-of-type(2):checked ~ ul #hovertreebg {
            width: 100%;
            padding: 22px;
            -moz-transition: .5s .5s;
            -o-transition: .5s .5s;
            -webkit-transition: .5s .5s;
            transition: .5s .5s;
        }

            #hewenqislider > input:nth-of-type(2):checked ~ ul #hovertreebg div {
                -moz-transform: translate(0);
                -ms-transform: translate(0);
                -o-transform: translate(0);
                -webkit-transform: translate(0);
                transform: translate(0);
                -moz-transition: .5s .9s;
                -o-transition: .5s .9s;
                -webkit-transition: .5s .9s;
                transition: .5s .9s;
            }
             #hewenqislider > input:nth-of-type(3):checked ~ ul #hovertreebg {
            width: 100%;
            padding: 22px;
            -moz-transition: .5s .5s;
            -o-transition: .5s .5s;
            -webkit-transition: .5s .5s;
            transition: .5s .5s;
        }

            #hewenqislider > input:nth-of-type(3):checked ~ ul #hovertreebg div {
                -moz-transform: translate(0);
                -ms-transform: translate(0);
                -o-transform: translate(0);
                -webkit-transform: translate(0);
                transform: translate(0);
                -moz-transition: .5s .9s;
                -o-transition: .5s .9s;
                -webkit-transition: .5s .9s;
                transition: .5s .9s;
            }

   #hovertreebg {
		color: #FFFFFF;
		padding: 22px 0;
		position: absolute;
		left: 0;
		top: 60%;
		height: 20%;
		width: 0;
		z-index: 10;
		overflow: hidden;
	}

		#hovertreebg:before {
			content: '';
			position: absolute;
			left: -1px;
			top: 1px;
			height: 100%;
			width: 100%;
			z-index: -1;
			
			-webkit-filter: blur(7px);
		}

		#hovertreebg:after {
			content: '';
			position: absolute;
			left: 0;
			top: 0;
			height: 100%;
			width: 100%;
			z-index: 20;
			background: rgba(0, 0, 0, 0.35);
			pointer-events: none;
		}

		#hovertreebg div {
			-moz-transform: translate(120%);
			-ms-transform: translate(120%);
			-o-transform: translate(120%);
			-webkit-transform: translate(120%);
			transform: translate(120%);
		}
   

    .scrollable p {
        padding: 30px;
        text-align: justify;
        line-height: 140%;
        font-size: 120%;
    }
    #hewenqislider a{color:greenyellow}
    .csslider>ul{width:1500px;  height:600px;/*在这里改变宽度 */}
    
</style>
  </head>
  <body>
<div class="list">
   <ul>
  <li><a href="main.jsp">主页</a></li>
  <li><a href="https://www.baidu.com">新闻</a></li>
  <li><a href="https://www.baidu.com">社区</a></li>
  <li><a href="https://www.baidu.com">帮助</a></li>
   <li style="float:right" ><a class="active"  id="log" href="ID.html"> 登录/注册 </a></li>
   <li style="float:right"><a class="active" id="user" href="Pein.jsp">${sessionScope.uid}</a></li>
   <li style="float:right" ><a class="active"  id="logout" onclick="Logout()">注销</a></li>
</ul>
</div>
<div style="padding: 1em 0;">
    <div id="hewenqislider" class="csslider">
        <input type="radio" name="slides" id="slides_1"  />
        <input type="radio" name="slides" id="slides_2"  checked/>
       <input type="radio" name="slides" id="slides_3"  />
        
        <ul id="lunbo">
            <li>  
                <a href="movie?mid=4"><img alt="" src="images/16.jpg"></a>
               <div id="hovertreebg">
					<div>
					<p style="margin:100px;float:right">104分钟 - 动作/冒险 - 北京101家影院上映374场侦探小分队追击真相 </p>
						<h1 style="float:right ">《大侦探皮卡丘》</h1>
					</div>
				</div>
  
            </li>
            <li >
                <a href="movie?mid=3"><img src="images/15.jpg" /></a>
                <div id="hovertreebg">
					
						<h1 >《复仇者联盟4:终局之战》</h1>
						<p >逆转无限  不惜一切代价 </p>
						
						</div> 
				
            </li>
            
            <li>
            <a href="movie?mid=5"><img src="images/13.jpg" /></a>
               <div id="hovertreebg">
					<div>
						<h1>《哥斯拉2》</h1>
						<p>5月31日 - 全国上映 </p>
						 
					</div>
				</div>
            </li>
             
        </ul>
        <div class="arrows">
            <label for="slides_1"></label>
            <label for="slides_2"></label>
            <label for="slides_3"></label>
           
        </div>
        <div class="navigation">
            <div>
                <label for="slides_1"></label>
                <label for="slides_2"></label>
                <label for="slides_3"></label>
               
            </div>
        </div>
 </div>
</div>
<div class="list">

<div class="search bar8">
       <ul>
  
   <li style="float:right"><form name="fm" >
            <input type="text" placeholder="搜你感兴趣的电影" name="name">
            <button type="submit" onclick="document.fm.action='name';document.fm.submit()"></button>
        </form></li>
  </ul> 
    </div></div>
    <div class="box" >
   <h1>上映电影<br/></h1> 
   <div class="box0" id="show_data"> 
   </div>
   </div>
</body>
</html>
