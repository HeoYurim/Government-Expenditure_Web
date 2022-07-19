<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//방법 1 : 회원 인증 정보 삭제
session.removeAttribute("UserId");
session.removeAttribute("UserName");

//방법 2 : 모든 속성을 한꺼번에 제거
session.invalidate(); //세선 자체를 무효화 시킨다.
out.println("세션삭제 완료");

//속성 삭제 후 페이지 이동 
response.sendRedirect("LoginForm.jsp");
%>