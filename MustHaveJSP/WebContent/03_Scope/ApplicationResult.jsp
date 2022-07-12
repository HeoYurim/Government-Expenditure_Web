<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page import="common.Person" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplicationResult.jsp</title>
</head>
<body>
	<h2>appliction 영역의 속성 읽기</h2>
	<%
	//maps는 main에서 넘어온 application 객체임으로 강제 타입 변환하여 maps에 넣는다.
	Map<String, Person> maps = (Map<String, Person>)application.getAttribute("maps");
	Set <String>keys = maps.keySet(); //컬렉션에 key를 알아낸다.
	for(String key : keys){ //keys에 있는 값을 반복적으로 출력용 for
		Person person = maps.get(key); //key값에 해당하는 Person 객체 가져옴
		out.print(String.format("이름 : %s, 나이 : %d<br/>", //%s String %d 숫자
				person.getName(), person.getAge())); //출력 format
	}
	%>
</body>
</html>