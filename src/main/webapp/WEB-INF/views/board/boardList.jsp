<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BoardList</title>
    <style>
        div{
            border:1px black solid;
            margin: auto;
        }

        body{
            width:1000px;
            margin:auto;
        }

        .board{
            border:1px black solid;
            width:100%;
        }

        td{
            padding:10px;
        }
        
        
    </style>
</head>
<body>
    <h1 align="center">ê²ìí</h1>
    <br>
    <div class="wrap">
        <table class="board">
            <tr>
                <th style="width:50px;">글번호</th>
                <th style="width:600px;">제목</th>
                <th style="width:10%;">날짜</th>
                <th style="width:50px;">조회수</th>
            </tr>
            <tr>
                <td>10</td>
                <td>제목입니다.</td>
                <td>2022.04.13</td>
                <td>0</td>
            </tr>
            <tr>
                <td>9</td>
                <td>제목입니다.</td>
                <td>2022.04.13</td>
                <td>0</td>
            </tr>
            <tr>
                <td>8</td>
                <td>제목입니다.</td>
                <td>2022.04.13</td>
                <td>0</td>
            </tr>
            <tr>
                <td>7</td>
                <td>제목입니다.</td>
                <td>2022.04.13</td>
                <td>0</td>
            </tr>
            <tr>
                <td>6</td>
                <td>제목입니다.</td>
                <td>2022.04.13</td>
                <td>0</td>
            </tr>
            <tr>
                <td>5</td>
                <td>제목입니다.</td>
                <td>2022.04.13</td>
                <td>0</td>
            </tr>
            <tr>
                <td>4</td>
                <td>제목입니다.</td>
                <td>2022.04.13</td>
                <td>0</td>
            </tr>
            <tr>
                <td>3</td>
                <td>제목입니다.</td>
                <td>2022.04.13</td>
                <td>0</td>
            </tr>
            <tr>
                <td>2</td>
                <td>제목입니다.</td>
                <td>2022.04.13</td>
                <td>0</td>
            </tr>
            <tr>
                <td>1</td>
                <td>제목입니다.</td>
                <td>2022.04.13</td>
                <td>0</td>
            </tr>
        </table>

        <br><br>

        <div class="paging" align="center">
            <a href="">1</a>
            <a href="">2</a>
            <a href="">3</a>
        </div>

        <br><br>

        <div class="search" align="center">
            <select name="" id="">
                <option value="">ì ëª©</option>
                <option value="">ê¸ë´ì©</option>
            </select>

            <input type="text"> &nbsp;
            <button type="submit">ê²ì</button>
        </div>
        
        <script>

        </script>
    </div>
    <br><br><br><br>
</body>
</html>