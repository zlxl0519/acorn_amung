<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<script>
	document.title = "Amung'Notice"; 
</script>
<%--공지사항 리스트--%>
<div class="content">	
	<h2>공지사항</h2>
	<div class="left mb20">
		<a href="private/insertform.do" class="btn-a">글작성</a>
	</div><!--left-->
	<div class="table-wrap">
		<table>
			<colgroup>
				<col width="100px"/>
				<col width="100px"/>
				<col width=""/>
				<col width=""/>
				<col width=""/>
				<col width="20%"/>
			</colgroup>
			<tr>
				<th>글번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
			<c:forEach var="tmp" items="${list }">
			<tr>
				<td>${tmp.num }</td>
				<td>${tmp.category }</td>
				<td class="board_title left">
					<a href="detail.do?num=${tmp.num }&condition=${condition }&keyword=${encodedK }">
						${tmp.title }
					</a>
				</td>
				<td>운영자</td>
				<td>${tmp.viewCount }</td>
				<td>${tmp.regdate }</td>
			</tr>
		</c:forEach>
		</table>
	</div><!--table-wrap -->
	
	<!-- 검색 폼 --> 
	 <div class="search-form">
	 	<form action="list.do" method="get">
	 		<div class="search-wrap">
			<select name="condition" id="condition">
				<option value="title_content" <c:if test="${condition eq 'title_content' }">selected</c:if>>제목+내용</option>
				<option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
				<option value="writer" <c:if test="${condition eq 'category' }">selected</c:if>>카테고리</option>
			</select>
			<label for="keyword">
				<input value="${keyword }" type="text" name="keyword" placeholder="검색어를 입력하세요." />
				<button type="submit" class="btn-search"><i class="fas fa-search"></i></button>
			</label>
		</div>
		</form> 
	 </div>
	 
	 <!-- 페이징 처리 버튼 -->
	<div class="page-display">
		<ul>
			<c:choose>
				<c:when test="${startPageNum ne 1 }">
					<li class="prev">
						<a href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }">
							Prev
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="prev muted">
						<a href="">
							Prev
						</a>
					</li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<c:choose>
					<c:when test="${i eq pageNum }">
					<li class="active">
						<a href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">
							${i }
						</a>
					</li>
					</c:when>
					<c:otherwise>
					<li>
						<a href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">
							${i }
						</a>
					</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:choose>
				<c:when test="${endPageNum lt totalPageCount }">
					<li class="next">
						<a href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }">
							Next
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="next muted">
						<a href="">
							Next
						</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div><!-- page-display -->
</div><!-- content -->
<%@include file="/../resources/footer.jsp"%><!-- footer -->