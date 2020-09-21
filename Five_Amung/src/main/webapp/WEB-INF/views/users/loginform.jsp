<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="content">

<div class="form-wrap">
<h2>LOGIN</h2>

	<form id="loginForm" name="loginForm" action="${pageContext.request.contextPath	}/users/login.do" method="post" >
	<div class="form-ul-wrap users-wrap">
		<ul>
			<input type="hidden" name="url" value="${url }" />
			<li>
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
					<a href="idfind_form.jsp">아이디 찾기</a>
					<a href="pwdfind_form.jsp">비밀번호 찾기</a>
					<a href="${pageContext.request.contextPath }/signup/signup_form.jsp">회원가입</a>
				
				</div>
				
				
		</div>
	</form>
	
</div> <!--form-wrap 종료 --> 
	
</div><!-- content 종료  -->
</body>
</html>