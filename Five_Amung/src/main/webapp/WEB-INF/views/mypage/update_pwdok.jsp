<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/update_pwdok.jsp</title>
</head>
<body>
	<c:choose>
		<c:when test="${isSuccess }">
			<script>
			alert("비밀번호가 확인되었습니다.");
			location.href="${pageContext.request.contextPath }/mypage/private/info/updateform.do?isSuccess=true";
			
			</script>
		</c:when>
		<c:otherwise>
			<script>
			alert("잘못된 비밀번호 입니다.");
			location.href="${pageContext.request.contextPath }/mypage/private/info/update/check.do";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>