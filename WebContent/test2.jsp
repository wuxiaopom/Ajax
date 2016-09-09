<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String userName = request.getParameter("userName");
    out.print(String.valueOf(volidate(userName)));
%>

<%!
	boolean  volidate(String userName){
	  boolean str =true;
	    if(userName.equals("aa")){
	    	return false;
	    }else{
	    	return true;
	    }
	}
%>
