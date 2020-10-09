<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약한 강아지 정보</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/base.css">
</head>
<body>
<h3>강아지 정보</h3>
<table>
	<thead>
		<tr>
			<th scope="col">반려견 나이</th>
			<th scope="col">견종</th>
			<th scope="col">몸무게</th>
			<th scope="col">중성화 유무</th>
			<th scope="col">성별</th>
			<th scope="col">기타사항</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>${dogDto.dage }</td>
			<td>${dogDto.breed }</td>
			<td>${dogDto.weight }</td>
			<td>${dogDto.neutral }</td>
			<td>${dogDto.gender }</td>
			<td>${dogDto.etc }</td>	
		</tr>		
	</tbody>
</table>
</body>
</html>
