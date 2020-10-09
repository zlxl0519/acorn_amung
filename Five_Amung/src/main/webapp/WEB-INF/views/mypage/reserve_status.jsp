<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<script>
	document.title = "Amung' mypage"; 
	var myApp=angular.module("myApp", ["ngRoute"]);
	myApp.controller("reserveCtrl", function($scope, $http, $location){
		
	}
</script>
<div class="content" ng-app="myApp">
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
	<div class="sub-content" ng-controller="reserveCtrl">
		<c:choose>
			<c:when test="${isSuccess eq true}">
				<div>
				<h2 class="mt20"><strong>전체 예약 : </strong>${reserveCheck }</h2>
				
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
								<a href="javascript:void(0)" class="on-menu" data-ng-if="isHidden">
									예약취소
								</a>
							</div>
						</div>
							
						</c:if>
						<ul>
						
							<li>
							예약자명 : ${tmp.name }
							</li>
							<li>
							연락처 : ${tmp.phone}
							</li>
							<li>
							방이름 : ${tmp.room_name }
							</li>
							<li>
							투숙 기간 : ${tmp.checkin_date } ${tmp.start_time } ~ <br/>
							${tmp.checkout_date } ${tmp.end_time }
							</li>
							<li>
							가격 : ${tmp.room_price }
							</li>
							<li>
							예약 날짜 : ${tmp.regdate }
							</li>
							<li>
							예약 현황 : ${tmp.state }
							</li>
						</ul>
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
<%@include file="/../resources/footer.jsp"%><!-- footer -->