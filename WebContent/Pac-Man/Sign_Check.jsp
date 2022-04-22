<%@page import="java.io.Console"%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<jsp:useBean id="user_info" class="com.javalec.pacman.Sign_Up" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="user_info" />
<!DOCTYPE html>
<html>
<head>
<%!Connection connection = null;
	Statement statement = null;
	ResultSet resultset = null;
	PreparedStatement preparedStatement = null;

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "C##PACMAN";
	String password = "pacman";

	// DB 입력문
	String query = "INSERT INTO MEMBER(ID, PASSWORD, NAME, EMAIL, PHONENUMBER) values (?, ?, ?, ?, ?)";
	// DB 검색문
	String search = "SELECT * FROM MEMBER WHERE ID = ";

	String ID, PASSWORD, NAME, EMAIL, PHONENUMBER;%>
<meta charset="UTF-8">
<link href="css/infocheck_style.css" rel="stylesheet" type="text/css">
<title>회원 정보 확인</title>
</head>
<body>
	<%
	// 현재 세션 상태 확인
	String type = (String) session.getAttribute("TYPE");

	// ID, PASSWORD, NAME, EMAIL, PHONENUMBER를 자바빈을 활용하여 정보를 가져온다.
	ID = user_info.getID();
	PASSWORD = user_info.getPASSWORD();
	NAME = user_info.getNAME();
	EMAIL = user_info.getEMAIL();
	PHONENUMBER = user_info.getPHONENUMBER();

	if (type == "SIGNIN") { // 로그인 페이지에서 넘어온 경우
		try {
			// DB 연동
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user, password);
			statement = connection.createStatement();

			// 입력한 아이디가 존재하는 아이디인지 검색한다.
			resultset = statement.executeQuery(search + "'" + ID + "'");

			if (resultset.next()) { // 입력한 아이디가 존재할 경우
		if (resultset.getString("PASSWORD").equals(PASSWORD)) { // 입력한 비밀번호가 해당 아이디와 일치할 경우
			// DB의 값을 불러온 뒤 세션에 저장시킨다.
			session.setAttribute("ID", resultset.getString("ID"));
			session.setAttribute("PASSWORD", resultset.getString("PASSWORD"));
			session.setAttribute("NAME", resultset.getString("NAME"));
			session.setAttribute("EMAIL", resultset.getString("EMAIL"));
			session.setAttribute("PHONENUMBER", resultset.getString("PHONENUMBER"));
		}
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
		if (preparedStatement != null)
			preparedStatement.close();
		if (connection != null)
			connection.close();
		if (resultset != null)
			resultset.close();
			} catch (Exception e) {
		e.printStackTrace();
			}
		}
		// 로그인 성공 표시 후 메인 페이지로 이동
	%>
	<script type="text/javascript">
		alert("로그인 성공!");
		location.href = "main.jsp";
	</script>
	<%
	} else if (type == "SIGNUP") { // 회원가입 페이지에서 넘어온 경우
	try {// DB 연동
		Class.forName(driver);
		connection = DriverManager.getConnection(url, user, password);
		preparedStatement = connection.prepareStatement(query);
		// 만일 입력한 정보 중 하나라도 빈 값일 경우
		if (ID == null || PASSWORD == null || NAME == null || EMAIL == null || PHONENUMBER == null) {
	%>
	<script type="text/javascript">
		alert("정보를 모두 입력해주셔야 합니다!");
		location.href = window.history.back();
	</script>
	<%
	}
	// PreparedStatement의 '?' 순서에 맞춰 정보를 입력한다.
	preparedStatement.setString(1, ID);
	preparedStatement.setString(2, PASSWORD);
	preparedStatement.setString(3, NAME);
	preparedStatement.setString(4, EMAIL);
	preparedStatement.setString(5, PHONENUMBER);

	try { // 입력된 정보를 DB에 업데이트 한다.
	preparedStatement.executeUpdate();
	} catch (Exception e) { // ID(PRIMARY KEY)가 중복될 경우 예외 처리
	%>
	<script type="text/javascript">
		alert("ID가 중복됩니다!");
		location.href = "SignUp.jsp";
	</script>
	<%
	}

	// 세션에 정보를 입력한다.
	session.setAttribute("ID", ID);
	session.setAttribute("PASSWORD", PASSWORD);
	session.setAttribute("NAME", NAME);
	session.setAttribute("EMAIL", EMAIL);
	session.setAttribute("PHONENUMBER", PHONENUMBER);
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	try {
	if (preparedStatement != null)
		preparedStatement.close();
	if (connection != null)
		connection.close();
	if (resultset != null)
		resultset.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	}
	}
	%>

	<section id="insertinfo-container">

		<section id="header">
			<h1 class="title">WELCOME</h1>
			<div class="subtitle">가입을 축하드립니다!</div>
		</section>

		<section id="body">
			<form action="signin" method="post">
				<ul class="check-form">
					<li>아이디</li>
					<li>
						<div>
							<%=ID%></div>
					</li>
					<li>비밀번호</li>
					<li>
						<div>
							<%=PASSWORD%></div>
					</li>
					<li>이름</li>
					<li>
						<div><%=NAME%></div>
					</li>
					<li>이메일</li>
					<li>
						<div><%=EMAIL%></div>
					</li>
					<li>전화번호</li>
					<li>
						<div><%=PHONENUMBER%></div>
					</li>
				</ul>
				<div class="submit-button">
					<button type="button" onclick="location.href = 'main.jsp'">메인페이지로 가기</button>
				</div>

			</form>
		</section>

	</section>


</body>
</html>

