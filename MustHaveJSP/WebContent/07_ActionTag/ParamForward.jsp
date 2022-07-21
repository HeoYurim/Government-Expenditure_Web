<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParamForward.jsp</title>
</head>
<body>
	<jsp:useBean id="person" class="common.Person" scope="request"/>
	<h2>포워드 된 페이지에서 매개변수를 확인해보자</h2>
	<ul>
		<li>이름 : <jsp:getProperty name="person" property="name" /></li>
		<li>나이 : <jsp:getProperty name="person" property="age" /></li>
		<li>본명 : <%= request.getParameter("param1") %></li>
		<li>출생 : <%= request.getParameter("param2") %></li>
		<li>특징 : <%= request.getParameter("param3") %></li>
	</ul>

	<jsp:include page="ParamInclude.jsp">
		<jsp:param name="loc1" value="강원도 영월"/>
		<jsp:param name="loc2" value="김삿갓면"/>
	</jsp:include>
</body>
</html>