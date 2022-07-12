<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String popupMode ="on"; //레이어 팝업 창 띄울지 여부

Cookie[] cookies = request.getCookies(); //쿠키를 읽어 팝업 값 설정
if(cookies != null){
	for(Cookie c : cookies){
		String cookieName = c.getName();
		String cookieValue = c.getValue();
		if(cookieName.equals("PopupClose")){
			popupMode = cookieValue; //on.off 표시용
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업 관리 ver 0.1</title>
<style>
	div#popup{
		position : absolute; top:100px; left: 50px; color : yellow;
		width : 270px; height : 100px; background-color : gray;
	}
	div#popup > div{
		position : relative; background-color:#ffffff; top:0px;
		border:1px solid gray; padding : 10px; color : black;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$('#closeBtn').click(function(){
			$('#popup').hide();
			var chkval = $("input:checkbox[id=inactiveToday]:checked").val();
			
			$.ajax({ //4. 비동기로 요청을 보낸다.
				url : './PopupCookir=e.jsp', 	//1. PopupCookie.jsp 파일에
				type : 'get',				 	//2. http get 방식으로
				data : {inactiveToday : chkval},//3. chkval 값을 
				dataType : "text",				//5. 응답 데이터 타입은 일반 텍스트이며
				success : function(resData){	//6. 요청 성공시
					if(resData != '') 			//7. 응답 데이터가 있다면
						location.reload(); 		//8. 페이지를 새로고침 합니다.
				}
			})
		});
	});
</script>
</head>
<body>
	<h2>팝업 메인 페이지(ver0.1)</h2>
	<%
	for(int i = 1; i <= 10; i++){
		out.print("현재 팝업창은 " + popupMode + "상태입니다. <br/>");
	}
	
	if(popupMode.equals("on"));{
	%>	
		<div id = "popup">
			<h2 align="center">공지사항 팝업입니다.</h2>
			<div align="right"><form name ="popFrm">
				<input type="checkbox" id="inactiveToday" value="1"/>
				하루동안 열지 않음
				<input type="button" value="닫기" id="closeBtn"/> 
			</form>
			</div>
		</div>
	<%
	}
	 %>
</body>
</html>