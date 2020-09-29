<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<script>
	document.title = "Amung'mypage"; 
</script>
<div class="content">
	<div class="form-wrap">
		

	<div class="icon-wrap">	
		<i class="fas fa-lock"></i>
		 	<p class="form-span m0">
		 	<strong>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</strong>
		 	</p>
		</div>
	<form name="update_pwdokform" action="submit.do" method="post" onsubmit="return checkValue()">
		
		<div class="form-ul-wrap users-wrap users-find-wrap">
		<ul>
			<li>
				<label for="id">아이디</label>
				<input type="text" id="id" value="${id }" readonly/> <br />
			</li>
			<li>
				<label for="pwd">비밀번호</label>
				<input type="password" id="pwd" name="pwd" />
			</li>
		</ul>
		
		<button type="submit" class="btn-default mt20 w100">확인</button>
		</div>
		
	</form>
	</div><!-- form-wrap -->
</div><!-- content -->
<script>
	function checkValue(){
		if(!document.update_pwdokform.pwd.value){
			alert("비밀번호를 입력하지 않았습니다.");
			return false;
		}
	}
</script>
<%@include file="/../resources/footer.jsp"%><!-- footer -->