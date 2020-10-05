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
		
		<div class="caption">
			<p>${tmp.caption }</p>
			<strong class="sub">${tmp.subCaption}</strong><br/>
			<span class="date">${tmp.regdate }</span>
		</div>
		<div class="gallery-btn">
			<div>
				<a href="update_form.do?num=${tmp.num }" class="btn-default">수정</a>
				<a href="delete.do?num=${tmp.num }" class="btn-default btn-gray">삭제</a>
			</div>
		</div>
	</li>
</c:forEach>