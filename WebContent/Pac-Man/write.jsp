<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link href="css/write_style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<section id=write-container>
		<section id="header">
			<h1>글쓰기</h1>
		</section>

		<section id="left">
			<nav class="left-nav">
				<h1 class="left-nav-title">MENU</h1>
				<ul>
					<li><a href="main.jsp"> <img class="home" src="image/home.png"> HOME
					</a></li>
					<li><a href="mypage.jsp" target="_blank"> <img class="user" src="image/user.png"> My Page
					</a></li>
					<li><a href="SignOut.jsp"> <img class="signout" src="image/signout.png"> Sign Out!
					</a></li>
				</ul>
			</nav>
		</section>
		
		<% session.setAttribute("TYPE", "SIGNED"); %>

		<section id="main">
			<form action="write_check.jsp" method="post">
			
				<table>
					<tr class="board-writer">
						<td class="writer">작성자</td>
						<td>
						<%= session.getAttribute("ID") %>
						</td>
					</tr>
					<tr>
						<td class="title">글 제목</td>
						<td><input type="text" name="BOARD_TITLE" size="75"></td>
					</tr>
					<tr>
						<td class="context">글 내용</td>
						<td><textarea name="BOARD_CONTENT" rows="20" cols="80"></textarea></td>
					</tr>
				</table>
				<div class="input-button">
					<input class="post" type="submit" value="등록">
					<input class="revise" type="reset" value="다시작성">
				</div>

			</form>
		</section>
	</section>
</body>
</html>