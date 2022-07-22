package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect{
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	//검색 조건에 맞는 게시물이 개수를 반환
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		//게시물 수를 얻어오는 쿼리문 작성
		String query = "SELECT COUNT(*) FROM BOARD";
		if(map.get("searchWord")!= null) {
			query += "WHERE" + map.get("serachField") + " " +
					" LIKE '%" + map.get("serachWord") + "%'";
		}
		try {
			stmt = con.createStatement(); //쿼리문 생성
			rs = stmt.executeQuery(query); //쿼리 실행
			rs.next();
			totalCount = rs.getInt(1); //첫번째 컬럼 값을 가져옴
		}catch(Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
		}
		return totalCount;
	}
	
	public List<BoardDTO> selectList(Map<String, Object> map){
		//결과(게시물 목록)을 담을 변수
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		String query = "SELECT * FROM board ";
		if(map.get("searchWord")!= null) {
			query += "WHERE" + map.get("serachField") + " " +
					" LIKE '%" + map.get("serachWord") + "%'";
		}
			query += " ORDER BY num DESC "; //내림차순 정렬
			
			try {
				stmt = con.createStatement(); //쿼리문 생성
				rs = stmt.executeQuery(query); //쿼리문 실행
				
				while(rs.next()) { //결과를 순차적으로 반복 출력
					//한 행(게시물 하나)의 내용을 DTO로 보냄
					BoardDTO dto = new BoardDTO(); //dto 객체 생성
					
					dto.setNum(rs.getString("num"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setPostdate(rs.getDate("postdate"));
					dto.setId(rs.getString("id"));
					dto.setVisitcount(rs.getString("visitcount"));
					
					bbs.add(dto); //DTO를 LIST 컬렉션에 담는다.
				}
				
			}catch(Exception e) {
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace(); //예외발생시 로그 출력
			}
			return bbs; //쿼리 결과를 list 컬렉션을 jsp 반환
	}
}