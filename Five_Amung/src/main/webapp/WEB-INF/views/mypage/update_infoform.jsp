<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<script>
	document.title = "Amung'myPage : info"; 
	history.replaceState({}, null, location.pathname);
</script>
<div class="content">
	<div class="form-wrap">
		<%-- 프로필사진  업로드 폼--%>
		<form action="${pageContext.request.contextPath }/users/profile_upload.do"
				method="post"
				id="profileForm"
				enctype="multipart/form-data">
			<div class="form-ul-wrap mb0">
				<ul>
					<li class="profile-wrap bbn">
						<div class="profile-box">
							<label for="image">프로필 이미지</label>
							<div class="profile-img">
								<c:choose>
									<c:when test="${empty dto.profile }">
										<img id="profileImage"
											src="${pageContext.request.contextPath }/resources/img/icon_user.png" />
									</c:when>
									<c:otherwise>
										<img id="profileImage"
											src="${pageContext.request.contextPath }${dto.profile}" />
									</c:otherwise>
								</c:choose>
							</div><!-- profile-img -->
							
								<div class="profile-btn">
									<label for="image"><i class="fas fa-images"></i></label>
									<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
								</div>
								
						</div><!-- Profile-box -->
					</li><!-- profile-wrap -->
				</ul>
			</div><!-- form-ul-wrap -->
		</form>

		<form action="update.jsp" method="post" id="signup">
			<input type="hidden" name="profile" id="profile" value="${dto.profile }"/>
			<div class="form-ul-wrap">
				<ul>
					
					<li>
						<label for="id">아이디</label>
						<input type="text" name="id" id="id" maxlength="30" value="${dto.id }" disabled/>
						<span class="form-span">* 아이디는 변경이 불가합니다.</span>
					</li>
					<li>
						<label for="pwd">비밀번호</label>
							<a href="" class="btn-pwd">비밀번호 변경</a>
					</li>
					<li class="updateform">
						<label for="email">이메일</label>
						<input type="text" name="email01" id="email01" value="" />
						<span>&nbsp;&nbsp;@</span>
						<input type="text" id="email02" name="email02" list="domains" placeholder="도메인입력/선택" value="" />
							<select id="domains" name="email02">
								<option value="">직접선택</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="kakao.com">kakao.com</option>
							</select>
					</li>
					<li>
						<label for="name">성함</label>
						<input type="text" name="name" id="name" value="${dto.name }"/>
					</li>
					<li>
						<label for="phone">연락처</label>
						<input type="tel" name="phone" id="phone" placeholder="-없이 번호만 입력해주세요"  value="${dto.phone }" />
						<div id="phoneAlert" class="form-span">* 연락처는 '-' 없이 숫자만 입력해주세요.</div>
					
					</li>
				</ul>
			</div>
		</form>
	</div><!-- form-wrap -->
	<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
	<script>
	//========= form 에 submit 이벤트가 일어 났을때 프로필 사진을 ajax 로 제출 하도록  ====================
	$("#profileForm").ajaxForm(function(data){
		//프로필 이미지를 업데이트 한다.
		$("#profileImage").attr("src", "${pageContext.request.contextPath }"+data.imageSrc);
		console.log("이미지 안바끼냐--");
		//회원정보 수정폼 전송될 때 같이 전송되도록 한다.
		$("#profile").val(data.imageSrc);
	});
	//이미지 파일을 선택했을때 change 이벤트가 일어난다.
	$("#image").on("change", function(){
		$("#profileForm").submit();//폼 강제 제출
	});
	</script>
</div><!-- content -->
<%@include file="/../resources/footer.jsp"%><!-- footer -->