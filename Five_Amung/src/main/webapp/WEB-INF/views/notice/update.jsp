<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amung' 공지사항 수정</title>
</head>
<body>
	<script>
		alert("${param.num}번 글을 수정하였습니다.");
		location.href="${pageContext.request.contextPath }/notice/detail.do?num=${param.num}";
		</script>
</body>
</html>