<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	img { max-width: 100%; height: auto; }
</style>
<img src="${pageContext.request.contextPath }${dto.imagePath}"/>
	
<form action="${pageContext.request.contextPath }/admin/popup_save.do" method="post">
	<label>
		<input type="checkbox" name="canPopup" value="no" />
		하루 동안 팝업 띄우지 않기
	</label>
	<button type="submit">닫기</button>
</form>
