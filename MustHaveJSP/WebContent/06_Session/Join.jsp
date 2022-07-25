<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join.jsp</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp"/>
	<h2>회원가입 페이지</h2>
	<form action="JoinProcess.jsp" method="post" name="JoinFrm"
        onsubmit="return validateForm(this);">
		<fieldset>
			<legend>개인 정보 입력</legend>
			<table>
				<tr>
					<td><label for ="id">아이디</label></td>
					<td>
						<input type="text" name="user_id" placeholder="이름을 입력하시오" required="required" autofocus="autofocus" id="name">
					</td>
				</tr>
				<tr>
					<td><label for ="pw">비밀번호</label></td>
					<td>
						<input type="number" name="user_pw" placeholder="이메일을 입력하시오" id="email">
					</td>
				</tr>
				<tr>
					<td><label for ="name">이름</label></td>
					<td>
						<input type="text" name="user_name" placeholder="이메일을 입력하시오" id="email">
					</td>
				</tr>
			</table>
			<input type="submit" value="가입하기">
			<input type="reset" value="취소">
		</fieldset>
	</form>
</body>
</html>