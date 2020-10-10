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
							<a href="${pageContext.request.contextPath	}/reserve/reserve_home.do">예약하기 </a>
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

				<a href="${pageContext.request.contextPath }/notice/list.do"
					class="notice-plus"><span>+</span>더보기</a>
			</div>
			<div class="main-notice-list">
				<ul>
					<c:forEach var="tmp" items="${noticeList }" end="4">
						<li>
							<a href="${pageContext.request.contextPath }/notice/detail.do?num=${tmp.num }">
								<span>[ ${tmp.category } ]
								</span> ${tmp.title }
							</a>
						</li>
					</c:forEach>
				</ul>
			</div><!-- main-notice-lis  -->
		</div><!-- main-notice-wrap -->
	</section><!-- main-notice -->
	
	<section class="main-gallery-wrap">
		<h6>
			<a href="${pageContext.request.contextPath }/gallery/list.do">Amung의
				일상 <span class="f_gr">+</span>
			</a>
		</h6>
		<ul class="gallery-list">
			<c:forEach var="tmp" items="${galleryList }" end="2">
				<li>
					<a href="${pageContext.request.contextPath }/gallery/content.do?num=${tmp.num }">
					<img
						src="${pageContext.request.contextPath }${tmp.imagePath}" />
					</a>
				</li>
			</c:forEach>
		</ul>
	</section><!-- main-gallery-wrap -->

	<section class="main-review">
		<h6>
			<a href="${pageContext.request.contextPath }/review/rev_list.do">Amung
				후기 <span class="f_gr">+</span>
			</a>
		</h6>
		<ul class="review-ul">
			<c:forEach var="tmp" items="${reviewList }" end="2">
				<li>
					<div class="review-wrap">
						<!-- 별점 -->
						<div class="review-star">
							<p>
								<c:choose>
									<c:when test="${tmp.rating eq 1 }">★☆☆☆☆</c:when>
									<c:when test="${tmp.rating eq 2 }">★★☆☆☆</c:when>
									<c:when test="${tmp.rating eq 3 }">★★★☆☆</c:when>
									<c:when test="${tmp.rating eq 4 }">★★★★☆</c:when>
									<c:otherwise>
									★★★★★
									</c:otherwise>
								</c:choose>
							</p>
						</div>
						<span class="review-date">${tmp.regdate }</span>
						<div class="review-wrap-users">
							<div class="review-profile">
								<img id="profileImage"
									src="${pageContext.request.contextPath}/resources/img/icon_user.png" />
							</div>
							<div class="review-users">
								<p>${tmp.writer }</p>
								<span>${tmp.title }<br /></span>
							</div>
						</div>
						<!-- review-wrap-users -->
						<div class="review-wrap-con mt30">
							<p>${tmp.content }</p>
						</div>
						<!-- review-wrap-con -->
						<div class="right mt20">
							<a class="review-btn" href="${pageContext.request.contextPath }/review/content.do?num=${tmp.num }"> 더보기 </a>
						</div>
					</div>
					<!-- review-wrap -->
				</li>
			</c:forEach>
		</ul>
	</section>
	<!-- review -->
</article>

<script>
//팝업 띄우는 함수 

	let canPopup = ${canPopup}
	if(canPopup && ${not empty dto}){
			window.open("${pageContext.request.contextPath }/popup.do","${dto.title}","width=${dto.window_width},height=${dto.window_height},top=${dto.location_top},left=${dto.location_left}");	
	}
</script>
<%@include file="/resources/footer.jsp"%><!-- footer -->