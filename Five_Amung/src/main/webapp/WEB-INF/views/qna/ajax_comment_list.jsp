<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="tmp" items="${commentList }">
		<c:choose>
			<c:when test="${tmp.deleted eq 'yes' }">
				<li>삭제된 댓글 입니다.</li>
			</c:when>
			<c:otherwise>
				<li id="comment${tmp.num }" <c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if>>
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
						<c:choose>
							<c:when test="${tmp.writer eq 'admin' }">
								<span class="comment-writer">관리자</span>
							</c:when>
							<c:otherwise>
								<span class="comment-writer">>${tmp.writer }</span>
							</c:otherwise>
						</c:choose>
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
							</c:if>
							<c:if test="${tmp.writer eq id or id eq 'admin' }">
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