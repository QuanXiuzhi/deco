<%@page import="main_vo.ImageVo"%>
<%@page import="main_dao.ImageDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String pt_place=request.getParameter("search");
	String hit=request.getParameter("hit");
	String like=request.getParameter("like");
	String latest=request.getParameter("latest");
	ImageDao dao=new ImageDao();
	ArrayList<ImageVo> list =null;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		margin-left: 250px;
	}
	#wrapper{
		background-color: skyblue;
		width: 1000px;
	}
	#head{
		background-color: pink;
		height: 220px;
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
	#TitleImg{
		background-color: white;
		width: 300px;
		height: 300px;
		padding: 10px 23px 0 10px;
		float: left;		
	}
	#menu{
		margin-left: 790px;
	}	
	#p{
		font-size: 15px;
		font-weight: bold;
		padding: 0 150px 0 0;
	}
	#like{
		width: 15px;
		height: 15px;
	}
	#hit{
		width: 20px;
		height: 15px;
	}
	input[type=submit] {
    	padding:0 10px 0 10px;
    	border:0 none;
    	cursor:pointer;
       	border-radius: 5px;
       	background-color: skyblue;
       	font-size: 15px;
}
	#top{
		position: absolute;
		left: 1300px;
		top: 10px;
		width: 30px;
		height: 30px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){		
		$("#top").hide();
		$("img").each(function(i){
			var width=parseInt($(".imgs").css("width"));
			var height=parseInt($(".imgs").css("height"));
			
				if(width>10&height>10){
					$(".imgs").css("width",300);
					$(".imgs").css("height",250);
				}//if end					
		});//each end
		
		var scrollStandard=150;
		var top=parseInt($("#top").css("top"));
		
		$(window).scroll(function(){
			var scrollTop=$(window).scrollTop();
			var moveTop=scrollTop+top;
			console.log(moveTop);
			if(moveTop>scrollStandard){
				$("#top").show();
				$("#top").stop().animate({top:moveTop},200);				
			}else if(moveTop<310){
				$("#top").hide();				
			}
		});		
	});//function end
</script>
</head>
<body>
<form method="get">
	<div id="wrapper">
		<div id="head">
			<input type="text" name="search" id="search" value="<%=pt_place %>" onfocus="this.value=''"/>
			<%-- 경복궁이라는 데이터는 한번쓰고 끝났으니까 value="<%=pt_place %>" 다시 넣어서 보내줘야 조회순으로 뜬다. --%>
			<input type="submit" value="검색" id="button"/>
		</div>
		
		<div id="menu">
			<input type="submit" value="최신순" name="latest" />
			<input type="submit" value="추천순" name="like"/>
			<input type="submit" value="조회순" name="hit" />
		</div>
		
		<%
			if(hit!=null){
				if(hit.equals("조회순")){
					list=dao.getHits(pt_place);
				}
			}else if(like!=null){
				if(like.equals("추천순")){
					list=dao.getLike(pt_place);
				}			
			}else if(latest!=null){
				if(latest.equals("최신순")){
					list=dao.getImgTitle(pt_place);
				}
			}else{
				list = dao.getImgTitle(pt_place);
			}			
			for(ImageVo vo : list){			
		%>
			<!-- 반복문이 돌면 class로 묶어야한다. id로 하면 첫번째꺼만 적용된다. -->
		<div id="TitleImg">
			<a href="#"><img src="<%=vo.getImg_temp1() %>" alt="<%=vo.getPt_place() %>"
			 class="imgs" /></a>
			<span id="p"><%=vo.getPt_title() %></span>	
			<img src="images/hit1.jpg" alt="조회수" id="hit" /><%=vo.getPt_hit() %>
			&nbsp;&nbsp;
			<img src="images/like1.png" alt="좋아요" id="like" /><%=vo.getPt_like() %>
		</div>
		<%}%>
		<div>
		<a href=""><img src="images/top.png" alt="화살표" id="top" /></a>
		</div>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	<p>dkddkkdkdkd</p>
	</div>
	
	
	
</form>	
</body>
</html>