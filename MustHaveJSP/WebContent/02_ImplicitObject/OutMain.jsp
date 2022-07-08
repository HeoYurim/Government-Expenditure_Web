<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OutMain.jsp</title>
</head>
<body>
	<% //버퍼 내용 삭제하기
	out.print("출력되지 않는 텍스트"); //버퍼에 저장
	out.clearBuffer(); //버퍼를 비움 -> 버퍼가 출력되지 않음.
	//윗 줄의 출력 결과가 사라진다.
	
	out.print("<h2>OUT 내장 객체</h2>");
	
	//버퍼 크기 정보 확인
	out.print("출력 버퍼의 크기 : " + out.getBufferSize() + "<br>");
	out.print("남은 버퍼의 크기 : " + out.getRemaining() + "<br>");
	out.print("사용한 버퍼의 크기 : " + (out.getBufferSize() - out.getRemaining()) + "<br>");
	out.print("<br>");
	
	out.flush(); //버퍼 내용 출력
//	out.print("flush 후 출력 버퍼의 크기 : " + out.getBufferSize() + "<br>");
	out.print("flush 후 남은 버퍼의 크기 : " + out.getRemaining() + "<br>");
//	out.print("flush 후 사용한 버퍼의 크기 : " + (out.getBufferSize() - out.getRemaining()) + "<br>");

	//다양한 타입 값을 출력
	out.print(1);
	out.print("<br>");
	out.println(false);
	out.println("안녕하쇼");
	out.println('가');
	%>
</body>
</html>