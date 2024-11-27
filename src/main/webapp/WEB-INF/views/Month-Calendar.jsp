<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감정 일지 | 월별 통계</title>
 <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        let calendarEl = document.getElementById('calendar');
        let calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>
</head>
<body>
	<div id="container">
		<div id="calendarBox">
			<h4>나의 한달은?</h4>
			<div id='calendar' style="width:800px; height:800px;"></div>
		</div>
		
		<div id="btnBox">
			<button>일별 통계</button>
			<button>주별 통계</button>
			<button>확인</button>
			
		</div>
	</div>
</body>
</html>