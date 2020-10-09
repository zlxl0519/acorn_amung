<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<script>
	document.title = "Amung' mypage"; 
</script>
<div class="content">
<div class="sub-nav">
		<div class="info-box">
			<div class="profile-img">
				<c:choose>
					<c:when test="${empty dto.profile }">
						<img id="profileImage"
							src="${pageContext.request.contextPath }/resources/img/icon_user.png" />
					</c:when>
					<c:otherwise>
						<img id="profileImage"
							src="${pageContext.request.contextPath }${dto.profile}" />
					</c:otherwise>
				</c:choose>
			</div><!-- profile-img -->
			<div class="info-name">
				<h5>${dto.name}</h5>
				<h6>${dto.id}</h6>
			</div>
		</div><!-- info-box -->
		<div class="sub-nav-gnb">
			<ul>
				<li>
					<a href="../info.do">나의 정보</a>
				</li>
				<li class="active">
					<a href="status.do">나의 예약</a>
				</li>
				
				<li>
					<a href="../info/dogs.do">강아지 정보</a>
				</li>
			</ul>
		</div><!-- sub-nav-gnb -->
	</div><!-- sub-nav -->
	<div class="sub-content">
		<c:choose>
			<c:when test="${isSuccess eq true}">
				<div>
				<h2 class="mt20">
					<strong>전체 예약 : </strong>${reserveCheck }
				</h2>
				
				</div>
				
				<ul class="dog-list">
					<c:forEach var="tmp" items="${reserveList }">
					<li>
						<c:if test="${tmp.state eq '예약대기중'}">
						<div class="on-menu-container">
							<div class="on-menu-wrap">
								<a href="javascript:void(0)" class="on-btn">
									<i class="fas fa-ellipsis-v"></i>
								</a>
								<a href="javascript:onDelete(${tmp.num })" class="on-menu">
									예약취소
								</a>
							</div>
						</div>
						</c:if>
						<ul class="reserve-ul">
						
							<li>
							예약자명 : <strong>${tmp.name }</strong>
							</li>
							<li>
							연락처 : <strong>${tmp.phone}</strong>
							</li>
							<li>
							방이름 : <strong>${tmp.room_name } ROOM</strong>
							</li>
							<li>
							투숙 기간 : <strong>${tmp.checkin_date } ${tmp.start_time }시 ~ <br/>
							&emsp;&emsp;&emsp;&emsp;&nbsp; ${tmp.checkout_date } ${tmp.end_time }시</strong>
							</li>
							<li>
							가격 : <strong>${tmp.room_price } 원</strong>
							</li>
							<li>
							예약 날짜 : <strong>${tmp.regdate }</strong>
							</li>
						</ul>
						<c:choose>
							<c:when test="${tmp.state eq '예약대기중'}">
								<div class="reserve-state">
									<h6>대기중인<br/>예약입니다.</h6>
								</div>
							</c:when>
							<c:when test="${tmp.state eq '예약취소' }">
								<div class="reserve-state state-cancle">	
									<h6>취소된<br/>예약입니다.</h6>
								</div>
							</c:when>
							<c:when test="${tmp.state eq '예약확인' }">
								<div class="reserve-state state-ok">	
									<h6>예약 확인<br/>되었습니다.</h6>
								</div>	
							</c:when>
						</c:choose>
					</li>
					</c:forEach>
				</ul>
			</c:when>
			<c:otherwise>
				<div class="icon-wrap">
					<i class="fas fa-bomb"></i>
					<h3>
						<strong>예약 내역이 없습니다.</strong>
					</h3>
					<a href="${pageContext.request.contextPath }/reserve/reserve_home.do" class="btn-a mt20">예약하러가기</a>
				</div>
			</c:otherwise>
		</c:choose>
	</div> <!-- sub-content -->
</div><!-- content -->

<script>
	function onDelete(num){
	if (confirm("예약을 취소하시겠습니까?") == true) { //확인
			location.href = "delete.do?num=" + num;
		} else { //취소
			return false;
		}
	}
</script>
<%@include file="/../resources/footer.jsp"%><!-- footer -->