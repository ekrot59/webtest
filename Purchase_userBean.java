package jspbook.solProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Purchase_userBean {

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	String jdbc_url = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	void connect() {

		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url,"ywk","ywk");
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
	
	public boolean insertToPurchaseUser(Audience audience, ArrayList order_list){
		connect();
		
		String strSQL = "SELECT Max(p_id) FROM purchase_user";
		String strSQL2 = "SELECT Max(codenum) FROM purchase";
		String sql ="insert into purchase_user(a_id,a_name,a_tel,p_id) values(?,?,?,?)";
		String sql2 ="insert into purchase(codenum, r_name, p_id) values(?,?,?)";
		try {
			
			pstmt = conn.prepareStatement(strSQL);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int p_id = rs.getInt(1) + 1;
			
			pstmt = conn.prepareStatement(strSQL2);
			ResultSet rs2 = pstmt.executeQuery();
			rs2.next();
			int codenum = rs2.getInt(1) + 1;

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,audience.getA_id());
			pstmt.setString(2,audience.getA_name());
			pstmt.setString(3,audience.getA_tel());
			pstmt.setInt(4,p_id);
			pstmt.executeUpdate();
			
			//pstmt = conn.prepareStatement(sql2);
			for(int i = 0 ; i < order_list.size(); i++){
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1,codenum + i);
				pstmt.setString(2, (String)order_list.get(i));
				pstmt.setInt(3, p_id);
				pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	public boolean insertToPurchase(ArrayList order_list){
		connect();
		String strSQL = "SELECT Max(codenum) FROM purchase";
		String strSQL2 = "SELECT Max(p_id) FROM purchase_user";
		String sql ="insert into purchase(codenum, r_name, p_id) values(?,?,?)";
		try {
			pstmt = conn.prepareStatement(strSQL);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int codenum = rs.getInt(1);	
			
			pstmt = conn.prepareStatement(strSQL2);
			ResultSet rs2 = pstmt.executeQuery();
			rs2.next();
			int p_id = rs2.getInt(1);
			
			for(int i = 0; i < order_list.size();i++){
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,codenum+i);
				pstmt.setString(2, (String) order_list.get(i));
				pstmt.setInt(3, p_id);
				pstmt.executeQuery();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	

	
	public boolean updateDB(Purchase_user purchase_user) {
		connect();
		
		String sql ="update Purchase_user set a_id=?, a_name=?, a_tel=? where p_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,purchase_user.getA_id());
			pstmt.setString(2,purchase_user.getA_name());
			pstmt.setString(3,purchase_user.getA_tel());
			pstmt.setInt(4,purchase_user.getP_id());
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
	

	public boolean deleteDB(int p_id) {
		connect();
		
		try {
			
			String sql ="delete from purchase_user where p_id=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,p_id);
			pstmt.executeUpdate();
		
			String sql2 = "UPDATE purchase_user SET p_id = p_id - 1 WHERE p_id > ?";
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1,p_id);
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
	
	public ArrayList getDBList() {
		connect();

		ArrayList<Purchase_user> datas = new ArrayList<Purchase_user>();
		
		String sql = "select * from Purchase_user order by p_id desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				Purchase_user purchase_user = new Purchase_user();
				purchase_user.setP_id(rs.getInt("p_id"));
				purchase_user.setA_id(rs.getString("a_id"));
				purchase_user.setA_name(rs.getString("a_name"));
				purchase_user.setA_tel(rs.getString("a_tel"));
				datas.add(purchase_user);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas;
	}
	
	public Purchase_user getDB(Integer p_id) {
		connect();
		
		String sql = "select * from Purchase_user where p_id=?";

		Purchase_user purchase_user = new Purchase_user();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,p_id);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			purchase_user.setP_id(rs.getInt("p_id"));
			purchase_user.setA_id(rs.getString("a_id"));
			purchase_user.setA_name(rs.getString("a_name"));
			purchase_user.setA_tel(rs.getString("a_tel"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return purchase_user;
	}
}
