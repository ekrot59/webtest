package jspbook.solProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LoginBean {
	
	private String a_id;
	private String a_passwd;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	String jdbc_url = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	void connect() {

		try {
			Class.forName(jdbc_driver);
		
			conn = DriverManager.getConnection(jdbc_url,"ywk","ywk" +"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getA_passwd() {
		return a_passwd;
	}
	public void setA_passwd(String a_passwd) {
		this.a_passwd = a_passwd;
	}
	
	public boolean checkUser() {
		connect();
		
		String sql = "select a_passwd from audience where a_id=?";
		
		try {
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,a_id);
			ResultSet rs = pstmt.executeQuery();
			if(a_id!=""){
				if(rs.next()){
					if(rs.getString("a_passwd").equals(a_passwd)) {
						rs.close();
						disconnect();
						return true ;
					}
					else{
						rs.close();
						disconnect();
						return false;
					}		
				}
		}
			
		}
		catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	
		finally {
			disconnect();
		}
		return false;
	}

}
