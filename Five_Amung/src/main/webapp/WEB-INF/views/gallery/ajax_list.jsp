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
		<div class="caption"><p>${tmp.caption}</p></div>
	</li>
</c:forEach>