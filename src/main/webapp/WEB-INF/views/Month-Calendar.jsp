<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="stepup.emotiondiary.dto.CalendarDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감정 일지 | 월별 통계</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/common2.css">
 <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
 <script>
	/*
   document.addEventListener('DOMContentLoaded', function() {
     let calendarEl = document.getElementById('calendar');
     let calendar = new FullCalendar.Calendar(calendarEl, {
       initialView: 'dayGridMonth'
       
       
     });
     calendar.render();
   });

   */
   document.addEventListener('DOMContentLoaded', function() {
		let calendarEl = document.getElementById('calendar');
		let calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			
			  
			events : [ 
	    	    <%List<CalendarDTO> calendarList = (List<CalendarDTO>) request.getAttribute("calendarList");%>
	            <%if (calendarList != null) {%>
	            <%for (CalendarDTO vo : calendarList) {%>
	            {
	            	title : '<%=vo.getCalendar_title()%>',
	                start : '<%=vo.getCalendar_start()%>',
	                end : '<%=vo.getCalendar_end()%>',
	                color : '#FFFFFF'
	             },
					<%}
				}%>
					],
				eventContent: function (info) {
                   // title에 따라 이미지 매핑
                   let titleToImageMap = {
                		   'happy': '/resources/images/happy.png',
                		   'good': '/resources/images/calmness.png',
                		   'anticipation': '/resources/images/anticipation.png',
                		   'soso': '/resources/images/soso.png',
                		   'anger': '/resources/images/anger.png',
                		   'apathy': '/resources/images/apathy.png',
                		   'sadness': '/resources/images/sadness.png',
                		   
                       
                   };

                   const imageUrl = titleToImageMap[info.event.title]; // title에 맞는 이미지 가져오기
                   console.log("Image URL: ", imageUrl);
                   console.log("Event title:", info.event.title);
                   
                   const imageHtml = imageUrl
                       ? '<img src="' + imageUrl + '" alt="' + info.event.title + '" style="width:30px; height:30px;">'
                       : '';
                       console.log("imageHtml : ", imageHtml);
                   return { html: imageHtml };
               		}
		
		
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