package common;

public class Person {
	private String name; 
	private int age; //필드 생성(멤버 변수, 규약 2번)
	
	public Person() {  } //기본 생성자(규약 3번)
	
	//인수를 받는 생성자
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

	//4번 5번 규약을 이용한 getter setter 생성
	public String getName() {return name;}
	public int getAge() {return age;}

	public void setName(String name) {this.name = name;}
	public void setAge(int age) {this.age = age;}
}
