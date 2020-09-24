<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amung'delete</title>
</head>
<body>
<script>
	alert("${param.id }님 탈퇴처리되었습니다.");
	location.href="${pageContext.request.contextPath }/home.do";
</script>
</body>
</html>