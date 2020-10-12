<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${id}님의 반려견 정보</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/base.css">
</head>
<body>
<div class="popup">
		<div class="popup-h">
			<h3>${id}<strong>님의 반려견 정보</strong></h3>
		</div>
		<div class="table-wrap">
		<table>
			<thead>
				<tr>
					<th scope="col">반려견 이름</th>
					<th scope="col">반려견 나이</th>
					<th scope="col">견종</th>
					<th scope="col">몸무게</th>
					<th scope="col">중성화 유무</th>
					<th scope="col">성별</th>
					<th scope="col">기타사항</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${dogList }">
					<tr>
						<td>${tmp.dname }</td>
						<td>${tmp.dage }</td>
						<td>${tmp.breed }</td>
						<td>${tmp.weight }</td>
						<td>${tmp.neutral }</td>
						<td>${tmp.gender }</td>
						<td>${tmp.etc }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="popup-close">
		<a href='javascript:window.close();'><button>닫기</button></a>
	</div>
</div>
</body>