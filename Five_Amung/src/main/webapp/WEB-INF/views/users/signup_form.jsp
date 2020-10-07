<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resources/header.jsp"%><!-- header -->
<script>
   document.title = "회원가입 페이지"; 
</script>
<%--회원가입 폼입니다.--%>
<div class="content">
<div class="form-wrap">
<h2>회원가입
<span>* 표시가 되어있는 칸은 반드시 입력하셔야 가입이 가능합니다</span>
</h2>
	<%-- 프로필사진  업로드 폼--%>
	<form action="profile_upload.do" method="post" enctype="multipart/form-data" id="profileForm">
		<div class="form-ul-wrap mb0">
		
			<ul>
				<li class="profile-wrap bbn">
				<div class="profile-box">
				<label for="image">프로필 이미지</label>
					<div class="profile-img">
						<img id="profileImage" src="${pageContext.request.contextPath }/resources/img/icon_user.png"/>
					</div>
		
						<div class="profile-btn">
							<label for="image"><i class="fas fa-images"></i></label>
							<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
						</div>
						
					</div>
					
				</li>
			</ul>
		</div>
	</form>
	
	
	
	<%-- 나머지 정보 업로드 폼 --%>
	<form action="signup.do" method="post" id="signup">
		<input type="hidden" name="profile" id="profile" />
		<div class="form-ul-wrap">
		<ul>
			<li>
				<label for="id">아이디 *</label>
				<input type="text" name="id" id="id" maxlength="30" placeholder="5자 이상 30자 이내의 영문/숫자만 입력 가능합니다."/>
				
				<button id="checkBtn">중복확인</button>
				<div id="idAlert" class="form-span">* 아이디는 5자 이상 30자 이내의 영문/숫자만 입력 가능합니다.</div>
				<span id="checkResult" class="form-span"></span>
				<span class="form-span">* 입력하신 아이디의 중복확인을 해주세요.</span>
			</li>
			<li>
				<label for="pwd">비밀번호 *</label>
				<input type="password" name="pwd" id="pwd" maxlength="16" placeholder="영문/숫자/특수문자 조합 8~16자리"/>
				<div id="pwdAlert" class="form-span">* 비밀번호는 8자 이상 16자리 이하의 영문/숫자/특수문자<br/>
													&nbsp;&nbsp;&nbsp;~!@#$%^&* 만 사용이 가능합니다.</div>
			</li>
			<li>
				<label for="pwd2">비밀번호 확인 *</label>
				<input type="password" name="pwd2" id="pwd2" maxlength="16" placeholder="비밀번호 입력 확인"/>
				<div class="alert alert-success form-span f_blue" id="alert-success">* 비밀번호가 일치합니다.</div>
				<div class="alert alert-danger form-span f_red" id="alert-danger">* 비밀번호가 일치하지 않습니다.</div>
			</li>
			<li>
				<label for="email">이메일 *</label>
				<input type="text" name="email01" id="email01" />
				<span>&nbsp;&nbsp;@</span>
	            <input type="text" id="email02" name="email02" list="domains" placeholder="도메인입력/선택" />
	            <datalist id="domains">
	                <option value="naver.com">
	                <option value="daum.net">
	                <option value="gmail.com">
	                <option value="yahoo.co.kr">
	            </datalist>
			</li>
			<li>
				<label for="name">이름 *</label>
				<input type="text" name="name" id="name" />
			</li>
			<li>
				<label for="phone">연락처*</label>
				<input type="tel" name="phone" id="phone" placeholder="-없이 번호만 입력해주세요"/>
				<div id="phoneAlert" class="form-span">* 연락처는 '-' 없이 숫자만 입력해주세요.</div>
			
			</li>
		</ul>
			
		</div>
		<button type="submit" id="submit" class="btn-default">회원가입 하기</button>
	</form>
	</div>
	</div><!-- content 종료  -->
	
	
	<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
	<script>
	
	//========= form 에 submit 이벤트가 일어 났을때 프로필 사진을 ajax 로 제출 하도록  ====================
	$("#profileForm").ajaxForm(function(data){
		//프로필 이미지를 업데이트 한다.
		$("#profileImage").attr("src", "${pageContext.request.contextPath }"+data.imageSrc);
		//회원정보 수정폼 전송될 때 같이 전송되도록 한다.
		$("#profile").val(data.imageSrc);
	});
	//이미지 파일을 선택했을때 change 이벤트가 일어난다.
	$("#image").on("change", function(){
		$("#profileForm").submit();//폼 강제 제출
	});
		
	
	//=========== 아이디 중복 확인 =======================
	var isChecked = false;
	
	$("#checkBtn").on("click", function(){
		
		var inputId = $("#id").val();
		isChecked = true;
		
		$.ajax({
			url : "checkid.do",
			method : "get",
			data : "inputId="+inputId,
			success : function(data){
				if(data.isExist || !canUseId2){
					$("#checkResult").text("* 사용이 불가한 아이디입니다.").css("color", "red");
					canUseId=false;
				}else{
					$("#checkResult").text("* 사용 가능한 아이디입니다.").css("color","green");
					canUseId=true;
				}
			}
		}); 
		return false;
	});
	
	$("#signup").on("submit", function(){
		if(!canUseId){
			alert("아이디 중복을 확인하세요");
			return false;
		}
	})
		
		
	//=========아이디 영문/숫자 제한==============
		var enNumCheck = RegExp(/[^A-Za-z0-9]$/);
		$("#idAlert").hide();
		$("#id").keyup(function(){
			if(enNumCheck.test($("#id").val()) || $("#id").val().length < 5){
				$("#idAlert").show();
				$("#submit").attr("disabled", true);
				canUseId2 = false;
			}else{
				$("#idAlert").hide();
				$("#submit").removeAttr("disabled");
				 canUseId2 = true;
			}
		})
		
		
	var canUse = false;
	//==========  비밀번호 재확인 일치불일치 =============
		$("#alert-success").hide();
		$("#alert-danger").hide();
		
		$("#signup").keyup(function(){
			var pwd1 = $("#pwd").val();
			var pwd2 = $("#pwd2").val();
			if(pwd1!="" || pwd2!=""){
				if(pwd1==pwd2){
					$("#alert-sucess").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
					 canUse = true;
				}else{
					$("#alert-success").hide(); 
					$("#alert-danger").show();
					$("#submit").attr("disabled", true);
					 canUse = false;
				}
			}
		})
		
		
	//=========비밀번호 영문/숫자/특수문자 제한===========
		var pattern1 = /[0-9]/;
		var pattern2 = /[a-zA-Z]/;
		var pattern3 = /[~!@#$%^&*]/; 
		$("#pwdAlert").hide();
		$("#pwd").keyup(function(){
			if(!pattern1.test($("#pwd").val())||!pattern2.test($("#pwd").val())
					||!pattern3.test($("#pwd").val())||$("#pwd").val().length<8){
				$("#pwdAlert").show();
				$("#submit").attr("disabled", true);
				 canUse = false;
			}else{
				$("#pwdAlert").hide();
				$("#submit").removeAttr("disabled");
				 canUse = true;
			}
		})
		
		
	//=========연락처 숫자 제한===========
		var numCheck = RegExp(/^[0-9]*$/);
		$("#phoneAlert").hide();
		$("#phone").keyup(function(){
			if(!numCheck.test($("#phone").val())){
				$("#phoneAlert").show();
				$("#submit").atter("disabled", true);
			}else{
				$("#phoneAlert").hide();
				$("#submit").removeAttr("disabled");
				 canUse = true; 
			}
		})
		
		//=========기타...등등===========
			
		$("#submit").on("click", function(){
			if($("#id").val() == "" || $("#id").val().length <5){
				alert("아이디를 5자 이상 쓰세요")
				$("#id").focus();
				return false;
			}else if(!isChecked){
				alert("아이디 중복확인을 해주세요")
				$("#id").focus();
				return false;
			}else if($("#pwd").val() == "" || $("#pwd").val() != $("#pwd2").val()){
				alert("비밀번호를 확인하세요.")
				$("#pwd").focus();
				return false;
			}else if($("#pwd").val().length < 8){
				alert("비밀번호는 8자 이상 16자리 이하의 영문/숫자/특수문자 ~!@#$%^&* 만 사용가능합니다.")
				$("#pwd").focus();
				return false;
			}else if(!pattern1.test($("#pwd").val())||!pattern2.test($("#pwd").val())||!pattern3.test($("#pwd").val())){
				alert("비밀번호는 8자 이상 16자리 이하의 영문/숫자/특수문자 ~!@#$%^&* 만 사용가능합니다.")
				$("#pwd").focus();
				return false;
			}else if($("#email01").val() == "" || $("#email02").val() == ""){
				alert("이메일을 확인하세요")
				$("#email").focus();
				return false;
			}else if($("#phone").val() == "" || $("#phone").val().length < 9 || !numCheck.test($("#phone").val())){
				alert("연락처를 확인하세요")
				$("#phone").focus();
				return false;
			}else if($("#name").val() == ""){
				alert("이름을 확인하세요")
				$("#name").focus();
			}else if($("#name").val().length > 13){
				alert("본명을 작성해주세요");
				$("#name").focus();
				return false;
			}else if(!canUse){
				alert("잘못입력하신 가입란이 있습니다. 다시 확인해주세요.")
				return false;
			}
		})
	</script>


<%--
   자바스크립트 정규식에서 자주 사용되는 메소드 search(), test(), replace()
   1. search(); == 전체 문장에서 찾고자 하는 문자열이 몇 번째에 위치해있는지 알려준다.
      용례) var string = "Please visit myWeb!";
          var position = string.search("myWeb");
          console.log(position);
          -->  result : 13
   
   2. test(); == 문장 안에 찾으려는 문자가 들어있으면, 결과는 "true"이다.
      용례) var string = "Please visit myWeb!";
          var reg = /my/;
          var testing = reg.test(string);
          console.log(testing);
          --> result : true
          
   3. replace(); == 문자열의 일부를 다른 문자열로 바꿀 때 사용한다.
      용례) var string = "Please visit myWeb!";
          var change = string.replace("myWeb", "Naver");
          console.log(change);
          --> result : Please visit Naver!
 --%>
<%@include file="/resources/footer.jsp"%><!-- footer -->