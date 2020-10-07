<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reserve/reserve.jsp</title>
</head>
<body>
	<c:choose>
		<c:when test="${isSuccess }">
			<script>
				alert("예약이 되었습니다.");
				location.href="${pageContext.request.contextPath}/mypage/private/reserve/status.do";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("예약 실패했습니다.");
				location.href="${pageContext.request.contextPath}/reserve/reserve_home.do";
			</script>
			
		</c:otherwise>
	</c:choose>
</body>
</html>