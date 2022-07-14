package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnect {
	public Connection con; //데이터베이스 연결을 담당
	public Statement stmt; //인파라미터가 없는 정적쿼리문 실행
	public PreparedStatement psmt; //동적 쿼리문 실행
	//인파라미터가 있는 동적 쿼리문 인파라미터는 쿼리문 작성 시 매개변수 전달된 값을 설정
	//?로 표현하는데 sql문법 대체용
	public ResultSet rs; //select 쿼리문 결과를 저장할 때 사용
	
	public JDBConnect() {
		try {
			//JDBC 드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver");
			
			//DB연결
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "musthave";
			String pass = "1234";
			con = DriverManager.getConnection(url,id,pass);
			
			System.out.println("DB연결 성공 (기본 생성자)");
			
		}catch(Exception e) {
			e.printStackTrace(); //예외 로그 출력
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
			
			System.out.println("JDBC 자원 해제 완료");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}