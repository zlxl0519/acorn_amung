<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/../resources/header.jsp"%><!-- header -->

<div class="content center">
	<h3 class="review">소중한 <strong>후기</strong>를 작성해주세요! <i class="fas fa-comment-dots"></i></h3>
		<form action="insert.do" method="post">
			<ul class="review-ul mt30 review-text">
				<li>
					<div class="review-wrap">
					<div class="mt-20">
						<label for="writer">작성자 : ${id }</label>
						<input type="hidden" value="${id }" disabled />
					</div>
					<div class="mt20">
							<label for="title">제목</label>
							<input type="text" name="title" id="title" />
						</div>
						<div class="mt20">
							<label for="rating">별점</label>
							<select name="rating" id="rating">
								<option value="5">★★★★★</option>
								<option value="4">★★★★☆</option>
								<option value="3">★★★☆☆</option>
								<option value="2">★★☆☆☆</option>
								<option value="1">★☆☆☆☆</option>
							</select>
						</div>
						<div class="mt20">
							<label for="content">작성하기</label>
							<textarea name="content" id="content" class="mt20" cols="40" rows="20" placeholder="글 내용을 입력해주세요!" onfocus="this.placeholder=''" onblur="this.placeholder='글 내용을 입력해주세요!'"></textarea>
						</div>
					</div>
				</li>
			</ul>
			<div class="left">
				<button id="submit" type="submit" class="mt20">등록</button>
			</div>
		</form>
</div>


<script>
	$("#submit").on("click", function() {
		if ($("#title").val() == "") {
			alert("제목을 입력해주세요");
			$("#title").focus();
			return false;
		} else if ($("#content").val() == "") {
			alert("내용을 입력해주세요");
			$("#content").focus();
			return false;
		}
	});
</script>

<%@include file="/../resources/footer.jsp"%><!-- footer -->