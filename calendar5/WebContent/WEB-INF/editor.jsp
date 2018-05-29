<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		input, textarea {
			clear: both;
			display: table;
		}
		
	/* 	
		.right {
		 	float: right;
		 	width: 20%;
		}
		
		.left {
			float: left;
			width: 80%;
			
		} */
		

		 #map {
		   width: 100%;
		   height: 200px;
		   background-color: grey;
		 }

	</style>
	<link rel="stylesheet" href="css/hs.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Editor</title>
</head>
<body>
	<div id="header">
	<!-- 	<h1 class="header">EDITOR</h1> -->
		<img src="images/1st_white.png" alt="logo" id="logo" />
		<img src="images/login_white.png" alt="login" id="login"/>
	</div>
	
	<form action="write.do" method="post" enctype="multipart/form-data">
	

		<div id="sidebar">
		제목 <input type="text" name="title" id="title">
		<!-- *회원번호 <input type="text" name="mbNo" id="mbNo" value="1" disabled="disabled">  -->
		데이트날짜<input id="date" type="date" name="date" value="${param.Data}">
		<!-- <input type="text" name="date" id="date"> -->
		날씨 <input type="text" name="weather" id="weather">
		장소 <input type="text" name="place" id="place">
		<h3>My Google Maps Demo</h3>
		<div id="map"></div> 
		
		태그 <input type="text" name="tag" id="tag"> 
		비용 <input type="text" name="price" id="price">
		<div>
		
		공개 여부
		<!-- <input type="text" name="show" id="show" value="1" disabled="disabled">  -->
		<input type="radio" name="show" value="1" checked>공개 
		<input type="radio" name="show" value="2">비공개
		</div> 

		</div>
	
		<div id="main">
		${id}님 환영합니다.
			<p>내용</p>
			<textarea name="contents" id="contents" cols="100" rows="30"></textarea>
			<input id="browse" type="file"  name="file" onchange="previewFiles()" multiple>
			<div id="preview"></div>
		</div>
		
		<input type="submit" value="write" />
	</form>
	
<script>

function previewFiles() {

	  var preview = document.querySelector('#preview');
	  var files   = document.querySelector('input[type=file]').files;

	  function readAndPreview(file) {

	    // Make sure `file.name` matches our extensions criteria
	    if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
	      var reader = new FileReader();

	      reader.addEventListener("load", function () {
	        var image = new Image();
	        image.height = 100;
	        image.title = file.name;
	        image.src = this.result;
	        preview.appendChild( image );
	      }, false);

	      reader.readAsDataURL(file);
	    }

	  }

	  if (files) {
	    [].forEach.call(files, readAndPreview);
	  }

	}
	
</script>

    <script>
      function initMap() {
        var uluru = {lat: -25.363, lng: 131.044};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 5,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
        
      //마커 클릭하면 확대
        google.maps.event.addListener(marker,'click',function() {
      	  map.setZoom(8);
      	  map.setCenter(marker.getPosition());
      	  });
        
      }
      
      
    </script>
    <script async defer
     src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLOBW8MKJ4F3AsgoZl28QTWko4bVFDImE&callback=initMap">
    </script>
			
</body>
</html>