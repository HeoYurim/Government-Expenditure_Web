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
	
	String id = "test1";
	String pass = "1111";
	String name = "테스트1회원"; //member 테이블 연습 insert
	
	String sql = "INSERT INTO member VALUES (?, ?, ?, sysdate)";
	PreparedStatement psmt = jdbc.con.prepareStatement(sql);
	psmt.setString(1, id);
	psmt.setString(2, pass);
	psmt.setString(3, name); //인파라미터로 나중에 값을 대입
	
	//쿼리수행
	int inResult = psmt.executeUpdate();
	out.println(inResult + "행이 입력 되었습니다.");
	
	//연결 닫기
	jdbc.close();
	%>
</body>
</html>