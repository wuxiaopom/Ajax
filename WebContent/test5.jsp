<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无刷新登录页面</title>
<script type="text/javascript">
	function check(){
		var name = document.getElementById("uname").value;
		var pwd = document.getElementById("upwd").value;
		if( name == ""){
			alert("请输入用户名");
			return false;
		}else if(pwd==""){
			alert("请输入密码");
			return false;
		}else{
			doAjax();   //登录方法
		}
	}
	
	function doAjax(){
		//创建XMLHttpRrquest 对象
		var xmlhttp;
		if(window.XMLHttpRequest) {                    
		  xmlhttp = new XMLHttpRequest();
		}else{                                        
		  xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		var name = document.getElementById("uname").value;   //取得用户名
		var pwd =  document.getElementById("upwd").value;    //密码
		
		xmlhttp.onreadystatechange = function(){    //回调函数
			if(xmlhttp.readyState==4 && xmlhttp.status==200){  
				var sobj=document.getElementById("login");
				alert(xmlhttp.responseText);
				var str= xmlhttp.responseText;
				str=str.replace(/(^\s*)|(\s*$)/ig,""); 
				if(str == 'aa'){
				    sobj.innerHTML = "欢迎  <b>"+str + "</b>  登录"+ "<a href='#'>login out</a>";
				}else{
					document.getElementById("error").innerHTML="用户名或密码错误";
				}
			}
		}
		xmlhttp.open("POST","/Jsp_7/doLogin.jsp?uname="+name+"&pwd="+pwd,true);
		xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
		xmlhttp.send(null);
	}

</script>


</head>
<body>
	<div id="login">
		<label>登录名</label>
		<input type="text" id="uname" value="" size="19" /><br/>			
		<label>密&#160;&#160;码</label>
		<input type="password" id="upwd" value="" />
		<label id="error"></label><br>		
		<input type="button" value="登录" onclick="check()" />
	</div>
</body>
</html>