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
		<form id="pwdupdate" action="update.do" method="post">
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
						id="newPwd2"
						placeholder="변경할 비밀번호를 확인해주세요!"
						/>
					</li>
				</ul>
				<p class="alert alert-success form-span f_blue m0 mt20"
					id="alert-success">
					* 변경할 비밀번호가 일치합니다.
				</p>
				<p class="alert alert-danger form-span f_red m0 mt20"
				id="alert-danger">
					* 변경할 비밀번호가 일치하지 않습니다.
				</p>
				<p class="form-span m20 f_red">
					* 비밀번호는 8자 이상 16자리 이하의 영문/숫자/특수문자<br/>
					&nbsp;&nbsp;[ ~!@#$%^&* ]만 사용이 가능합니다.
				</p>
			
				<button type="submit" id="submit" class="btn-default">
					비밀번호 수정
				</button>
				<button type="reset" class="btn-default btn-gray">
					취소
				</button>
			</div>
			
		</form>
		
	</div><!-- form-wrap -->
	
</div><!-- content -->
<script>

	var canUse = false;
	//==========  비밀번호 재확인 일치불일치 =============
	$("#alert-success").hide();
	$("#alert-danger").hide();
	
	$("#pwdupdate").keyup(function(){
		var pwd1 = $("#newPwd").val();
		var pwd2 = $("#newPwd2").val();
		if(pwd1!="" || pwd2!=""){
			if(pwd1==pwd2){
				$("#alert-success").show();
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
	});
	
	
	//=========비밀번호 영문/숫자/특수문자 제한===========
	var pattern1 = /[0-9]/;
	var pattern2 = /[a-zA-Z]/;
	var pattern3 = /[~!@#$%^&*]/; 
	$("#pwd").keyup(function(){
		if(!pattern1.test($("#newPwd").val())||!pattern2.test($("#newPwd").val())
				||!pattern3.test($("#newPwd").val())||$("#newPwd").val().length<8){
			$("#submit").attr("disabled", true);
			 canUse = false;
		}else{
			$("#submit").removeAttr("disabled");
			 canUse = true;
		}
	});
	
	$("#submit").on("click", function(){
		if($("#pwd").val()==""){
			alert("기존 비밀번호를 입력해주세요.");
			return false;
		}else if($("#newPwd").val() == "" || $("#newPwd").val() != $("#newPwd2").val()){
			alert("비밀번호를 확인하세요.")
			$("#newPwd").focus();
			return false;
		}else if($("#newPwd").val().length < 8){
			alert("특수문자는 8자 이상 16자리 이하의 영문/숫자/특수문자 ~!@#$%^&* 만 사용가능합니다.")
			$("#newPwd").focus();
			return false;
		}else if(!pattern1.test($("#newPwd").val())||!pattern2.test($("#newPwd").val())||!pattern3.test($("#newPwd").val())){
			alert("특수문자는 8자 이상 16자리 이하의 영문/숫자/특수문자 ~!@#$%^&* 만 사용가능합니다.")
			$("#newPwd").focus();
			return false;
		}
	})
</script>
<%@include file="/../resources/footer.jsp"%><!-- footer -->