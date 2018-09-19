<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="webProject.librarySeatDAO"%>
<%@ page import="webProject.StudentDAO"%>
<%@ page import="webProject.Student"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="webProject.librarySeat"%>
<%@ page import="java.util.ArrayList"%>

<jsp:useBean id="SeatDAO" class="webProject.librarySeatDAO" scope="page" />
<jsp:useBean id="StudentDAO" class="webProject.StudentDAO" scope="page" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

	<%
		String userID = null;
		if (session.getAttribute("student_id") != null) {
			userID = (String) session.getAttribute("student_id");
		}
		int seatNum = 0;
		if (request.getParameter("seat_num") != null) {
			seatNum = Integer.parseInt(request.getParameter("seat_num"));
		}

		librarySeat seat = SeatDAO.getSeatdata(seatNum);
		Student student = StudentDAO.getstudentinfo(userID);
		if(student.getStudent_used().equals("1")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('사용중인 좌석을 반납해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (seat.getSeat_used().equals("1") && student.getStudent_used().equals("0")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('좌석이 사용중입니다.')");
			script.println("history.back()");
			script.println("</script>");
		} 
		 else if (seat.getSeat_used().equals("0") && student.getStudent_used().equals("0")) {
			boolean result = SeatDAO.usedUpdate(seat, student);
			boolean used = StudentDAO.usedUpdate(student);
			if (result == true) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'librarySeat.jsp'");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류')");
				script.println("history.back()");
				script.println("</script>");
			}
		}
	%>


</body>

</html>
