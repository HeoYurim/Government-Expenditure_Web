package core;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CountServlet")
public class CountServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter(); //브라우저로 한글 출력
		HttpSession session = request.getSession();
		
		if(session.getAttribute("cnt") == null) { //cnt 유무
			session.setAttribute("cnt", new int[1]); //cnt가 없으면 cnt와 배열[1] 생성
		}
		
		int[] count = (int[])session.getAttribute("cnt"); //count에 배열 객체 연결
		count[0]++;
		out.print("<h3>당신은 " + count[0] + "번째 방문입니다.</h3>"); //방문 정보 출력
		out.close(); //종료
	}

}
