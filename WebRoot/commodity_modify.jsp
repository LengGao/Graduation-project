<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="enity.TRoominfo " %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
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
<body>
<script type="text/javascript" src="js/Calendar3.js"></script>

<div id="navi">
	<div id='naviDiv'>
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;员工管理<span>&nbsp;
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<a href="commodity_modify.jsp">修改房间信息</a><span>&nbsp;
	</div>
</div>
<div id="tips">
</div>
<div id="mainContainer">
<strong>修改房间资料</strong>
<br>
<br>

<form name="modifyForm" action="modifyCommdity" method="post">
<table width="400" >
  <tr>
    <td width="30%">房间编号：</td>
    <td><input type="text" name="roomId" value='<s:property value="#session.modify_room.roomId"/>'  readonly="readonly"/></td>
  </tr>
  <tr>
    <td width="30%">房间类型：</td>  
    <td><input type="text" name="roomType" value="<s:property value="#session.modify_room.roomType"/>" /></td>
  </tr>
  <tr>
    <td>房间床数：</td>
    <td><input type="text" name="roomBed" value="<s:property value="#session.modify_romm.roomBed"/>" />
    <!--  <input name="employee_birthday" type="text" id="control_date" size="20"
      maxlength="10" onclick="new Calendar().show(this);" readonly="readonly" 
      value="<s:date name="#session.modify_employee.employee_birthday" format="yyyy-MM-dd"/>"
      />-->
    </td>
  </tr>
  <tr>
  <td>房间价格：</td>
  <td><input type="text" name="roomPrice" value='<s:property value="#session.modify_room.roomPrice" />'/></td>
  </tr>
  <tr>
    <td>房间订金：</td>
    <td><input type="text" name="rommDeposite" value="<s:property value="#session.modify_room.rommDeposite"/>" /></td>
  </tr>
  <tr>
    <td>房间备注：</td>
    <td><input type="text" name="roomResever" value="<s:property value="#session.modify_room.roomResever"/>" /></td>
  </tr>
  <tr>
    <td>房间状态：</td>
    <td><input type="text" name="roomState" value="<s:property value="#session.modify_room.roomState"/>" /></td>
  </tr>
  <tr>
    <td>订房时间：</td>
    <td><input type="text" name="roomBooktime" value="<s:property value="#session.modify_room.roomBooktime"/>" /></td>
  </tr>
  <tr>
    <td>退房时间：</td>
    <td><input type="text" name="roomOuttime" value="<s:property value="#session.modify_room.roomOuttime"/>" /></td>
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