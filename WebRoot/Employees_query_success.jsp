<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/default.css" />
	<style type="text/css">
* {
    background: none repeat scroll 0 0 transparent;
    border: 0 none;
    margin: 0;
    padding: 0;
    vertical-align: baseline;
	font-family:微软雅黑;
	overflow:hidden;
}
#navi{
	width:100%;
	position:relative;
	word-wrap:break-word;
	border-bottom:1px solid #065FB9;
	margin:0;
	padding:0;
	height:40px;
	line-height:40px;
	vertical-align:middle;
    background-image: -moz-linear-gradient(top,#EBEBEB, #BFBFBF);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #EBEBEB),color-stop(1, 
#BFBFBF));
}
#naviDiv{
	font-size:14px;
	color:#333;
	padding-left:10px;
}
#tips{
	margin-top:10px;
	width:100%;
	height:40px;
}
#buttonGroup{
	padding-left:10px;
	float:left;
	height:35px;
}
.button{
	float:left;
	margin-right:10px;
	padding-left:10px;
	padding-right:10px;
	font-size:14px;
	width:70px;
	height:30px;
	line-height:30px;
	vertical-align:middle;
	text-align:center;
	cursor:pointer;
    border-color: #77D1F6;
    border-width: 1px;
    border-style: solid;
    border-radius: 6px 6px;
    -moz-box-shadow: 2px 2px 4px #282828;
    -webkit-box-shadow: 2px 2px 4px #282828;
    background-image: -moz-linear-gradient(top,#EBEBEB, #BFBFBF);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #EBEBEB),color-stop(1, #BFBFBF));
}
#mainContainer{
	padding-left:10px;
	padding-right:10px;
	text-align:center;
	width:98%;
	font-size:12px;
}
</style>
<title>员工列表</title>
</head>
<body>
<div id="navi">
	<div id='naviDiv'>
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<span>员工管理</span>&nbsp;
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<span><a href="Employees_query_success.jsp">员工列表</a></span>&nbsp;
	</div>
</div>
<div id="tips">
	<div id="buttonGroup">
		<div  id="test2" class="button" onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'" onmouseover="this.style.backgroundColor='#77D1F6';this.style.fontWeight='bold'">
			<a href="Employees_add.jsp">添加员工</a>
		</div>
		<div class="button" onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'" onmouseover="this.style.backgroundColor='#77D1F6';this.style.fontWeight='bold'">
			<a href="Employees_search1.jsp">查找员工</a>
		</div>
	</div>
</div>
<div id="mainContainer">
<!-- 从session中获取员工集合 -->

<table class="default" width="100%">
	<col width="10%">
	<col width="10%">
	<col width="15%">
	<col width="10%">
	<col width="15%">
	<col width="20%">
	<col width="10%">
	<tr class="title">
		<td>员工编号</td>
		<td>员工姓名</td>
		<td>员工密码</td>
		<td>性别</td>
		<td>手机号码</td>
		<td>是否是管理员</td>
		<td>操作</td>
	</tr>
	
	<!-- 遍历开始 -->
	<s:iterator value="#session.employee_list" var="emy">
	<tr class="list">
		<td><s:property value="#emy.userId"/> </td>
		<td><s:property value="#emy.userName"/></td>
		<td><s:property value="#emy.userPassword"/></td>
		<td><s:property value="#emy.userSex"/> </td>
		<td><s:property value="#emy.userTelephone"/> </td>
		<td><s:property value="#emy.userIsManager"/> </td>
		<td><a href="deleteEmployee?userId=<s:property value="#emy.userId"/>"
		onclick="javascript: return confirm('真的要删除吗？');">删除</a>
		<a href="modifyEmployeeinfo?userId=<s:property value="#emy.userId"/>">修改 </a>
		</td>
	</tr>
	</s:iterator>
	<!-- 遍历结束 -->
	<tr class="title">
	<td><input id="up" type="button" onclick="upPage()" value='上一页'></td>
	<td>当前在第：<input id="now" value="<s:property value="#request.page"/>"/>页</td>
	<td><input id="dowm" type="button" onclick="downPage()"  value='下一页'></td>
	</tr>
</table>

<script type="text/javascript">
	var nows = document.getElementById("now").value;
	var now = parseInt(nows);
	function upPage(){
	if(now <= 1){
	alert("已经是最前面一页了");
	return
	}else{
		location.href="showEmployee.action?page="+(now-1)+"";
			document.getElementById("now").value = now-1;
	}	
	}
	function downPage(){
	var end = ${endpage};
	if(now == end){
	alert("已经是最后一页了");
	return
	}else{
		location.href="showEmployee.action?page="+(now+1)+"";
		document.getElementById("now").value = now+1;
	}
	}
</script>
</div>
</body>
</html>