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
	<div id="container">
		<header>
			<%@include file="/WEB-INF/views/component/profile.jsp" %>
			<%@include file="/WEB-INF/views/component/title.jsp" %>
		</header>
		<div id="formBox">
			<form action="post" id="editorForm">
				<div id="emotionBox">
					<label for="emotion">지금 기분은?</label><br>
					<select name="emotion">
						<option value="즐거움">즐거움</option>
						<option>행복함</option>
						<option>슬픔</option>
						<option>자괴감</option>
						<option>불안함</option>
						<option>우울함</option>
						<option>화남</option>
						<option>황당함</option>
						<option>당황스러움</option>
						<option>놀람</option>
						<option>극대노</option>
					</select>
				</div>
				<div id="eventBox">
					<label for="content">무슨 일이 일어나고 있나요?</label><br>
					<textarea rows="5" cols="20" name="content"></textarea><br>
				</div>
				<button>기록</button>
			</form>
		</div>
	</div>
	
	
</body>
</html>