<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "IncludeFile.jsp" %>
<!-- 다른 JSP 파일(IncludeFile.jsp) 포함 -->
<!DOCTYPE html>
<html>
<body>
	<%
	out.println("오늘 날짜 : " + today);
	out.println("<br/>");
	out.println("내일 날짜 : " + tomorrow);
	
	%>
</body>
</html>