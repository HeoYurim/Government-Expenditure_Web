<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.CookieManager" %>
<%
//CookieManager클래스에 readCookie메소드를 활용하여 이름이 loginId인 쿠키를
//읽어와 loginId 변수에 저장 -> 아이디가 있다면 아이디 입력폼에 기본 값으로 쓰임
String loginId = CookieManager.readCookie(request, "loginId");
String cookieCheck=""; //cookieCheck변수 생성
if(!loginId.equals("")){ //loginId에 빈문자열 외의 문자열을 저장했다면
	cookieCheck = "checked"; //cookieCheck에 checked가 대입 된다.
	//[아이디 저장하기] 체크박스에 checked 속성을 부여한다.
}
%>  
<%
//CookieManager클래스에 readCookie메소드를 활용하여 이름이 loginId인 쿠키를
//읽어와 loginId 변수에 저장 -> 아이디가 있다면 아이디 입력폼에 기본 값으로 쓰임
String loginpw = CookieManager.readCookie(request, "loginpw");
String cookieCheck2=""; //cookieCheck변수 생성
if(!loginpw.equals("")){ //loginId에 빈문자열 외의 문자열을 저장했다면
	cookieCheck2 = "checked"; //cookieCheck에 checked가 대입 된다.
	//[아이디 저장하기] 체크박스에 checked 속성을 부여한다.
}
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IdSaveMain.jsp</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<form action="IdSaveProcess.jsp" method="post">
	아이디 : <input type="text" name="user_id" value="<%= loginId %>" />
	<input type="checkbox" name ="save_check" value="Y" <%= cookieCheck %> />
	아이디 저장하기
	<br />
	패스워드 : <input type="text" name="user_pw" value="<%= loginpw %>"/>
	<input type="checkbox" name ="save_check2" value="Y" <%= cookieCheck2 %> />
	비밀번호 저장하기
	<br />
	<input type="submit" value="로그인하기" />
	</form>
</body>
</html>