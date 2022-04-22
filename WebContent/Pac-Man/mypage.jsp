<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/mypage_style.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
<body>
	<%
	session.setAttribute("TYPE", "SIGNED");
	%>

	<div class="mypage-container">

		<div class="header">
			<ul class="above-nav">
				<!-- 메인 사이트 방문 -->
				<li><a href="main.jsp"> <img class="home" src="image/home.png"> <br> HOME
				</a></li>
				<!-- 나의 페이지 방문 -->
				<li><a href="mypage.jsp"> <img class="user" src="image/user.png"> <br> MY PAGE
				</a></li>
				<!-- 로그 아웃 -->
				<li><a href="SignOut.jsp"> <img class="signout" src="image/signout.png"> <br>Sign Out!
				</a></li>
			</ul>
		</div>

		<section class="userinfo-container">
			<h1 class="userinfo-title">기본 회원정보</h1>
			<!-- 회원 정보란 -->
			<table class="userinfo">
				<colgroup>
					<col>
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>아이디</th>
						<td><%=session.getAttribute("ID")%></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><%=session.getAttribute("PASSWORD")%></td>
					</tr>
					<tr>
						<th>이름(실명)</th>
						<td><%=session.getAttribute("NAME")%></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><%=session.getAttribute("EMAIL")%></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><%=session.getAttribute("PHONENUMBER")%></td>
					</tr>
				</tbody>
			</table>
		</section>
		<input type="button" class="back-button" value="뒤로가기" onclick="history.back(-1);">

	</div>
</body>
</html>