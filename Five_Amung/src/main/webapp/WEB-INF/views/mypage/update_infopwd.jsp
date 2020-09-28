<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/update_infopwd.jsp</title>
</head>
<body>
	<c:choose>
		<c:when test="${isSuccess }">
			<script>
			alert("비밀번호를 변경했습니다.");
			location.href="${pageContext.request.contextPath }/mypage/private/info.do";
			</script>
		</c:when>
		<c:otherwise>
			<script>
			alert("기존 비밀번호가 맞지 않습니다.");
			location.href="${pageContext.request.contextPath }/mypage/private/info/pwd/updateform.do";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>