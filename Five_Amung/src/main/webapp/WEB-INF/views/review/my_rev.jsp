<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>   
<%@include file="/../resources/header.jsp"%><!-- header -->

<div class="content center">
	<h3 class="review"><strong>${id} </strong>님의 소중한 후기 <i class="fas fa-comment-dots"></i></h3>
	<div class="left mb20">
		<a href="${pageContext.request.contextPath}/review/private/insertform.do"><button>작성하기</button></a>
		<a href="rev_list.do"><button class="btn-g">목록으로</button></a>
	</div>

	<ul class="review-ul">
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
							<c:when test="${not empty tmp.writer}">${tmp.writer }</c:when>
							<c:otherwise>익명의 리뷰어</c:otherwise>
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
	</ul>
	
</div><!-- content -->

<script>
	//페이지가 처음 로딩될때 1page 를 보여준다고 가정
	var currentPage=1;
	//전체 페이지의 수를 javascript 변수에 담아준다.
	var totalPageCount=${totalPageCount};
	
	//웹브라우저에 scoll 이벤트가 일어 났을때 실행할 함수 등록 
	$(window).on("scroll", function(){
		if(currentPage == totalPageCount){//만일 마지막 페이지 이면 
			return; //함수를 여기서 종료한다. 
		}
		//위쪽으로 스크롤된 길이 구하기
		var scrollTop=$(window).scrollTop();
		//window 의 높이
		var windowHeight=$(window).height();
		//document(문서)의 높이
		var documentHeight=$(document).height();
		//바닥까지 스크롤 되었는지 여부
		var isBottom = scrollTop+windowHeight + 10 >= documentHeight;
		if(isBottom){//만일 바닥까지 스크롤 했다면...
			currentPage++; //페이지를 1 증가 시키고 
			//해당 페이지의 내용을 ajax  요청을 해서 받아온다. 
			$.ajax({
				url:"my_rev_ajax_list.do",
				method:"get",
				data:{pageNum:currentPage},
				success:function(data){
					console.log(data);
					//data 가 html 마크업 형태의 문자열 
					$(".review-ul").append(data); 
				}
			});
		}
	});	
</script>
          
<%@include file="/../resources/footer.jsp"%><!-- footer -->