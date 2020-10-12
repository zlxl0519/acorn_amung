<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amung: Main popup</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/base.css">
</head>
<body>
	<div class="popup">
		<img src="${pageContext.request.contextPath }${dto.imagePath}" />

		<form action="${pageContext.request.contextPath }/popup_save.do"
			method="post">
			<div class="popup-close">
				<label> <input type="checkbox" name="canPopup" value="no" />
					하루 동안 팝업 띄우지 않기
				</label>
				<button type="submit">닫기</button>
			</div>
		</form>
	</div>
</body>