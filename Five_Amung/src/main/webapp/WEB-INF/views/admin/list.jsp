<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/resources/header.jsp"></jsp:include>
<div class="content admin">
	<div onClick="location.href ='../users/admin/user_list.do'">
		<span>
			<i class="fas fa-users"></i>
		</span>
		<p>회원 리스트</p>
	</div>
	<div onClick="location.href ='../gallery/admin/list_admin.do'">
		<span>
		<i class="fas fa-camera-retro"></i>
		</span>
		<p>
		amung 일상 갤러리 관리
		</p>
	</div>
	<div onClick="location.href ='reserve_list.do'">
		<span>
		<i class="fas fa-calendar-check"></i>
		</span>
		<p>예약 내역 리스트</p>
	</div>
	<div onClick="location.href ='../notice/list.do'">
		<span>
		<i class="fas fa-edit"></i>
		</span>
		<p>amung 공지사항 관리</p>
	</div>
	<div onClick="location.href = 'popup_upload.do'">
		<span>
		<i class="far fa-window-restore"></i>
		</span>
		<p>팝업 등록</p>
	</div>
	<div onClick="location.href = '${pageContext.request.contextPath }/faq/faq_insertform.do'">
		<span>
		<i class="fas fa-question-circle"></i>
		</span>
		<p>faq 게시판 관리</p>
	</div>
</div><!-- admin -->
<jsp:include page="/resources/footer.jsp"></jsp:include>