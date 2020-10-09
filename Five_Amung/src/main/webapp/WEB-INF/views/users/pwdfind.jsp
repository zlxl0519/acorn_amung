<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/../resources/header.jsp"%><!-- header -->
<script>
	document.title = "Amung'"; 
</script>
<div class="content">
<div class="icon-wrap">
	<c:choose>
		<c:when test="${isSuccess }">
			<i class="fas fa-lock-open"></i>
			<p class="form-span m0">
		 		임시비밀번호는 <strong>${newPwd }</strong> 입니다.
		 	</p>
			<a class="btn-a" href="${pageContext.request.contextPath }/users/loginform.do">확인</a>
		</c:when>
		<c:otherwise>
			<i class="fas fa-lock"></i>
			<p class="form-span m0">
				<strong>입력한 정보가 맞지 않아 비밀번호를 찾지 못하였습니다.</strong>
			</p>
				<a class="btn-a" href="${pageContext.request.contextPath	}/users/pwdfind_form.do">다시 시도</a>
		</c:otherwise>
	</c:choose>
</div>
</div>
<%@include file="/../resources/footer.jsp"%><!-- footer -->