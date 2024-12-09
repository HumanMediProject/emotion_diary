<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/common.css">
<title>Register</title>
</head>
<script type="text/javascript">
window.onload(){
	
	let msg = '${msg}';
	 
	 
		
		if(msg != ''){
			 alert(msg);
	
	
}


</script>
<body>
	<!-- 상단 헤더 -->
	<header>
		<%@include file="/WEB-INF/views/component/title.jsp" %>
	</header>
	
	<!-- 회원가입 폼 -->
	<div id="container">
		<form action="/Register-Action" id="registerForm" method="post">
			<div id="registerBox">
				<label class="input_label">Email</label>
				<input class="user_input" type="email" id="userId" name="user_id" placeholder="아이디를 입력해주세요"> <button>중복확인</button>
				<label class="input_label">Password</label>
				<input class="user_input" type="password" id="userPw" name="hashed_password" placeholder="비밀번호를 입력해주세요">
				<label class="input_label">Password Check</label>
				<input class="user_input" type="password" id="userPwCheck" name="user_pw_check" placeholder="비밀번호를 입력해주세요">
				<label class="input_label">Nickname</label>
				<input class="user_input" type="text" id="userName" name="name" placeholder="사용하실 닉네임을 입력해주세요">
				<label class="input_label">Gender</label>
	            <div class="radio_group">
	                <label class="radio_label">
	                    <input type="radio" name="gender" value="male"> 남자
	                </label>
	                <label class="radio_label">
	                    <input type="radio" name="gender" value="female"> 여자
	                </label>
	            </div>
			</div>
			<button type="submit" id="registerBtn" class="register_btn">회원가입</button>
		</form>
	</div>
	

</body>
</html>