<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/resources/header.jsp"></jsp:include>
<script>
	document.title = "비밀번호 찾기  "; 
</script>


<div class="content">
	<div class="pwdfind form-wrap">
		<h2>아이디 / 비밀번호 찾기</h2>
		<div class="find-tab">
			<a href="idfind_form.do" class="bbc">아이디 찾기</a>
			<a href="pwdfind_form.do" class="active bbn">비밀번호 찾기</a>
		</div>
		 
		 <div class="icon-wrap">
			<i class="fas fa-mobile-alt"></i>		 	
		 	<p class="form-span m0">
		 	<strong>등록된 휴대폰 번호로 찾기</strong><br />
		 	가입 당시 입력한 연락처를 통해 비밀번호를 찾아주세요.
		 	</p>
		 </div>
		 
		
		
		<form id="pwdfind_form" action="pwdfind.do" method="post">
			<div class="form-ul-wrap users-wrap users-find-wrap">
				<ul>
					<li>
						<input type="text" name="id" id="id" placeholder="아이디 " />
					</li>
					<li>
						<input type="text" name="name" id="name" placeholder="이름 "/>
					</li>
					<li>
						<input type="text" name=""	id="phone" placeholder="연락처 " />
					</li>
					
				</ul>
				
				<div class="form-span m20 f_red">* 연락처는 '-' 없이 숫자만 입력해주세요.</div>
			
			
			<button type="submit" class="btn-default">찾기</button>
			<button type="reset" class="btn-default btn-gray">취소</button>
			</div>
			
		</form>
		
	</div><!-- form-wrap -->
	
</div><!-- content -->


<script>
	$("#pwdfind_form").on("submit", function(){
		//아이디 입력칸이 비어있다면
		if($("#id").val().length<1){
			alert("아이디를 올바르게 입력해주세요");
			$("#id").focus();
			return false;
		}
		//이름 입력칸이 비어있다면
		if($("#name").val().length<1){
			alert("이름을 입력해 주세요");
			$("#name").focus();
			return false;
		}
		
		//연락처 입력칸이 비어있다면
		if($("#phone").val().length<1){
			alert("연락처를 올바르게 입력해주세요");
			$("#phone").focus();
			return false;
		}
	});
</script>
<jsp:include page="/resources/footer.jsp"></jsp:include>