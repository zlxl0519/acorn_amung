<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>\
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %> 
<%@include file="/../resources/header.jsp"%><!-- header -->
	<div class="content">
		<h2>QnA 게시판</h2>	
		<div class="table-wrap boardList bl2">
			<table>
				<tr>
					<th>글번호</th>
					<td class="center">${dto.num}</td>
					<th>작성자</th>
					<td class="center">${dto.writer}</td>
					<th>작성일</th>
					<td>${dto.regdate}</td>
					<th>조회수</th>
					<td class="center">${dto.hit}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="7">
						${dto.title } 
							<c:if test="${dto.done ne 0 }">
								답변 완료
							</c:if>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="7"><div id="content">${dto.content }</div></td>
				</tr>	
			</table>	
			
		</div><!-- table-wrap -->
		
		<div class="bottom-list">
			<div class="mt20">
				<div class="left">
					<c:choose>
						<c:when test="${dto.prevNum ne 0 }">
							<a class="btn-left" href="content.do?num=${dto.prevNum}"><i class="fas fa-chevron-left"></i></a>
						</c:when>
						<c:otherwise>
							<a class="btn-left mute" href="javacript:void(0)"><i class="fas fa-chevron-left"></i></a>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="right">
					<c:choose>
						<c:when test="${dto.nextNum ne 0 }">
							<a class="btn-right" href="content.do?num=${dto.nextNum}"><i class="fas fa-chevron-right"></i></a>
						</c:when>
						<c:otherwise>
							<a class="btn-right mute" href="javacript:void(0)"><i class="fas fa-chevron-right"></i></a>
						</c:otherwise>
					</c:choose>
				</div>
					
		
			</div><!-- mt20 -->
			<div class="center">
				<!-- 로그인 중인 id가 글 작성 시의 id와 같을 때에만 수정, 삭제 기능 볼 수 있도록 -->
				<a class="btn-a" href="qna_list.do">목록</a>
				<c:if test="${dto.writer eq id }">
					<a class="btn-a btn-b" href="updateform.do?num=${dto.num }">수정</a>
				</c:if>
				<c:if test="${dto.writer eq id or id eq 'admin' }">
					<a class="btn-a btn-gray" href="javascript:deleteConfirm()">삭제</a>
				</c:if>
				
				
			</div><!-- center -->  
			
		</div><!-- bottom-list -->
	</div> <!-- content -->

<script>
	function deleteConfirm(){
	    var isDelete=confirm("이 글을 삭제하시겠습니까?");
	    if(isDelete){
	        location.href="delete.do?num=${dto.num }";
	    }
	}
</script>
	
<%@include file="/../resources/footer.jsp"%><!-- footer -->