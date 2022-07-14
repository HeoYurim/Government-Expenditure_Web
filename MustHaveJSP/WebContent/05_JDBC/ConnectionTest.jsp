<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC연결 테스트</title>
</head>
<body>
	<h2>JDBC 테스트1</h2>
	<%
	JDBConnect jdbc1 = new JDBConnect(); //연결
	jdbc1.close(); //연결 해제
	%>
</body>
</html>