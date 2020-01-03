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
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<span>员工管理</span>&nbsp;
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<span><a href="Employees_add.jsp">添加员工</a></span>&nbsp;
	</div>
</div>
<div id="tips">
</div>
<div id="mainContainer">
<!-- 从session中获取员工集合 -->
<strong>添加员工资料</strong>
<br>
<br>
<s:form name="addForm" action="addEmployee" method="post"> 
<table width="400">
  <tr>
    <td>  <!-- <input type="text" name="employee_num" /> -->
    	<s:textfield  name="userId" label="员工编号"/>
    </td>
  </tr>
  <tr>
    <td>	<!-- <input type="text" name="employee_name" /> -->
    	<s:textfield  name="userName" label="姓名"/>
    </td>
  </tr>
  <tr>
    <td>
    <s:textfield name="userPassword" label="密码"/>
     <!-- <td>出生日期:</td>
     <input name="employee_birthday" type="text" id="control_date"
     onclick="new Calendar().show(this);" readonly="readonly" />
      Struts2 Tag Can't used read only, but Input -->
     <!--  <s:textfield  name="employee_birthday" id="control_date" size="20" maxlength="10" onclick="new Calendar().show(this);" label="出生日期" readonly="readonly"/> -->
    </td>
  </tr>
  <tr>
    <td><!-- <input type="radio" name="employee_gender" value="男" checked="checked"/>男<input type="radio" name="employee_gender" value="女"/>女  -->
    	<s:radio list="{'男','女'}" name="userSex" label="性别"/>
    </td>
  </tr>
  <tr>
    <td><!-- <input type="text" name="employee_phone" /> -->
    	<s:textfield name="userTelephone" type="number" label="联系电话"/>
    </td>
  </tr>
  <tr>
  <td>
  <s:textfield name="isManager" type="number" label="是否是管理员"/>
  </td>
  </tr>
  <tr>
    <td colspan="2" align="center">	<input class="button" type="submit" value="添加" > 
    </td>
  </tr>
</table>
</s:form>
</div>
</body>
</html>