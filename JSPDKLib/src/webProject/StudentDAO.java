package webProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StudentDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public StudentDAO() {
		try {
			String jdbc_driver = "com.mysql.jdbc.Driver";
			String jdbc_url = "jdbc:mysql://127.0.0.1/student";
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "root", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(String student_id, String student_pw) {
		String sql = "SELECT student_pw FROM studentinfo WHERE student_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(student_pw))
					return 1; // 로그인 성공
				else
					return 0; // 비밀 번호 틀림
			}
			return -1; // 아이디없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // db오류
	}

	public int getUsed(String student_id)
	{
		String sql = "SELECT student_used FROM studentinfo WHERE student_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals("1"))
					return 1; // 사용중 아이디
				else if(rs.getString(1).equals("0"))
					return 0; // 비사용중 아이디			
			}
			return -1; // 아이디없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //db 오휴
	}
	
	public boolean usedUpdate(Student student) {
		String sql = "update studentinfo set student_used=? where student_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setString(2, student.getStudent_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean usedReturn(Student student) {
		String sql = "update studentinfo set student_used=? where student_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setString(2, student.getStudent_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public Student getstudentinfo(String student_id) {
		String sql = "SELECT * FROM studentinfo WHERE student_id = ?";
		Student studentinfo = new Student();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				studentinfo.setStudent_id(rs.getString(1));
				studentinfo.setStudent_pw(rs.getString(2));
				studentinfo.setStudent_used(rs.getString(3));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return studentinfo;
	}
		
}
