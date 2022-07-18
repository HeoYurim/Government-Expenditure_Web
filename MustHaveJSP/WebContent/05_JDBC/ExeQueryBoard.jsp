<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ExeQueryBoard.jsp</title>
</head>
<body>
	<h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>
	<%
	JDBConnect jdbc = new JDBConnect(); //db에 연결
	
	String sql = "SELECT num, title, content, id, postdate, visitcount FROM board";
	Statement stmt =jdbc.con.createStatement(); //쿼리문 생성 
	
	ResultSet rs = stmt.executeQuery(sql); //쿼리문 수행
	
	while(rs.next()){ //ResultSet은 결과의 집합이기 때문에 next()로 가져온다.
		String title = rs.getString(1);
		String content = rs.getString(2);
		String id = rs.getString(3);
		java.sql.Date postdate = rs.getDate("postdate");
		String visitcount = rs.getString(4);
		
		out.print(String.format("%s %s %s %s %s", title, content, id, postdate, visitcount) + "<br/>");
	} //ResultSet에 있는 데이터를 한 줄 씩 가져와 출력하고 줄 바꿈
	
	//연결 닫기
	jdbc.close();
	%>
</body>
</html>