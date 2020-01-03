<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>登录界面</title>
    <meta http-equiv="content-Type" content="text/html;charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="css/login.css">
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="layer/layer.js"></script>
	<script type="text/javascript">
     function test(){
    var ii = layer.msg('玩命加载中', {icon: 16});
    //此处用setTimeout演示ajax的回调
    setTimeout(function(){
        layer.close(ii);
    }, 2000);
};
	</script>
</head>
<body>
<div id="wrapper">
	<div id="header">
		<div id="logo"></div>
		<div id="heading">
			<div id="title">酒店住房服务系统</div>
			<div id="subTitle"> 1.0</div>
		</div>
	</div>
	<div id="main">
		<div id="mainBg">
			<div id="mainPanel">
				<div id="left">
					<div id="image"></div>
				</div>
				<div id="right">
<s:form action="loginAction" onsubmit="return test()" method="post">
	<!-- start of login form -->
					<div id="welcome">
						<span id="welcome-text">用&nbsp;户&nbsp;登&nbsp;录</span>
					</div>	
					<div id="user-name">
						<span class="item">用户名:</span>
						<span class="input">&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userId" class="form-input" size="25" /></span>
					</div>
					<div id="user-password">
						<span class="item">密&nbsp;&nbsp;&nbsp;&nbsp;码:</span>
						<span class="input">&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="userPassword" class="form-input" size="25" /></span>
					</div>
					<div id="button-group">
						<input type="submit" class="btn" value="登录" onclick=""/>
						<input type="reset" class="btn" value="重置"/>
					</div>
					<div>
					  <s:fielderror cssStyle="color.red"/> <!-- 显示表单验证的出错信息 -->
					</div>
					<!-- end of form -->
</s:form>
		</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<div id="text">Copyright © 2018-2060 All Rights Reserved Powered By LiangGuang</div>
	</div>
</div>
</body>
</html>