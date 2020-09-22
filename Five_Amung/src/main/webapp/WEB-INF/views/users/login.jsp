<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${isSuccess }">
			<script>
				alert("로그인 되었습니다.");
				location.href="${url }";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("가입하지 않은 아이디이거나, 잘못된 비밀번호 입니다.");
				location.href="${pageContext.request.contextPath }/users/loginform.do?url=${encodedUrl }";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>