<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<script>
	document.title = "Amung' mypage"; 
</script>
<div class="content">
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
</div>
<%@include file="/../resources/footer.jsp"%><!-- footer -->