<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<script>
	document.title = "회원목록 "; 
</script>
<%--회원 목록 페이지 입니다.--%>
	<div class="content">
	<h2>운영관리 | 회원 목록</h2>
	<div class="table-wrap">
	<table >
		<thead>
			<tr>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">이메일</th>
				<th scope="col">연락처</th>
				<th scope="col">가입일</th>
				<th scope="col">반려견 정보</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.id }</td>
					<td>${tmp.name }</td>
					<td>${tmp.email }</td>
					<td>${tmp.phone }</td>
					<td>${tmp.regdate }</td>
					<td><a href="javascript:void(0);" onclick="PopupCenter('dog_info.do?member_id=${tmp.id }','팝업창', 700, 500);"><button>반려견 정보</button></a></td>
				</tr>
			</c:forEach>		
		</tbody>
	</table>
	
	<%-- 검색창 --%>
	<div class="right">
	
	<div class="search-form search-sm">
		<form action="user_list.do" method="get">
			<select name="condition" id="condition">
				<option value="id" <c:if test="${condition eq 'id' }">selected</c:if>>아이디</option>
				<option value="name" <c:if test="${condition eq 'name' }">selected</c:if>>이름</option>
				<option value="phone" <c:if test="${condition eq 'phone' }">selected</c:if>>연락처</option>
			</select>
			<label for="keyword">
				<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요."/>
				<button type="submit" class="btn-search"><i class="fas fa-search"></i></button>
			</label>
		</form>
	</div>
	<div class="leftf mt30">
		<a href="user_list.do"><button>전체목록 보기</button></a>
	</div>
	</div><!-- right -->
	
	
	
	<%-- 페이징 넘버 --%>
	<div class="page-display">
		<ul>
		<c:if test="${startPageNum ne 1 }">
			<li class="prev"><a class="page-link" href="user_list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }">Prev</a></li>
		</c:if>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="active"><a class="page-link" href="user_list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-link"><a class="page-link" href="user_list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${endPageNum lt totalPageCount }">
			<li class="next"><a class="page-link" href="user_list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }">Next</a></li>
		</c:if>
		</ul>
	</div>
	
	</div><!-- table-wrap -->
	</div><!-- content -->
	
	<script>
	/*	
	[ 팝업 옵션 문자열 ]
	
	yes나 no로 지정하면 됩니다.
	toolbar = 상단 도구창 출력 여부 
	menubar = 상단 메뉴 출력 여부
	location = 메뉴아이콘 출력 여부
	directories = 제목 표시줄 출력 여부
	status = 하단의 상태바 출력 여부
	scrollbars = 스크롤바 사용 여부
	resizable = 팝업창의 사이즈 변경 가능 여부
	
	사이즈 정의(픽셀 px)
	width = 팝업창의 가로 길이 설정
	height = 팝업창의 세로 길이 설정
	top = 팝업창이 뜨는 위치(화면 위에서부터의 거리 지정)
	left = 팝업창이 뜨는 위치(화면 왼쪽에서부터의 거리 지정)
	*/
	
	//팝업을 중앙에 원하는 페이지를 원하는  크기로 띄우는 함수 
	function PopupCenter(url, title, w, h) {
		// Fixes dual-screen position                         Most browsers      Firefox
		var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
		var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;
		
		width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
		height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
		
		var left = ((width/2) - (w/2)) + dualScreenLeft;
		var top = ((height/2) - (h/2)) + dualScreenTop;
		var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
		
		// Puts focus on the newWindow
		if (window.focus) {
		    newWindow.focus();
		}
	}	
	</script>
<%@include file="/../resources/footer.jsp"%><!-- footer -->