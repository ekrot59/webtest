

package jspbook.solProject;

import java.sql.*;
import java.util.*;

public class AudienceBean {
//	 �����ͺ��̽� �������? ���� ����
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	// �����ͺ��̽� �������������? ���ڿ��� ����
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	String jdbc_url = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	// �����ͺ��̽� ���� �޼���
	void connect() {
		// JDBC ����̹�? �ε�
		try {
			Class.forName(jdbc_driver);
			// �����ͺ��̽� ���������� �̿��� Connection �ν��Ͻ� Ȯ��
			conn = DriverManager.getConnection(jdbc_url,"ywk","ywk");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// �����ͺ��̽� ���� ���� �޼���
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
	//	 �Խù� ���? �޼���
	public boolean insertDB(Audience audience) {
		connect();
		
		String sql ="insert into audience(a_id,a_name,a_passwd,a_tel,a_email) values(?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,audience.getA_id());
			pstmt.setString(2,audience.getA_name());
			pstmt.setString(3,audience.getA_passwd());
			pstmt.setString(4,audience.getA_tel());
			pstmt.setString(5,audience.getA_email());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	public boolean deleteDB(String a_id) {
		connect();
		
		String sql ="delete from audience where a_id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,a_id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	//ID �ߺ� üũ �޼ҵ�
	public boolean checkID(String a_id){
		Boolean check = null;
		connect();
		String sql = "select a_id from audience where a_id=?";
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(!rs.next())
				check = true;
			else
				check = false;
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return check;
	}
	
	//���? ���� ��������.
	public Audience getAudience(String a_id) {
		connect();
		
		Audience audience = new Audience();
		
		String sql ="select * from audience where a_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a_id);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			audience.setA_id(rs.getString("a_id"));
			audience.setA_name(rs.getString("a_name"));
			audience.setA_passwd(rs.getString("a_passwd"));
			audience.setA_tel(rs.getString("a_tel"));
			audience.setA_email(rs.getString("a_email"));
			rs.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return audience;
	}
}
