<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 id="aa">
		<a herf="#"> 상세 데이트 내역</a>
	</h1>
	<table>
			<thead>
				<th>글제목</th>  
				<th>날짜</th>
				<th>조회수</th>
			</thead>
			<tbody>
				<%-- <c:forEach items="${map}" var="map"> --%>
					<tr>
						<td><c:out value="${detailInfo.ptTitle}" /></td>
						<td><c:out value="${detailInfo.ptDate}" /></td>
						<td><c:out value="${detailInfo.ptHit}" /></td>
					</tr>
				<%-- </c:forEach> --%>
			</tbody>
		</table>

	<form id="frm" action="editor.do">
		<!-- <input type="button"  name="btn" value=""> -->
		<input type="submit" value="편집하기">
		</div>

	</form>
	
	<%-- <h1 id="aa">
	<a herf = "#">
	상세 데이트 내역</a></h1>
	<div><h3><c:out value="${detailInfo.ptTitle}" /></h3></div>
	<div><c:out value="${detailInfo.ptDate}" /></div>
	<div><c:out value="${detailInfo.ptHit}" /></div>
	
	<div>
	<form id="frm" action="editor.do">
	<!-- <input type="button"  name="btn" value=""> -->
	<input type="submit"  value="편집하기">
	</div>
	
	</form> --%>

</body>
</html>