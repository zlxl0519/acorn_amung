<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>   
<%@include file="/../resources/header.jsp"%><!-- header -->

<div class="content">
	<h2>My QnA</h2>
	<div class="left mb20">
		<h3>
			<strong class="f_blue f16"> ${id }</strong>
			님의 게시물 목록입니다.
		</h3>
	</div>
	
	<div class="table-wrap">
			<table>
			<colgroup>
				<col width="100px" />
				<col width="50%" />
				<col width="" />
				<col width="200px" />
				<col width="100px" />
			</colgroup>
			<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tmp" items="${list }">
						<tr>
							<td>${tmp.num }</td>
							<td class="board_title left">
								<c:choose>
									<c:when test="${tmp.prv eq 1 }">
										<c:if test="${tmp.writer eq id or id eq 'admin' }">
											<a href="content.do?num=${tmp.num }">
												${tmp.title } <span class="comment-icon">${tmp.comm}</span>
												<c:if test="${tmp.done ne 0 }">
												-답변완료
												</c:if>
												<c:if test="${tmp.prv eq 1 }">
												-비밀글
												</c:if>
											</a>
										</c:if>
										<c:if test="${tmp.writer ne id and id ne 'admin' }">
											<a href="secret_content.do?num=${tmp.num }">
												${tmp.title } <span class="comment-icon">${tmp.comm}</span>
												<c:if test="${tmp.done ne 0 }">
												-답변완료
												</c:if>
												-비밀글
											</a>
										</c:if>
									</c:when>
									<c:otherwise>
										<a href="content.do?num=${tmp.num }">
											${tmp.title } [${tmp.comm}]
											<c:if test="${tmp.done ne 0 }">
											-답변완료
											</c:if>
											<c:if test="${tmp.prv eq 1 }">
											-비밀글
											</c:if>
										</a>
									</c:otherwise>
								</c:choose>
							</td>
							<td>${tmp.writer }</td>
							<td>${tmp.regdate }</td>
							<td>${tmp.hit }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
		</div><!-- table-wrap -->	
		
		<div class="left mt20">
			<a href="${pageContext.request.contextPath}/qna/private/insertform.do"><button>작성하기</button></a>
			<a href="qna_list.do"><button>목록으로</button></a>
		</div>
		
		
		<!-- 페이징 처리 --> 
		<div class="page-display">
			<ul>
				<c:if test="${startPageNum ne 1 }">
					<li>
						<a href="myqna.do?pageNum=${startPageNum-1  }&condition=${condition }&keyword=${encodedK  }">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<c:choose>
						<c:when test="${i eq pageNum }">
							<li class="active">
								<a href="myqna.do?pageNum=${i  }&condition=${condition }&keyword=${encodedK }">${i  }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="myqna.do?pageNum=${i  }&condition=${condition }&keyword=${encodedK }">${i  }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${endPageNum lt totalPageCount }">
					<li>
						<a href="myqna.do?pageNum=${endPageNum+1  }&condition=${condition }&keyword=${encodedK  }">Next</a>
					</li>
				</c:if>
			</ul>
		</div><!-- 페이징처리 -->
</div> <!-- content -->

<%@include file="/../resources/footer.jsp"%><!-- footer -->