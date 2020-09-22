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
		 	<table>
		 		<thead>
		 			<tr>
		 				<th>아이디</th>
		 				<th>가입 일자</th>
		 			</tr>
		 		</thead>
		 		<tbody>
		 			<c:forEach var="tmp" items="${findId }">
			 			<tr>
			 				<td>${tmp.id }</td>
			 				<td>${tmp.regdate }</td>
			 			</tr>
		 			</c:forEach>
		 		</tbody>
		 	</table>
			<div>
				<button onclick="location.href='${pageContext.request.contextPath }/users/loginform.do'" class="btn-default">로그인하러가기 </button>
			</div>
		</c:otherwise>
	</c:choose>
</div>
</div>
<jsp:include page="/resources/footer.jsp"></jsp:include>