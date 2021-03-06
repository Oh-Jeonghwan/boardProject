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
        
        tbody>tr:hover{
			cursor: pointer;
	        opacity: 0.7;
		}

        td{
            padding:10px;
        }
        
        ul{
        	list-style: none;
        	padding-left: 0px;
        	display:inline-block;
        	text-align:center;
        	width:500px;
        	margin-left: auto;
        	margin-right: auto;
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
	<div id="header">
       <jsp:include page="../../../index.jsp"></jsp:include>
    </div>
	<br><br>
    <h1 align="center">게시글 목록</h1>
    <br>
    <div class="wrap">
        <table class="table table-hover">
        	<thead>
	            <tr>
	                <th style="width:100px;">글번호</th>
	                <th style="width:600px;">제목</th>
	                <th style="width:20%;">날짜</th>
	                <th style="width:100px;">조회수</th>
	            </tr>
            </thead>
            <tbody>
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
				                	<fmt:setLocale value="en_US" scope="session"/>
				                	<fmt:parseDate value="${b.enrollDate}" var="eDate" pattern="EEE MMM d HH:mm:ss z yyyy"/>
									<fmt:formatDate value="${eDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				                </td>
				                <td>${b.count }</td>
		            		</tr>
	            		</c:forEach>
	            	</c:otherwise>
	           </c:choose>
           </tbody>
        </table>

        <br><br>
		<c:choose>
			<c:when test="${!empty condition && !empty keyword }">
				<div class="paging" align="center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev }">
							<li class="page-item">
								<a class="page-link" href="list.do${pageMaker.makeQuery(pageMaker.startPage -1)}&conditon=${condtion}&keyword=${keyword}" class="previous">이전</a>
							</li>
						</c:if>
						
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="index">
							<button type="button" onclick="location.href='list.do${pageMaker.makeQuery(index)}&condition=${condition }&keyword=${keyword }'"
							class="btn btn-default" ${(pageMaker.cri.page==index)?'disabled':'' }>${index }</button>
						</c:forEach>
						
						<c:if test="${pageMaker.next }">
			                <li class="page-item">
			                    <a class="page-link" href="list.do${pageMaker.makeQuery(pageMaker.endPage + 1)}&type=${type}&keyword=${keyword}" class="next">다음 </a>
			                </li>
		            	</c:if>  
					</ul>
				</div>
			</c:when>
			
			<c:otherwise>
				 <div class="paging" align="center">
				 	<ul class="pagination">
				 		<c:if test="${pageMaker.prev}">
				 			<li class="page-item">
				 				<a class="page-link" href="list.do${pageMaker.makeQuery(pageMaker.startPage-1) }" class="previous">이전</a>
				 			</li>
				 		</c:if>
				 		
				 		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="index">
			            	<button type="button" onclick="location.href='list.do${pageMaker.makeQuery(index) }'" 
			            		class="btn btn-default" ${(pageMaker.cri.page==index)?'disabled':''}>${index }</button>
		            	</c:forEach>
		            	
		            	<c:if test="${pageMaker.next }">
			                <li class="page-item">
			                    <a class="page-link" href="list.do${pageMaker.makeQuery(pageMaker.endPage + 1)}&type=${type}&keyword=${keyword}" class="next">다음 </a>
			                </li>
		            	</c:if>  
				 	</ul>
        		 </div>
			</c:otherwise>
		</c:choose>
        <br>
        <div class="insert">
        	<button class="btn btn-success" onclick="location.href='insert.do'">글쓰기</button>
        </div>

        <br><br>
		<form action="list.do">
	        <div class="search" align="center">
	            <select name="condition" id="">
	                <option value="board_title">제목</option>
	                <option value="board_content">글내용</option>
	            </select>
	
	            <input type="text" name="keyword"> &nbsp;
	            <button class = "btn btn-success" type="submit">확인</button>
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