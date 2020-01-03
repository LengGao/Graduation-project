<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@page import="enity.TUser"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
<title>员工信息修改</title>
</head>
<body>
<script type="text/javascript" src="js/Calendar3.js"></script>

<div id="navi">
	<div id='naviDiv'>
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;员工管理<span>&nbsp;
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<a href="Employees_modify.jsp">修改员工信息</a><span>&nbsp;
	</div>
</div>
<div id="tips">
</div>
<div id="mainContainer">
<strong>修改员工资料</strong>
<br>
<br>

<form name="modifyForm" action="modifyEmployee" method="post">
<table width="400" >
  <tr>
    <td width="30%">员工编号：</td>
    <td><input type="text" name="userId" value='<s:property value="#session.modify_employee.userId"/>'  readonly="readonly"/></td>
  </tr>
  <tr>
    <td width="30%">姓名：</td>  
    <td><input type="text" name="userName" value="<s:property value="#session.modify_employee.userName"/>" /></td>
  </tr>
  <tr>
    <td>密码：</td>
    <td><input type="text" name="userPassword" value="<s:property value="#session.modify_employee.userPassword"/>" />
    <!--  <input name="employee_birthday" type="text" id="control_date" size="20"
      maxlength="10" onclick="new Calendar().show(this);" readonly="readonly" 
      value="<s:date name="#session.modify_employee.employee_birthday" format="yyyy-MM-dd"/>"
      />-->
    </td>
  </tr>
  <tr>
    <td>性别：</td>
    <td>
      <s:if test='%{#session.modify_employee.userSex=="男"}'>
         <input type="radio" name="userSex" value="男" checked="checked"/>男
         <input type="radio" name="userSex" value="女"/>女
      </s:if>
      <s:else>
         <input type="radio" name="userSex" value="男" />男
         <input type="radio" name="userSex" value="女" checked="checked"/>女
      </s:else>
      </td>
  </tr>
  <tr>
    <td>联系电话：</td>
    <td><input type="text" name="userTelephone" value="<s:property value="#session.modify_employee.userTelephone"/>" /></td>
  </tr>
  <tr>
    <td>是否是管理人员：</td>
    <td><input type="text" name="userIsManager" value="<s:property value="#session.modify_employee.userIsManager"/>" /></td>
  </tr>
  <tr>
    <td colspan="2" align="center"><input class="button" type="submit" value="修改" onclick="firm()"></td>
  </tr>
</table>
</form>
<script type="text/javascript">
	function firm()
	{
		confirm("您确定要保存修改?")
	} 
</script>

</div>
</body>
</html>