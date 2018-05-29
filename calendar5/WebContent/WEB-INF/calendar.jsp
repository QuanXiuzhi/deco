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
  
  .fc-content-skeleton tbody td {height:100px;}

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

<%-- <c:out value="${map}" /> --%>
<script>

  $(function() {
	  
	  var arry = [];
	  
	  <c:forEach items="${map}" var="map">
	 	 var calendar = {};
	 	 
	 	 calendar.url="view_hs.do?No="+"<c:out value="${map.ptNo}" />";
	 	 calendar.title="<c:out value="${map.ptTitle}" />";
	 	 calendar.start="<c:out value="${map.ptDate}" />";
	 	 
	 	 arry.push(calendar);
	  
	  </c:forEach>

    $('#calendar').fullCalendar({
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: arry      // url를 넘기면 페이지 넘어가게끔 설정되어있음.
    });
    
    $(document).on("click", ".fc-content-skeleton tbody td", function() {
    	var noIndex = $(this).parent().find(".fc-limited").length;
    	var index = $(this).index() - noIndex;
    	var data = $(this).parents(".fc-content-skeleton table").find("thead td").eq(index).data("date");
       	
    	if (!$(this).hasClass("fc-event-container")) {
    		    		
    		location.href = "editor.do?Data=" + data;
    		
    	}
    });
    
    $(document).on("click", ".fc-future", function() {
    	location.href = "editor.do?Data=" + $(this).data("date");
    });
  });
  
</script>
</body>
</html>