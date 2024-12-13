<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/common.css">
<title>Login</title>
</head>
<script>
	window.onload = function () {
	    // 서버에서 전달된 FlashAttribute를 JS 변수로 가져오기
	    const message = '${message}';
	    const error = '${error}';
	
	    // 메시지가 있으면 알림창 표시
	    if (message) alert(message);
	    if (error) alert(error);
	};
</script>
<body>
	<!-- 상단 헤더 -->
	<header>
		<%@include file="/WEB-INF/views/component/title.jsp" %>
	</header>
	
	<c:if test="${not empty error}">
    <div class="error-message">
        ${error}
    </div>
</c:if>
	<!-- 로그인 폼 -->
	<div id="container">
		<div id="wrapper">
			<form action="/user/login" method="post" id="loginForm">
				<div id="loginBox">
					<label class="input_label">Email</label>
					<input class="user_input" type="text" id="userId" name="email" placeholder="Email을 입력해주세요">
					<label class="input_label">Password</label>
					<input class="user_input" type="text" id="userPw" name="hashed_password" placeholder="PW를 입력해주세요">
				</div>
				<button type="submit" id="loginBtn" class="login_bth">로그인</button>
			</form>
			
			<!-- 비밀번호 찾기 -->
			<div id="passwordBox">
				<a href="Password-Finder">Forget Password?</a>
			</div>
			
			<!-- OAuth 로그인 -->
			<div id="oauthBox">
				<button onclick=""><img src="resources/btnW_official.png" alt="네이버 로그인 이미지" class="login_bth"></button>
				<button onclick=""><img src="resources/web_light_sq_SI@1x.png" alt="구글 로그인 이미지" class="login_bth"></button>
			</div>
			
		</div>
		<div id="RegisterBox">
			계정이 없으시다면 <a href="Register">여기</a>를 클릭해주세요
		</div>
	</div>


</body>
</html>