<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BoardInsertForm</title>
    <style>
        body{
            width:1000px;
            margin:auto;
        }
    </style>
</head>
<body>
    <h1 align="center">글 작성</h1>
    <br>
    <div class="content">
        <form action="">
            <span>제목: </span> <input type="text">
            <br><br>
            <span>작성자: </span> <input type="text">
            
            <br><br>

            <span>글내용</span><br>
            <textarea>
            </textarea>

            <br><br>

            <!--a로할지 버튼으로 할지 결정 -->
            <button type="submit">등록</button>
            <button>취소</button>
        </form>
    </div>
    <br><br><br><br>
</body>
</html>