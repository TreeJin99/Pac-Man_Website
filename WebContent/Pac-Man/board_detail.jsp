<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<%!Connection connection = null;
	Statement statement = null;
	ResultSet resultset = null;
	PreparedStatement preparedstatement = null;

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "C##PACMAN";
	String password = "pacman";

	// DB 검색문
	String search = "SELECT * FROM BOARD WHERE BOARD_ID = ";

	String session_ID, session_DATE;
	String BOARD_USER, BOARD_TITLE, BOARD_CONTENT, BOARD_ID;%>


<meta charset="UTF-8">
<link href="css/board_detail_style.css" rel="stylesheet" type="text/css">
<title>게시글</title>
</head>
<body>
	<%
	try {
		// 세션에서 현재 로그인되어있는 아이디를 들고 옵니다.
		session_ID = session.getAttribute("ID").toString();
		// board.jsp 에서 들고온 BOARD_ID 값을 받습니다.
		BOARD_ID = request.getParameter("id");
		// DB 연동
		Class.forName(driver);
		connection = DriverManager.getConnection(url, user, password);
		statement = connection.createStatement();
		// 결과 받아오기.
		resultset = statement.executeQuery(search + "'" + BOARD_ID + "'");
		// 결과 값이 있을 경우 받아오기.
		if (resultset.next()) {
			BOARD_USER = resultset.getString("BOARD_USER");
			BOARD_TITLE = resultset.getString("BOARD_TITLE");
			BOARD_CONTENT = resultset.getString("BOARD_CONTENT");
		}
	%>
	<section id=write-container>
		<section id="header">
			<h1>게시글</h1>
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

		<section id="main">
			<form action="write_check.jsp" method="post">

				<%
				// 만약 현재 세션 사용자와 게시글 작성자의 ID가 같을 경우 삭제가 가능하도록 합니다.
				if (BOARD_USER.equals(session_ID)) {
					session.setAttribute("TYPE", "DELETE");
				%>
				<table class="board_table">
					<tr class="table1">
						<td class="board-writer">작성자</td>
						<td><%=BOARD_USER%></td>
					</tr>
					<tr class="table1">
						<td class="board-title">글 제목</td>
						<td><input class="board_title" type="text" name="BOARD_TITLE" value="<%=BOARD_TITLE%>"></td>
					</tr>
					<tr>
						<td>글 내용</td>
						<td><textarea name="BOARD_CONTENT"><%=BOARD_CONTENT%></textarea></td>
					</tr>
				</table>

				<div class="input-button">
					<input type="hidden" name="BOARD_ID" value="<%=BOARD_ID%>"> <input class="post" type="submit" value="삭제"> <input class="post" type="button" onclick="history.back(-1)" value="뒤로가기">
				</div>

				<%
				// 현재 세션 사용자와 게시글 작성자의 ID와 다를 경우 수정, 삭제가 불가능하도록 합니다.
				} else {
				%>
				<table class="board_table">
					<tr class="table1">
						<td class="board-writer">작성자</td>
						<td><%=BOARD_USER%></td>
					</tr>
					<tr class="table1">
						<td class="board-title">글 제목</td>
						<td><input name="BOARD_TITLE" type="text" value="<%=BOARD_TITLE%>" readonly /></td>
					</tr>
					<tr>
						<td>글 내용</td>
						<td><textarea name="BOARD_CONTENT" readonly><%=BOARD_CONTENT%></textarea></td>
					</tr>
				</table>
				<div class="input-button">
					<input class="post" type="button" onclick="history.back(-1)" value="뒤로가기">
				</div>
				<%
				}
				%>


			</form>
		</section>
	</section>
	<%
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	try {
		if (connection != null)
			connection.close();
		if (resultset != null)
			resultset.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	}
	%>
</body>
</html>