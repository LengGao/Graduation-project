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
	 if(name.length<=0){ ii = layer.msg('�û�������Ϊ��', function(){});return false }
	 else if(!reg1.test(name)){ li = layer.msg('�û�����ʽ����ȷ',function(){});return false}
	 else if(pwd.length<6){ li = layer.msg('���볤������Ϊ6λ',function(){});return false }
	 else if(pwd!=pwd1){ li = layer.msg('�������벻һ��',function(){});return	false }
	 else if(!reg2.test(email)){ li = layer.msg('�����ʽ����ȷ',function(){});return false}
	 else if(accept==false) { li = layer.msg('����Ҫͬ�Ⲣ�����û�ʹ��Э��', {icon: 5}); return false}
	 else document.forms[0].submit();
	 
 }
