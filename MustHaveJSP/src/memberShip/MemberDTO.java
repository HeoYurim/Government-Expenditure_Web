package memberShip;

public class MemberDTO {
	//멤버 변수 선언
	private String id;
	private String pass;
	private String name;
	private String regidate;
	
	//게터 세터 선언
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegdate() {
		return regidate;
	}
	public void setRegdate(String regdate) {
		this.regidate = regdate;
	}
}
