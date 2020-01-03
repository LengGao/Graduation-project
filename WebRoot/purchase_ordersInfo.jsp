<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>进货订单列表</title>
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
	height:500px;
	font-size:12px;
	overflow-y:auto;
	
}
ul
{
list-style-type:none;
margin:0;
padding:0;
overflow:hidden;
}
li
{
float:left;
}
a:link,a:visited
{
display:block;
width:120px;
font-weight:bold;
color:#aaaa;
text-align:center;
padding:4px;
text-decoration:none;
text-transform:uppercase;
}
a:hover,a:active
{
background-color:#cc0000;
}
</style>
</head>
<body>
	<div id="navi">
	<div id='naviDiv'>
		<ul>
		<li><a href="#home">待付款</a></li>
		<li><a href="#contact">已买商品</a></li>
		<li><a href="#Info">物流信息</a></li>
		<li><a href="index.html">关于</a></li>
	</ul>
	</div>
</div>
<div id="tips">
<!-- 空数据 -->
</div>
<div id="mainContainer">
	<table class="default" width="100%">
	<col width="10%">
	<col width="10%">
	<col width="8%">
	<col width="10%">
	<col width="5%">
	<col width="12%">
	<col width="15%">
	<!-- 	<col width="10">	 -->
	<col width="10%">
	<tr class="title">
		<td>订单编号</td>
		<td>商品名字</td>
		<td>价格</td>
		<td>商品类型</td>
		<td>购买数</td>
		<td>应付款</td>
		<td>下单时间</td>
	<!-- 	<td>确认购买</td>  -->
		<td>操作</td>
	</tr>
	<!-- Iterator Search -->
		<s:iterator value="#session.orders_info" var="orders">
			<tr class="list">
				<td> <s:property value="#orders.purchaseOrders_num"/> </td>
				<td> <s:property value="#orders.purchaseOrders_name"/> </td>
				<td> ￥<s:property value="#orders.purchaseOrders_price"/> </td>
				<td> <s:property value="#orders.purchaseOrders_type"/> </td>
				<td> <s:property value="#orders.purchaseOrders_amount"/> </td>
				<td> ￥<s:property value="#orders.purchaseOrders_totalPrice"/> </td>
				<td> <s:date name="#orders.purchaseOrders_date" format="yyyy年MM月dd日hh:mm:ss"/> </td>
			<!-- 	<td>确认付款</td>	 -->
				<td><a href="deletePurchaseOrder.action?purchaseOrders_num=<s:property value="#orders.purchaseOrders_num"/>"
						onclick="javascript : return confirm('您确定要取消订单吗?')">取消订单</a></td>
			</tr>
		</s:iterator>
	</table>
</div>
</body>
</html>