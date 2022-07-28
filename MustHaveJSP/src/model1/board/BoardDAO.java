package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;
import javax.servlet.ServletContext;
import common.JDBConnect;

public class BoardDAO extends JDBConnect {
   public BoardDAO(ServletContext application) {
      super(application);
   }
   
   // 검색 조건에 맞는 게시물의 개수를 반환
   public int selectCount(Map<String, Object> map) {
      int totalCount = 0; // 초기값 설정
      // 게시물 수를 얻어오는 쿼리문 작성 SELECT COUNT(*) FROM BOARD WHERE searchField LIKE '%searchWord%'
      String query = "SELECT COUNT(*) FROM BOARD ";
      if(map.get("searchWord") != null) {
         query += " WHERE " + map.get("searchField") + " " + "LIKE '%" + map.get("searchWord") + "%'";
      }
      try {
         stmt = con.createStatement(); // 쿼리문 생성
         rs = stmt.executeQuery(query); // 쿼리 실행
         rs.next();
         totalCount = rs.getInt(1); // 첫번째 컬럼 값을 가져옴
      } catch(Exception e) {
         System.out.println("게시물 수를 구하는 중 예외 발생");
         e.printStackTrace();
      }
      return totalCount;
   }
   
   // 게시물 목록 가져오기
   public List<BoardDTO> selectList(Map<String, Object> map){
      List<BoardDTO> bbs = new Vector<BoardDTO>(); // 결과(게시물 목록)를 담을 변수
      
      String query = "SELECT * FROM BOARD ";
      if(map.get("searchWord") != null) {
         query += " WHERE " + map.get("searchField") + " " + "LIKE '%" + map.get("searchWord") + "%'";         
      }
      query += " ORDER BY NUM DESC "; // 내림차순 정렬
      try {
         stmt = con.createStatement(); // 쿼리문 생성
         rs = stmt.executeQuery(query); // 쿼리문 실행
         
         while(rs.next()) { // 결과를 순차적으로 반복 출력
            // 한 행(게시물 하나)의 내용을 DTO로 보냄
            BoardDTO dto = new BoardDTO(); // dto객체 생성
            
            dto.setNum(rs.getString("num"));
            dto.setTitle(rs.getString("title"));
            dto.setContent(rs.getString("content"));
            dto.setPostdate(rs.getDate("postdate"));
            dto.setId(rs.getString("id"));
            dto.setVisitcount(rs.getString("visitcount"));
            
            bbs.add(dto); // DTO를 LIST 컬렉션에 담는다.
         }
      } catch(Exception e) {
         System.out.println("게시물 조회 중 예외 발생");
         e.printStackTrace(); // 예외 발생 시 로그 출력
      }
      return bbs; // 쿼리 결과를 list 컬렉션을 jsp 반환
   }
   
   public List<BoardDTO> selectListPage(Map<String, Object> map){
	   List<BoardDTO> bbs = new Vector<BoardDTO>(); //결과(게시물 목록)을 담을 변수
	   
	   //쿼리문 템플릿
	   String query = "SELECT * FROM ("
			   + "		SELECT Tb.*, ROWNUM rNUM FROM ( "
			   + "			SELECT * FROM board";
	   
	   //검색 조건 추가
	   if(map.get("searchWord")!= null) {
		   query += "WHERE" + map.get("searchField") 
		   		+ "LIKE '%" + map.get("searchWord") + "%' ";
	   }
	   
	   query += "	ORDER BY num DESC "
			   +"	) Tb"
			   +" ) "
			   +" WHERE rNum BETWEEN ? AND ?";
	   
	   try {
		   //쿼리문 완성
		   psmt = con.prepareStatement(query);
		   psmt.setString(1, map.get("start").toString());
		   psmt.setString(2, map.get("end").toString());
		   
		   //쿼리문 실행
		   rs = psmt.executeQuery();
		   
		   while(rs.next()) {
			   //한 행(게시물 하나)의 데이터를 DTO에 저장
			   BoardDTO dto = new BoardDTO();
			   dto.setNum(rs.getString("num"));
			   dto.setTitle(rs.getString("title"));
			   dto.setContent(rs.getString("content"));
			   dto.setPostdate(rs.getDate("postdate"));
			   dto.setId(rs.getString("id"));
			   dto.setVisitcount(rs.getString("visitcount"));
			   
			   //반환할 결과 목록에 게시물 추가
			   bbs.add(dto);
		   }
	   }catch(Exception e) {
		   System.out.println("게시물 조회 중 예외 발생");
		   e.printStackTrace();
	   }
	   
	   //목록 반환
	   return bbs;
   }
   
