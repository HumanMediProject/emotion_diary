<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="stepup.emotiondiary.enums.StatisticsDate" %>
<%
	String description = "HELLO";
	String emotion_summary = "notgood";
	StatisticsDate statistics_type = StatisticsDate.WEEK;

	request.setAttribute("description", description);
	request.setAttribute("statistics_type", statistics_type);
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/common2.css">
<title>Insert title here</title>
</head>
<body>
	<header>
		<%@include file="/WEB-INF/views/component/profile.jsp" %>
		<%@include file="/WEB-INF/views/component/title.jsp" %>
	</header>
	<div id="container">
		<article>
			<div id="emotionSummaryIcon">
				<span>나의 하루는?</span>
				<img src="${emotion_summary}.webp">
			</div>
			
			<div id="emotionGraph">
				<span>오늘의 감정 추이</span>
				<%@include file="/WEB-INF/views/chartviewer.jsp" %>
			</div>
			
			<div id="emotionSummaryText">
				<span>종합</span><br>
				
				<jsp:include page="./component/summary.jsp" />
			</div>
			
			
			<jsp:include page="./component/swap-statistics.jsp" />
		</article>
	</div>
</body>
</html>