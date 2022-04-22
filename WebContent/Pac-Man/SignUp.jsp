<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link href="css/signup_style.css" rel="stylesheet" type="text/css">
  <title> 회원가입 </title>
</head>

<body>
  <section id="signup-container">

    <section id="header">
      <h1 class="title"> 회원가입</h1>
      <div class="subtitle"> Sign up</div>
    </section>

    <section id="body">
      <form action="Sign_Check.jsp" method="post">
        <ul class="signup-form">
          <li>아이디</li>
          <li><input type="text" name="ID" placeholder=" Username"></li>
          <li>비밀번호</li>
          <li><input type="text" name="PASSWORD" placeholder=" 비밀번호"></li>
          <li>이름</li>
          <li><input type="text" name="NAME" placeholder=" 이름을 입력해 주세요."></li>
          <li>이메일</li>
          <li><input type="text" name="EMAIL" placeholder=" 이메일을 입력해 주세요."></li>
          <li>전화번호</li>
          <li><input type="text" name="PHONENUMBER" placeholder=" 전화번호를 입력해주세요"></li>
          
          <% 
          // 현재 상태(TYPE)에 대한 세션 추가
          // SIGNED는 현재 회원가입을 시도하는 것이다.
          session.setAttribute("TYPE", "SIGNUP");
          %>
        </ul>
        <div class="submit-button">
          <input type="submit" value="회원가입 ✓">
          <input type="reset" value="다시 작성">
        </div>
      </form>
    </section>

  </section>

</body>
</body>

</html>