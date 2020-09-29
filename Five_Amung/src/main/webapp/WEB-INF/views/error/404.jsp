<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<script>
	document.title = "Amung'404"; 
</script>
<div class="content">
	<img src="${pageContext.request.contextPath }/resources/img/404.png" width="600" alt="404" />
	<h3 class="mt30 f25 f_gr" style="font-family: 'yg-jalnan';">해당 페이지가 존재하지 않습니다.</h3>
</div>
<%@include file="/../resources/footer.jsp"%><!-- footer -->