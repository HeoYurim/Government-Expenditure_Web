<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ExeUpdate.jsp</title>
</head>
<body>
	<h2>회원 추가 테스트(executeUpdate() 사용)</h2>
	<%
	JDBConnect jdbc = new JDBConnect(); //db에 연결
	
	String title = "실습1";
	String content = "실습합니다.";
	String id = "test1"; //board 테이블 연습 insert
	int visitcount = 0;
	
	String sql = "INSERT INTO board VALUES (seq_board_num.nextval, ?, ?, ?, sysdate, ?)";
	PreparedStatement psmt = jdbc.con.prepareStatement(sql);
	psmt.setString(1, title);
	psmt.setString(2, content); 
	psmt.setString(3, id);
	psmt.setInt(4, visitcount);
	
	
	//쿼리수행
	int inResult = psmt.executeUpdate();
	out.println(inResult + "행이 입력 되었습니다.");
	
	//연결 닫기
	jdbc.close();
	%>
</body>
</html>