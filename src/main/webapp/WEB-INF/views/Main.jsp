<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/common.css">
<title>감정 일지 | 메인페이지</title>
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
	<div id="container">
		<header>
			<%@include file="/WEB-INF/views/component/profile.jsp" %>
			<%@include file="/WEB-INF/views/component/title.jsp" %>
		</header>
		<form action="/user/userInfo">
		<button type="submit">내정보</button>		
		</form>
		<div id="btnBox">
			<form action="Editor">
			<button type="submit">기록 작성</button>			
			</form>
			<button>오늘의 통계</button>
			<form action="/diary/getDiary">
			<button type="submit">일기 목록</button>
			</form>
			
		</div>
		<div id="cardBox">
			<div class="card">
				<span>시간</span>
				<div>감정 및 내용</div>
			</div>
			<div class="card">
				<span>시간</span>
				<div>감정 및 내용</div>
			</div>
		</div>
	</div>
	
</body>
</html>