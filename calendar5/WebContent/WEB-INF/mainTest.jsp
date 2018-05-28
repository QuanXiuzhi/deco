<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<ul class="navbar">
			<li class="menu">
				<a href="modalLogin.do" style="padding-left: 50px; padding-right: 50px">
				로그인
				</a>
			</li>
			<li class="menu">
				<a href="register.do" style="padding-left: 50px; padding-right: 50px">
				회원가입
				</a>
			</li>
			<li class="menu">
				<a href="calendar.do" style="padding-left: 50px; padding-right: 50px">
				캘린더
				</a>
			</li>
			<li>
				${id}님
				<c:if test="${id != null and id != ''}">
					<a href="logout.do" style="padding-left: 50px; padding-right: 50px">
					 로그아웃
					</a>
				</c:if>				
			</li>
		
		</ul>	
		
	</div>

</body>
</html>