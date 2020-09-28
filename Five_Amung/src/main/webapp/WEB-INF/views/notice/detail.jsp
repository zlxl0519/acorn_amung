<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<div class="content">
	<h2>공지사항</h2>
	<c:if test="${not empty keyword }">
		<p class="alert alert-success">
			<strong>${keyword }</strong>라는 키워드로 검색한 결과에 대한 자세히 보기 입니다.
		</p>
	</c:if>
	<div class="table-wrap boardList bl2">
		<table>
		<colgroup>
			<col width=""/>
			<col width="100px"/>
			<col width=""/>
			<col width=""/>
			<col width=""/>
			<col width=""/>
			<col width=""/>
			<col width="150px"/>
		</colgroup>
			<tr>
				<th>글번호</th>
				<td class="center">
					${dto.num }
				</td>
				
				<th>작성자</th>
				<td class="center">
					운영자
				</td>
				
				<th>작성일</th>
				<td class="center">
					${dto.regdate }
				</td>
				
				<th>조회수</th>
				<td class="center">
					${dto.viewCount }
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="7">
					<span class="title-select">[ ${dto.category } ]</span>
					${dto.title }
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="7">
					<div id="content">
						${dto.content }
					</div>
				</td>
			</tr>
		</table>
		
	</div><!-- table-wrap -->

	<div class="bottom-list">
		<div class="mt20">
			<div class="left">
				<c:choose>
					<c:when test="${dto.prevNum ne 0 }">
						<a class="btn-left"
							href="detail.do?num=${dto.prevNum }&condition=${condition }&keyword=${encodedK }">
							<i class="fas fa-chevron-left"></i>
						</a>
					</c:when>
					<c:otherwise>
						<a class="btn-left mute">
							<i class="fas fa-chevron-left"></i>
						</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="right">
				<c:choose>
					<c:when test="${dto.nextNum ne 0 }">
						<a class="btn-right"
							href="detail.do?num=${dto.nextNum }&condition=${condition }&keyword=${encodedK }">
							<i class="fas fa-chevron-right"></i>
						</a>
					</c:when>
					<c:otherwise>
						<a class="btn-right mute">
							<i class="fas fa-chevron-right"></i>
						</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div><!-- mt20 -->
		<div class="center">
			<!-- 로그인 중인 id가 글 작성 시의 id와 같을 때에만 수정, 삭제-->
			<c:if test="${id eq 'admin'}">
				<a class="btn-a btn-out-b"
				href="private/updateform.do?num=${dto.num }">
				수정
				</a>
				<a class="btn-a btn-gray"
					href="javascript:deleteConfirm(${dto.num })">
					삭제
				</a>
			</c:if>
			<a class="btn-a"
				href="list.do">
				목록
			</a>
		</div><!-- center-->
	</div><!-- bottom-list -->
</div><!-- content -->
<script>
	function deleteConfirm(num){
		var isDelete = confirm(num+"번 글을 삭제하시겠습니까?");
		if(isDelete){
			location.href="private/delete.do?num="+num;
		}
	}
</script>
<%@include file="/../resources/footer.jsp"%><!-- footer -->