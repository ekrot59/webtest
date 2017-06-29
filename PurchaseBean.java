package jspbook.solProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PurchaseBean {

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
	
	
		public boolean updateDB(Purchase purchase) {
			connect();
			
			String sql ="update purchase set r_name=?, p_id=? where codenum=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1,purchase.getR_name());
				pstmt.setInt(2,purchase.getP_id());
				pstmt.setInt(3,purchase.getCodenum());
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
		
	
		public boolean deleteDB(int codenum) {
			connect();
			
			try {
				
				String sql ="delete from purchase where codenum=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1,codenum);
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

			ArrayList<Purchase> datas = new ArrayList<Purchase>();
			
			String sql = "select * from purchase order by codenum desc";
			try {
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();

				while(rs.next()) {
					Purchase purchase = new Purchase();
					purchase.setCodenum(rs.getInt("codenum"));
					purchase.setR_name(rs.getString("r_name"));
					purchase.setP_id(rs.getInt("p_id"));
					datas.add(purchase);
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
		
		public Purchase getDB(Integer codenum) {
			connect();
			
			String sql = "select * from purchase where codenum=?";

			Purchase purchase = new Purchase();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,codenum);
				ResultSet rs = pstmt.executeQuery();
				
				rs.next();
				purchase.setP_id(rs.getInt("p_id"));
				purchase.setR_name(rs.getString("r_name"));
				purchase.setCodenum(rs.getInt("codenum"));
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				disconnect();
			}
			return purchase;
		}
		
		
		
		public ArrayList getDBListPurchase(){
			connect();
			
			ArrayList<Purchase> datas = new ArrayList<Purchase>();
			String sql = "select p_id, r_name, codenum from purchase where p_id = (select max(p_id) from purchase)";
			try {
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()){
					Purchase purchase = new Purchase();
					purchase.setP_id(rs.getInt("p_id"));
					purchase.setR_name(rs.getString("r_name"));
					purchase.setCodenum(rs.getInt("codenum"));
					datas.add(purchase);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				disconnect();
			}
			return datas;
		}
		
		
		public ArrayList<Purchase> getDBListPurchaseAll(String a_id){
			connect();
			
			ArrayList<Purchase> datas = new ArrayList<Purchase>();
			String sql = "select P1.p_id, P1.r_name, codenum from purchase P1, purchase_user P2  where p2.p_id =p1.p_id  and p2.a_id = '"+a_id+"' order by codenum";
			try {
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()){
					Purchase purchase = new Purchase();
					purchase.setP_id(rs.getInt("p_id"));
					purchase.setR_name(rs.getString("r_name"));
					purchase.setCodenum(rs.getInt("codenum"));
					datas.add(purchase);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				disconnect();
			}
			return datas;
		}
}
