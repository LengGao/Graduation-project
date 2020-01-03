
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.DateFormat" %>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib prefix="s" uri="/struts-tags" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加订单</title>
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
.button {
  display: inline-block;
  padding: 15px 25px;
  font-size: 16px;
  cursor: pointer;
  text-align: center;   
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
#mainContainer{
	padding-left:10px;
	padding-right:10px;
	width:98%;
	font-size:16px;
}
</style>

<script type="text/javascript"> 
function checkInt(o){ 
  theV=isNaN(parseInt(o.value))?0:parseInt(o.value); 
  if(theV!=o.value){
 o.value=theV;
  } 
  txtTotal.value=txtAmount.value*txtPrice.value; 
} 
function checkP(o){ 
  theV=isNaN(parseFloat(o.value))?0:parseFloat(o.value); 
  theV=parseInt(theV*100)/100; 
  if(theV!=o.value){ 
    theV=(theV*100).toString(); 
    theV=theV.substring(0,theV.length-2)+"."+theV.substring(theV.length-2,theV.length) 
    o.value=theV; 
  } 
  txtTotal.value=txtAmount.value*txtPrice.value; 
} 
window.onload=function(){
  var txtAmount=document.getElementById("txtAmount");
  var txtPrice=document.getElementById("txtPrice");
  txtAmount.onkeyup=function(){
    checkInt(this)
  }
  txtAmount.onpaste=function(){
    checkInt(this);
  }
  txtAmount.oncut=function(){
    checkInt(this);
  }
  txtAmount.ondrop=function(){
    checkInt(this);
  }
  txtAmount.onchange=function(){
    checkInt(this);
  }
   
  txtPrice.onkeyup=function(){
    checkP(this)
  }
  txtPrice.onpaste=function(){
    checkP(this);
  }
  txtPrice.oncut=function(){
    checkP(this);
  }
  txtPrice.ondrop=function(){
    checkP(this);
  }
  txtPrice.onchange=function(){
    checkP(this);
  }
}
</script> 

</head>
<body>
<div id="navi">
	<div id='naviDiv'>
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<span>进货管理</span>&nbsp;
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<span><a href="#">订单列表</a></span>&nbsp;
	</div>
</div>
<div id="tips">
</div>
<div id="mainContainer">
<strong>填写订单信息</strong>
<br>
<br>
	<s:form action="addPurchaseOrder" name="addOrders" method="post" theme="simple">
		<table border="0">
			<tr>
				<td>商品编号:</td>
				<td><input type="text" readonly="readonly" name="commodity_num"  
				value='<s:property value="#session.search_list.commodity_num"/>'></td>
			</tr>
			<tr>
				<td>商品名字:</td>
				<td><input type="text" readonly="readonly" name="purchaseOrders_name"  
				value='<s:property value="#session.search_list.commodity_name"/>'></td>
			</tr>
			<tr>
				<td>商品价格:</td>
				<td><input type="text" id="txtPrice" readonly="readonly" name="purchaseOrders_price" value='<s:property value="#session.search_list.commodity_price"/>'></td>
			</tr>
			<tr>
				<td>商品类型:</td>
				<td><input type="text" readonly="readonly" name="purchaseOrders_type" value='<s:property value="#session.search_list.commodity_type"/>'></td>
			</tr>
			
			<tr>
				<td>Total Price:</td>
					<td><input type="text" id="txtTotal" readonly="readonly" name="purchaseOrders_totalPrice" value='<s:property value="#session.search_list.commodity_price"/>'></td>
			</tr>
			
			<tr>
				<td>购买数量:</td>
				<td><input type="number" step="1" min="1" id="txtAmount" value="1" name="purchaseOrders_amount"></td>
			</tr>
			<tr>
				
			 	<% 
			 	/*	<td>下单时间:</td>
			 	 *转换日期格式方法   DateFormat & SimpleDateFormat
			 	 * SimpleDateFormat 更为直观
			 	 */
			 	Date date = new Date(); 
			 //	 DateFormat d1=DateFormat.getDateTimeInstance(DateFormat.LONG,DateFormat.LONG);
				SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd"+"&"+"HH:mm:ss");
			//	 String str1=d1.format(date);
				%>
				<td><input type="hidden" value=<%=simple.format(date) %> name="purchaseOrders_date" readonly="readonly"></td> 
			</tr>
			<tr>
				<td colspan="2" align="center"><button class="button">提交订单</button></td>
				<td></td>
			</tr>
	</table>
	</s:form>
</div>
</body>
</html>