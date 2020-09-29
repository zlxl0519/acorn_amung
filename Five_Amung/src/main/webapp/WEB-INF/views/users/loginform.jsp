<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/resources/header.jsp"></jsp:include>
<script>
	document.title = "로그인 "; 
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<body>
<div class="content">

<div class="form-wrap">
<h2>LOGIN</h2>

	<form id="loginForm" name="loginForm" action="${pageContext.request.contextPath	}/users/login.do" method="post" >
	<div class="form-ul-wrap users-wrap">
		<ul>
			
			<li>
				<input type="hidden" name="url" value="${url }" />
				<input type="text" name="id" id="id" value="${savedId }" placeholder="아이디" />
			</li>
			
			<li>
				<input type="password" name="pwd" id="pwd"  placeholder="비밀번호"/>
			</li>
		
		</ul>
		
				<button class="btn-default mt20" type="submit">로그인</button>
				<div class="chk-wrap">
					<input type="checkbox" name="remember" value="remember"/>로그인 상태 유지
				</div>
				
				
				<div class="a-wrap">
					<a href="${pageContext.request.contextPath	}/users/idfind_form.do">아이디 찾기</a>
					<a href="${pageContext.request.contextPath	}/users/pwdfind_form.do">비밀번호 찾기</a>
					<a href="${pageContext.request.contextPath }/users/signup_form.do">회원가입</a>
				
				</div>
				
				
		</div>
	</form>
	
</div> <!--form-wrap 종료 --> 
	
</div><!-- content 종료  -->

<script>

	$("#loginForm").on("submit", function(){
		
		if($("#id").val()==""){
			alert("아이디를 입력해주세요");
			$("#id").focus();
			return false;
		}else if($("#pwd").val()==""){
			alert("비밀번호를 입력해주세요");
			$("#pwd").focus();
			return false;
		}
	});

</script>
<jsp:include page="/resources/footer.jsp"></jsp:include>