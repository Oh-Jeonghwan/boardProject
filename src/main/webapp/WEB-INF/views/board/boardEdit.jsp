<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BoardInsertForm</title>
    
    <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
    
    <style>
        body{
            width:1000px;
            margin:auto;
        }
        
        textarea{
        	resize:none;
        	width:830px;
        	height:500px;
        }
        
        .content{
        	margin: auto;
        }
        
    </style>
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/nse_files/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
    <h1 align="center">글 작성</h1>
    <br>
    <div class="content">
        <form action="contentEdit.do?boardNo=${board.boardNo }" method="post">
            <span>제목: </span> <input type="text" name="boardTitle" value=${board.boardTitle } required>
            <br><br>
            <span>작성자: </span> <input type="text" name="boardWriter" value=${board.boardWriter } required>
            
            <br><br>

            <span>글내용</span><br>
            <textarea name="boardContent" id="boardContent">
            ${board.boardContent }
            </textarea>

            <br><br>
            
			<div class="button" align="right">
	            <!--a로할지 버튼으로 할지 결정 -->
	            <button id="submitModifyBoardBtn">등록</button>
	            <button type="button" onclick="location.href='${pageContext.request.contextPath}/board/content.do?bno=${board.boardNo }'">취소</button>
        	</div>
        </form>
    </div>
    <br><br><br><br>
    <script type="text/javascript">
	 	var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.
		$(function() { 
		
			// Editor Setting 
			nhn.husky.EZCreator.createInIFrame({ oAppRef : oEditors, // 전역변수 명과 동일해야 함. 
				elPlaceHolder : "boardContent", // 에디터가 그려질 textarea ID 값과 동일 해야 함. 
				sSkinURI : "${pageContext.request.contextPath}/resources/nse_files/SmartEditor2Skin.html", // Editor HTML 
				fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X 
				htParams : { 
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseToolbar : true, 
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseVerticalResizer : true, 
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
					bUseModeChanger : true, } });
		});
		
		$("#submitModifyBoardBtn").click(function() {
			oEditors.getById["boardContent"].exec("UPDATE_CONTENTS_FIELD", []);
			});
		
	</script>
</body>
</html>