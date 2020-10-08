<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/resources/header.jsp"></jsp:include>
<%--예약페이지

--%>
<div class="content">
	<hr style="clear:left;"/>
	<form action="${pageContext.request.contextPath	}/admin/reserve_list.do" method="get">
		<label for="condition">검색 조건</label>
		<select name="condition" id="condition"><%--아래 if 는 condition이 각각의 value 값과 맞을때 계속 선택되어있게 한다. --%>
			<option value="room_name" <c:if test="${condition eq 'room_name' }">selected</c:if>>예약 방 이름</option>
			<option value="name" <c:if test="${condition eq 'name' }">selected</c:if>>예약자명</option>
			<option value="member_id" <c:if test="${condition eq 'member_id' }">selected</c:if>>예약자 아이디</option>
			<option value="state" <c:if test="${condition eq 'state' }">selected</c:if>>예약 현황</option>
		</select>
		<input value="${keyword }" type="text" name="keyword" placeholder="검색어..."/>
		<button type="submit">검색</button>
	</form>	
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
				<th>예약 상태</th>
				<th>예약 현황</th>
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
				<td><a href="javascript:void(0);" onclick="PopupCenter('dog_one_info.do?num=${tmp.dog_num }','팝업창', 700, 500);">${tmp.dname }</a></td>
				<td>${tmp.room_price }</td>
				<td>${tmp.regdate }</td>
				<td><a href="${pageContext.request.contextPath}/admin/reserve_cancle.do?num=${tmp.num}">예약 취소</a></td>
				<td><a href="${pageContext.request.contextPath}/admin/reserve_ok.do?num=${tmp.num}">예약 확인</a></td>
				<td>${tmp.state }</td>
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
</div><!--content -->
<script>
	//팝업을 중앙에 원하는 페이지를 원하는  크기로 띄우는 함수 
	function PopupCenter(url, title, w, h) {
		// Fixes dual-screen position                         Most browsers      Firefox
		var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
		var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;
		
		width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
		height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
		
		var left = ((width/2) - (w/2)) + dualScreenLeft;
		var top = ((height/2) - (h/2)) + dualScreenTop;
		var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
		
		// Puts focus on the newWindow
		if (window.focus) {
		    newWindow.focus();
		}
	}	
</script>
<jsp:include page="/resources/footer.jsp"></jsp:include>