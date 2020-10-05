<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<script>
	alert("작성하신 글이 무사히 저장되었습니다!");
	location.href="${pageContext.request.contextPath}/faq/faq_main.do"
</script>
<%@include file="/../resources/footer.jsp"%><!-- footer -->