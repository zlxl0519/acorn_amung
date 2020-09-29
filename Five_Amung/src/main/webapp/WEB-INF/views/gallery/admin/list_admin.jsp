<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<div class="content">
	<h2>운영관리 | 호텔일상</h2>	
	<!-- ===============================검색창================================= -->
	
	<%-- 검색창 --%>
	<div class="right">
	
	
	<div class="search-form search-sm">
		<form action="list_admin.do" method="get" style="margin-right : 40px">
		<label for="keyword">
				<input value="${keyword }" type="text" name="keyword" placeholder="제목 검색" id="search"/>
				<button type="submit" class="btn-search"><i class="fas fa-search"></i></button>
		</label>
		</form>
	</div>
	<div class="leftf mt30">
		<a href="upload_form.do"><button>새 글 작성</button></a>
	</div>
	</div><!-- right -->
	
	<!-- ===================================================================== -->
	
		<ul class="gallery-list">
			<c:forEach var="tmp" items="${list }">
				<li>
					<div class="gallery-img">
						<a href="content.do?num=${tmp.num }">
							<img src="${pageContext.request.contextPath }${tmp.imagePath}"/>
						</a>
					</div>
					<p>${tmp.subCaption }</p>
					<div class="caption"><p>${tmp.caption}</p></div>
					<p>${tmp.regdate }</p>
					<div class="gallery-btn">
					<div>
						<a href="update_form.do?num=${tmp.num }" class="btn-default">수정</a>
						<a href="delete.do?num=${tmp.num }" class="btn-default btn-gray">삭제</a>
					</div>
				</div>
				</li>
			</c:forEach>
		</ul>
		
		<c:if test="${totalRow gt 6 }">
			<div class="btn-down">
				<a href="javascript:void(0);" id="nextBtn" ><i class="fas fa-chevron-down"></i></a>
			</div><!-- btn-down -->		
		</c:if>
</div><!-- content -->
<script>
	var currentPage = 1;
	var totalPageCount = ${totalPageCount};
	
	$("#nextBtn").on("click", function(){
		
		currentPage++;
		
		if($("#serch").val == ""){
			$.ajax({
				url : "ajax_list_admin.do",
				method : "get",
				data : {pageNum : currentPage},
				success : function(data){
					$(".gallery-list").append(data).fadeIn(1000);
				}
			});	
		}else{
			$.ajax({
				url : "ajax_list_admin.do",
				method : "get",
				data : {pageNum : currentPage, keyword:"${keyword}"},
				success : function(data){
					$(".gallery-list").append(data).fadeIn(1000);
				}
			});
		}
		
	})
</script>
<%@include file="/../resources/footer.jsp"%><!-- footer -->