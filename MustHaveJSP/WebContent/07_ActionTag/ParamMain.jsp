<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글 처리를 UTF-8로 (DD에서 설정 함 : 생략 가능)
	request.setCharacterEncoding("UTF-8"); 
	String pValue="방랑시인"; //파라미터에서 사용할 변수, 값
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParamMain.jsp</title>
</head>
<body>
	<jsp:useBean id="person" class="common.Person" scope="request"/>
	<jsp:setProperty property="name" name="person" value="김삿갓"/>
	<jsp:setProperty property="age" name="person" value="25"/>
	<jsp:forward page="ParamForward.jsp?param1=엠아이티">
		<jsp:param value="수원시 망포" name="param2"/>
		<jsp:param value="<%= pValue%>" name="param3"/>
	</jsp:forward>
</body>
</html>