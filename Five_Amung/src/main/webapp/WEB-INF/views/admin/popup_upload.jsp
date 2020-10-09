<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/resources/header.jsp"></jsp:include>
<script>
   document.title = "팝업 설정 페이지"; 
</script>
<div class="content">
<div class="form-wrap">
<h2>운영관리 | 팝업 설정</h2>

<form action="upload.do" method="post" enctype="multipart/form-data">
	<div class="form-ul-wrap">
	<ul>
		<li>
			<label for="title">제목</label>
			<input type="text" id="title" name="title" placeholder="창제목을 입력해주세요" value="${dto.title }"/>
		</li>
		<li>
			<label for="window_width">창너비</label>
			<input type="number" id="window_width" name="window_width" value="${dto.window_width }"/>
		</li>
		<li>
			<label for="window_height">창높이</label>
			<input type="number" id="window_height" name="window_height" value="${dto.window_height }"/>	
		</li>
		<li>
			<label for="location_top">화면 위로부터</label>
			<input type="number" id="location_top" name="location_top" value="${dto.location_top }"/>
		</li>
		<li>
			<label for="location_left">화면 왼쪽으로부터</label>
			<input type="number" id="location_left" name="location_left" value="${dto.location_left }"/>			
		</li>
		<li>
		
			<label for="image">업로드</label>
			&nbsp;&nbsp;<input type="file" name="image" id="image" accept=".jpg, jpeg, .png, .JPG, .JPEG" />	
		</li>
	</ul>
	</div>
	<button type="submit" class="btn-a">등록</button>
	<a class="btn-a btn-pink" href="${pageContext.request.contextPath }/admin/delete.do" >기존팝업 삭제</a>
</form>
</div>
</div>
<jsp:include page="/resources/footer.jsp"></jsp:include>