package core;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RequestInfoServlet
 */
@WebServlet("/RequestInfoServlet")
public class RequestInfoServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String contextPath = request.getContextPath();
		String method = request.getMethod();
		String protocol = request.getProtocol();
		String remoteAddr = request.getRemoteHost();
		String requestURI = request.getRequestURI();
		String requestURL = new String(request.getRequestURL());
		String serverName = request.getServerName();
		String userAgent = request.getHeader("user-agent");
		String referer = request.getHeader("referer");
		String cilentMachine = "";
		boolean result = Pattern.matches(
			".*[win16|win32|linux|win64|mac].*", userAgent.toLowerCase()
		);
		
		if(result) {
			cilentMachine ="PC";
		}else {
			cilentMachine ="모바일";
		}
		
		String brower = "";
		if(userAgent.indexOf("Trident") > 0 || userAgent.indexOf("MSIE") > 0) {
			brower = "IE";
		}else if(userAgent.indexOf("Opera") > 0) {
			brower = "Opera";
		}else if(userAgent.indexOf("Firefox") > 0) {
			brower = "Firefox";
		}else if(userAgent.indexOf("Safari") > 0) {
			if(userAgent.indexOf("Edge") > 0) {
				brower = "Edge";
			}else if(userAgent.indexOf("Chrome") > 0) {
				brower = "Chrome";
			}else {
				brower = "Safari";
			}
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<h3>요청 정보를 통해서 추출한 내용</h3>");
		out.println("<ul>");
		out.println("<li>요청 컨텍스트 패스 : " + contextPath + "</li>");
		out.println("<li>요청 방식 : " + method + "</li>"); 
		out.println("<li>요청 프로토콜 : " + protocol + "</li>");
		out.println("<li>요청 클라이언트 주소 : " + remoteAddr + "</li>");
		out.println("<li>요청 URI : " + requestURI + "</li>");
		out.println("<li>요청 URL : " + requestURL + "</li>");
		out.println("<li>요청 서버명 : " + serverName + "</li>");
		out.println("<li>요청 브라우저 종류 : " + brower + "</li>");
		out.println("<li>이 콘텐프를 요청한 웹 페이지 : " + referer + "</li>");
		out.println("</ul>");
		out.close();
	}

}
