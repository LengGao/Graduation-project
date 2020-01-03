
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>查询结果</title>
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
<script type="text/javascript" src="js/Calendar3.js"></script>
</head>
<body>
	<div id="navi">
	<div id='naviDiv'>
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<span>商品管理</span>&nbsp;
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<span><a href="queryCommodity.action">商品列表</a></span>&nbsp;
	</div>
</div>
<div id="tips">
</div>
<div id="mainContainer">
	<br/>
	<br/>
	<s:form action="saveCommodity_info.action" name="update_info" method="post" theme="simple">
		<table align="center">
			<tr><th colspan="2" align="center"><h3>修改商品信息</h3></th></tr>
			<tr><td>商品编号：</td>
				<td><input type="text" name="commodity_num" readonly="readonly" value='<s:property value="#session.search_list.commodity_num"/>'></td>
			</tr>
			<tr>
				<td>商品名字：</td>
				<td><input type="text" name="commodity_name"  value='<s:property value="#session.search_list.commodity_name"/>'></td>
			</tr>
			<tr>
				<td>商品价格：</td>
				<td><input type="text" name="commodity_price" value='<s:property value="#session.search_list.commodity_price"/>'></td>
			</tr>
			<tr>
				<td>商品类型：</td>
				<td><input type="text" name="commodity_type" value='<s:property value="#session.search_list.commodity_type"/>'></td>
			</tr>
			<tr>
				<td>商品库存：</td>
				<td><input type="number" min="1" name="commodity_information" value='<s:property value="#session.search_list.commodity_information"/>'></td>
			</tr>
			<tr>
				<td>上架时间：</td>
				<td><input type="text" name="commodity_time" readonly="readonly" id="control_date" 
					onclick="new Calendar().show(this);" value="<s:date name="#session.search_list.commodity_time" format = "yyyy-MM-dd"/>" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" class="button" value="修改" onclick="firm()"></td>
			</tr>
	</table>
	</s:form>
</div>	
<script type="text/javascript">
	function firm()
	{
		return confirm("您确定保存修改吗?")
	}
</script>
</body>
</html>