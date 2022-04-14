<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BoardContent</title>
    <style>
        div{border:1px black solid;}
        .contentTable{
            border:1px black solid;
        }

        body{
            width:1000px;
            margin:auto;
        }

        .firstLine div, .secondLine div,
        .thirdLine div, .forthLine div{
            
            display:inline-block;
            font-size: large;
        }

        .contentNumber, .contentDate,
        .contentWriter, .contentCount{
            width:49%;
        }

        .contentTitle{
            width:100%;
        }
        
        .number1, .date1,
        .writer1, .count1{
            text-align: center;
            width:28%;
        }

        .number2, .date2,
        .writer2, .count2{
            width:68%;
        }

        .title1, .content1{
            text-align: center;
            width:138.36px;
        }

        .title2, .content2{
            width:85%;
        }

        .content1{
            height:500px;
            text-align: center;
            line-height: 500px;
        }

    </style>
</head>
<body>
    <h1 align="center">게시글 상세보기</h1>
    <br>
    <div class="wrap">
        <div class="contentTable">
            <!-- ~~1: ë¼ë²¨, ~~2: ë´ì© -->
            <div class="firstLine">
                <div class="contentNumber">
                    <div class="number1">
                        글번호
                    </div>
                    <div class="number2">
                        1
                    </div>
                </div>
                <div class="contentDate">
                    <div class="date1">
                        작성 날짜
                    </div>
                    <div class="date2">
                        2022.04.13
                    </div>
                </div>
            </div>
            <div class="secondLine">
                <div class="contentWriter">
                    <div class="writer1">
                        작성자
                    </div>
                    <div class="writer2">
                        오정환
                    </div>
                </div>
                <div class="contentCount">
                    <div class="count1">
                        조회수
                    </div>
                    <div class="count2">
                        0
                    </div>
                </div>
            </div>
            <div class="thirdLine">
                <div class="contentTitle">
                    <div class="title1">
                        글제목
                    </div>
                    <div class="title2">
                        제목입니다.
                    </div>
                </div>
            </div>
            <div class="forthLine">
                <div class="content1">
                    글내용
                </div>
                <div class="content2">
                    asㅁㄴㅇㄻㄴㅇㄹ
                </div>
            </div>
        </div>
    </div>
    <br><br><br><br>
</body>
</html>