<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<script>
	document.title = "Amung'info";
</script>
<div class="content">
<div class="pwdfind form-wrap">
		 
		 <div class="icon-wrap">
			<i class="fas fa-key"></i>
		 	<p class="form-span m0">
		 	<strong>비밀번호 변경</strong><br/>
		 	가입 당시 입력한 비밀번호를 확인 후 비밀번호를 변경해주세요.
		 	</p>
		 </div>
		<form id="pwdfind_form" action="updatepwd.do" method="post">
			<div class="form-ul-wrap users-wrap users-find-wrap">
				<ul>
					<li>
						<input
						type="password"
						name="pwd"
						id="pwd"
						placeholder="기존 비밀번호를 입력해주세요!" />
					</li>
					<li>
						<input
						type="password"
						name="newPwd"
						id="newPwd"
						placeholder="변경할 비밀번호를 입력해주세요!"
						/>
					</li>
					<li>
						<input
						type="password"
						name="newPwd2"
						id="pwd2"
						placeholder="변경할 비밀번호를 확인해주세요!"
						/>
					</li>
				</ul>
				
				<p class="form-span m20 f_red">
					* 비밀번호는 8자 이상 16자리 이하의 영문/숫자/특수문자<br/>
					&nbsp;&nbsp;[ ~!@#$%^&* ]만 사용이 가능합니다.
				</p>
			
				<button type="submit" class="btn-default">
					비밀번호 수정
				</button>
				<button type="reset" class="btn-default btn-gray">
					취소
				</button>
			</div>
			
		</form>
		
	</div><!-- form-wrap -->
	
</div><!-- content -->
<%@include file="/../resources/footer.jsp"%><!-- footer -->