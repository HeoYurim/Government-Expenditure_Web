<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FrontController.jsp</title>
</head>
<body>
	<h3>한 번의 요청으로 3가지 요청 처리하기</h3>
	${ resultValue }
	<ol>
		<li>URI : ${ uri }</li>
		<li>요청명 : ${ commandStr }</li>
	</ol>
	<ul>
		<li><a href="../13_Servlet/regist.mit">회원가입</a>
		<li><a href="../13_Servlet/Login.mit">로그인</a>
		<li><a href="../13_Servlet/freeboard.mit">자유게시판</a>
	</ul>
</body>
</html>