<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
CookieManager.makeCookie(response, "ELCookie", "EL좋죠?", 10);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OtherImplicitObj.jsp</title>
</head>
<body>
	<h3>쿠키 값 읽기</h3>
	<li>ELCookie값 : ${cookie.ELCookie.value }</li>
	
	<h3>http 헤더 읽기</h3>
	<ul>
		<li>host : ${header.host }</li>
		<li>user-agent : ${header['user-agent'] }</li>
		<li>cookie : ${header.cookie }</li>
	</ul>
	
	<h3>컨텍스트 초기화</h3>
	<li>OracleDriver : ${initParam.OracleDriver }</li>
	
	<h3>컨텍스트 루트 경로 읽기</h3>
	<li>${pageContext.request.contextPath }</li>
</body>
</html>