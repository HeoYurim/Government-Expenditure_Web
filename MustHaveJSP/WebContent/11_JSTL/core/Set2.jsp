<%@page import="common.Person"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Set2.jsp</title></head><body>
	<h4>List 컬렉션 이용하기</h4>
	<%
	ArrayList<Person> pList = new ArrayList<Person>();
	pList.add(new Person("홍지영", 29));
	pList.add(new Person("김재준", 50));
	%>
	<c:set var="personList" value="<%= pList %>" scope="request" />
	<ul>
		<li>이름 : ${ requestScope.personList[0].name }</li>
		<li>나이 : ${ personList[1].age }</li>
	</ul>
	
	<h4>Map 컬렉션 이용하기</h4>
	<%
	Map<String, Person> pMap = new HashMap<String, Person>();
	pMap.put("personArgs1", new Person("최영광", 65));
	pMap.put("personArgs2", new Person("전민", 67));
	%>
	<c:set var="personMap" value="<%= pMap %>" scope="request" />
	<ul>
		<li>이름 : ${ requestScope.personMap.personArgs1.name }</li>
		<li>나이 : ${ personMap.personArgs2.age }</li>
	</ul>
</body>
</html>