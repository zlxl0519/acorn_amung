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
</div>	<!-- content -->
<%@include file="/../resources/footer.jsp"%><!-- footer -->