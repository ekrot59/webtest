package jspbook.solProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RideBean {

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
	public boolean insertDB(Ride ride) {
		connect();
		
		try {
			
			String strSQL = "SELECT Max(r_id) FROM ride";
			PreparedStatement pstmt1 = conn.prepareStatement(strSQL);
			ResultSet rs = pstmt1.executeQuery();
			rs.next();
			int  r_id = rs.getInt(1) + 1;	
			
			String sql ="insert into ride(r_id,r_name,r_place,r_offseason,r_price) values(?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,r_id);
			pstmt.setString(2,ride.getR_name());
			pstmt.setString(3,ride.getR_place());
			pstmt.setString(4,ride.getR_offseason());
			pstmt.setInt(5,ride.getR_price());
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

		ArrayList<Ride> datas = new ArrayList<Ride>();
		
		String sql = "select * from ride order by r_id desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Ride ride = new Ride();
				ride.setR_id(rs.getInt("r_id"));
				ride.setR_name(rs.getString("r_name"));
				ride.setR_place(rs.getString("r_place"));
				ride.setR_offseason(rs.getString("r_offseason"));
				ride.setR_price(rs.getInt("r_price"));
				datas.add(ride);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		// 처占쏙옙占쏙옙 占쏙옙占쏙옙 ArrayList 占쏙옙 占쏙옙占쏙옙占쏙옙.
		return datas;
	}
	
	public Ride getDB(Integer r_id) {
		connect();
		
		String sql = "select * from ride where r_id=?";

		Ride ride = new Ride();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,r_id);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			ride.setR_id(rs.getInt("r_id"));
			ride.setR_name(rs.getString("r_name"));
			ride.setR_place(rs.getString("r_place"));
			ride.setR_offseason(rs.getString("r_offseason"));
			ride.setR_price(rs.getInt("r_price"));
			//ride.setCount(rs.getInt("count"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return ride;
	}
	
	public boolean updateDB(Ride ride) {
		connect();
		
		String sql ="update ride set r_name=?, r_place=?, r_offseason=?, r_price=? where r_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1,ride.getR_name());
			pstmt.setString(2,ride.getR_place());
			pstmt.setString(3,ride.getR_offseason());
			pstmt.setInt(4,ride.getR_price());
			pstmt.setInt(5,ride.getR_id());
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
	
	public boolean deleteDB(int r_id) {
		connect();
		
		try {
			
			String sql ="delete from ride where r_id=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,r_id);
			pstmt.executeUpdate();
		
			String sql2 = "UPDATE ride SET r_id = r_id - 1 WHERE r_id > ?";
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1,r_id);
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
	
	//장바구니 리스트 가져오기
		public ArrayList getDBListRes(String res_id){
			connect();
			
			ArrayList<Reservation> datas = new ArrayList<Reservation>();
			String sql = "select r_id, r_name, r_price, count from reservation where res_id = '" + res_id + "' ";
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
