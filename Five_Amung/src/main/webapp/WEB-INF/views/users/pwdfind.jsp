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
			<p>
				임시비밀번호는 <strong>${newPwd }</strong> 입니다.
				<a href="${pageContext.request.contextPath }/users/loginform.do">확인</a>
			</p>
		</c:when>
		<c:otherwise>
			<p>
				입력한 정보가 맞지 않아 비밀번호를 찾지 못하였습니다.
				<a href="${pageContext.request.contextPath	}/users/pwdfind_form.do">다시 시도</a>
			</p>
		</c:otherwise>
	</c:choose>
</body>
</html>