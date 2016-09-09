<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>初学ajax</title>
</head>
<script>
	function loadXMLDoc(){
		var xmlhttp;
		if(window.XMLHttpRequest) {                     // code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp = new XMLHttpRequest();
		}else{                                         // code for IE6, IE5
		  xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function(){ 
	    alert(xmlhttp.readyState);
		if(xmlhttp.readyState==4 && xmlhttp.status==200){  //回调函数
		      document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
		    }
		}
		//open(method,url,async)    // method(POST/GET) url(可以绝对路劲，也可以相对路径)   
		//xmlhttp.open("GET","/Jsp_7/test4.jsp?userName=12312312",true);    //true 异步       false 同步
		//xmlhttp.send();            //使用get的时候参数拼接在url地址之后 可以不填写   POST请求需填写参数
		
		xmlhttp.open("GET","/Jsp_7/test.txt",true);
		xmlhttp.send();
		
		
		//xmlhttp.open("POST","/Jsp_7/test4.jsp",true);	
		//设置请求头信息，告诉服务器要发送一个表单  必须写在 open()与send() 中间
		//xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");  
		//xmlhttp.send("name=zhangsan");  
		
	}
</script>
</head>
<body>

<div id="myDiv"><h2>我是登录的内容</h2></div>
	<button type="button" onclick="loadXMLDoc()">修改内容</button>
</body>
</html>