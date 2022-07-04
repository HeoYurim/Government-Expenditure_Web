package core;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sessiontest")
public class SessionTestServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter(); //브라우저로 한글 출력
		
		String command = request.getParameter("comm"); //name을 command로 생성
		HttpSession session = request.getSession(); //세션 정보를 받아온다.
		String msg =""; //메시지를 저장할 변수 선언
		long time = session.getCreationTime(); //세션 시간 정보 생성
		String id = session.getId(); //Id 정보 삽입
		if(command.equals("view")) { //get 방식으로 값이 view인 경우 코드
			if(session.isNew()) { //기존 세션인지.
				msg = "세션 객체 생성 : ";
			}else {
				msg = "세션 객체 추출 : ";	
			}
			msg += "<br>id : " + id + "<br>time : " + new Date(time); //쿠키 정보 출력
		}else if(command.equals("delete")) { //?comm=delete 삭제
			session.invalidate(); //세션 삭제
			msg = id + "을 id로 갖는 세션 객체 삭제!";
		}else {
			msg = "요청시 Query 문자열로 comm=view 또는 comm=delete를 " + "전달해주세요"; //get입력 오류시 발생
		}
		out.print("<h2>" + msg + "</h2>");
		out.close();
	}

}
