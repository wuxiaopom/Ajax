<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>

<%  
    request.setCharacterEncoding("UTF-8");
	String uname = URLDecoder.decode(request.getParameter("uname"),"UTF-8");
	String pwd = URLDecoder.decode (request.getParameter("pwd"),"UTF-8");
	
	out.print(volidate(uname,pwd));
	System.out.println(uname);
	System.out.println(pwd);
%>

<%!
	String  volidate(String uname,String pwd){
	    if(uname.equals("aa")  && pwd.equals("aa")){
	    	return uname;
	    }else{
	    	return "error";
	    }
	}
%>
