package webProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class librarySeatDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public librarySeatDAO() {
		try {
			String jdbc_driver = "com.mysql.jdbc.Driver";
			String jdbc_url = "jdbc:mysql://127.0.0.1/student";
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "root", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	


	public boolean usedUpdate(librarySeat seat,Student student) {
		String sql = "update libraryseat set seat_used=?, seat_used_id=? where seat_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setString(2, student.getStudent_id());
			pstmt.setInt(3, seat.getSeat_num());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean usedReturn(librarySeat seat) {
		String sql = "update libraryseat set seat_used=?, seat_used_id=? where seat_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setString(2, null);
			pstmt.setInt(3, seat.getSeat_num());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public ArrayList<librarySeat> getMapdata() {
		String sql = "SELECT * FROM librarySeat";
		ArrayList<librarySeat> list = new ArrayList<librarySeat>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				librarySeat seatInfo = new librarySeat();
				seatInfo.setSeat_num(rs.getInt(1));
				seatInfo.setSeat_used(rs.getString(2));
				seatInfo.setSeat_used_id(rs.getString(3));
				seatInfo.setSeat_option(rs.getString(4));
				list.add(seatInfo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public librarySeat getSeatdata(int seatnum) {
		String sql = "SELECT * FROM librarySeat WHERE seat_num = ?";
		librarySeat seatInfo = new librarySeat();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seatnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				seatInfo.setSeat_num(rs.getInt(1));
				seatInfo.setSeat_used(rs.getString(2));
				seatInfo.setSeat_used_id(rs.getString(3));
				seatInfo.setSeat_option(rs.getString(4));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return seatInfo;
	}
	
	public librarySeat getSeatdata(String student_id) {
		String sql = "SELECT * FROM librarySeat WHERE seat_used_id = ?";
		librarySeat seatInfo = new librarySeat();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				seatInfo.setSeat_num(rs.getInt(1));
				seatInfo.setSeat_used(rs.getString(2));
				seatInfo.setSeat_used_id(rs.getString(3));
				seatInfo.setSeat_option(rs.getString(4));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return seatInfo;
	}
}
