package core;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LottoServlet
 */
@WebServlet("/lotto")
public class LottoServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int answer = (int)(Math.random() * 10) + 1;
		int input = Integer.parseInt(request.getParameter("guess"));
		String msg="";
		if(answer == input) {
			msg = "<h3>축하합니다...당첨되셨어요!</h3>";
		}else {
			msg = "<h3>다음 기회를...</h3><a href='" + request.getHeader("referer") + "'>재도전</a>";
		}
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(msg);
		out.close();
	}

}


