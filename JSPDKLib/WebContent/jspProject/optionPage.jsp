<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
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
	href='https://fonts.googleapis.com/css?family=Lora:200,700,200italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,200italic,600italic,700italic,800italic,200,300,600,700,800'
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
	%>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
	<div class="container">


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
					<span class="subheading">1열람실</span>
				</div>
			</div>
		</div>
	</div>
	</header>
	<hr>
	<div align="center">
		<H2>좌석 옵션 선택</H2>
		<form name=form1 method=post action=librarySeat.jsp>
			<table border=0 cellspacing="1" cellpadding="5">
				<tr>
					<td><input type=checkbox name=favorite value="a">열람실입구&nbsp;&nbsp;&nbsp;

						<input type=checkbox name=favorite value="b">콘센트
				<tr>
					<td colspan=2 align=center><input type=submit value="선택">
					</td>
				</tr>
			</table>
		</form>
	</div>

	<hr>
	<!-- Main Content -->
	<tr>
		<td width=100%>
			<table width=100% border=0>
				<tr>
					<td align="right" width=50%><font
						style='color: black; font-size: 9pt; font-weight: 900;'>사용중색상
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;미사용 색상 &nbsp; </font>
						<table width=165 height=21 border='0' cellpadding='0'
							cellspacing='0'>
							<tr>
								<td width=70 bgcolor='red' align='center' valign='middle'></td>
								<td width=25></td>
								<td width=70 bgcolor='gray' align='center' valign='middle'></td>
							</tr>
						</table></td>
				</tr>
			</table>
		</td>
	</tr>
	<div class="container">
		<div class="row">
			<div align="center" class="col-lg-10 col-md-10 mx-auto">
				<table border=0 cellpadding=1 cellspacing=0>
					<tr>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>1</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>2</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>3</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>4</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>5</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>6</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>7</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>8</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>9</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>10</td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>11</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>12</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>13</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>14</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>15</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>16</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>17</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>18</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>19</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>20</td>
								</tr>
							</table></td>
					<tr>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>101</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>122</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>123</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>124</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>125</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>136</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>127</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>128</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>319</td>
								</tr>
							</table></td>
						<td><table border=1 width=100% height=100% cellpadding=20
								cellspacing=0>
								<tr>
									<td>110</td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<hr>

	<!-- Footer -->
	<footer>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<ul class="list-inline text-center">
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