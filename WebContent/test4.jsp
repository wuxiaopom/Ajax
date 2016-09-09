<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String userName = request.getParameter("userName");
   
    String name = request.getParameter("name");

    System.out.println(name);
    out.print(name);
%>

