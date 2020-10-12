<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="/../resources/header.jsp"%><!-- header -->
<div class="content">
<div class="table-wrap boardList">
	<h2>호텔 일상</h2>
	<table>
			<tr>
				<th>글번호</th>
				<td class="center">${dto.num }</td>
				<th>작성자</th>
				<td class="center">운영자</td>
				<th>작성일</th>
				<td>${dto.regdate }</td>
				<th>조회수</th>
				<td class="center">${dto.hit }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="7">${dto.caption }</td>
			</tr>
			<c:if test="${not empty dto.subCaption }">
			<tr>
				<th>부제목</th>
				<td colspan="7">${dto.subCaption}</td>
			</tr>
			</c:if>
			<tr>
				<th>내용</th>
				<td colspan="7"><div id="content">${dto.content }</div></td>
			</tr>
				
	</table>
</div><!-- table-wrap -->
	<%--=============================이전글 다음글================================= --%>
<div class="bottom-list">
	<div class="mt20">
		<div class="left">
				<c:choose>
					<c:when test="${dto.prevNum ne 0}">
						<a class="btn-left" href="content.do?num=${dto.prevNum }"><i class="fas fa-chevron-left"></i></a>
					</c:when>
					<c:otherwise>
						<a class="btn-left mute" href="javacript:void(0)"><i class="fas fa-chevron-left"></i></a>
					</c:otherwise>
				</c:choose>
		</div>
		<div class="right">
			<c:choose>
				<c:when test="${dto.nextNum ne 0}">
					<a class="btn-right" href="content.do?num=${dto.nextNum }"><i class="fas fa-chevron-right"></i></a>
				</c:when>
				<c:otherwise>
					<a class="btn-right mute" href="javacript:void(0)"><i class="fas fa-chevron-right"></i></a>
				</c:otherwise>
			</c:choose>
		</div>
	</div><!-- mt20 -->
</div><!-- bottom-list -->

	<!-- ===================================================== 상세페이지 본문  =======================================================================-->
	<!-- ============================ 댓글 목록  =============================-->
	<div class="comments">
		<div class="left">
			<h4>
				<i class="fas fa-comments"></i>
				<strong>${totalRow }</strong>
			</h4>
		</div>
		<ul class="comments-ul">
			<c:forEach var="tmp" items="${commentList }">
				<c:choose>
					<c:when test="${tmp.deleted eq 'yes' }">
						<li>삭제된 댓글 입니다.</li>
					</c:when>
					<c:otherwise>
						<li id="comment${tmp.num }" <c:if test="${tmp.num ne tmp.comment_group }">class='reply-wrap'</c:if>>
							<c:if test="${tmp.num ne tmp.comment_group }">
								<div class="reply-icon">
									<i class="fa fa-share fa-flip-vertical re"></i>
								</div>
							</c:if>
							<ul class="comment-box">
								<li>
									<div class="profile-image">
										<c:choose>
											<c:when test="${empty tmp.profile }">
												<img id="profileImage"
													src="${pageContext.request.contextPath }/resources/img/icon_user.png" />
											</c:when>
											<c:otherwise>
												<img class="profileImage" 
													src="${pageContext.request.contextPath }${tmp.profile }"/>
											</c:otherwise>
										</c:choose>
									</div>
									<span class="comment-writer">${tmp.writer }</span>
									<c:if test="${tmp.num ne tmp.comment_group }">
										@<i>${tmp.target_id }</i>
									</c:if>
									<span class="comment-date">${tmp.regdate }</span>
									<div class="comment-btn">
										<a data-num="${tmp.num }" href="javascript:"
											class="reply-link">
											<i class="fas fa-comment"></i>
											답글
										</a> 
										<c:if test="${tmp.writer eq id }">
											<a data-num="${tmp.num }" href="javascript:"
												class="comment-update-link">
												<i class="fas fa-pen-square"></i>
												수정
											</a>
											<a data-num="${tmp.num }" href="javascript:"
												class="comment-delete-link">
												<i class="fas fa-trash-alt"></i>
											삭제
											</a>
										</c:if>
									</div>
									
									
									<div>
										<pre>${tmp.content }</pre>
									</div>
								</li>
							</ul>
							<form class="comment-form re-insert-form" 
								action="private/comment_insert.do" method="post">
								<input type="hidden" name="ref_group"
									value="${dto.num }"/>
								<input type="hidden" name="target_id"
									value="${tmp.writer }"/>
								<input type="hidden" name="comment_group"
									value="${tmp.comment_group }"/>
								<textarea name="content"></textarea>
								<button type="submit">등록</button>
							</form>
							<!-- 로그인된 아이디와 댓글의 작성자가 같으면 수정 폼 출력 -->
							<c:if test="${tmp.writer eq id }">
								<form class="comment-form update-form" 
									action="private/comment_update.do" method="post">
									<input type="hidden" name="num" value="${tmp.num }"/>
									<textarea name="content">${tmp.content }</textarea>
									<button type="submit">수정</button>
								</form>
							</c:if>
						</li>						
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ul>
	</div>
	<!-- ============================ 댓글 목록  =============================-->
	<!-- ============== 댓글 페이징 넘버 start ================ -->
	<div class="page-display mt20">
		<ul class="pagination pagination-sm">
			<c:if test="${startPageNum ne 1 }">
				<li class="page-item"><a class="page-link" href="content.do?num=${dto.num }&pageNum=${startPageNum-1 }">Prev</a></li>
			</c:if>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<c:choose>
					<c:when test="${i eq pageNum }">
						<li class="page-item active"><a class="page-link" href="content.do?num=${dto.num }&pageNum=${i }">${i }</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="content.do?num=${dto.num }&pageNum=${i }">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${endPageNum lt totalPageCount }">
				<li class="page-item"><a class="page-link" href="content.do?num=${dto.num }&pageNum=${endPageNum+1 }">Next</a></li>
			</c:if>
		</ul>	
	</div>
	<!-- ============== 댓글 페이징 넘버 end ================ -->

	<!-- =================== 원글에 댓글을 작성하는 form  =====================-->
	<form class="comment-form insert-form" action="private/comment_insert.do" method="post">
		<!-- 원글의 글번호가 ref_group 번호가 된다. -->
		<input type="hidden" name="ref_group" value="${dto.num }"/>
		<!-- 원글의 작성자가 댓글의 수신자가 된다. -->
		<input type="hidden" name="target_id" value="${dto.id }"/>
		<textarea name="content" <c:if test="${empty sessionScope.id }">readonly</c:if>><c:if test="${empty sessionScope.id }">로그인이 필요합니다</c:if></textarea>
		<button type="submit">등록</button>
	</form>
	<!-- =================== 원글에 댓글을 작성하는 form  =====================-->		

