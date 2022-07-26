package MemberJoin;

import javax.servlet.ServletContext;

import common.JDBConnect;
import memberShip.MemberDTO;

public class MemberJoinDAO extends JDBConnect{
	public MemberJoinDAO(ServletContext application) {
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
