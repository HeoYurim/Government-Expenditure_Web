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
<title>Login Page</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<!-- header -->
	<header>
		<div class="container">
			<div class="logo"><img src="image/officemark.PNG" width="160px" height="100px"></div>
				<ul class="sidemenu">
				<li><a href="#">Home</a></li>
				<li><a href="#">나의 기록🧭</a></li>
				</ul>
		</div>
	</header>
	
	<!-- nav -->
	<nav>
	<div class ="container">
		<ul class="leftMenu">
			<li class="active"><a href="main.html">Home</a></li>
			<li class="dropBox">
				<a href="record.html">여행 기록🧭</a>
				<span class="dropmenu">
					<span><a href="#">국내🚅</a></span>
					<span><a href="#">해외💺</a></span>
				</span>
			</li>
			<li><a href="map.html">여행 계획📆</a></li>
			<li><a href="map.html">Map🌏</a></li>
			<li class="dropBox">
				<a href="">🚩추천 🚩</a>
				<span class="dropmenu">
					<span><a href="#">국내 여행지🎈</a></span>
					<span><a href="#">국내 맛집🍴</a></span>
					<span><a href="#">해외 여행지🎈</a></span>
					<span><a href="#">해외 맛집🍴</a></span>
				</span>
			</li>
			<li class="dropBox">
				<a href="">고객센터📞</a>
				<span class="dropmenu">
					<span><a href="#">회사 소개</a></span>
					<span><a href="#">문의 사항</a></span>
				</span>
			</li>
		</ul>
		<ul class="rightMenu">
			<li><a href="join.html">회원가입</a></li>
			<li><a href="login.jsp">로그인</a></li>
		</ul>
	</div>
	</nav>
	
	<section id="section2">
		<div class="container">
			<div class="loginBox">
				<div>
					<div class="box">
						<div class="logo">
							<h1>로그인</h1>
						</div>
						<form action="IdSaveProcess.jsp" method="post">
							아이디  : <input type="text" name="user_id" value="<%= loginId %>" />
							<input type="checkbox" name ="save_check" value="Y" <%= cookieCheck %> />
							<br />
							패스워드 : <input type="text" name="user_pw" value="<%= loginpw %>"/>
							<input type="checkbox" name ="save_check2" value="Y" <%= cookieCheck2 %> />
							<br />
							<button type="submit">로그인</button>
						</form>
					</div>
					<div class="box">
						<div class="social logo">
							<h1>소셜 로그인하기</h1>
							<button class="facebook">페이스북 ID로 로그인</button>
							<button class="kakao">카카오톡 ID로 로그인</button>
							<button class="naver">네이버 ID로 로그인</button>
						</div>
					</div>
					<div class="clear"></div>
					<div class="alert">
						<h1>도움이 필요하신가요?</h1>
						<p>
							<button>아이디 찾기</button>
							<button>비밀번호 찾기</button>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="clear"></div>
	
	<!-- footer -->
	<footer>
	<div class="top">
		<div class="container">
			<span>다운로드</span>
			<span>개인정보처리방침</span>
			<span>저작권지침및신고</span>
			<span>이메일무단수집거부</span>
		</div>
	</div>
	<div class="container">
		<strong>
		Home : Location Log : Tag Log : Media Log : Guestbook :
		Admin : New Post
		</strong>
		<div class="copyright">
			COPYRIGHT &copy; yurryme's
			BLOG IS POWERED BY DAUM / DESUGNED BY TISTORY
		</div>
	</div>
	</footer>
</body>
</html>