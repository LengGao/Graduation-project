<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>房间列表</title>
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
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<span>业务</span>&nbsp;
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<span><a href="serviceShowRoom.jsp">显示房间</a></span>&nbsp;
	</div>
</div>
<div id="tips">
	<div id="buttonGroup">
		<div class="button" onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'" onmouseover="this.style.backgroundColor='#77D1F6';this.style.fontWeight='bold'">
			<a href="commodity_search.jsp">查找房间</a>
		</div>
	</div>
</div>
<div id="mainContainer">

<table class="default" width="100%">
	<col width="10%">
	<col width="10%">
	<col width="10%">
	<col width="10%">
	<col width="10%">
	<col width="15%">
	<col width="10%">
	<col width="10%">
	<tr class="title">
		<td>房间编号</td>
		<td>房间类型</td>
		<td>房间床数</td>
		<td>房间订金</td>
		<td>房间价格</td>
		<td>房间描述</td>
		<td>房间状态</td>
		<td>订房时间</td>
		<td>退房时间</td>
		<td>操作</td>
	</tr>
	<!-- 迭代遍历开始 -->
	<s:iterator value="#session.serviceShowRoom_list" var="commodity">
	<tr class="list">
		<td><s:property value="#commodity.roomId"/> </td>
		<td><s:property value="#commodity.roomType"/> </td>
		<td><s:property value="#commodity.roomBed"/> 张</td>
		<td><s:property value="#commodity.rommDeposite"/> ￥</td>
		<td><s:property value="#commodity.roomPrice"/> ￥/12小时</td>
		<td><s:property value="#commodity.roomResever"/> </td>
		<td><s:if test="#commodity.roomState == 0">
		空闲
		</s:if>
		<s:else>已入住</s:else>
		</td>
		<td><s:date name="#commodity.roomBooktime" format="yyyy年MM月dd日" /> </td>
		<td><s:date name="#commodity.roomOuttime" format="yyyy年MM月dd日" /> </td>
		<td>><a href="readyBookRoom.action?roomId=<s:property value="#commodity.roomId"/>">
		订房</a>
		<a href="serviceOutRoom.action?roomId=<s:property value="#commodity.roomId"/>">
		退房</a></td>
	</tr>
	</s:iterator>
	<!-- 迭代遍历结束 -->
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
