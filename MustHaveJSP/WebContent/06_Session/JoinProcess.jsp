<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="memberShip.MemberDAO" %>
<%@ page import="memberShip.MemberDTO" %>

<% //폼 값 받기
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pass");
String username = request.getParameter("user_name");

//폼 값을 DTO 객체에 저장
MemberDTO dto = new MemberDTO();
dto.setId(userId);
dto.setPass(userPwd);
dto.setName(username);
 
MemberDAO dao =new MemberDAO(application);
int Result = dao.insertWrite(dto);
dao.close();

if(Result == 1){
	response.sendRedirect("LoginForm.jsp");
}else{
	JSFunction.alertBack("회원가입 실패하였습니다.", out);
}
%>