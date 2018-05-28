<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>
<link rel="stylesheet" type="text/css" href="css/fullcalendar.css">

<script type="text/javascript" src="js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="js/moment.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/fullcalendar.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='calendar'></div>

<c:out value="${map}" />
<script>

  $(function() {
	  
	  var arry = [];
	  
	  <c:forEach items="${map}" var="map">
	 	 var calendar = {};
	 	 
	 	 calendar.url="popup.do?No="+"<c:out value="${map.postNo}" />";
	 	 calendar.title="<c:out value="${map.title}" />";
	 	 calendar.start="<c:out value="${map.postDate}" />";
	 	 
	 	 arry.push(calendar);
	  
	  </c:forEach>

    $('#calendar').fullCalendar({
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: arry
    });
    
    // 날짜 안에 제목 클릭시 새 창 뜨게..
    $(".fc-event-container").click(function() {
    	console.log(this)
    	//window.open("popup.do", "editor"); 
    })

  });
// 잠만요 ;; script가 돔을 그려서 만들어지느거기 때문에 calendar api좀 볼게요 
</script>
</body>
</html>