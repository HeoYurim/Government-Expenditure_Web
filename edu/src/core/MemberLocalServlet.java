package core;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberLocalServlet
 */
@WebServlet("/MemberLocalServlet")
public class MemberLocalServlet extends HttpServlet {
	
	int member_v = 0; //필드 영역(멤버 변수)
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8"); //한글 지원 타입
		PrintWriter out = response.getWriter();
		int local_v = 0; //지역 변스
		
		member_v++; //멤버 변수 증가
		local_v++; //지역 변수 증가
		
		out.print("<h2>member_v(멤버변수) : " + member_v + "</h2>");
		out.print("<h2>local_v(지역변수) : " + local_v + "</h2>");
		out.close();
	}

}