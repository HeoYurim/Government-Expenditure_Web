<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncludeFile.jsp</title>
</head>
<body>
	<%
	LocalDate today = LocalDate.now(); //오늘 날짜
	LocalDateTime tomorrow = LocalDateTime.now().plusDays(1); //내일 날짜
	%>
</body>
</html>