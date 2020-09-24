<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<script>
	document.title = "Amung' myPage"; 
</script>
<%--마이페이지-정보보기 mypage/info.jsp--%>
<!-- content -->
<div class="content">
	<div class="sub-nav">
		<h2>MyPage</h2>
		<div class="sub-nav-gnb">
			<ul>
				<li class="active">
					<a href="info.do">나의 정보</a>
				</li>
				<li>
					<a href="reserve/status.do">나의 예약</a>
				</li>
				
				<li>
					<a href="info/dogs.do">강아지 정보</a>
				</li>
			</ul>
		</div><!-- sub-nav-gnb -->
	</div><!-- sub-nav -->
	<div class="form-wrap">
		<div class="profile-img">
		<c:choose>
			<c:when test="${empty dto.profile }">
				<img id="profileImage"
					src="${pageContext.request.contextPath }/resources/img/icon_user.png" />
			</c:when>
			<c:otherwise>
				<img id="profileImage"
					src="${pageContext.request.contextPath }${dto.profile}" />
			</c:otherwise>
		</c:choose>
		</div><!-- profile-img -->
		<h3 class="info"><strong>${dto.name }</strong> 님의 정보입니다.</h3>
		<%-- 프로필사진  업로드 폼--%>

		<div class="form-ul-wrap mt30">
			<ul>
	
				<li>
					<label for="id">아이디</label>
					<p>${dto.id}</p>
				</li>
				<li>
					<label for="pwd">비밀번호</label>
					<a href="" class="btn-pwd">비밀번호 변경</a>
				</li>
				<li>
					<label for="email">이메일</label>
					<p>${dto.email }</p>
				</li>
				<li>
					<label for="name">성함</label>
					<p>${dto.name }</p>
				</li>
				<li>
					<label for="phone">연락처</label>
					<p>${dto.phone }</p>
				</li>
				<li>
					<label for="">가입일</label>
					<p>
					${dto.regdate }
					</p>
				</li>
			</ul>
	
		</div>
	
		<a href="update/pwd.do" class="btn-default">개인정보 수정</a>
		<a href="javascript:deleteConfirm()" class="btn-default btn-gray">탈퇴</a>
	</div><!-- form-wrap -->
</div><!-- content -->
<script>
function deleteConfirm(){
	
	var isDelete = confirm("탈퇴하시겠습니까?");
	if (isDelete) {
		location.href = "${pageContext.request.contextPath }/mypage/private/delete.do?id=${id}";
	}else {
		return false
	}
}
</script>
<%@include file="/../resources/footer.jsp"%><!-- footer -->