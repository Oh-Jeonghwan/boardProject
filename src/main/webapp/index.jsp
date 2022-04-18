<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>

	<style>
		.login{float:right;}
		
		#user-info {float:right;}
		
	    #user-info a{
	        text-decoration: none;
	        color: black;
	        font-size:12px;
	    }
	    
	    .nav-area{background: #2BA542; }
	    
	    .menu{
	        display: table-cell; /*인라인 요소처럼 배치 가능*/
	        height: 50px;
	        width: 150px;
	    }
	    .menu a{
	        text-decoration: none;
	        color: white;
	        font-size: 20px;
	        font-weight: bold;
	        display: block;
	        width: 100%;
	        height: 100%;
	        line-height:50px;
	    }
	    .menu a:hover{
	        background:darkgray;
	    }
	</style>
</head>
<body style="width:1000px; margin:auto;">
	<c:if test="${!empty alertMsg }"><!-- 띄울 메시지가 있다면 -->
		<script type="text/javascript">
			var msg = "${alertMsg}";
			alert(msg);
		</script>
		<!-- 일회성 알람이므로 지우기 -->
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	
	
	<h1 align="center" class="logo">게시판 과제</h1>
	<br>
	
	<br><br>
	<div class="login btn-group">
			<c:choose>
				<c:when test="${ !empty loginUser }"><!-- 로그인 되었을때 -->
					<div id="user-info">
						<b>${loginUser.memberId} 님</b> 환영합니다. <br><br>
						<div align="center">
							<a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
						</div>
					</div>
					<br>
				</c:when>
				<c:otherwise><!-- 로그인이 안되었다면 -->
					<div class="login_form">
						<table>    
							<tr>
								<th colspan="2">
									<br>
									<button class="btn btn-success" type="button"onclick="location.href='${pageContext.request.contextPath}/member/login.do'">로그인</button>
									<button class="btn btn-info" type="button" onclick="location.href='${pageContext.request.contextPath}/member/join.do'">회원가입</button>
								</th>
							</tr>
						</table>
					</div>					
				</c:otherwise>
			</c:choose>
		</div>
		<br>
		<br>
    	<br>
		<div class="nav-area" align="center">
			<div class="menu"><a href="${pageContext.request.contextPath}">HOME</a></div>
			<div class="menu"><a href="${pageContext.request.contextPath }/board/list.do?page=1">일반 게시판</a></div>
		</div>
</body>
</html>