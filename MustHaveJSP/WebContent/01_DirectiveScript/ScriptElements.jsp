<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! //선언부(메소드 선언) 
	public int add(int num1 , int num2){
	return num1 + num2;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScriptElements.jsp</title>
</head>
<body>
	<% //스크립트릿(자바 코드)
		int result = add(10,20);
	%>
	덧셈 결과 1 : <%= result %> <br/> <%-- 표현식(변수) --%>
	덧셈 결과 2 : <%= add(30,40) %> <%-- 표현식 (메서드 호출) --%>
</body>
</html>