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
<body>
	<div id="container">
		<header>
			<%@include file="/WEB-INF/views/component/profile.jsp" %>
			<%@include file="/WEB-INF/views/component/title.jsp" %>
		</header>
		<div id="btnBox">
			<button>기록 작성</button>
			<button>오늘의 통계</button>
			
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