<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="tmp" items="${list }">
	<li>
		<div class="gallery-img">
			<a href="content.do?num=${tmp.num }">
				<img src="${pageContext.request.contextPath }${tmp.imagePath}"/>
			</a>
		</div>
		<p>${tmp.subCaption }</p>
		<div class="caption"><p>${tmp.caption}</p></div>
		<p>${tmp.regdate }</p>
		<div class="gallery-btn">
		<div>
			<a href="update_form.do?num=${tmp.num }" class="btn-default">수정</a>
			<a href="delete.do?num=${tmp.num }" class="btn-default btn-gray">삭제</a>
		</div>
	</div>
	</li>
</c:forEach>