<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<%@ page import = "webProject.StudentDAO"%>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="student" class="webProject.Student" scope="page"/>
<jsp:setProperty name="student" property="student_id" />
<jsp:setProperty name="student" property="student_pw" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <body>
	<%
		
		StudentDAO logindao = new StudentDAO();
		int result = logindao.login(request.getParameter("student_id"),request.getParameter("student_pw"));
		if(result == 1){
			session.setAttribute("student_id", request.getParameter("student_id"));
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류')");
			script.println("history.back()");
			script.println("</script>");
		}
		
	
	
	
	%>    
   

  </body>

</html>
