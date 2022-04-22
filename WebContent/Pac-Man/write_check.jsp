<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<jsp:useBean id="write_info" class="com.javalec.pacman.Write_Check" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="write_info" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link href="css/write_style.css" rel="stylesheet" type="text/css">
<%!Random random = new Random();
	Connection connection = null;
	PreparedStatement preparedStatement = null;

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "C##PACMAN";
	String password = "pacman";

	// DB 입력문
	String query = "INSERT INTO BOARD(BOARD_USER, BOARD_TITLE, BOARD_CONTENT, BOARD_DATE, BOARD_ID) VALUES (?, ?, ?, SYSDATE, ?)";
	// DB 수정문
	String sql_delete = "DELETE FROM BOARD WHERE BOARD_ID = ?";

	String BOARD_USER, BOARD_TITLE, BOARD_CONTENT, BOARD_ID;%>
</head>
<body>

	<%
	// 현재 세션 상태 확인
	String type = (String) session.getAttribute("TYPE");
	try {
		// DB 연동
		Class.forName(driver);
		connection = DriverManager.getConnection(url, user, password);

		if (type == "SIGNED") {
			// 글쓴이, 제목, 내용을 불러온다.
			BOARD_USER = session.getAttribute("ID").toString();
			BOARD_TITLE = write_info.getBOARD_TITLE();
			BOARD_CONTENT = write_info.getBOARD_CONTENT();
			// 기본 키를 생성한다.
			BOARD_ID = Long.toString(random.nextInt(10) * System.currentTimeMillis());

			// 유저, 제목, 내용이 빈 값일 경우 write.jsp로 강제 이동
			if (BOARD_USER == null || BOARD_TITLE == null || BOARD_CONTENT == null) {
	%>
	<script type="text/javascript">
		alert("정보를 모두 입력해주셔야 합니다!");
		location.href = "write.jsp";
	</script>
	<%
	} else {
	// 준비된 입력문을 입력한다.
	preparedStatement = connection.prepareStatement(query);
	preparedStatement.setString(1, BOARD_USER);
	preparedStatement.setString(2, BOARD_TITLE);
	preparedStatement.setString(3, BOARD_CONTENT);
	preparedStatement.setString(4, BOARD_ID);

	// 입력된 정보 업데이트
	preparedStatement.executeUpdate();
	}
	%>
	<script type="text/javascript">
		alert("등록이 완료 되었습니다!");
		location.href = "board.jsp";
	</script>
	<%
	} // 현재 상태가 삭제일 경우
	else if (type == "DELETE") {
	// 수정할 제목, 내용을 들고온다.
	BOARD_TITLE = write_info.getBOARD_TITLE();
	BOARD_CONTENT = write_info.getBOARD_CONTENT();

	// 수정할 테이블을 확인하기 위해 BOARD_ID를 들고온다.
	BOARD_ID = request.getParameter("BOARD_ID");

	preparedStatement = connection.prepareStatement(sql_delete);
	preparedStatement.setString(1, BOARD_ID);
	preparedStatement.executeUpdate();
	%>
	<script type="text/javascript">
		alert("삭제가 완료 되었습니다!");
		location.href = "board.jsp";
	</script>
	<%
	}
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	try {
	if (preparedStatement != null)
		preparedStatement.close();
	if (connection != null)
		connection.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	}
	%>

</body>
</html>