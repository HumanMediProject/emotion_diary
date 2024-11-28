<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감정 일지 | 월별 통계</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/common2.css">
 <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        let calendarEl = document.getElementById('calendar');
        let calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
          
          //,events:JSON.parse(data),    // 서버에서 받은 데이터(스케쥴 내용) JSON 형태여야함.
          //displayEventTime:true,     
          //allDaySlot:false,         
          //headerToolbar: {
          //   start: 'dayGridMonth,timeGridWeek,dayGridDay',
          //    center: 'title',
          //    end: 'today prev,next'
        });
        calendar.render();
      });
	
      
      


    </script>
</head>
<body>
	<div id="container">
		<header>
			<%@include file="/WEB-INF/views/component/profile.jsp" %>
			<%@include file="/WEB-INF/views/component/title.jsp" %>
		</header>
		<div id="calendarBox">
			<span>나의 한달은?</span>
			<div id="calendar"></div>
		</div>
		
		<div id="btnBox">
			<button>일별 통계</button>
			<button>주별 통계</button>
			<button>확인</button>
			
		</div>
	</div>
</body>
</html>