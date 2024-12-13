<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감정 일지 | 작성하기</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/common2.css">
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<div id="container">
		<header>
			<%@include file="/WEB-INF/views/component/profile.jsp" %>
			<%@include file="/WEB-INF/views/component/title.jsp" %>
		</header>
		<div id="formBox">
			<form action="/diary/create" method="post" id="editorForm">
			    <div id="titleBox">
			        <label for="title">일기 제목</label><br>
			        <input type="text" id="title" name="title" required><br>
		    	</div>
				<div id="emotionBox">
					<label for="emotion_type">지금 기분은?</label><br>
					<select name="emotion_type">
						<option value="2">즐거움</option>
						<option value="2">행복함</option>
						<option value="-2">슬픔</option>
						<option value="-2">자괴감</option>
						<option value="-1">불안함</option>
						<option value="-1">우울함</option>
						<option value="-2">화남</option>
						<option value="0">황당함</option>
						<option value="0">당황스러움</option>
						<option value="0">놀람</option>
						<option value="-2">극대노</option>
					</select>
				</div>
				<div id="eventBox">
					<label for="content">무슨 일이 일어나고 있나요?</label><br>
					<textarea rows="5" cols="20" name="content"></textarea><br>
				</div>
				<button type="submit">기록</button>
			</form>
		</div>
	</div>
	
	
</body>
</html>