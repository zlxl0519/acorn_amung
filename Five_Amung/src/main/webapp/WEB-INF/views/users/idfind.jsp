<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/resources/header.jsp"></jsp:include>
<div class="content">
<div class="icon-wrap">
	<c:choose>
		<c:when test="${empty findId }">
			<i class="fas fa-lock"></i>
			<p class="form-span m0">
		 		<strong>가입한 아이디가 존재하지않습니다.</strong>
		 	</p>
			<div>
				<button onclick="location.href='${pageContext.request.contextPath }/users/idfind_form.do'" class="btn-default">돌아가기</button>
			</div>
		</c:when>
		<c:otherwise>
			<i class="fas fa-lock-open"></i>
			<p class="form-span m0">
				<c:forEach var="tmp" items="${findId }">
				아이디: <strong>${tmp.id }</strong><br/>
			 	가입날짜 : <strong>${tmp.regdate }</strong>
		 		</c:forEach>
		 	</p>
		 	
			<div>
				<button onclick="location.href='${pageContext.request.contextPath }/users/loginform.do'" class="btn-default">로그인 </button>
			</div>
		</c:otherwise>
	</c:choose>
</div>
</div>
<jsp:include page="/resources/footer.jsp"></jsp:include>