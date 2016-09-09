<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自动搜索</title>
</head>
<style type="text/css">
	body {
		font: 11px arial;
	}

	.suggest_link {
		background-color: #FFFFFF;
		padding: 2px 6px 2px 6px;
	}

	.suggest_link_over {
		background-color: #E8F2FE;
		padding: 2px 6px 2px 6px;
	}

	#suggest {
		position: abslute;
		background-color: #FFFFFF;
		text-align: left;
		border: 1px solid #000000;
		display: none;
	}
</style>

<script type="text/javascript">
		var xmlhttp;//声明浏览器初始化对象变量
		function searchSuggest(){
		if(window.XMLHttpRequest) {                    
			  xmlhttp = new XMLHttpRequest();
			}else{                                        
			  xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
		//判断XMLHttpRequest对象是否成功创建
		if(!xmlhttp){
			alert("不能创建XMLHttpRequest对象实例");
			return false;
		}
		
		//创建请求结果处理程序
		xmlhttp.onreadystatechange=processReuqest;   //回调函数
		var str = encodeURI(encodeURI(document.getElementById("txtSearch").value));
		
		xmlhttp.open("POST","SearchSuggest.jsp?search="+str,true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.setRequestHeader("Content-type","text/html;charset=utf-8");
		xmlhttp.send(null);
		
        function processReuqest(){
        	if(xmlhttp.readyState==4){
 			   if(xmlhttp.status==200){
 				 var sobj=document.getElementById("suggest");
 				 sobj.innerHTML="";
 				 var str= xmlhttp.responseText.split("-");
 				 var suggest="";
 				 if(str.length > 0 && str[0].length > 0){
 					 for(i=0;i<str.length;i++){
 						suggest += "<div onmouseover='javascript:suggestOver(this);'";
 						suggest += " onmouseout='javascript:suggestOut(this);'";
 						suggest += " onclick='javascript:setSearch(this.innerHTML);'";
 						suggest += " class='suggest_link'>"+str[i]+"</div>";
 					  }
 					sobj.innerHTML=suggest;
 					document.getElementById("suggest").style.display="block";
 				}else{
 					document.getElementById("suggest").style.display="none";
 				}
 			  }
 		   }
        }
	} 
        function suggestOver(obj){
			obj.className = "suggest_link_over";
		}
		function suggestOut(obj){
			obj.className="suggest_link";
		}
</script>

<body>
	<h3>Ajax实现搜索提示</h3>
	<div style="width: 500px">
		<form action="" id="formSearch">
			<input type="text"   id="txtSearch" name="txtSearch" onkeyup="searchSuggest()" autocomplete="off" />
			<input type="submit" id="cmdSearch" name="cmdSearch" value="搜索" />
			<div id="suggest" style="width: 200px"></div>
		</form>
	</div>
</body>
</html>