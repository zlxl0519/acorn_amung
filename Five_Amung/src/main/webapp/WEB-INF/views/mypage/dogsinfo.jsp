<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<script>
	document.title = "Amung' mypage"; 
</script>
<div class="content">
	<div class="sub-nav">
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
					<a href="info/dogs.do">강아지 정보</a>
				</li>
			</ul>
		</div><!-- sub-nav-gnb -->
	</div><!-- sub-nav -->
	<div class="sub-content">
		<c:choose>
			<c:when test="${isSuccess eq true}">
			<ul class="dog-list">
				<c:forEach var="tmp" items="${dogList }">
				<li> 
					<ul>
						<li>
							<h2>
								${tmp.dname }
							</h2>
						</li>
						<li>
						성별 :
						<c:choose>
							<c:when test="${tmp.gender eq 'female' }">
								여아
							</c:when>
							<c:otherwise>
								남아
							</c:otherwise>
						</c:choose>
						</li>
						<li>
							나이 : ${tmp.dage }살
						</li>
						<li>
							견종 : ${tmp.breed }
						</li>
						<li>
							몸무게 : 
							<c:choose>
								<c:when test="${tmp.weight eq '3' }">
									3kg 이하
								</c:when>
								<c:when test="${tmp.weight eq '6' }">
									4kg~6kg
								</c:when>
								<c:when test="${tmp.weight eq '9' }">
									7kg~9kg
								</c:when>
								<c:when test="${tmp.weight eq '10' }">
									10kg 이상
								</c:when>
							</c:choose>
						</li>
						<li>
							중성화 여부 : 
							<c:choose>
								<c:when test="${tmp.neutral eq 'yes' }">
									유
								</c:when>
								<c:otherwise>
									무
								</c:otherwise>
							</c:choose>
						</li>
						<li class="dog-etc">
							<h4>특이사항</h4>
							<c:choose>
								<c:when test="${empty tmp.etc }">
									<pre>특이사항이 없습니다.</pre>
								</c:when>
								<c:otherwise>
									<pre>${tmp.etc }</pre>
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
					<div class="info-hover">
						<!-- <a href="" class="btn-a btn-b">수정</a> -->
						<a href="" class="btn-a">삭제</a>
					</div>
				</li>
				</c:forEach>
			</ul>
			</c:when>
			<c:otherwise>
			<div class="icon-wrap">
				<i class="fas fa-bomb"></i>
				<h3>
					<strong>강아지 정보를 등록하지 않았습니다.</strong>
				</h3>
				<a href="${pageContext.request.contextPath }/reserve/reserve_home.do" class="btn-a mt20">등록하러가기</a>
			</div>
				
			</c:otherwise>
		</c:choose>
	</div>
</div><!-- content -->
<%@include file="/../resources/footer.jsp"%><!-- footer -->