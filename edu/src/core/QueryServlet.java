package core;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/queryget")
public class QueryServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter(); //화면 표시 출력 용
		String userName = request.getParameter("guestName"); //get 방식으로 이름 전달
		int number = Integer.parseInt(request.getParameter("num")); //문자열을 정수로
		out.print("<h2>요청 방식 : " + request.getMethod() + "</h2>");
		out.print("<h2>요청 URI : " + request.getRequestURI() + "</h2>");
		out.print("<h2>당신의 이름은 " + userName + "이군요!</h2>"); //get으로 받은 정보
		out.print("<h2>당신이 좋아하는 숫자는 " + number + "이군요!</h2>");
		out.print("<a href = '" + request.getHeader("referer") + "'> 입력 화면으로 가기</a>");
		out.close();
	}

}
