package jspbean;

import java.time.LocalTime;

public class TestBean {
	private String name;
	private String time;
	
	public TestBean() {
		LocalTime lt = LocalTime.now();
		time = lt.getHour()+"시 " + lt.getMinute() + "분 " +lt.getSecond() + "초";
		name="Guest";
	}
	public TestBean(String name) {
		LocalTime lt = LocalTime.now();
		time = lt.getHour()+"시 " + lt.getMinute() + "분 " +lt.getSecond() + "초";
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTime() {
		return time;
	}
}
