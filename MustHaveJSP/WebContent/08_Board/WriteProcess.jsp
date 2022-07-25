<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%> <!-- 로그인 확인 -->
<% //폼값 받기
String title = request.getParameter("title");
String content = request.getParameter("content");

//폼 값을 DTO 객체에 저장
BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);

//request로 넘어온 id값이 없어 세션에 있는 UserId를 활용한다.
//board 테이블의 id 컬럼은 member 테이블의 id 컬럼과 외래키로 설정되어 있다.
//id가 빈 값이면 제약조건 위배가 발생
dto.setId(session.getAttribute("UserId").toString());

//DAO 객체를 통해 DB에 DTO 저장
BoardDAO dao = new BoardDAO(application);
int iResult = dao.insertWrite(dto);
dao.close();

//성공 유무 확인
if(iResult == 1){ //글쓰기가 성공하면 1값이 반환됨
	response.sendRedirect("List.jsp"); //게시판 목록으로 돌아감
}else{
	JSFunction.alertBack("글쓰기 실패하였습니다.", out);
}
%>