<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;

	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/student";

	try {
		Class.forName(jdbc_driver);

		conn = DriverManager.getConnection(jdbc_url, "root", "1234");

		String sql = "select student_id, student_pw from studentinfo";
		pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();

		boolean hasSameId = false;
		sql = "insert into studentinfo values(?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("student_id"));
		pstmt.setString(2, request.getParameter("student_pw"));

		while (rs.next()) {
			if (rs.getString("student_id").equals(request.getParameter("student_id"))) {
				out.print("이미 동일한 id가 있습니다");
				hasSameId = true;
				response.sendRedirect("account_add_fail.html");
				break;
			}
		}

		if (!hasSameId && request.getParameter("student_id") != null) {
			pstmt.executeUpdate();
		}
	} catch (Exception e) {
		System.out.println(e);
	}
%>
<HTML>
<HEAD>
<link href="buttonhover.css" rel="stylesheet">
<TITLE>수강신청 회원가입</TITLE>
</HEAD>

<BODY>
	<div align="center">
		<H2>REGISTER</H2>
		<HR>

		<form name=form1 method=post action=account_add.jsp>
			registerName : <input type=text name=student_id> student_pw :
			<input type=text name=student_pw size=20> <input type=submit
				value="register">
		</form>
		<HR>
		<a href="#" class="btn-gradient red small">Button</a>
		<a href="#" class="btn-gradient red small">Button</a>
		<a href="#" class="btn-gradient red small">Button</a>
		<a href="#" class="btn-gradient red small">Button</a>
		<a href="#" class="btn-gradient red small">Button</a>

	</div>
	#register list
	<P>
		<%
			try {
				String sql = "select student_id, student_pw from studentinfo";
				pstmt = conn.prepareStatement(sql);

				ResultSet rs = pstmt.executeQuery();
				int i = 1;

				while (rs.next()) {
					out.println(i + " : " + rs.getString("student_id") + " , " + rs.getString("student_pw") + "<BR>");
					i++;

				}

				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		%>
		<a href="login.jsp">로그인</a>
</BODY>
</HTML>