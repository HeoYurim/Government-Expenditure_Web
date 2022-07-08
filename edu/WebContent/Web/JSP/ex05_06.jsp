<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 기반 구현 점검</title>
</head>
<body>
	<jsp:useBean id = "hello" class="jspbean.TestBean"/>
	<c:set target="${hello}" value="${ param.name }" property="name"/>
	<h3>Hello<c:out value="${ hello.name }" default="Guest" />!
	방문시간은 <c:out value="${ hello.time }"/></h3>
</body>
</html>