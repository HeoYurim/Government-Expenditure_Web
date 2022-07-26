<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="MemberJoin.MemberJoinDAO" %>
<%@ page import="MemberJoin.MemberJoinDTO" %>

<% //폼 값 받기
String id = request.getParameter("user_id");
String pass = request.getParameter("user_pass");
String name = request.getParameter("user_name");

//폼 값을 DTO 객체에 저장
MemberJoinDTO dto = new MemberJoinDTO();
dto.setId(id);
dto.setPass(pass);
dto.setName(name);
 
MemberDAO dao =new MemberJoinDAO(application);
int iResult = dao.insertWrite(dto);
dao.close();

if(iResult == 1){
	response.sendRedirect("JoinForm.jsp");
}else{
	JSFunction.alertBack("회원가입 실패하였습니다.", out);
}
%>