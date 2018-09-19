<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="webProject.librarySeatDAO"%>
<%@ page import="webProject.librarySeat"%>
<%@ page import="webProject.Student"%>
<%@ page import="webProject.StudentDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Clean Blog - Start Bootstrap Theme</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="css/clean-blog.min.css" rel="stylesheet">

</head>

<body>
	<%
		String userID = null;
		if (session.getAttribute("student_id") != null) {
			userID = (String) session.getAttribute("student_id");
		}
		session.setAttribute("userid", userID);
	%>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">Start Bootstrap</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			Menu <i class="fa fa-bars"></i>
		</button>
		<%
			if (userID == null) {
		%>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a>
				</li>
			</ul>
		</div>
		<%
			} else {
		%>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="librarySeat.jsp">좌석현황</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="logoutAction.jsp">Logout</a></li>
			</ul>
		</div>
		<%
			}
		%>

	</div>
	</nav>

	<!-- Page Header -->
	<header class="masthead"
		style="background-image: url('img/dankook.jpg')">
	<div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="site-heading">
					<h1>단국대 열람실</h1>
					<span class="subheading">A Blog Theme by Start Bootstrap</span>
				</div>
			</div>
		</div>
	</div>
	</header>

	<!-- Main Content -->

	<hr>
	<div align="center">
		<H2>좌석 옵션 선택</H2>
		<form name=form4 method=post action=librarySeat.jsp>
			<table border=0 cellspacing="1" cellpadding="5">
				<tr>
					<td><input type=checkbox name=favorite value="a">열람실입구&nbsp;&nbsp;&nbsp;

						<input type=checkbox name=favorite value="b">콘센트&nbsp;&nbsp;&nbsp;
						
					<input  type=submit value="선택">	
				
			</table>
		</form>
	</div>

	<P>
	<div class="container">
		<div class="row">
			<div align="center" class="col-lg-10 col-md-10 mx-auto">
				<table border=0 cellpadding=1 cellspacing=0>
					<tr>
						<%
							librarySeatDAO SeatDAO = new librarySeatDAO();
							ArrayList<librarySeat> list = SeatDAO.getMapdata();
							for (int i = 0; i < list.size(); i++) {
								if (list.get(i).getSeat_used().equals("1")) {
						%>
						<td><table border=1 width=65px height=50px cellpadding=5px
								cellspacing=5px bgcolor="#FE2E2E">
								<tr>
									<td align='center'><a
										href="librarySeatAction.jsp?seat_num=<%=list.get(i).getSeat_num()%>"><%=list.get(i).getSeat_num()%></a></td>
								</tr>
							</table></td>
						<%
							} else if (list.get(i).getSeat_used().equals("0")) {
						%>
						<td><table border=1 width=65px height=50px cellpadding=5px
								cellspacing=5px bgcolor="#00FF00">
								<tr>
									<td align='center'><a
										href="librarySeatAction.jsp?seat_num=<%=list.get(i).getSeat_num()%>"><%=list.get(i).getSeat_num()%></a></td>
								</tr>
							</table></td>
						<%
							}
								if (list.get(i).getSeat_num() % 12 == 0) {
						%>
					</tr>
					<tr>
						<%
							}
						%>
						<% 
							if (list.get(i).getSeat_num() % 12 == 6) {
						%>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
						<%
							}
						%>	
						<%
							}
						%>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<P>
		<%
			StudentDAO studentDAO = new StudentDAO();
			if (studentDAO.getUsed(userID) == 1) {
		%>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="login-panel panel panel-default">
					<div class="panel-body">
						<form method="post" action="librarySeatReturn.jsp" name="form1">
							<fieldset>
								<P>
									<input class="btn btn-primary float-right" type="submit"
										value="좌석 반납">
								<p>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>

	<P>
	<hr>

	<!-- Footer -->
	<footer>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<ul class="list-inline text-center">
					<li class="list-inline-item"><a href="#"> <span
							class="fa-stack fa-lg"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-twitter fa-stack-1x fa-inverse"></i>
						</span>
					</a></li>
					<li class="list-inline-item"><a href="#"> <span
							class="fa-stack fa-lg"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-facebook fa-stack-1x fa-inverse"></i>
						</span>
					</a></li>
					<li class="list-inline-item"><a href="#"> <span
							class="fa-stack fa-lg"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-github fa-stack-1x fa-inverse"></i>
						</span>
					</a></li>
				</ul>
				<p class="copyright text-muted">Copyright &copy; Your Website
					2018</p>
			</div>
		</div>
	</div>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/clean-blog.min.js"></script>

</body>

</html>