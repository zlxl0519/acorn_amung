<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<div class="content">
	<div class="icon-wrap">
		<i class="fas fa-lock-open"></i>
		<p class="form-span m20">
			<strong>THANKS</strong>
		</p>
		<p class="form-span m20">
			${dto.name }님 회원가입이 완료되었습니다.
		</p>
		<div class="center">
			<table class="table-wrap" style="width : auto!important;">
				<colgroup>
					<col />
					<col width="117px;" />
					<col />
				</colgroup>
				<tr>
					<td rowspan="3" class="bbn">
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
               			</div>
					</td>
					<th>아이디</th>
					<td>${dto.id }</td>
				</tr>
				<tr>
					<th>성함</th>
					<td>${dto.name }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td class="bbn">${dto.email }</td>
				</tr>
			</table>
		</div>
		<a href="../home.do" class="btn-default mt20">GO HOME</a>
	</div>
</div>
<%@include file="/../resources/footer.jsp"%><!-- footer -->