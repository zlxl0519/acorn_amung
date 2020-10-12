<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
	<c:forEach var="tmp" items="${list }">
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
							<c:when test="${tmp.rating eq 5 }">★★★★★</c:when>
						</c:choose>
					</p>
				</div>
				<span class="review-date">
					<!-- 
						// - 를 기준으로 문자열 추출
					    String regdate = tmp.getRegdate();
						String date[] = regdate.split("-");
						date[0]년 
						date[1] 월
						date[2]일 
						
						- 이 부분 jstl로 바꾸는 법을 모르겠어서 우선 주석 처리.
					 -->
					${tmp.regdate }
					</span>
				<div class="review-wrap-users">
					<div class="review-profile">
						<c:choose>
							<c:when test="${empty tmp.profile }">
								<img id="profileImage"
									src="${pageContext.request.contextPath }/resources/img/icon_user.png" />
							</c:when>
							<c:otherwise>
								<img id="profileImage"
									src="${pageContext.request.contextPath }${tmp.profile}" />
							</c:otherwise>
						</c:choose>
					</div>
					<div class="review-users">
					<p>
						<c:choose>
							<c:when test="${not empty tmp.writer}">${tmp.writer }</c:when>
							<c:when test="${empty tmp.writer}">익명의 리뷰어</c:when>
						</c:choose>
					</p>
					<span>${tmp.title } <br/></span>
					</div>
				</div><!-- review-wrap-users -->
				<div class="review-wrap-con mt30">
					<p>${tmp.content }
					</p>
				</div><!-- review-wrap-con -->
				<div class="right mt20"><a class="review-btn" href="content.do?num=${tmp.num }">더보기</a></div>
			</div><!-- review-wrap -->
		</li>
	</c:forEach>
