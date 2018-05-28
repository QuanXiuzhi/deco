<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function checkForm(x){ //매개변수 x를 통해 아이디 비번 비번확인 이메일 정보가 배열로 담겨져서 들어온다.

	var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	/* (이메일 검증 식) */
	var name=x.form[0].value;  /* (이름) */
	var birth=x.form[1].value; /* (생년월일 앞자리) */
	var email=x.form[4].value; /* (이메일) */
	var passwd=x.form[5].value;		/* (비밀번호) */
	var passwdck=x.form[6].value;	/* (비밀번호 확인) */
	
	if(name==""){
		alert("이름을 입력하세요.");
		//경고창 확인 후 아이디 텍스트 창으로 커서 옮겨주기
		x.form[0].focus();
		//리턴: 이 값을 반환하고 그만 중지해
		return;
	}else if(birth==""){
		alert("생년월일을 입력하세요.");
		x.form[1].focus();
		return;
		
	}else if(isNaN(birth)){
		alert("생년월일은 숫자로 입력하세요.");
		x.form[1].focus();
		return;
		
	}else if(birth.length<6||birth.length>6){
		alert("생년월일 길이가 맞지 않습니다.(yymmdd)");
		x.form[1].focus();
		return;
		
	}else if($(':radio[name="gender"]:checked').length < 1){
		alert("성별을 선택해주세요.")
		return;		
		

	}else if(email==""){
		alert("이메일을 입력해주세요.")
		x.form[4].focus();
		return;	
		
	}else if(regex.test(email) === false){
		alert("잘못된 이메일 형식입니다.")
		x.form[4].focus();
		return;
		
	}else if(passwd==""){
		alert("비밀번호를 입력하세요.");         
		x.form[5].focus();
		return;
		
	}else if(passwdck==""){
		alert("비밀번호를 다시 한번 입력하세요.");
		x.form[6].focus();
		return;
		
	
		
	}else if(passwd!=passwdck){
		alert("입력한 비밀번호가 일치하지 않습니다.");
		x.form[5].value="";
		x.form[6].value="";
		x.form[5].focus();
	}

	/* 이동 할 페이지 입력 */
	x.form.action="welcome(회원가입과 연동).html";

	x.form.method="post";

	//이동하기
	x.form.submit();
	}

</script>

	<title>회원가입창</title>

	<style type="text/css">
	
		div {
			 border: 1px solid grey; 
			/*border-collapse: collapse;*/
			padding: 14px 18px 14px 18px;
			width: 321px;
			height: 460px;
			margin-left: 100px;
			

		}

		.a {
			font-size: 12px;
		}

		.cc {
			width: 300px;
			height: 23px;
		}

		#title {
			font-size: 25px;
			text-align: center;
			
		}

		#f{
			font-size: 12px;
		}
		#o {
			font-size: 12px;
		}
		#btn{
			width: 310px;
			height: 30px;
			color: black;
			background-color: #F1C760;
		}
		#img{
			margin-left: 190px;
			
			
		}
	</style>
</head>
<body>
				로고 들어갈 자리 일단 삭제
				<!-- <img id="img" src="..\Images\deco.jpg" alt="데코"> -->
			<div>		
				<form action="#">			
					<table>
						<tr>
							<td id="title">회원가입</td>
						</tr>
						<tr>
							<td class="a"></br>이름
								</br>
								<input class="cc" type="text">
							</td>
						</tr>
						<tr>
							<td class="a">생년월일
								</br>
								<input class="cc" type="text">
							</td>
						</tr>
						<tr>
							<td class="a">성별
								</br>
								<input type="radio" name="gender" value="0" /> 남자
								<input type="radio" name="gender" value="1" /> 여자


							</td>
						</tr>
						<tr>
							<td class="a">이메일(ID)
								</br>
								<input class="cc" type="text">
							</td>
						</tr>
						<tr>
							<td class="a">비밀번호
								<input class="cc" type="text">
							</td>
						</tr>
						<tr>
							<td class="a">비밀번호 확인
								</br>
								<input class="cc" type="text">
							</td>
						</tr>
						
						<tr>
							<td id="button" >
								</br>
									<input id="btn" type="button" value="회원가입 완료" onclick="checkForm(this)">
							</td>
						</tr>
						<tr>
							<td id="f"></br>이미 회원가입을 하셨나요?</br></br><font color="blue"><a href="modalLogin.jsp">로그인</a></font></td>

						</tr>
						
				</table>
			</form>	
		</div>





</body>
</html>

