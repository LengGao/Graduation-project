/**
 * 
 */
 function validate(){
	 var name=document.forms[0].name.value;
	 var pwd=document.forms[0].password.value;
	 var pwd1=document.forms[0].repassword.value;
	 var email=document.forms[0].information.value;
	 var accept=document.forms[0].accept.checked;
	 var ii;
	 var reg1=/[a-zA-Z]\w*/;
	 var reg2=/\w+([-+.']\w+)*@\w+([-.]\w+)*.\w+([-.]\w+)*/;
	 if(name.length<=0){ ii = layer.msg('用户名不能为空', function(){});return false }
	 else if(!reg1.test(name)){ li = layer.msg('用户名格式不正确',function(){});return false}
	 else if(pwd.length<6){ li = layer.msg('密码长度至少为6位',function(){});return false }
	 else if(pwd!=pwd1){ li = layer.msg('两次密码不一致',function(){});return	false }
	 else if(!reg2.test(email)){ li = layer.msg('邮箱格式不正确',function(){});return false}
	 else if(accept==false) { li = layer.msg('您需要同意并接受用户使用协议', {icon: 5}); return false}
	 else document.forms[0].submit();
	 
 }
