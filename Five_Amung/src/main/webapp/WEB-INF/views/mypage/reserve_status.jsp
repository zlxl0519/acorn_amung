<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<script>
	document.title = "Amung' mypage"; 
</script>
<div class="content">
<%-- 	<div class="sub-nav">
		<div class="info-box">
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
			<div class="info-name">
				<h5>${dto.name}</h5>
				<h6>${dto.id}</h6>
			</div>
		</div><!-- info-box -->
		<div class="sub-nav-gnb">
			<ul>
				<li>
					<a href="../info.do">나의 정보</a>
				</li>
				<li>
					<a href="../reserve/status.do">나의 예약</a>
				</li>
				
				<li class="active">
					<a href="dogs.do">강아지 정보</a>
				</li>
			</ul>
		</div><!-- sub-nav-gnb -->
	</div><!-- sub-nav -->
	<div class="sub-content">
	</div> --%>
</div><!-- content -->
<%@include file="/../resources/footer.jsp"%><!-- footer -->