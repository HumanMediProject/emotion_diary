<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="stepup.emotiondiary.enums.StatisticsDate" %>
    
<%
	Object something = request.getAttribute("statistics_type");
	StatisticsDate statistics_type = StatisticsDate.TODAY;
	if(something instanceof StatisticsDate){
		statistics_type = (StatisticsDate)something;
	}
	 

%>
<div id="swapStatistics">
	<span>${statistics_type.toString()}</span>
	<br>
	<c:choose>
		<c:when test="${statistics_type.toString() != 'TODAY'}">
			<button onclick="window.location.href='/';">일간 통계</button>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${statistics_type.toString() != 'WEEK'}">
			<button onclick="window.location.href='/';">주간 통계</button>
		</c:when>
	</c:choose>
	
	<c:choose>
		<c:when test="${statistics_type.toString() != 'MONTH'}">
			<button onclick="window.location.href='/';">월간 통계</button>
		</c:when>
	</c:choose>
	<button onclick="window.location.href='/';">확인</button>
</div>