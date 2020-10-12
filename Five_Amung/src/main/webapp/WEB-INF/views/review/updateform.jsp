<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<div class="content center">
<h3 class="review">소중한 <strong>후기</strong>를 수정 중 입니다. <i class="fas fa-comment-dots"></i></h3>
	<form action="update.do" method="post">
	<ul class="review-ul mt30 review-text">
			<li>
				<div class="review-wrap">
					<div class="mt20">
					<input type="hidden" name="num" value="${dto.num }" />
					<label for="num">글번호 : ${dto.num }&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</label>
					<input type="hidden" name="id" value="${dto.writer }" />
					<label for="id">작성자 : ${dto.writer }</label>
					</div>
					<div class="mt20">
						<label for="title">제목</label>
						<input type="text" name="title" id="title" value="${dto.title }"/>
					</div>
					<div class="mt20">
						<label for="rating">별점</label>
						<select name="rating" id="rating">
							<option value="5" <c:if test="${dto.rating eq 5}">selected</c:if>>★★★★★</option>
							<option value="4" <c:if test="${dto.rating eq 4}">selected</c:if>>★★★★☆</option>
							<option value="3" <c:if test="${dto.rating eq 3}">selected</c:if>>★★★☆☆</option>
							<option value="2" <c:if test="${dto.rating eq 2}">selected</c:if>>★★☆☆☆</option>
							<option value="1" <c:if test="${dto.rating eq 1}">selected</c:if>>★☆☆☆☆</option>
						</select>
					</div>
					<div class="mt20 mb20">
						<label for="content">작성하기</label>
						<textarea name="content" id="content" class="mt20" cols="40" rows="20" placeholder="글 내용을 입력해주세요!" onfocus="this.placeholder=''" onblur="this.placeholder='글 내용을 입력해주세요!'">${dto.content }</textarea>
					</div>
				</div>
			</li>
		</ul>
		<div class="left">
			<button id="submit" type="submit" class="mt20">등록</button>
		</div>
	</form>
</div><!-- content -->

<script>
	$("#submit").on("click", function(){
	    if($("#title").val() == ""){
	    	alert("제목을 입력해주세요");
	    	$("#title").focus();
		      return false;
	    }else if($("#content").val() == ""){
	    	alert("내용을 입력해주세요");
	    	$("#content").focus();
		      return false;
	    }
	});
</script>
<%@include file="/../resources/footer.jsp"%><!-- footer -->