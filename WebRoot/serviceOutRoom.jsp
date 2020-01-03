<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="action.PurchaseOrdersAction"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>退房</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	margin-top:10px;
	padding-left:10px;
	padding-right:10px;
	font-size:14px;
	width:70px;
	height:30px;
	line-height:30px;
	vertical-align:center;
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
<script type="text/javascript">
	function ClickoutRoom(){
	 s = document.getElementById("s").value;
	 c = document.getElementById("c").value;
	sun = c - s;
	 if(sun >= 0 ){
	 document.getElementById("e").value = sun;
	 }else{
	 alert("实收金额不能小于应收金额，请重新退房");
	 }
	}
</script>
<body>

<div id="navi"> 
	<div id='naviDiv'>
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;业务<span>&nbsp;
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<a href="serviceOutRoom.jsp">退房</a><span>&nbsp;
	</div>
</div>
<div id="tips"> 
	<strong>请输入实收金额并点击确认，系统计算找零后再点击退房</strong>
</div>
<div id="mainContainer">
	<s:form name="orderForm" action="outRoomComplete" method="post">
		<table class="default" width="100%" >
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
		<tr class="title">
		<td>应收金额</td>
		<td>实收金额</td>
		<td>确认收款</td>
		<td>找零	</td>
		<td>操作</td>
		</tr>
		<tr class="list">
		<td><input id="s" type="text" name="order.staySolt" value="<s:property value="#session.outRoomId.staySolt"/> " onkeyup="value=value.repalce(/[^\d]/g,'')" /></td>
		<td><input id="c" type="text" name="order.collectedMoney" value="" onkeyup="value=value.repalce(/[^\d]/g,'')" /></td>
		<td><input name="btn" type="button" class="button" onclick="ClickoutRoom()" value="确认" /> 
		
		</td>
		<td><input id="e" type="text" name="order.expenditureMoney" value="" onkeyup="value=value.repalce(/[^\d]/g,'')" /></td>
		<td colspan="2" align="center"><input type="submit" class="button" value="退房" />
		</tr>
		</table>
	</s:form>
</div> 
</body>
</html>