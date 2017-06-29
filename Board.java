package jspbook.solProject;
import java.util.*;

// 방명록 테이블 구조와 동일한 데이터 처리 클래
public class Board {
	//멤버변수
	private int b_id;
	private String b_name;
	private String b_passwd;
	private String b_title;
	private String b_email;
	private Date b_date;
	private String b_contents;
	
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_passwd() {
		return b_passwd;
	}
	public void setB_passwd(String b_passwd) {
		this.b_passwd = b_passwd;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_email() {
		return b_email;
	}
	public void setB_email(String b_email) {
		this.b_email = b_email;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public String getB_contents() {
		return b_contents;
	}
	public void setB_contents(String b_contents) {
		this.b_contents = b_contents;
	}

}
