<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/../resources/header.jsp"%><!-- header -->

<div class="content">
	<div class="icon-wrap">
		<i class="fas fa-lock"></i>
		<p class="form-span m0">
			<strong>작성자와 관리자만 볼 수 있는 글입니다.</strong>
		</p>
		<div>
			<a class="btn-a" href="qna_list.do">목록</a>
		</div>
	</div>
</div>

<%@include file="/../resources/footer.jsp"%><!-- footer -->