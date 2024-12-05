<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Encryptor 1</title>
    <style>
        body {
            margin: 20px;
        }
        .container {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input, textarea, button {
            width: 100%;
            margin-bottom: 10px;
            padding: 10px;
            font-size: 14px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>AES-GCM 암/복호화</h1>

    <button id="generate-alpha-iv">IV 자동 생성</button><br>

    <section>
        <h2>Alpha Key 암/복호화</h2>
        <label for="alpha-password">비밀번호:</label>
        <input type="text" id="alpha-password"><br>

        <label for="alpha-iv">IV:</label>
        <input type="text" id="alpha-iv"><br>

        <button id="generate-alpha-key">Alpha Key 생성</button>
        <button id="encrypt-alpha-key">Alpha Key 암호화</button>
        <button id="decrypt-alpha-key">Alpha Key 복호화</button><br>

        <textarea id="alpha-key-output" placeholder="결과 출력란"></textarea>
    </section>

    <hr>

    <section>
        <h2>Beta 데이터 암/복호화</h2>
        <label for="beta-input">Beta 데이터:</label>
        <textarea id="beta-input"></textarea><br>

        <label for="beta-alpha-key">Alpha Key:</label>
        <input type="text" id="beta-alpha-key"><br>

        <label for="beta-iv">IV:</label>
        <input type="text" id="beta-iv"><br>

        <button id="encrypt-beta-data">Beta 데이터 암호화</button>
        <button id="decrypt-beta-data">Beta 데이터 복호화</button><br>

        <textarea id="beta-output" placeholder="결과 출력란"></textarea>
    </section>

    <script src="/script/aes-gcm.js"></script>
</body>
</html>
</body>
</html>
