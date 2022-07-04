package core;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/forward")
public class forwardServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ForwardServlet 수행");
	//	RequestDispatcher rd = request.getRequestDispatcher("/edu/servletexam/output.html");
		RequestDispatcher rd = request.getRequestDispatcher("http://www.naver.com");
		rd.forward(request, response);
	}

}
