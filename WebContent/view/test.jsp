<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, java.sql.Date, dao.*,model.*"%>

<%

java.util.Date ultiDate = new java.util.Date();
Timestamp today = new Timestamp (ultiDate.getTime());
System.out.println(today.toString());

%>