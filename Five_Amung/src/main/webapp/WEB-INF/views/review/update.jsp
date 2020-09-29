<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	alert("글을 수정했습니다.");
	location.href="${pageContext.request.contextPath}/review/detail.do?num=${param.num}";
</script>