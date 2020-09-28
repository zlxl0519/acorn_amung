<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/resources/header.jsp"%><!-- header -->

<article class="main-article">

	<section class="main-slide">
		<ul>
			<li>
				<div class="main-slide-content">
					<div class="slide-content-wrap">
						<h4>당신의 소중한 반려견에게</h4>
						<div class="slide-txt">
							<h3>유일한</h3>
							<h4>호텔링 경험을 선물하세요</h4>
						</div>
						<div class="reservation-btn">
							<a href="${pageContext.request.contextPath	}/reserve/reserveform.do">예약하기 </a>
						</div>
					</div>
				</div><!-- main-slide-content -->
				<img src="${pageContext.request.contextPath }/resources/img/main01.png" />
				
			</li>
			<li>
				<img src="${pageContext.request.contextPath }/resources/img/main02.png" />
			</li>
			<li>
				<img src="${pageContext.request.contextPath }/resources/img/main03.png" />
			</li>
			<li>
				<img src="${pageContext.request.contextPath }/resources/img/main04.png" />
			</li>
		</ul>
	</section><!-- main-slide -->
	
	<section class="main-room">
		<ul>
			<li><img
				src="${pageContext.request.contextPath }/resources/img/main_room01.png" /></li>
			<li><img
				src="${pageContext.request.contextPath }/resources/img/main_room02.png" /></li>
			<li><img
				src="${pageContext.request.contextPath }/resources/img/main_room03.png" /></li>
		</ul>
	</section><!-- main-room -->
	
	<section class="main-notice">
		<div class="main-notice-wrap">
			<div class="main-notice-con">
				<h6>공지사항•새소식</h6>
				<p>
					어디에도 없는 프리미엄 반려견 호텔 서비스를 선사하는<br /> AMung의 새 소식과 공지사항을 알려드립니다.
				</p>

				<a href="${pageContext.request.contextPath }/notice/notice_list.jsp"
					class="notice-plus"><span>+</span>더보기</a>
			</div>
			<div class="main-notice-list">
				<ul>
					<c:forEach var="i" begin="1" end="5">
						<li>
							<a href="#">
								<span>[ 공지사항 ]
								</span> 공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항공지사항
							</a>
						</li>
					</c:forEach>
				</ul>
			</div><!-- main-notice-lis  -->
		</div><!-- main-notice-wrap -->
	</section><!-- main-notice -->
	
	<section class="main-gallery-wrap">
		<h6>
			<a href="${pageContext.request.contextPath }/gallery/list.jsp">Amung의
				일상 <span class="f_gr">+</span>
			</a>
		</h6>
		<ul class="gallery-list">
			<c:forEach var="i" begin="1" end="3">
				<li>
					<a
						href="">
						<img
							src="https://images.mypetlife.co.kr/content/uploads/2019/09/04222847/dog-panting.jpg" />
					</a>
				</li>
			</c:forEach>
		</ul>
	</section><!-- main-gallery-wrap -->

	<section class="main-review">
		<h6>
			<a href="${pageContext.request.contextPath }/review/rev_list.jsp">Amung
				후기 <span class="f_gr">+</span>
			</a>
		</h6>
		<ul class="review-ul">
			<c:forEach var="i" begin="1" end="3">
				<li>
					<div class="review-wrap">
						<span class="review-date">2020년 09월 11일</span>
						<div class="review-wrap-users">
							<div class="review-profile">
								<img id="profileImage"
									src="${pageContext.request.contextPath}/resources/img/icon_user.png" />
							</div>
							<div class="review-users">
								<p>익명의 리뷰어</p>
								<span>제목 제목<br /></span>
							</div>
						</div>
						<!-- review-wrap-users -->
						<div class="review-wrap-con mt30">
							<p>너무 좋아요 복 받으세요</p>
						</div>
						<!-- review-wrap-con -->
						<div class="right mt20">
							<a class="review-btn" href="#"> 더보기 </a>
						</div>
					</div>
					<!-- review-wrap -->
				</li>
			</c:forEach>
		</ul>
	</section>
	<!-- review -->
</article>
<%@include file="/resources/footer.jsp"%><!-- footer -->