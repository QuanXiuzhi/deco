<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	  var modalLayer = $("#modalLayer");
	  var modalLink = $(".modalLink");
	  var modalCont = $(".modalContent");
	  var marginLeft = modalCont.outerWidth()/2;
	  var marginTop = modalCont.outerHeight()/2; 

	  modalLink.click(function(){
	    modalLayer.fadeIn("slow");
	    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
	    $(this).blur();
	    $(".modalContent > a").focus(); 
	    return false;
	  });

	  $(".modalContent > button").click(function(){
	    modalLayer.fadeOut("slow");
	    modalLink.focus();
	  });		
	});

</script>
<style type="text/css">
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/styles.css">
    
    /* Basics */
 
html, body {
    width: 100%;
    height: 100%;
    font-family: "Helvetica Neue", Helvetica, sans-serif;
    color: #444;
    -webkit-font-smoothing: antialiased;
    background: #f0f0f0;
     
}
  

form {
    margin: 0 auto;
    margin-top: 20px;
}
 
label {
    color: #555;
    display: inline-block;
    margin-left: 18px;
    padding-top: 0px;
    font-size: 14px;
}
 
p a {
    font-size: 11px;
    color: #aaa;
    float: right;
    margin-top: -13px;
    margin-right: 20px;
    -webkit-transition: all .4s ease;
    -moz-transition: all .4s ease;
    transition: all .4s ease;
}
 
p a:hover {
    color: #555;
}
 
input {
    font-family: "Helvetica Neue", Helvetica, sans-serif;
    font-size: 12px;
    outline: none;
}
 
input[type=text],
input[type=password] {
    color: #777;
    padding-left: 10px;
    margin: 10px;
    margin-top: 12px;
    margin-left: 18px;
    width: 290px;
    height: 35px;
    border: 1px solid #c7d0d2;
    border-radius: 2px;
    box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .4), 0 0 0 5px #f5f7f8;
    -webkit-transition: all .4s ease;
    transition: all .4s ease;
}

input[type=text]:hover,
input[type=password]:hover {
    border: 1px solid #b6bfc0;
    box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .7), 0 0 0 5px #f5f7f8;
}

input[type=text]:focus,
input[type=password]:focus {
    border: 1px solid #a8c9e4;
    box-shadow: inset 0 1.5px 3px rgba(190, 190, 190, .4), 0 0 0 5px #e6f2f9;
}
 
#lower {
    width: 100%;
    height: 69px;
    margin-top: 15px;
    box-shadow: inset 0 1px 1px #fff;
    border-top: 1px solid #ccc;
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px;
}
 
input[type=checkbox] {
    margin-left: 20px;
    margin-top: 30px;
}
 
.check {
    margin-left: 3px;
    font-size: 11px;
    color: #444;
    text-shadow: 0 1px 0 #fff;
}
 
#login {
    float: right;
    margin-right: 20px;
    margin-top: 17px;
    width: 80px;
    height: 30px;
    background-color: #acd6ef; /*IE fallback*/
    background-image: -webkit-gradient(linear, left top, left bottom, from(#acd6ef), to(#6ec2e8));
    background-image: linear-gradient(top left 90deg, #acd6ef 0%, #6ec2e8 100%);
    border-radius: 30px;
    border: 1px solid #66add6;
    box-shadow: 0 1px 2px rgba(0, 0, 0, .3), inset 0 1px 0 rgba(255, 255, 255, .5);
    cursor: pointer;
}

#register {
    float: left;
    margin-left: 20px;
    margin-top: 17px;
    width: 80px;
    height: 30px;
    background-color: #acd6ef; /*IE fallback*/
    background-image: -webkit-gradient(linear, left top, left bottom, from(#acd6ef), to(#6ec2e8));
    background-image: linear-gradient(top left 90deg, #acd6ef 0%, #6ec2e8 100%);
    border-radius: 30px;
    border: 1px solid #66add6;
    box-shadow: 0 1px 2px rgba(0, 0, 0, .3), inset 0 1px 0 rgba(255, 255, 255, .5);
    cursor: pointer;
}

input[type=submit]:hover {
    background-image: -webkit-gradient(linear, left top, left bottom, from(#b6e2ff), to(#6ec2e8));
    background-image: linear-gradient(top left 90deg, #b6e2ff 0%, #6ec2e8 100%);
}

input[type=submit]:active {
    background-image: -webkit-gradient(linear, left top, left bottom, from(#6ec2e8), to(#b6e2ff));
    background-image: linear-gradient(top left 90deg, #6ec2e8 0%, #b6e2ff 100%);
}

a{color:#000;}

.mask{width:100%; height:100%; position:fixed; left:0; top:0; z-index:10; background:#000; opacity:.5; filter:alpha(opacity=50);}

#modalLayer{ position:relative;}
#modalLayer .modalContent{width:350px; height:280px; border:1px solid #ccc; position:fixed; left:50%; top:50%; z-index:11; background:#fff;margin-left:-175px;margin-top:-140px;}
#modalLayer .modalContent #close{position:absolute; right:0; top:0; cursor:pointer; background-color: rgba( 192, 192, 192, 0.3 ); border:0 none;}



</style>
</head>
<!-- Main HTML -->
     
<body>
     
    <!-- Begin Page Content -->
<!-- 	<a href="#modalLayer" class="modalLink">모달 로그인</a> -->
	<div id="modalLayer">
		<div class="modalContent">

			<button type="button" id="close">X</button>

			<form action="modalLogin.do" method="post">
				<label for="username">Username:</label> <input type="text"
					id="username" name="username"> <label for="password">Password:</label>

				<p>
					<a href="#"> <!-- 공백 --></a>
				</p>

				<input type="password" id="password" name="password">

				<div id="lower">

					<!-- <input type="checkbox"><label class="check" for="checkbox">Keep me logged in</label> -->

					<input type="submit" value="로그인" id="login"> 
					<input type="button" value="회원가입" id="register" onclick="location='register.do'">

				</div>
				<!--/ lower-->

			</form>

		</div>
		<!--/ container-->
	</div>
	<!-- class -->


	<!-- End Page Content -->
     
</body>
 
</html>