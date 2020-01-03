<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>历史记录查询</title>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/default.css" />
<style type="text/css">
* {
    background: none repeat scroll 0 0 transparent;
    border: 1 none;
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
	margin-top:20px;
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
	text-align:left;
	width:98%;
	font-size:16px;
}
</style>
</head>
<body>
<script type="text/javascript" src="js/Calendar3.js"></script>

<div id="navi">
	<div id='naviDiv'>
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<span>业务</span>&nbsp;
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<span><a href="serviceCheck_success.jsp">历史记录</a></span>&nbsp;
	</div>
</div>
<div id="tips">
</div>
<div id="mainContainer">
<!-- 从session中获取员工集合 -->
<strong>请输入要查询的客户姓名或者身份证号</strong>
<br>
<br>
<table class="default" width="100%">
	<col width="10%">
	<col width="8%">
	<col width="8%">
	<col width="8%">
	<col width="8%">
	<col width="8%">
	<col width="8%">
	<col width="8%">
	<col width="4%">
	<col width="15%">
	<col width="15%">
	<tr class="title">
		<td>订单编号</td>
		<td>所订编号</td>
		<td>客户编号</td>
		<td>操作员工</td>
		<td>房间订金</td>
		<td>应收金额</td>
		<td>实收金额</td>
		<td>找零金额</td>
		<td>折扣</td>
		<td>订房时间</td>
		<td>退房时间</td>
	</tr>
	<!-- 迭代遍历开始 -->
	<s:iterator value="#session.check_list" var="order">
	<tr class="list">
		<td><s:property value="#order.ordId"/> </td>
		<td><s:property value="#order.TRoominfo.roomId"/> </td>
		<td><s:property value="#order.TConstumer.corId"/> </td>
		<td><s:property value="#order.TUser.userId"/> </td>
		<td><s:property value="#order.rommDeposite"/> </td>
		<td><s:property value="#order.staySolt"/> ￥</td>
		<td><s:property value="#order.collectedMoney"/> ￥</td>
		<td><s:property value="#order.expenditureMoney"/>￥ </td>
		<td><s:property value="#order.discount"/> ￥</td>
		<td><s:date name="#order.roomBooktime" format="yyyy年MM月dd日" /> </td>
		<td><s:date name="#order.roomOuttime" format="yyyy年MM月dd日" /> </td>
	</tr>
	</s:iterator>
	<!-- 迭代遍历结束 -->	
	<tr class="title">
	<td><input type="button"  value="上一页"></td>
	<td>当前在第：<input type="text" name='' value='1'>页</td>
	<td><input type="button"  value="下一页"></td>
	</tr>
</table>
</div>
</body>
</html>
