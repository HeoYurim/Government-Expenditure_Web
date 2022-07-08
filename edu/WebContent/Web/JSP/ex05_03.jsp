<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 기반 구현 점검</title>
</head>
<body>
	<%
	String name = request.getParameter("name");
	java.time.LocalTime lt = java.time.LocalTime.now();
	%>
	
	<h3>Hello <%= name ==null ? "Guest" : name %>!
		방문시간 : <%= lt.getHour() + "시 " + lt.getMinute() + "분 " +lt.getSecond() + "초"%></h3>
</body>
</html>