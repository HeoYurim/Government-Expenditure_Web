<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberAuth.jsp</title>
</head>
<body>
	<h2>MVC 패턴으로 회원 인증하기</h2>
	<p>
	<strong>${ authMessage }</strong>
	<br/>
	<a href="./MemberAuth.mvc?id=mit&pass=1234">회원인증(관리자)</a>
	<br/>
	<a href="./MemberAuth.mvc?id=phs&pass=1110">회원인증(회원)</a>
	<br/>
	<a href="./MemberAuth.mvc?id=cloud&pass=0712">회원인증(비회원)</a>
</body>
</html>