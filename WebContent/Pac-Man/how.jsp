<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/how_style.css" rel="stylesheet" type="text/css">
<title>플레이 방법</title>
</head>
<body>
	<section id="how-container">
		<section id="header">
			<h1>플레이 방법</h1>
		</section>

		<section id="left">
			<nav class="left-nav">
				<h1 class="left-nav-title">MENU</h1>
				<ul>
					<!-- 메인 사이트 방문 -->
					<li><a href="main.jsp"> <img class="home" src="image/home.png"> HOME
					</a></li>
					<!-- 나의 페이지 방문 -->
					<li><a href="mypage.jsp" target="_blank"> <img class="user" src="image/user.png"> My Page
					</a></li>
					<!-- 로그 아웃 -->
					<li><a href="SignOut.jsp"> <img class="signout" src="image/signout.png"> Sign Out!
					</a></li>
				</ul>
			</nav>
		</section>

		<section id="main">
			<div class="video-container">
				<iframe src="https://www.youtube.com/embed/HK-damrOt4o" title="YouTube video player"></iframe>
			</div>
			<ul class="pacList">
				<li>
					<ul>
						<li><img src="image/pic_01.gif" /></li>
						<li>
							<dl>
								<dt>팩맨</dt>
								<dd>내 캐릭터입니다.</dd>
							</dl>
						</li>
					</ul>
				</li>
				<li>
					<ul>
						<li><img src="image/pic_02.png" /></li>
						<li>
							<dl>
								<dt>쿠키</dt>
								<dd>미로에 있는 쿠키를 모두 먹으면 팩맨의 이동 스피드가 1단게 상승합니다.</dd>
							</dl>
						</li>
					</ul>
				</li>
				<li>
					<ul>
						<li><img src="image/pic_13.png" /></li>
						<li>
							<dl>
								<dt>파워 쿠키</dt>
								<dd>
									파워 쿠키를 먹으면 일정 시간 동안 고스트가 겁먹고 도망칩니다. <br> 또 미로에 있는 방해 팩맨을 한꺼번에 제거할 수 있습니다.
								</dd>
							</dl>
						</li>
					</ul>
				</li>
				<li>
					<ul>
						<li><img src="image/pic_03.gif" /></li>
						<li>
							<dl>
								<dt>방해 팩맨</dt>
								<dd>
									방해 팩맨과 닿으면 스피드가 일정 시간 동안 감소합니다. <br> 대전 상대가 보냈거나, 선택한 작전 등의 플레이 방법에 따라 방해 팩맨이 출현합니다. <br> 파워 쿠키를 먹으면 화면에 있는 방해 팩맨을 한꺼번에 제거할 수 있습니다.
								</dd>
							</dl>
						</li>
					</ul>
				</li>
				<li>
					<ul>
						<li><img src="image/pic_04.gif" /></li>
						<li>
							<dl>
								<dt>고스트</dt>
								<dd>
									팩맨이 닿으면 게임 오버됩니다. <br> 파워 쿠키를 먹으면 고스트들이 겁을 먹으며, 닿으면 겁먹은 고스트를 물리칠 수 있습니다. <br> 고스트를 물리치면 타깃으로 삼은 대전 상대에게 방해 팩맨을 보낼 수 있습니다.
								</dd>
							</dl>
						</li>
					</ul>
				</li>
				<li>
					<ul>
						<li><img src="image/pic_06.gif" /></li>
						<li>
							<dl>
								<dt>잠든 고스트</dt>
								<dd>닿으면 최대 32마리까지 고스트와 연결되는 트레인 고스트가 되며, 파워 쿠키를 먹었을 때 대량의 콤보로 연계할 수 있습니다.</dd>
							</dl>
						</li>
					</ul>
				</li>
				<li>
					<ul>
						<li><img src="image/pic_07.gif" /></li>
						<li>
							<dl>
								<dt>과일</dt>
								<dd>
									남은 쿠키 수가 전체 쿠키 배치 수의 절반 이하가 되면 과일이 출현합니다. <br> 과일을 먹으면 쿠키, 파워 쿠키, 잠든 고스트가 다시 배치되고, 출현 중인 킬러 팩맨을 한꺼번에 제거할 수 있습니다.
								</dd>
							</dl>
						</li>
					</ul>
				</li>
			</ul>
		</section>

		<section id="footer">
			<input type="button" class="back-button" value="뒤로가기" onclick="history.back(-1);">
		</section>
	</section>
</body>
</html>