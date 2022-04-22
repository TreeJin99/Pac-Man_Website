<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/board_style.css" rel="stylesheet" type="text/css">
<title>Board</title>
<%!Connection connection = null;
	Statement statement = null;
	ResultSet resultset = null;
	PreparedStatement preparedStatement = null;

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "C##PACMAN";
	String password = "pacman";

	int order = 1;

	// DB 검색문
	String search = "SELECT BOARD_USER, BOARD_TITLE, BOARD_DATE, BOARD_ID FROM BOARD ORDER BY BOARD_DATE";

	String BOARD_USER, BOARD_TITLE, BOARD_DATE, BOARD_ID;%>
</head>
<body>
	<%
	try {
		// DB 연동
		Class.forName(driver);
		connection = DriverManager.getConnection(url, user, password);

		statement = connection.createStatement();
		resultset = statement.executeQuery(search);
	%>
	<section id="board-container">

		<section id="header">
			<h1 class="title">Board</h1>
		</section>

		<section id="left">
			<nav class="left-nav">
				<h1 class="left-nav-title">MENU</h1>
				<ul>
					<li><a href="main.jsp"> <img class="home" src="image/home.png"> HOME
					</a></li>
					<li><a href="mypage.jsp"> <img class="user" src="image/user.png"> My Page
					</a></li>
					<li><a href="SignOut.jsp"> <img class="signout" src="image/signout.png"> Sign Out!
					</a></li>
				</ul>
			</nav>
		</section>

		<section id="main">
			<h1 class="main-title"></h1>
			<table class="main-table">
				<colgroup>
					<col>
					<col>
					<col>
					<col>
				</colgroup>
				<thead>
					<tr>
						<th>순서</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>게시일</th>
					</tr>

				</thead>
				<tbody>
					<%
					while (resultset.next()) {
						BOARD_USER = resultset.getString("BOARD_USER");
						BOARD_TITLE = resultset.getString("BOARD_TITLE");
						BOARD_DATE = resultset.getString("BOARD_DATE");
						BOARD_ID = resultset.getString("BOARD_ID");
					%>
					<tr>
						<!-- (중요!) 게시판의 목록을 불러오기 위해 해당 게시글을 클릭하면 게시글의 BOARD_ID(기본키)가 하이퍼링크로 넘어가서 게시글을 구분할 수 있도록 도와준다. -->
						<td><a href="board_detail.jsp?id=<%=BOARD_ID%>"><%=order++%></a></td>
						<td><a href="board_detail.jsp?id=<%=BOARD_ID%>"><%=BOARD_TITLE%></a></td>
						<td><a href="board_detail.jsp?id=<%=BOARD_ID%>"><%=BOARD_USER%></a></td>
						<td><a href="board_detail.jsp?id=<%=BOARD_ID%>"><%=BOARD_DATE.substring(0, 9)%></a></td>
					</tr>
					<%
					}
					%>

				</tbody>
			</table>
		</section>

		<section id="footer">
			<button class="write-button" type="button" name="button" onclick="location.href = 'write.jsp'">글쓰기</button>
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