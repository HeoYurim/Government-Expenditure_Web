<%@page import="utils.JSFunction" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("UserId") == null){
	//세션 영역에 UserId라는 속성값이 있는 확인
	//null이면 로그인 하지 않음을 의마한다.
	JSFunction.alertLocation("로그인 후 이용해주세요!!",
			"../06_Session/LoginForm.jsp", out);
	//로그인하지 않았다면 경고창을 띄움(alert)
	//로그인 페이지로 이동
	return;
}
%>