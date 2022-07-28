package memberShip;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
    // 명시한 데이터베이스로의 연결이 완료된 MemberDAO 객체를 생성합니다.
    public MemberDAO(String drv, String url, String id, String pw) {
        super(drv, url, id, pw);
    }
    
    
    // 명시한 아이디/패스워드와 일치하는 회원 정보를 반환합니다.
    public MemberDTO getMemberDTO(String uid, String upass) {
        MemberDTO dto = new MemberDTO();  // 회원 정보 DTO 객체 생성
        String query = "SELECT * FROM member WHERE id=? AND pass=?";  // 쿼리문 템플릿

        try {
            // 쿼리 실행
            psmt = con.prepareStatement(query); // 동적 쿼리문 준비
            psmt.setString(1, uid);    // 쿼리문의 첫 번째 인파라미터에 값 설정
            psmt.setString(2, upass);  // 쿼리문의 두 번째 인파라미터에 값 설정
            rs = psmt.executeQuery();  // 쿼리문 실행

            // 결과 처리
            if (rs.next()) {
                // 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
                dto.setId(rs.getString("id"));
                dto.setPass(rs.getString("pass"));
                dto.setName(rs.getString(3));
                dto.setRegidate(rs.getString(4));
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return dto;  // DTO 객체 반환
    }
    
    public MemberDAO(ServletContext application) {
        super(application);
    }
    
 // 게시글 데이터를 받아 DB에 추가합니다.
    public int insertWrite(MemberDTO dto){
        int result = 0;
        
        try {
           //INSERT 쿼리문 작성
           String query = "INSERT INTO member( "
                     + " id, pass, name) "
                     + "VALUES( "
                     + " ?, ?, ?)";
           psmt = con.prepareStatement(query); //동적 쿼리
           psmt.setString(1, dto.getId());
           psmt.setString(2, dto.getPass());
           psmt.setString(3,  dto.getName());
         
           result = psmt.executeUpdate();
        }
        catch(Exception e) {
           System.out.println("게시물 입력 중 예외 발생");
           e.printStackTrace();
        }
        return result;
     }
}
