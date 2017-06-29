package jspbook.solProject;

import java.sql.*;
import java.util.*;

public class BoardBean {
	
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
	

	public boolean updateDB(Board board) {
		connect();
		
		String sql ="update board set b_name=?, b_passwd=?, b_title=?, b_email=?, b_date=sysdate, b_contents=? where b_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1,board.getB_name());
			pstmt.setString(2,board.getB_passwd());
			pstmt.setString(3,board.getB_title());
			pstmt.setString(4,board.getB_email());
			pstmt.setString(5,board.getB_contents());
			pstmt.setInt(6,board.getB_id());
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
	
	
	public boolean deleteDB(int b_id) {
		connect();
		
		try {
			
			String sql ="delete from board where b_id=?";
			
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1,b_id);
			pstmt.executeUpdate();
		
			String sql2 = "UPDATE board SET b_id = b_id - 1 WHERE b_id > ?";
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1,b_id);
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
	

	public boolean insertDB(Board board) {
		connect();
		
		try {
			String strSQL = "SELECT Max(b_id) FROM board";
			PreparedStatement pstmt1 = conn.prepareStatement(strSQL);
			ResultSet rs = pstmt1.executeQuery();
			rs.next();
			int  num = rs.getInt(1) + 1;	

			String sql ="insert into board(b_id, b_name, b_passwd, b_title, b_email, b_date, b_contents) values(?,?,?,?,?,sysdate,?)";
			
			
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1,num);
			pstmt.setString(2,board.getB_name());
			pstmt.setString(3,board.getB_passwd());
			pstmt.setString(4,board.getB_title());
			pstmt.setString(5,board.getB_email());
			pstmt.setString(6,board.getB_contents());
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


	public Board getDB(int b_id) {
		connect();
		
		String sql = "select * from board where b_id=?";

		Board board = new Board();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,b_id);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
	
			board.setB_id(rs.getInt("b_id"));
			board.setB_name(rs.getString("b_name"));
			board.setB_passwd(rs.getString("b_passwd"));
			board.setB_title(rs.getString("b_title"));
			board.setB_email(rs.getString("b_email"));
			board.setB_date(rs.getDate("b_date"));
			board.setB_contents(rs.getString("b_contents"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return board;
	}
	

	public boolean checkDB(int b_id){
		Boolean result = null;
		connect();
		String sql = "select b_name from board where b_id=?";
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_id);
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
	
	
	public ArrayList getDBList() {
		connect();

		ArrayList<Board> datas = new ArrayList<Board>();
		
		String sql = "select * from board order by b_id desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				board.setB_id(rs.getInt("b_id"));
				board.setB_name(rs.getString("b_name"));
				board.setB_passwd(rs.getString("b_passwd"));
				board.setB_title(rs.getString("b_title"));
				board.setB_email(rs.getString("b_email"));
				board.setB_date(rs.getDate("b_date"));
				board.setB_contents(rs.getString("b_contents"));
				datas.add(board);
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
	
	
	public boolean replyDB(Board board, int num) 
	{
		connect();
		try {
			String sql = "UPDATE board SET b_id = b_id + 1 WHERE b_id > " + num ;
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
				
			sql ="insert into board(b_id, b_name, b_passwd, b_title, b_email, b_date, b_contents) values(?,?,?,?,?,sysdate,?)";
				
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,num+1);
			pstmt.setString(2,board.getB_name());
			pstmt.setString(3,board.getB_passwd());
			pstmt.setString(4, num + "ÀÇ ´äº¯) " + board.getB_title());
			pstmt.setString(5,board.getB_email());
			pstmt.setString(6,board.getB_contents());
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
}