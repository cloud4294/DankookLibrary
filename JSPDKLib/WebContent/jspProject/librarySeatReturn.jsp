<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="webProject.librarySeatDAO"%>
<%@ page import="webProject.StudentDAO"%>
<%@ page import="webProject.Student"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="webProject.librarySeat"%>
<%@ page import="java.util.ArrayList"%>

<jsp:useBean id="SeatDAO" class="webProject.librarySeatDAO" scope="page" />
<jsp:useBean id="StudentDAO" class="webProject.StudentDAO" scope="page"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

	<%
		String userID = null;
		if (session.getAttribute("student_id") != null) {
			userID = (String) session.getAttribute("student_id");
		}
		

		librarySeat seat = SeatDAO.getSeatdata(userID);
		Student student = StudentDAO.getstudentinfo(userID);
		if(seat.getSeat_used().equals("1")){
			boolean result = SeatDAO.usedReturn(seat);
			boolean used = StudentDAO.usedReturn(student);
			if (result == true) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'librarySeat.jsp'");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 틀립니다.')");
				script.println("history.back()");
				script.println("</script>");
			}	
		}
	%>


</body>

</html>
