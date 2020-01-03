<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="action.PurchaseOrdersAction" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>订房</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/default.css" />
<script type="text/javascript" src="js/Calendar3.js"></script>
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
<script type="text/javascript">
/*	function firm()
	{
		if( confirm( "确定添加的信息没有错误?" ));
	{
		alert("取消");
	}
}
	*/
</script>
</head>
<body>
<div id="navi"> 
	<div id='naviDiv'>
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;业务<span>&nbsp;
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<a href="serviceBookRoom.jsp">订房</a><span>&nbsp;
	</div>
</div>
<div id="tips"> 
	<strong>添加住房资料</strong>
</div>
<div id="mainContainer">
	<form name="orderForm" action="serviceBookRoom" method="post">
	<input type="hidden" name="roomId" value=<%request.getParameter("roomId");%> /> 
		<table class="default width="100%">
			<col width="10%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="10%">			
			<tr class="title">
			<td>折扣</td>
			<td>证件类型</td>
			<td>请输入证件号</td>
			<td>请输入姓名</td>
			<td>请输入联系电话</td>
			<td>操作</td>
			</tr>
			<tr class="list">
			<td><input name="order.discount" value="1.0" onkeyup="value=value.repalce(/[^\d]/g,'')"/></td>
			<td><input name="constumer.corIdtype" /></td>
			<td><input name="constumer.corIdcard" /></td>
			<td><input name="constumer.corName" /></td>
			<td><input name="constumer.corTelephone" /></td>
			<td colspan="2" align="center"><input type="submit" class="button" value="订房 "></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>