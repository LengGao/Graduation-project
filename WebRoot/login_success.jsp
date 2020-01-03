<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>系统界面</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/index.css" />
	<link rel="stylesheet" href="Font-Awesome-3.2.1/css/font-awesome.css">
	<link rel="stylesheet" href="Font-Awesome-3.2.1/css/font-awesome.min.css">
	<style>
.button {
  display: inline-block;
  border-radius: 30px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 10px;
  padding: 15px;
  width: 80px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 0px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '»';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
</style>
<script type="text/javascript">
function screenAdapter(){
	document.getElementById('footer').style.top=document.documentElement.scrollTop+document.documentElement.clientHeight- document.getElementById('footer').offsetHeight+"px";
	document.getElementById('navigator').style.height=document.documentElement.clientHeight-100+"px";
	document.getElementById('main').style.height=document.documentElement.clientHeight-100+"px";
	document.getElementById('main').style.width=window.screen.width-230+"px";
}

window.onscroll=function(){screenAdapter();};
window.onresize=function(){screenAdapter();};
window.onload=function(){screenAdapter();};
</script>
<script type="text/javascript">
function firm()
{
    if(confirm("你确信要退出?"))
    {
        location.href="logout.action";
    }
    else
    {
        alert("您已取消退出,可继续使用本系统");
    }

}
</script>
</head>
<body>
	<div id="wrapper">
	<div id="header">
		<div id="title"><i class="icon-globe icon-spin"></i>后台管理系统</div>
		<div id="menu">
			<div id="menu_container">
				<ul id="menu_items">
					<li class="menu_item on" style="border-radius:8px 0 0 8px" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#77D1F6';this.style.borderRadius='8px 0 0 8px'"><a href="home_content.jsp" target="MainFrame">首页</a></li>
					<li class="menu_item" onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'" onmouseover="this.style.backgroundColor='#77D1F6';this.style.fontWeight='bold'"><a href="showRoom.action" target="MainFrame">显示房间</a></li>
					<li class="menu_item" onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'" onmouseover="this.style.backgroundColor='#77D1F6';this.style.fontWeight='bold'"><a href="showEmployee.action" target="MainFrame">显示员工</a></li>
					<li class="menu_item" onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'" onmouseover="this.style.backgroundColor='#77D1F6';this.style.fontWeight='bold'"><a href="serviceAllday.jsp">营业额统计</a></li>
					<li class="menu_item" onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'" onmouseover="this.style.backgroundColor='#77D1F6';this.style.fontWeight='bold'"><a>工作日志</a></li>
					<li class="menu_item" style="border-radius:8px 0 0 8px;border:0px;" onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'" onmouseover="this.style.backgroundColor='#77D1F6';this.style.borderRadius='0 8px 8px 0';this.style.fontWeight='bold'">
					<a href="index.html" target="_blank">关于我们</a></li>
				</ul>
			</div>
		</div>
		<div id="user_info">
			<div id="welcome">欢迎${sessionScope.userId}使用本系统</div>
			<div id="logout"><a href="#" onclick="firm()">
				<button class="button" style="vertical-align:middle"><span>退出</span></button>
				</a>
			</div>
		</div>
	</div>
	<div id="navigator">
		<iframe src="tree.jsp"></iframe>
        </div>
        
	<div id="main">
		<iframe name="MainFrame" src="home_content.jsp"></iframe>
	</div>
	<div id="footer">Copyright © 2016-2060 All Rights Reserved Powered By LiangGuang</div>
</div>
</body>
</html>