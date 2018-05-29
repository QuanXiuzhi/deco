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
		
		
		.right {
		 	float: right;
		 	width: 20%;
		}
		
		.left {
			float: left;
			width: 80%;
			
		}
	</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Editor</title>
</head>
<body>
<h1 class="header">EDITOR</h1>
	<form action="write.do" method="post" enctype="multipart/form-data">

		<div class="right">
			*제목 
			<input type="text" name="title" id="title">
			*회원번호 
			<input type="text" name="mbNo" id="mbNo" value="1" disabled="disabled"> 
			* 데이트날짜
			<input id="date" type="date" name="date">
<!-- 			<input type="text" name="date" id="date"> -->
			날씨 
			<input type="text" name="weather" id="weather">
			장소 
			<input type="text" name="place" id="place"> 
			태그 
			<input type="text" name="tag" id="tag"> 
			비용 <input type="text" name="price" id="price"> 
			*공개 여부<input type="text" name="show" id="show" value="1" disabled="disabled"> 
		</div>
	
		<div class="left">
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

</body>
</html>