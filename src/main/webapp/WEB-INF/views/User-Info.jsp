<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 정보</title>
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
	
    function confirmDeletion(event) {
        if (!confirm("탈퇴하시겠습니까?")) {
            // 확인창에서 "취소"를 누른 경우 폼 제출 중단
            event.preventDefault();
        }
    }
    </script>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
	<h2>${userInfo.name} 님 환영합니다</h2>
	<p>아이디 : ${userInfo.email}</p>
	<p>성별 : ${userInfo.gender}</p>
	
	<form action="/user/delete" method="get" onsubmit="confirmDeletion(event)">
	<button type="submit" >탈퇴하기</button>
	</form>
</body>
</html>