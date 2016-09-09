<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>失焦验证</title>
</head>
<script type="text/javascript">
    function checkUserExists(){
    	var userName = document.getElementById("userName").value;
    	if( userName == null || userName == ''){
    		alert("用户名不能为空");
    		return false;
    	}else{
    		doAjax(userName);
    	}
	}
    
   function doAjax(userName){
    	var xmlhttp;
		if(window.XMLHttpRequest) {                    
		  xmlhttp = new XMLHttpRequest();
		}else{                                        
		  xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function(){  
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){  //回调函数
		      
			var infoDiv = document.getElementById("info");
		      var txt=xmlhttp.responseText;
		      
		      txt=txt.replace(/(^\s*)|(\s*$)/ig,"");     //使用正则表达式去掉空格   replace(/(^\s*)|(\s*$)/g,"")

		     
		      if (txt == "true"){
		    	  infoDiv.innerHTML = "用户名可以使用"; 					
		      }else{
		    	  infoDiv.innerHTML = "用户名已被使用";
		      }
		    }
		}
		//open(method,url,async)     method(POST/GET) url(可以绝对路劲，也可以相对路径)   
		xmlhttp.open("GET","/Jsp_7/test2.jsp?userName="+userName,true);   //true 异步       false 同步
		xmlhttp.send();                                           //使用get的时候参数拼接在url地址之后 可以不填写   POST请求需填写参数
    }

</script>


<body>
	用户名:<input type="text" id="userName" name="userName" value="" onblur="checkUserExists()"/> <div id="info"></div>
</body>
</html>