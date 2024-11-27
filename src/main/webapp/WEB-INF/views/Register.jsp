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
<body>
	<!-- 상단 헤더 -->
	<header>
		<%@include file="/WEB-INF/views/component/title.jsp" %>
	</header>
	
	<!-- 회원가입 폼 -->
	<div id="container">
		<form action="" id="registerForm">
			<div id="registerBox">
				<label class="input_label">ID</label>
				<input class="user_input" type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요"> <button>중복확인</button>
				<label class="input_label">Password</label>
				<input class="user_input" type="text" id="userPw" name="userPw" placeholder="비밀번호를 입력해주세요">
				<label class="input_label">Email</label>
				<input class="user_input" type="text" id="userPwCheck" name="userPwCheck" placeholder="비밀번호를 입력해주세요">
				<label class="input_label">Email</label>
				<input class="user_input" type="text" id="userEmail" name="userEmail" placeholder="이메일을 입력해주세요">
				<label class="input_label">Nickname</label>
				<input class="user_input" type="text" id="userName" name="userName" placeholder="사용하실 닉네임을 입력해주세요">
				<label class="input_label">Gender</label>
	            <div class="radio_group">
	                <label class="radio_label">
	                    <input type="radio" name="userGender" value="male"> 남자
	                </label>
	                <label class="radio_label">
	                    <input type="radio" name="userGender" value="female"> 여자
	                </label>
	            </div>
				</div>
		<button type="submit" id="registerBtn" class="register_btn">회원가입</button>
		</form>
	</div>
	

</body>
</html>