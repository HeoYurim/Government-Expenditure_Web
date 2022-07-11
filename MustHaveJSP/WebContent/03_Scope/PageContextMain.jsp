<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- common.Person import로 외부파일 연결 -->
<%@ page import="common.Person" %>
<%
//pageContext 객체를 통해서 page 영역세 속성값을  저장
//객체가 아닌 기본타입 int는 포장객체인 랩퍼wrapper 클래스로 자동 박싱(int -> integer) 된다.
pageContext.setAttribute("pageInteger", 1000);
pageContext.setAttribute("pageString", "페이지 영역의 문자열");
//new Person("한석봉", 99) Object 타입으로 저장된다.
pageContext.setAttribute("pagePerson", new Person("한석봉", 99));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageContextMain.jsp</title>
</head>
<body>
	<h2>page 영역의 속성값 읽기</h2>
	<%
	//모든 속성이 Object 타입으로 저장되어 있어 원래 타입으로 강제 타입 변환 -> 속성읽기
	int pInteger = (Integer)(pageContext.getAttribute("pageInteger"));
	//String 타입인 경우 toString() 메서드를 통해 문자열로 변환하여 출력
	String pString = pageContext.getAttribute("pageString").toString();
	Person pPerson = (Person)(pageContext.getAttribute("pagePerson"));
	%>
	
	<ul>
		<li>Integer 객체 : <%= pInteger %></li>
		<li>String 객체 : <%= pString %></li>
		<li>Person 객체 : <%= pPerson.getName() %>, <%= pPerson.getAge() %></li>
	</ul>
	
	<!-- include 지시어로 다른 jsp 파일을 포함 -->
	<h2>include된 파일에서 page 영역 읽어오기</h2>
	<%@ include file = "PageInclude.jsp"%>
	
	<!-- a태그로 감싼 링크를 클릭하면 다른 페이지로 이동 -->
	<!-- 이전 페이지에서 만든 page영역은 소멸 확인 -->
	<h2>페이지 이동 후 page 영역 읽어오기</h2>
	<a href="PageLocation.jsp">PageLocation.jsp 바로가기</a>
</body>
</html>