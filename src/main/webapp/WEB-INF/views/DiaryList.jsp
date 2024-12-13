<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감정 일지 목록</title>
<link rel="stylesheet" href="/resources/css/common2.css">
</head>
<body>
    <div id="container">
        <header>
            <h1>감정 일지 목록</h1>
        </header>
        <div id="diaryListBox">
            <c:if test="${not empty diaries}">
                <table>
                    <thead>
                        <tr>
                            <th>제목</th>
                            <th>작성 시간</th>
                            <th>감정</th>
                            <th>내용</th>
                        </tr>
                    </thead>
                    <tbody>
                            <tr>
                                <td>${diaries[1].title}</td>
                                <td>${diaries[1].time}</td>
                                <td>${diaries[1].emotion_type}</td>
                                <td>${diaries[1].content}</td>
                            </tr>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty diaries}">
                <p>등록된 일지가 없습니다.</p>
            </c:if>
        </div>
    </div>
</body>
</html>
