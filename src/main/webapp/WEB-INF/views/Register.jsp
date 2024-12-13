<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/common.css">
<title>Register</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	let isEmailCheck = false;

	//이메일 중복 확인 요청
	function CheckEmail() {
		const email = $('#userId').val();
		const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; // 이메일 형식 지정
		
		if (email === ""){
			alert("이메일을 입력해주세요");
			return;
		}
		if (!emailPattern.test(email)){
			alert("이메일 형식에 맞게 입력해주세요");
			return;
		}
		
		$.ajax({
			url: '/user/checkEmail',
			type: 'POST',
			data: {email:email},
			success: function(response) {
				if (response === "true"){
					alert("이미 사용중인 이메일 입니다.")
					isEmailCheck = false;
				} else {
					alert("사용 가능한 이메일 입니다.");
					isEmailCheck = true;
				}
			},
		});
	}
	
    // 이메일 중복 확인 여부 체크
    function ensureEmailChecked(event) {
        if (!isEmailCheck) {
            alert("이메일 중복확인을 해주세요.");
            $('#userId').focus(); // 이메일 입력란으로 포커스 이동
            event.preventDefault();
        }
    }
    
	
	// 비밀번호 확인
	function checkPasswordMatch() {
		const password = $('#userPw').val();
		const passwordCheck = $('#userPwCheck').val();

		if (password !== passwordCheck) {
			$('#passwordError').show();  // 비밀번호 불일치 시 메시지 보이기
			$('#registerBtn').prop('disabled', true);  // 회원가입 버튼 비활성화
		} else {
			$('#passwordError').hide();  // 비밀번호 일치 시 메시지 숨기기
			$('#registerBtn').prop('disabled', false); // 버튼 활성화
		}
	}

    $(document).ready(function() {
        // 비밀번호 입력 시 확인
        $('#userPw, #userPwCheck').on('keyup', function() {
            checkPasswordMatch();
        });

        // 이메일 중복 확인 여부를 다른 필드가 focus 될 때 체크
        $('#registerBox input').on('focus', function(event) {
            if ($(this).attr('id') !== 'userId') {
                ensureEmailChecked(event);
            }
        });
    });
</script>

</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<!-- 상단 헤더 -->
	<header>
		<%@include file="/WEB-INF/views/component/title.jsp" %>
	</header>
	<!-- 회원가입 폼 -->
	<div id="container">
		<form action="/user/register" method="post" id="registerForm">
			<div id="registerBox">
				<label class="input_label">Email</label>
				<input class="user_input" type="text" id="userId" name="email" placeholder="이메일을 입력해주세요">
				<button type="button" onclick="CheckEmail()">중복확인</button>
				<label class="input_label">Password</label>
				<input class="user_input" type="password" id="userPw" name="hashed_password" placeholder="비밀번호를 입력해주세요">
				<label class="input_label">Password Check</label>
				<input class="user_input" type="password" id="userPwCheck" name="userPwCheck" placeholder="비밀번호를 입력해주세요">
				<span id="passwordError" style="color: red; font-size: 12px; display: none;">비밀번호가 일치하지 않습니다.</span>
				<label class="input_label">Name</label>
				<input class="user_input" type="text" id="userEmail" name="name" placeholder="이름을 입력해주세요">
				<label class="input_label">인증코드</label>
				<input class="user_input" type="text" id="userName" name="authentication_provider" placeholder="인증코드 입력해주세요">
				<label class="input_label">다이어리코드</label>
				<input class="user_input" type="text" id="userName" name="diary_passcode" placeholder="다이어리 번호를 입력해주세요">
				<label class="input_label">Gender</label>
	            <div class="radio_group">
	                <label class="radio_label">
	                    <input type="radio" name="gender" value="1"> 남자
	                </label>
	                <label class="radio_label">
	                    <input type="radio" name="gender" value="2"> 여자
	                </label>
	            </div>
				</div>
		<button type="submit" id="registerBtn" class="register_btn">회원가입</button>
		</form>
	</div>
	

</body>
</html>