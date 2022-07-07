<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//응답 헤더에 추가할 값 준비
//날짜 포멧 형식을 정한다 -> 년년년년-월월-일일  시시:분분
SimpleDateFormat s = new SimpleDateFormat("yyyy-mm-dd HH:mm"); 
//날짜에 해당하는 문자열을 날짜 포멧으로 변경 2021-07-07 16:30값이 add_date로 넘어옴
long add_date = s.parse(request.getParameter("add_date")).getTime();
//2021-07-07 16:30값이 add_date로 넘어온 값을 날짜로만 추출하는 sql.Date(날짜만 추출)
java.sql.Date date2 = new java.sql.Date(add_date);
System.out.println(date2);

//ResponseMain.jsp에서 8282라는 문자열로 넘어온 값을 int로 변경한다.
int add_int = Integer.parseInt(request.getParameter("add_int"));
//ResponseMain.jsp에서 홍길동으로 넘어온 문자열을 add_str에 넣는다.
String add_str = request.getParameter("add_str");

//응답 헤더에 값 추가
//yyyy-MM-dd HH:mm 형식으로 넘어온 값을 myBirthday 헤더 값으로 추가
response.addDateHeader("myBirthday", add_date);
//myNumber로 8282값을 가지고 있다.
response.addIntHeader("myNumber", add_int);
//myNumber로 1004값을 추가한다. -> myNumber가 2개 된다.
response.addIntHeader("myNumber", 1004); //추가
//myName으로 홍길동 값을 추가한다.
response.addHeader("myName", add_str);
//myName값이 안중근으로 변경된다.
response.setHeader("myName", "안중근"); //수정
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Response</title>
</head>
<body>
	<h2>응답 헤더 정보 출력하기</h2>
	<%
	 Collection<String> headerNames = response.getHeaderNames();
	for(String hName : headerNames){
		String hValue = response.getHeader(hName);
	%>
        <li><%= hName %> : <%= hValue %></li>
    <%
    }   
    %>
    
    <h2>myNumber만 출력하기</h2>
    <%
	Collection<String> myNumber = response.getHeaders("myNumber");
	for (String myNum : myNumber) {
	%>
		<li>myNumber : <%= myNum %></li>
	<%
	}
	%>
</body>
</html>