package core;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/upload")
//클라이언트에서 전송되는 multipart/form-data 형식의 데이터를 Part 객체로 추출할 수 있는 애노테이션 정의
//파일 당 최대 사이즈 5MB, 전체 요청  데이터 사이즈는 25MB 제한
@MultipartConfig(location = "c:/uploadtest", maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class UploadServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out= response.getWriter();
		
		request.setCharacterEncoding("utf-8");
		String path = "C:/uploadtest";
		File isDir = new File(path);
		if(!isDir.isDirectory()) {
			isDir.mkdirs();
		}
		Collection<Part> parts = request.getParts();
		for(Part part : parts) {
			if(part.getContentType() != null) {
				String fileName = part.getSubmittedFileName(); //업로드된 파일의 파일명을 추출
				if(fileName != null) {
					//업로드된 파일의 내용을 아규먼트에 지정된 파일명으로 저장
					part.write(fileName.substring(0, fileName.lastIndexOf(".")) + "_" + 
								System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf(".")));
					out.print("<br>업로드한 파일 이름: " + fileName);
					out.print("<br>크기 : " + part.getSize());
				}
			}else {
				String partName = part.getName();
				String fieldValue = request.getParameter(partName);
				out.print("<br>" + partName + ": " + fieldValue);
			}
		}
		out.close();
	}

}
