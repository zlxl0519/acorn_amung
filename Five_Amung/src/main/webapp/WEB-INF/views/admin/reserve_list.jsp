<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/admin/reserve_list.jsp</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>예약 번호</th>
				<th>아이디</th>
				<th>예약자명</th>
				<th>휴대폰 번호</th>
				<th>호텔방</th>
				<th>숙박기간</th>
				<th>입실/퇴실 시간</th>
				<th>강아지 이름</th>
				<th>가격</th>
				<th>예약 날짜</th>
				<th>예약 취소</th>
				<th>예약 확인</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${reserveList }">
			<tr>
				<td>${tmp.num }</td>
				<td>${tmp.member_id }</td>
				<td>${tmp.name }</td>
				<td>${tmp.phone}</td>
				<td>${tmp.room_name }</td>
				<td>${tmp.checkin_date }~${tmp.checkout_date }</td>
				<td>${tmp.start_time }시/${tmp.end_time }시</td>
				<td>${tmp.dname }</td>
				<td>${tmp.room_price }</td>
				<td>${tmp.regdate }</td>
				<td><button>예약 취소</button></td>
				<td><button>예약 확인</button></td>
			</tr>
		</c:forEach>		
		</tbody>
	</table>
	<div class="page-display">
		<ul class="pagination pagination-sm">
		<c:if test="${startPageNum ne 1 }">
			<li class="page-item"><a class="page-link" href="reserve_list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }">Prev</a></li>
		</c:if>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="page-item active"><a class="page-link" href="reserve_list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="reserve_list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${endPageNum lt totalPageCount }">
			<li class="page-item"><a class="page-link" href="reserve_list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }">Next</a></li>
		</c:if>
		</ul>	
	</div>
</body>
</html>