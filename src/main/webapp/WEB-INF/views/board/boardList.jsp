<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BoardList</title>
    
    <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
   
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
        
        ul{
        	list-style: none;
        	padding-left: 0px;
        	display:inline-block;
        }
        
        ul li{
       		display:inline-block; 
        }
        
        .insert{
            margin-right:30px;
        	float:right;
        }
    </style>
</head>
<body>
    <h1 align="center">게시글 목록</h1>
    <br>
    <div class="wrap">
        <table class="table">
            <tr>
                <th style="width:50px;">글번호</th>
                <th style="width:600px;">제목</th>
                <th style="width:10%;">날짜</th>
                <th style="width:50px;">조회수</th>
            </tr>
            <c:choose>
            	<c:when test="${empty list }">
            		<tr>
            			<td colspan="5" style="text-align: center">조회된 결과가 없습니다.</td>
            		</tr>
            	</c:when>
            	<c:otherwise>
            		<c:forEach var="b" items="${list }">
	            		<tr>
			                <td>${b.boardNo }</td>
			                <td>${b.boardTitle }</td>
			                <td>
			                	${b.enrollDate }
			                </td>
			                <td>${b.count }</td>
	            		</tr>
            		</c:forEach>
            	</c:otherwise>
            </c:choose>
           
        </table>

        <br><br>
		<c:choose>
			<c:when test="${!empty contion && !empty keyword }">
				<div class="paging" align="center">
					<ul>
						<c:if test="${pageMaker.prev }">
							<li>
								<a href="list.do${pageMaker.makeQuery(pageMaker.startPage -1)}&conditon=${condtion}&keyword=${keyword}" class="previous">&lt;</a>
							</li>
						</c:if>
						
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="index">
							<button type="button" onclick="location.href='list.do${pageMaker.makeQuery(index)}&condition=${condition }&keyword=${keyword }'"
							class="btn btn-default" ${(pageMaker.cri.page==index)?'disabled':'' }>${index }</button>
						</c:forEach>
						
						<c:if test="${pageMaker.next }">
			                <li>
			                    <a href="list.do${pageMaker.makeQuery(pageMaker.endPage + 1)}&type=${type}&keyword=${keyword}" class="next">&gt; </a>
			                </li>
		            	</c:if>  
					</ul>
				</div>
			</c:when>
			
			<c:otherwise>
				 <div class="paging" align="center">
				 	<ul>
				 		<c:if test="${pageMaker.prev}">
				 			<li>
				 				<a href="list.do${pageMaker.makeQuery(pageMaker.startPage-1) }" class="previous">&lt;</a>
				 			</li>
				 		</c:if>
				 		
				 		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="index">
			            	<button type="button" onclick="location.href='list.do${pageMaker.makeQuery(index) }'" 
			            		class="btn btn-default" ${(pageMaker.cri.page==index)?'disabled':''}>${index }</button>
		            	</c:forEach>
		            	
		            	<c:if test="${pageMaker.next }">
			                <li>
			                    <a href="list.do${pageMaker.makeQuery(pageMaker.endPage + 1)}&type=${type}&keyword=${keyword}" class="next">&gt; </a>
			                </li>
		            	</c:if>  
				 	</ul>
        		 </div>
			</c:otherwise>
		</c:choose>
       
        <br>
        <div class="insert">
        	<button onclick="location.href='insert.do'">글쓰기</button>
        </div>

        <br><br>
		<form action="list.do">
	        <div class="search" align="center">
	            <select name="condition" id="">
	                <option value="board_title">제목</option>
	                <option value="board_content">글내용</option>
	            </select>
	
	            <input type="text" name="keyword"> &nbsp;
	            <button type="submit">확인</button>
	        </div>
        </form>
        
        <script>
	        $(function(){
				$(".table tr").click(function(){
					var bno = $(this).children().eq(0).text();
					
					if(bno!="글번호"){
						location.href="${pageContext.request.contextPath}/board/content.do?bno="+bno;
					}
				});
			});
        </script>
    </div>
    <br><br><br><br>
</body>
</html>