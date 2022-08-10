package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/13_Servlet/AnnoMapping.mit")
public class AnnoMapping extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("message", "@WebServlet으로 매핑이다");
		req.getRequestDispatcher("/13_Servlet/AnnoMapping.jsp").forward(req, resp);
	}
}