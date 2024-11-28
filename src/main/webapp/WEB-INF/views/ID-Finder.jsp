<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/common.css">
<title>ID-Finder</title>
</head>
<body>
	<!-- 상단 헤더 -->
	<header>
		<%@include file="/WEB-INF/views/component/title.jsp" %>
	</header>
	
	<!-- 아이디 찾기 폼 -->
	<div id=container>
		<form action="" id="idFinderForm">
			<div id="idFinderBox">
				<label class="input_label">Email</label>
				<input class="user_input" type="text" id="userEmail" name="userEmail" placeholder="이메일을 입력해주세요">
				<label class="input_label">Nickname</label>
				<input class="user_input" type="text" id="userName" name="userName" placeholder="사용하신 닉네임을 입력해주세요">
			</div>
			<button type="submit" id="idFinderBtn" class="login_bth">아이디 찾기</button>
		</form>
	</div>

</body>
</html>