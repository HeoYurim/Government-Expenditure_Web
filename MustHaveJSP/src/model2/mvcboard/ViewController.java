package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/mvcboard/view.mit")
public class ViewController extends HttpServlet{

	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		//게시물 가져오기
		MVCBoardDAO dao = new MVCBoardDAO();
		String idx = req.getParameter("idx");
		dao.updateVisitCount(idx); //조회수 1씩 증가
		MVCBoardDTO dto = dao.selectView(idx); //인덱스 검색
		dao.close();
		
		//줄바꿈 처리
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
		
		//게시물(dto) 저장 후 뷰로 포워드
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/14_MVC/View.jsp").forward(req, resp);
	}
	
}