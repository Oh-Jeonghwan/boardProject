<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BoardContent</title>
    
    <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
    
    <style>
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
        
        .button{
        	float: right;
        }
        

    </style>
</head>
<body>
	<div id="header">
       <jsp:include page="../../../index.jsp"></jsp:include>
    </div>
	<br><br>
    <h1 align="center">게시글 상세보기</h1>
    <br>
    <div class="wrap">
        <table id="detail-area" class="table table-bordered" align="center" border="1">
            <tr>
                <th width="70px" class="bg-success text-white">글번호</th>
                <td width="200px">${board.boardNo }</td>
                <th width="70px" class="bg-success text-white">조회수</th>
                <td width="200px">${board.count }</td>
            </tr>
            <tr>
                <th class="bg-success text-white">작성자</th>
                <td>${board.boardWriter}</td>
                <th class="bg-success text-white">작성일</th>
                <td>
                	<fmt:setLocale value="en_US" scope="session"/>
				    <fmt:parseDate value="${board.enrollDate}" var="eDate" pattern="EEE MMM d HH:mm:ss z yyyy"/>
					<fmt:formatDate value="${eDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
            </tr>
            <tr>
                <th width="70px" class="bg-success text-white">제목</th>
                <td colspan="3">${board.boardTitle }</td>
            </tr>
            <tr>
                <th class="bg-success text-white">내용</th>
                <td colspan="3">
                    <p style = "height:200px;">${board.boardContent }</p>
                </td>
            </tr>
            
        </table>
    </div>
    <br>
    <div class="button btn-group">
    	<button class="btn" type="button" onclick="location.href='${pageContext.request.contextPath}/board/list.do?page=1'">목록가기</button>
        <!-- 서브밋이 아닌 기본 버튼을 통한 유알엘 이동은 get 방식으로 넘어감 서블릿에서 get매핑으로 -->
        <button class="btn btn-success" type="button" onclick="location.href='contentEdit.do?bno=${board.boardNo}'">수정하기</button>
        <button class="btn btn-danger" type="button" onclick="location.href='delete.do?bno=${board.boardNo}&boardWriter=${board.boardWriter}'">삭제하기</button>
    </div>
    <br><br><br><br>
</body>
</html>