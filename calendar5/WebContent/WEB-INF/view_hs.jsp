<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view_0525.jsp</title>
<link rel="stylesheet" href="css/hs.css" />

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
<%-- 	test : <span>${detailInfo.ptNo}</span> --%>
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
		 <%-- calendar.url="view_hs.do?No="+"<c:out value="${map.ptNo}" />"; --%>
		 <a href="editor.do?No=${detailInfo.ptNo}" class="button">edit</a>
<%-- 		<form id="frm" action="editor.do?ptNo=${detailInfo.ptNo}">
		
			<input type="submit" class="button" value="edit">
		</form>	 --%>	
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