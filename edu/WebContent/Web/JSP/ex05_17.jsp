<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 내장 객체 점검</title>
<style>
input{
	margin : 3px;
}
</style>
</head>
<body>
	<% if(request.getMethod().equals("GET")) { %>
		<h2>원하는 컬러와 날짜를 선택하세요.</h2>
		<form method="post" action="/edu/Web/JSP/ex05_17.jsp">
		컬러 : <input type="color" name="fcolor"><br>
		날짜 : <input type="date" name="fdate"><br>
		<input type="submit" value="전송">
		</form>
	<% } else { %>
	<script>
	document.body.style.backgroundColor = '<%= request.getParameter("fcolor") %>';
	</script>
	<h2>선택 날짜는 <%= request.getParameter("fdate") %> 이네요</h2>
	<% } %>
</body>
</html>