   // 게시글 데이터를 받아 DB에 추가합니다.
   public int insertWrite(BoardDTO dto){
       int result = 0;
       
       try {
          //INSERT 쿼리문 작성
          String query = "INSERT INTO board( "
                    + " num, title, content, id, visitcount) "
                    + "VALUES( "
                    + " seq_board_num.NEXTVAL, ?, ?, ?, 0)";
          psmt = con.prepareStatement(query); //동적 쿼리
          psmt.setString(1, dto.getTitle());
          psmt.setString(2, dto.getContent());
          psmt.setString(3,  dto.getId());
          
          result = psmt.executeUpdate();
       }
       catch(Exception e) {
          System.out.println("게시물 입력 중 예외 발생");
          e.printStackTrace();
       }
       return result;
    }
   
   // 지정한 게시물을 찾아 내용을 반환하는 메서드
   public BoardDTO selectView(String num) {
      BoardDTO dto = new BoardDTO();
      
      // 쿼리 생성
      String query = "SELECT B.*, M.name " // board 테이블의 모든 컬럼과, member 테이블의 name 컬럼을 선택
            + "FROM member M INNER JOIN board B " // member는 M으로, board는 B로 별칭 사용
            + "ON M.id=B.id "
            + "WHERE num=?";
      // board 테이블에는 작성자의 아이디만 저장된다.
      // 이름을 출력하기 위해서 member 테이블과의 조인이 필요하다.
      // board 테이블의 모든 컬럼과 member 테이블의 name 컬럼을 가져온다.
      
      try {
         psmt = con.prepareStatement(query);
         psmt.setString(1, num); // 인파리미터를 일련번호로 설정
         rs = psmt.executeQuery(); // 쿼리문을 실행하여 rs에 저장
         
         //결과처리
         if(rs.next()) { // ResultSet 객체로 반환된 행을 next() 확인
            dto.setNum(rs.getString(1));
            dto.setTitle(rs.getString(2));
            dto.setContent(rs.getString("content"));
            dto.setPostdate(rs.getDate("postdate"));
            dto.setId(rs.getString("id"));
            dto.setVisitcount(rs.getString(6));
            dto.setName(rs.getString("name"));
         }
      } catch(Exception e) {
         System.out.println("게시물 상세보기 예외 발생");
         e.printStackTrace();
      }
      return dto;
   }
   
   public void updateVisitCount(String num) {
	   String query = "UPDATE board SET " + "visitcount = visitcount+1"
			   		+ "WHERE num =?";
	   
	   try {
		   psmt = con.prepareStatement(query);
		   psmt.setString(1, num); //인파라미터를 일련번호로 설정
		   psmt.executeQuery(); //쿼리 실행
		   
	   }catch(Exception e){
		   System.out.println("게시물 조회수 증가 예외 발생");
		   e.printStackTrace();
	   }
   }
   
   public int updateEdit(BoardDTO dto) { //게시물 수정용
	   int result = 0;
	   
	   try { //쿼리문 작성
		   String query = "UPDATE board SET "
				   		+ " title=?, content=? "
				   		+ " WHERE num =? ";
		   
		   //쿼리문 완성 - 인파라미터 제공
		   psmt = con.prepareStatement(query);
		   psmt.setString(1, dto.getTitle());
		   psmt.setString(2, dto.getContent());
		   psmt.setString(3, dto.getNum());
		   
		   //쿼리문 실행
		   result = psmt.executeUpdate();
				   			
	   }catch(Exception e) {
		   System.out.println("게시물 수정 중 예외 발생");
		   e.printStackTrace();
	   }
	   return result;
   }
   
   // 지정한 게시물을 삭제합니다.
   public int deletePost(BoardDTO dto) { 
       int result = 0;

       try {
           // 쿼리문 템플릿
           String query = "DELETE FROM board WHERE num=?"; 

           // 쿼리문 완성
           psmt = con.prepareStatement(query); 
           psmt.setString(1, dto.getNum()); 

           // 쿼리문 실행
           result = psmt.executeUpdate(); 
       } 
       catch (Exception e) {
           System.out.println("게시물 삭제 중 예외 발생");
           e.printStackTrace();
       }
       
       return result; // 결과 반환
   }
}