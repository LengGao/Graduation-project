<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>日营业额统计</title>
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
	height:50px;
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
</head>
<body>
	<div id="navi">
	<div id='naviDiv'>
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<span>财务</span>&nbsp;
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<span><a href="serviceAllday.jsp">日营业额记录</a></span>&nbsp;
	</div>
</div>
<div id="tips">
</div>
<div id="mainContainer">

<table class="default" width="100%">
	<col width="10%">
	<col width="5%">
	<col width="10%">
	<col width="10%">
	<col width="10%">
	<col width="10%">
	<col width="10%">
	<col width="10%">
	<col width="5%">
	<col width="10%">
	<col width="10%">
	<tr class="title">
		<td>订单编号</td>
		<td>房间编号</td>
		<td>客户编号</td>
		<td>员工编号</td>
		<td>房间订金</td>
		<td>应收金额</td>
		<td>实收金额</td>
		<td>找零金额</td>
		<td>折扣</td>
		<td>订房时间</td>
		<td>退房时间</td>
	</tr>
	<!-- 迭代遍历开始 .TRoominfo .TConstumer .TConstumer
	 -->
	<s:iterator value="#session.allDay" var="order">
	<tr class="list">
		<td><s:property value="#order.ordId"/> </td>
		<td><s:property value="#order.TRoominfo.roomId"/> </td>
		<td><s:property value="#order.TConstumer.corId"/> </td>
		<td><s:property value="#order.TUser.userId"/> </td>
		<td><s:property value="#order.rommDeposite"	/></td>
		<td><s:property value="#order.staySolt"/> ￥</td>
		<td><s:property value="#order.collectedMoney"/> ￥</td>
		<td><s:property value="#order.expenditureMoney"/>￥ </td>
		<td><s:property value="#order.discount"/> ￥</td>
		<td><s:date name="#order.roomBooktime" format="yyyy年MM月dd日" /> </td>
		<td><s:date name="#order.roomOuttime" format="yyyy年MM月dd日" /> </td>
	</tr>
	</s:iterator>
	<!-- 迭代遍历结束//LocalDate date = LocalDate.now( -->	
	<tr class="title">
	<!--//LocalDate date = LocalDate.now( -->	
	<td><%=LocalDate.of(2018, 12, 20)%></td>
	<td>合计</td>
	<td>核对方式：</td>
	<td>利润=收入-押金-找出</td>
	<td>总押金<s:property value="#session.depositeAll"/></td>
	<td>总利润<s:property value="#session.staySoltAll"/></td>
	<td>总收入<s:property value="#session.collectedMoneyAll"/></td>
	<td>总找出<s:property value="#session.expenditureMoneyAll"/></td>
	</tr>
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