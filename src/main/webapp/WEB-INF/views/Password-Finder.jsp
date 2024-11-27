<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/common.css">
<title>Password-Finder</title>
</head>
<body>
	<!-- 상단 헤더 -->
	<header>
		<%@include file="/WEB-INF/views/component/title.jsp" %>
	</header>
	
	<!-- 비밀번호 찾기 폼 -->
	<div id=container>
		<form action="" id="pwFinderForm">
			<div id="passwordFinderBox">
				<label class="input_label">ID</label>
				<input class="user_input" type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요">
				<label class="input_label">Nickname</label>
				<input class="user_input" type="text" id="userName" name="userName" placeholder="사용하신 닉네임을 입력해주세요">
			</div>
			<div id="pwFinderBtnBox">
				<button onclick="" id="canselBtn" class="password_finder_btn">취소</button>
				<button type="submit" id="passwordFinderBtn" class="password_finder_btn">비밀번호 찾기</button>
			</div>
		</form>
	</div>

</body>
</html>