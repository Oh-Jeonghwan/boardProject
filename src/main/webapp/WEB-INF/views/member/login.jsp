<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	.top-title{
		margin: auto;
		border-bottom: #2BA542 solid 4px;
	}
	
	.outer{
		width:950px;
		margin:auto;
	}
</style>
</head>
<body style="width:1000px; margin:auto;">
	<div id="header">
       <jsp:include page="../../../index.jsp"></jsp:include>
    </div>
	<br><br>
	<div class="top-title">
		<h1>LOG-IN</h1>
	</div>
	<br>
	<div class="outer" align="center">
		<form action="${pageContext.request.contextPath}/member/login.do" method="post">
			아이디: <input type="text" name="memberId"><br><br>
			비밀번호:	<input type="password" name="memberPwd"><br><br>
			
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/member/join.do'">회원가입</button>
			&nbsp;&nbsp;<button type="submit">로그인</button>
		</form>
	</div>
</body>
</html>