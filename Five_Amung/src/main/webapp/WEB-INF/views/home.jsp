<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amung!</title>
</head>
<body>
	<c:choose>
		<c:when test="${empty id }">
			<a href="${pageContext.request.contextPath	}/users/loginform.do">로그인</a>
		</c:when>
		<c:otherwise>
			<a href=""><span>${id }</span></a> 님 환영합니다
			<a href="${pageContext.request.contextPath	}/users/logout.do">로그아웃</a>
		</c:otherwise>
	</c:choose>
	<h1>Amung!!</h1>
	<ul>
		<li><a href="${pageContext.request.contextPath	}/reserve/reserveform.do/">예약하기</a></li>
	</ul>
</body>
</html>