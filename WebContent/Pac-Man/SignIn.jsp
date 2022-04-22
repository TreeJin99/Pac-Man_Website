<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/signin_style.css" rel="stylesheet" type="text/css">
<title>환영합니다! 로그인 페이지</title>
</head>
<body>
	<%
	// 현재 로그인이 되어있는지 여부를 확인한다.
	// 세션에 ID값이 존재할 경우 로그인 되어 있는 것으로 간주한다.
	if (session.getAttribute("ID") == null) {
	%>
	<div class="login-container">
		<div class="title">Let's get there!</div>
		<form method="post" action="Sign_Check.jsp">
			<!-- 유저 닉네임 입력 -->
			<div class="username">
				<input type="text" name="ID" placeholder="Username">
			</div>
			<!-- 유저 비밀번호 입력 -->
			<div class="password">
				<input type="password" name="PASSWORD" placeholder="Password">
			</div>
			<!-- 제출 버튼 -->
			<div class="signin">
				<input type="submit" value="Sign In!">
			</div>
			<%
			// 현재 상태(TYPE)에 대한 세션 추가
			// SIGNIN은 현재 로그인을 시도하는 것이다.
			session.setAttribute("TYPE", "SIGNIN");
			%>
		</form>
		계정이 없으신가요?
		<!-- 회원가입 페이지로 이동 -->
		<button class="signup" type="button" onclick="location.href = 'SignUp.jsp'">Sign Up!</button>
	</div>
	<%
	// 이미 로그인 한 경우 아래의 링크로 강제 이동
	} else {
	response.sendRedirect("Signed.jsp");
	}
	%>
</body>
</html>