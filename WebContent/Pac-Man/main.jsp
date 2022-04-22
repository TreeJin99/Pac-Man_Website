<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link href="css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
	// 세션에 아이디 값이 저장되어 있지 않을 경우 접속 불가능하도록 한다.
	if (session.getAttribute("ID") == null) {
	%>
	<script type="text/javascript">
		alert("로그인이 필요합니다!");
		location.href = "SignIn.jsp";
	</script>
	<%
	}else{
		// 세션에 아이디 값이 저장되어 있을 경우 현재 타입을 SIGNED로 바꾼다.
        session.setAttribute("TYPE", "SIGNED");
	}
	%>

	<div class="main-container">
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

		<div class="body">
			<div class="neon-text">
				<div class="neon">Welcome</div>
				<img class="packman" src="image/pacman.png">
				<div class="flux">Pac-MAN!!</div>
			</div>
		</div>

		<div class="footer">
			<ul class="below-nav">
				<!-- 게임 플레이 링크 -->
				<li><a href="https://www.google.com/logos/2010/pacman10-i.html" target="_blank"> <img class="game" src="image/ghost_blinky.png"> <br>GAME
				</a></li>
				<!-- 플레이 방법 안내 -->
				<li><a href="how.jsp"> <img class="about" src="image/ghost_pinky.png"> <br> How to
				</a></li>
				<!-- 게시판 -->
				<li><a href="board.jsp"> <img class="board" src="image/ghost_inky.png"> <br> Board
				</a></li>
				<!-- 공식 사이트 방문 -->
				<li><a href="https://pacman.com/en/" target="_blank"> <img class="offical" src="image/ghost_clyde.png"> <br> Offical!
				</a></li>
			</ul>
		</div>

	</div>
</body>
</html>