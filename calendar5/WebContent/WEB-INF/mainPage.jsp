<%@page import="main_vo.ImageVo"%>
<%@page import="main_dao.ImageDao"%>
<%-- <%@page import="Vo.Mem"%> --%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ImageDao dao=new ImageDao();
    	ArrayList<ImageVo> list=dao.getLikeThree();
    	ArrayList<ImageVo> list1=dao.getHitThree();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		/* margin-left: 250px; */
	}
	#wrapper{
		background-color: #f9f9f9;
/* 		width: 1000px; */
	}
	#head{
		background-color: #fff043;
		height: 160px;
	}
	#nav{
		width: 1000px;
		height: 320px;
		padding: 0 0 0 35px;
	}
	#nav1{
		width: 1000px;
		height: 350px;
		padding: 0 0 0 35px;
	}
	#search{
		margin-left: 300px;
		margin-top: 90px;
		width: 400px;
		height: 50px;
		border-radius: 25px;
		border : 4px solid #A4EBFF;
		font-size: 20px;
	}
	 #button{
	 	border-radius: 25px;
	 	border: 2px solid #A4EBFF;
	 	background-color: white;
	 	height: 60px;
	 	position: absolute;
	 	left: 895px;
	 	top: 100px;
	 	width: 65px;
	 	background-color: #A4EBFF;
	 	color: white;
	 	font-size: 15px;
	}
	.strapline {
		color: black;
		font-size: 25px;
		font-family: '굴림';
	}
	#footer{
		border-top: 1px solid black;
		margin-bottom: 100px;
	}
	#footimg{
		margin-top: 10px;
		margin-left: 10px;
		width: 40px;
		height: 20px;
	}
	#notice{
		text-decoration: none;
	}
	#inner_foot{
		margin-left: 20px;
	}
	#head1{
		width: 80px;
		height: 30px;
		position: absolute;
		top: 9px;		
	}
	#membership{
		position: absolute;
		text-decoration: none;
		left: 1100px;
		top: 10px;
	}
	#login{
		position: absolute;
		text-decoration: none;
		left: 1190px;
		top: 10px;
	}
	#MyPage{
		position: absolute;
		text-decoration: none;
		left: 1020px;
		top: 10px;		
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){		
		$("img").each(function(i){
			var width=parseInt($(".imgs").css("width"));
			var height=parseInt($(".imgs").css("height"));
			
				if(width>10&height>10){
					$(".imgs").css("width",300);
					$(".imgs").css("height",250);
				}//if end		
		});//each end
	});//function end
</script>
</head>
<body>
<form action="search.do" method="get">
	<div id="wrapper">
		<div id="head">
			<input type="text" name="search" id="search" autofocus="" />
			<input type="submit" value="검색" id="button"/>
		</div>
		<div>
			<img src="images/1st_white.png" alt="로고" id="head1"/>
		</div>
		
		<div>
			<span><a href="calendar.do" id="MyPage">calendar</a></span> &nbsp;
			<span><a href="register.do" id="membership">회원가입</a></span> &nbsp;
			<span><a href="modalLogin.do" id="login">로그인</a></span> &nbsp;
			<span><c:if test="${id != null and id != ''}">
				${id}님 환영합니다.
				<a href="logout.do">로그아웃</a>
			</c:if>	</span>
		</div>
		
		
		<div id="nav">
				<h1 class="strapline">Best데이트</h1>
		<%
		for(ImageVo vo : list){
		%>
				<a href="#">
				<img src="<%=vo.getImg_temp1()%>" alt="<%=vo.getPt_title() %>" class="imgs" /></a>
				&nbsp;&nbsp;
		<%}%>
		</div>
		<div id="nav1">
				<h1 class="strapline">핫플레이스</h1>
		<%
		for(ImageVo vo1 : list1){
		%>
				<a href="#">
				<img src="<%=vo1.getImg_temp1() %>" alt="<%=vo1.getPt_title() %>" class="imgs" /></a>
				&nbsp;&nbsp;
		<%}%>
		</div>	
	
		<div id="footer">
			<div id="inner_foot">
				<img src="images/1st_white.png" alt="로고" id="footimg" />&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="" id="notice"><font weight='bold'>공지사항</font>> Daco운영정책 변경 안내</a>
				<p><font size="2" color="grey">회사소개 ·광고안내·검색등록·제휴문의·인재채용·서비스약관·청소년보호정책·개인정보처리방침·웹접근성안내·고객센터</font></p>
				<p><font size="2" color="grey">Copyright © Daco Corp. All rights reserved.</font></p>
			</div>		
		</div>
	</div>
</form>
</body>
</html>