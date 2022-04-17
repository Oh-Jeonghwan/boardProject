<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<style>
	.outer{
		width:950px;
		margin:auto;
	}
	
	.top-title{
		margin: auto;
		border-bottom: #2BA542 solid 4px;
	}
	
</style>
</head>
<body style="width:1000px; margin:auto;">
	<div id="header">
       <jsp:include page="../../../index.jsp"></jsp:include>
    </div>
	<br><br>
	<div class="top-title">
		<h1>회원 가입</h1>
	</div>
	<br><br>
	<div class="outer">
		<form action="join.do" method="post">
			<div class="form-group">
				<!-- 아이디 중복 체크 -->
				아이디 <br>
				<input type="text" name="memberId" id="idCheck" required style="width:300px"
					onchange="idCheck2();"	placeholder="영문 또는 숫자  8~15자"><br>
				<span id="idResult"></span><br>
				<!-- 비밀번호 정규화 -->
				비밀번호 <br>
				<input type="password" name = "memberPwd" id="pwdVali" required style="width:300px"
					onchange="pwdValidate();" placeholder="영문 숫자 포함  8~15자"><br>
				<span id="pwdValid"></span><br>
				비밀번호 확인<br>
				<input type="password" id="pwdCheck" required style="width:300px"
					onchange="pwdCheck1();" placeholder="영문 숫자 포함  8~15자"><br>
				<span id="pwdCheck1"></span><br>
				
				<!-- 우편번호 api -->
				주소
				<div class="address">
					<input type="text" id="sample6_postcode" name="post" placeholder="우편번호" required>&nbsp;&nbsp;
					
					<button type="button" class="btn btn-success" onclick="sample6_execDaumPostcode()"
						style="height:30px; margin:10px;">우편번호 찾기</button><br>
					
					<input type="text" name="baseAddr" id="sample6_address" style="width:300px"  placeholder="주소" required>&nbsp;&nbsp;
					
					<input type="text" name="extraAddr" id="sample6_detailAddress" placeholder="상세주소" required>
					<br><br> 
				</div>
				
				<!-- 생년월일 정규화 -->
				생년월일<br>
				<input type="text" name="birthDate" id="bdDay" required style="width:300px"
					placeholder="yyyymmdd 형식" onchange="bdCheck();"><br>
				<span id="bdCheck"></span><br>
				
				<!-- 전화번호 정규화 -->
				핸드폰번호<br>
				<input type="text" name="phone"  id="phone" required style="width:300px"
					placeholder="'-' 제외 최대  11자" onchange="phCheck();"><br>
				<span id="phCheck"></span><br>
				
				<button type="submit" class="btn btn-success">가입하기</button>	
			</div>
		</form>
	</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function idCheck2(){
			
			var regExp =/\w{8,15}/;
			var idCheck = $("#idCheck").val();
			if(!regExp.test(idCheck)){
				$("#idResult").text("유효하지 않은 아이디 입니다.");
				$("#idResult").css('color','red');
				$("#idResult").css('font-size','5px');
				$("#idCheck").val("");
			}
			else{
				$.ajax({
					url:"idCheck.do",
					data: {
						id:$("#idCheck").val()
					},
					type:"post",
					success:function(result){
						if(result>0){
							$("#idResult").text("중복된 아이디 입니다.");
							$("#idResult").css('color','red');
							$("#idResult").css('font-size','5px');
							$("#idCheck").val("");
						}
						else{
							$("#idResult").text("사용 가능한 아이디입니다.");
							$("#idResult").css('color','green');
							$("#idResult").css('font-size','5px');
						}
						
					},
					error:function(){
						
						console.log("아이디체크 에러");
					}
				});
			}
		}
		
		function pwdValidate(){
			var regExp = /^[a-zA-Z0-9]{8,15}$/;
			var pwdVali = $("#pwdVali").val();
			if(regExp.test(pwdVali)){
				$("#pwdValid").text("유효한 비밀번호입니다.");
				$("#pwdValid").css('color','green');
				$("#pwdValid").css('font-size','5px');
			}
			else{
				$("#pwdValid").text("영문, 숫자 포함 8~15자를 입력해주세요.");
				$("#pwdValid").css('color','red');
				$("#pwdValid").css('font-size','5px');
				$("#pwdVali").val("");
			}
		}
		
		function pwdCheck1(){
			var pwdVali = $("#pwdVali").val();
			var pwdCheck = $("#pwdCheck").val();
			if(pwdVali==pwdCheck){
				$("#pwdCheck1").text("비밀번호가 일치합니다.");
				$("#pwdCheck1").css('color','green');
				$("#pwdCheck1").css('font-size','5px');
			}
			else{
				$("#pwdCheck1").text("영문, 숫자 포함 8~15자를 입력해주세요.");
				$("#pwdCheck1").css('color','red');
				$("#pwdCheck1").css('font-size','5px');
				$("#pwdCheck").val("");
			}
		}
		
		function bdCheck(){
			var regExp = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
			var bdDay = $("#bdDay").val();
			if(regExp.test(bdDay)){
				$("#bdCheck").text("유효한 생년월일입니다.");
				$("#bdCheck").css('color','green');
				$("#bdCheck").css('font-size','5px');
			}
			else{
				$("#bdCheck").text("yyyymmdd 형식에 맞춰 작성해주세요.");
				$("#bdCheck").css('color','red');
				$("#bdCheck").css('font-size','5px');
				$("#bdDay").val("");
			}
		}
		function phCheck(){
			var regExp = /^010[0-9]{3,4}[0-9]{4}$/;
			var phone = $("#phone").val();
			if(regExp.test(phone)){
				$("#phCheck").text("유효한 전화번호입니다.");
				$("#phCheck").css('color','green');
				$("#phCheck").css('font-size','5px');
			}
			else{
				$("#phCheck").text("전화번호 형식을 확인해주세요.");
				$("#phCheck").css('color','red');
				$("#phCheck").css('font-size','5px');
				$("#phone").val("");
			}
		}
		
		function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>
<br><br><br><br><br>
</body>
</html>