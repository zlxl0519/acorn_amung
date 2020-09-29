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
		<c:when test="${reserveDto eq null }">
			<script>
				alert("예약이 실패했습니다");
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("예약 되었습니다");
			</script>
			<table>
				<tr>
					<th>예약한 방 이름</th>
					<td>${roomDto.room_name }</td>
				</tr>
				<tr>
					<th>체크인 날짜/시간</th>
					<td>${reserveDto.checkin_date }/${reserveDto.start_time }</td>
				</tr>
				<tr>
					<th>체크아웃 날짜/시간</th>
					<td>${reserveDto.checkout_date }/${reserveDto.end_time }</td>
				</tr>
				<tr>
					<th>결제 금액</th>
					<td>${reserveDto.room_price }</td>
				</tr>
			</table>
			<p><a href="">확인</a></p>
		</c:otherwise>
	</c:choose>
</body>
</html>