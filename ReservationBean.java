package jspbook.solProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReservationBean {
	
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
	
	public boolean insertDB(Reservation reservation) {
		connect();
		String sql ="select r_name, r_price from ride where r_id =?";
		String sql2 ="insert into reservation(res_id, a_id, r_id, r_name, count, r_price) values(?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reservation.getR_id());
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String r_name = rs.getString("r_name");
			int r_price = rs.getInt("r_price");
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1,reservation.getRes_id());
			pstmt.setString(2,reservation.getA_id());
			pstmt.setInt(3,reservation.getR_id());
			pstmt.setString(4,r_name);
			pstmt.setInt(5,reservation.getCount());
			pstmt.setInt(6,r_price);
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
	
	public boolean checkDB(String a_id, Integer r_id){
		Boolean result = null;
		connect();
		String sql = "select res_id from reservation where a_id=? and r_id=?";
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a_id);
			pstmt.setInt(2, r_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(!rs.next())
				result = false;
			else
				result = true;
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return result;
	}
	
		public boolean updateDB(Reservation reservation, Ride ride) {
		connect();
		
		String sql ="update reservation set count=? where a_id=? and r_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,ride.getCount());
			pstmt.setString(2,reservation.getA_id());
			pstmt.setInt(3,ride.getR_id());
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
	
	public boolean deleteDBP(Reservation reservation, Ride ride) {
		connect();
		
		try {
			
			String sql ="delete from reservation where a_id=? and r_id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,reservation.getA_id());
			pstmt.setInt(2, ride.getR_id());
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
	
	
	public boolean deleteDB(Reservation reservation) {
		connect();
		
		try {
			String sql ="delete from reservation where a_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,reservation.getA_id());
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
	
	
	public int checkOrder(String a_id){
		connect();
		
		int p_id = 0;
		String sql = "select p_id from purchase_user where a_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,a_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())	//占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
				p_id = rs.getInt("p_id");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return p_id;
	}
	
	public ArrayList getDBList(){
		connect();
		
		ArrayList<Reservation> datas = new ArrayList<Reservation>();
		String sql = "select * from Reservation order by r_id desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				Reservation reservation = new Reservation();
				reservation.setRes_id(rs.getString("res_id"));
				reservation.setA_id(rs.getString("a_id"));
				reservation.setR_id(rs.getInt("r_id"));
				reservation.setR_name(rs.getString("r_name"));
				reservation.setCount(rs.getInt("count"));
				reservation.setR_price(rs.getInt("r_price"));
				datas.add(reservation);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas;
	}
	

	//장바구니 리스트 가져오기
		public ArrayList getDBListRes(String a_id){
			connect();
			
			ArrayList<Reservation> datas = new ArrayList<Reservation>();
			String sql = "select r_id, r_name, r_price, count from reservation where a_id = '" + a_id + "' ";
			try {
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()){
					Reservation reservation = new Reservation();
					reservation.setR_id(rs.getInt("r_id"));
					reservation.setR_name(rs.getString("r_name"));
					reservation.setR_price(rs.getInt("r_price"));
					reservation.setCount(rs.getInt("count"));
					datas.add(reservation);
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