</div>	<!-- content -->
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>



	//=========  댓글 수정 링크를 눌렀을때 호출되는 함수 등록  =============
	$(document).on("click",".comment-update-link", function(){
		/*
			click 이벤트가 일어난 댓글 수정 링크에 저장된 data-num 속성의 값을 
			읽어와서 id 선택자를 구성한다.
		*/
		var selector="#comment"+$(this).attr("data-num");
		//구성된 id  선택자를 이용해서 원하는 li 요소에서 .update-form 을 찾아서 동작하기
		$(selector)
		.find(".update-form")
		.slideToggle();
	});
	
	
	
	//================ 댓글 업데이트 합수 등록  =====================
	$(document).on("submit", ".update-form", function(){
		//이벤트가 일어난 폼을 ajax로 전송되도록 하고 
		$(this).ajaxSubmit(function(data){
			//console.log(data);
			//수정이 일어난 댓글의 li 요소를 선택해서 원하는 작업을 한다.
			var selector="#comment"+data.num; //"#comment6" 형식의 선택자 구성
			
			//댓글 수정 폼을 안보이게 한다. 
			$(selector).find(".update-form").slideUp();
			//pre 요소에 출력된 내용 수정하기
			$(selector).find("pre").text(data.content);
		});
		//폼 전송을 막아준다.
		return false;
	});
	
	
	
	//================ 댓글 업데이트 합수 등록  =====================
	$(document).on("click",".comment-delete-link", function(){
		//삭제할 글번호 
		var num=$(this).attr("data-num");
		var isDelete=confirm("댓글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath }"+
			"/gallery/private/comment_delete.do?num="+num+"&ref_group=${dto.num}";
		}
	});
	
	
	
	//================ 답글 달기 링크를 클릭했을때 실행할 함수 등록  =====================
	$(document).on("click",".reply-link", function(){
		//로그인 여부
		var isLogin=${not empty id};
		if(isLogin == false){
			alert("로그인 페이지로 이동합니다.")
			location.href="${pageContext.request.contextPath }/users/loginform.do?"+
					"url=${pageContext.request.contextPath }/gallery/content.do?num=${dto.num}";
		}
		
		var selector="#comment"+$(this).attr("data-num");
		$(selector)
		.find(".re-insert-form")
		.slideToggle();
		
		if($(this).text()=="답글"){//링크 text를 답글일때 클릭하면 
			$(this).text("취소");//취소로 바꾸고 
		}else{//취소일때 크릭하면 
			$(this).text("답글");//답들로 바꾼다.
		}	
	});
	
	
	
	//================ 답글은 로그인 한 사람만 등록할 수 있게 하는 함수  =====================
	$(document).on("submit",".insert-form", function(){
		//로그인 여부
		var isLogin=${not empty id};
		if(isLogin == false){
			alert("로그인 페이지로 이동합니다.")
			location.href="${pageContext.request.contextPath }/users/loginform.do?"+
					"url=${pageContext.request.contextPath }/gallery/content.do?num=${dto.num}";
			return false; //폼 전송 막기 		
		}
	});
	
	
</script>
<%@include file="/../resources/footer.jsp"%><!-- footer -->