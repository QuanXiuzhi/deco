<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view_0525.jsp</title>
<style type="text/css">

@font-face{
	font-family:'NotoSansBold'; 
	src:url('fonts/NOTOSANSCJKKR-BOLD.OTF')
} 

@font-face{
	font-family:'NotoSansLight'; 
	src:url('fonts/NOTOSANSCJKKR-LIGHT.OTF')
} 

	body, table, div, p {
		font-family:'NotoSansBold'
	}

	* {
		margin: 0;
		padding-top: 0;
	}
	
	html {
		background-color: #ffffff;
	}
	
	hr{	
		color : #fff043;
		border-color : #b4b4b4;
		border: 0.5px solid #b4b4b4;
		margin-top: 20px;
	}
	
	.button{
		background-color: #fff043; 
	    border: none;
	    color: black;
	    width: 60px;
	    height: 24px;
	    text-align: center;
	    display: inline-block;
	    font-size: 16px;
	    cursor: pointer;
	    border-radius: 14px;
	}
	
	#header {
		position: fixed;
		background-color: #fff043;
		height: 60px;
		width: 100%;
		top: 0;
		left: 0;
	}
	
	#main {
		margin-left: 60px;
		padding-top: 60px;
		float: left;
		width: 80%;
	}
	
	#sidebar {
		margin-top: 60px;
		position: fixed;
		right: 10px;
		width: 20%;
		height: 100%;
		background-color: #ffffff;
	}
	
	#logo {
		margin-top: 15px;
		margin-left: 30px;
		height: 30px;
	}
	
	#login {
		float: right; margin-right : 30px;
		margin-top: 15px;
		height: 30px;
		margin-right: 30px;
	}
	
	
	#user {
		text-align: left;
		margin-top: 20px;
		margin-left: 10px;
		margin-bottom: 30px;
	}
	
	#profileImg {
		margin-right: 20px;
		float: right;
		width: 50px;
		height: auto;
		border-radius: 100%;
	}
	
	#frm{
		margin-left: 10px;
	}

	#place {
		text-align: left;
		margin-top: 20px;
		margin-left: 10px;
		color: #969696;
	}
	
	#placesquare{
		width: 280px;
		margin-top: 10px;
		margin-left: 10px;
		height: 120px;
		background-color: #969696;
	}
	
	#date {
		text-align: left;
		margin-top: 20px;
		margin-left: 10px;
		color: #969696;
	}
	
	#price {
		text-align: left;
		margin-top: 20px;
		margin-left: 10px;
		color: #969696;
	}
	
	#tag {
		text-align: left;
		margin-top: 20px;
		margin-left: 10px;
		color: #969696;
	}
	
	#hitandlike {
		text-align: left;
		margin-top: 20px;
		margin-left: 10px;
		color: #969696;
		font-size: 12px;
	}
	
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$(".buttonLike").click(function() {
			
			var thisParam = "<c:out value='${param.No}'/>";
			console.log(thisParam);
			
			$.ajax({
				 url  		: "view_hs2.do",
				 type 		: "post",	 
				 data 		: {"param" : thisParam},
			     dataType 	: "json",
			     success 	: function(data) {
			    	 
			    	 if (data.result === "SUCCESS") {
			    		 alert("좋아요를 눌렀습니다.");
				    	 $("#likeCount").text(parseInt($("#likeCount").text()) + 1);
			    	 } else {			    
			    		 alert(data.msg);
			    	 }
			    	 
			     }
			})
		})
	})
	

</script>

</head>
<body>

	<div id="header">
		<img src="images/1st_white.png" alt="logo" id="logo" />
		<img src="images/login_white.png" alt="login" id="login"/>
	</div>
	
	<div id="main">
		<br /><br /><br />
		<hr />
		<p>main</p>
		<span>${detailInfo.ptContents} </span>
		<br /><br /><br />
	</div>

	<div id="sidebar">
		
		<p id="user"> 
			<span>${detailInfo.mbId}<img src="images/siot.jpg" alt="profileImg" id="profileImg"/></span>
		</p>
		<form id="frm" action="editor.do">
			<input type="submit" class="button" value="edit">
		</form>		
		<hr />
		
		<p id="place"> 
			<span>장소</span>
			<br />
			<span>${detailInfo.ptPlace} </span>
			<div id="placesquare"></div>
		</p>
		<hr />
		
		<p id="date"> 
			<span>데이트 날짜</span>
			<br />
			<span>${detailInfo.ptDate} </span>
		</p>
		<hr />
		
		<p id="price"> 
			<span>데이트 비용</span>
			<br />
			<span>${detailInfo.ptPrice}</span>
		</p>
		<hr />
		
				
		<p id="tag"> 
			<span>태그</span>
			<br />
			<span>${detailInfo.ptTag}</span>
		</p>
		<hr />
		
		<p id="hitandlike"> 
			<span><img src="images/view.png" alt="hit" height="18px;"/> &nbsp; ${detailInfo.ptHit} 조회수 </span>
			&nbsp; &nbsp; &nbsp;
			<span><img src="images/like.png" alt="like" height="20px;"/> &nbsp; <strong id="likeCount">${detailInfo.ptLike}</strong> 좋아요 </span>
			<br /><br />
			<input type="button" class="buttonLike" value="Like" />
		</p>
	</div>

</body>
</html>