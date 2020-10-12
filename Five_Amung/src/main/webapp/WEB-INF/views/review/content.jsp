<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>   

<%@include file="/../resources/header.jsp"%><!-- header -->

<div class="content center">
	<h3 class="review"><strong>후기</strong>를 자세히 살펴보아요! <i class="fas fa-comment-dots"></i></h3>
	
	<div class="content-review">
		<c:if test="${dto.prevNum ne 0 }">
			<a href="content.do?num=${dto.prevNum}" class="review-arrow"><i class="fas fa-chevron-left"></i></a>
		</c:if>
		
			<ul class="review-ul">
				<li>
					<div class="review-wrap">
						<div class="review-star con">
							<p>
								<c:choose>
									<c:when test="${dto.rating eq 1 }">★☆☆☆☆</c:when>
									<c:when test="${dto.rating eq 2 }">★★☆☆☆</c:when>
									<c:when test="${dto.rating eq 3 }">★★★☆☆</c:when>
									<c:when test="${dto.rating eq 4 }">★★★★☆</c:when>
									<c:when test="${dto.rating eq 5 }">★★★★★</c:when>
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
								(추후 리뷰 전부 구현한 후에 고민해서 바꿔보기)
							 -->
							${tmp.regdate }
					</span>
						<div class="review-wrap-users">
							<div class="review-profile">
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
							</div>
						<div class="review-users">
							<p>
								<c:choose>
									<c:when test="${not empty dto.writer}">${dto.writer }</c:when>
									<c:otherwise>익명의 리뷰어</c:otherwise>
								</c:choose>
							</p>
							<span>${dto.title } <br/></span>
							</div>
						</div><!-- review-wrap-users -->
						<!-- 별점 -->
						<div class="review-wrap-con mt30">
							<p class="review-webkit">
								${dto.content }
							</p>
						</div><!-- review-wrap-con -->
					</div><!-- review-wrap -->
				</li>
			</ul>
		<c:if test="${dto.nextNum ne 0 }">
			<a href="content.do?num=${dto.nextNum}" class="review-arrow"><i class="fas fa-chevron-right"></i></a>
		</c:if>
		
	</div><!-- content-review -->
		
	<!-- 로그인 중인 id가 글 작성 시의 id와 같을 때에만 수정, 삭제 기능 볼 수 있도록 -->
		<div class="review-left">
			<c:if test="${dto.writer eq id }">
				<a href="private/updateform.do?num=${dto.num }" class="btn-a">수정</a>
			</c:if>
			<c:if test="${dto.writer eq id or id eq 'admin' }">
				<a href="javascript:deleteConfirm();" class="btn-a btn-g">삭제</a>
			</c:if>
		</div>
		<div class="center">
			<a href="rev_list.do" class="review-btn2"><b>+</b> 전체 후기 보기</a>
		</div>		
</div><!-- content -->
<script>
	function deleteConfirm() {
		var isDelete = confirm("이 글을 삭제하시겠습니까?");
		if (isDelete) {
			location.href = "delete.do?num=${dto.num}";
		}
	}
</script>
<%@include file="/../resources/footer.jsp"%><!-- footer -->