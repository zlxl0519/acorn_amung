<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
<script>
	document.title = "Amung'info";
	//myApp이라는 모듈 만들기
	var myApp=angular.module("myApp", []);
	//formCtrl 이라는 컨트롤러 만들기
	myApp.controller("formCtrl", function($scope, $http){//angularjs가 초기화 될 때 최초 한번만 호출된다.
		
		//비밀번호 입력란을 입력했을 때 호출되는 함수
		//$scope.isnewPwdEqual=true;
		$scope.pwdChanged=function(){
			//비밀번호를 같게 입력 했는지 여부를 모델로 관리
			$scope.myForm.newPwd.$valid=$scope.newPwd==$scope.newPwd2;//같은지
			$scope.myForm.newPwd.$invalid=$scope.newPwd!=$scope.newPwd2;//다른지
			$scope.myForm.newPwd2.$valid=$scope.newPwd==$scope.newPwd2;//같은지
			$scope.myForm.newPwd2.$invalid=$scope.newPwd!=$scope.newPwd2;//다른지
		}//newPwdChanged
	});//myApp.controller 종료
</script>
<div class="content" ng-app="myApp">
<div class="newPwdfind form-wrap" ng-controller="formCtrl">
		<div class="find-tab">
			<a href="newPwdfind_form.do" style="width:100%;" class="active bbn" >비밀번호 변경</a>
		</div>
		 
		 <div class="icon-wrap">
			<i class="fas fa-key"></i>
		 	<p class="form-span m0">
		 	가입 당시 입력한 비밀번호 확인 후 비밀번호를 변경해주세요.
		 	</p>
		 </div>
		<form action="find.do" id="myForm" name="myForm" method="post" novalidate>
			<div class="form-ul-wrap users-wrap users-find-wrap">
				<ul>
					<li>
						<input type="password" name="pwd" id="pwd" placeholder="현재 비밀번호를 입력해주세요" />
					</li>
					<li>
						<input type="password" name="newnewPwd" id="newnewPwd" placeholder="변경할 비밀번호"
							   ng-model="newnewPwd"
							   ng-required="true"
							   ng-minlength="7"
							   ng-maxlength="17"
							   ng-change="pwdChanged()"
						/>
				<div class="invalid-feedback">하단의 비밀번호를 확인해주세요!</div>
					</li>
					<li>
						<input type="password" name="newPwd2" id="newnewPwd2" placeholder="변경할 비밀번호 확인"
					   ng-model="newnewPwd2"
					   ng-required="true"
					   ng-minlength="7"
					   ng-maxlength="17"
					   ng-class="{'is-invalid':myForm.newPwd2.$invalid && myForm.newPwd2.$dirty,
					   			  'is-valid':myForm.newPwd2.$valid}"
					   ng-change="pwdChanged()"
						/>
					</li>
				</ul>
				
				<div class="form-span m20 f_red">
				* 비밀번호는 8자 이상 16자리 이하의 영문/숫자/특수문자<br/>
				&nbsp;&nbsp;[ ~!@#$%^&* ]만 사용이 가능합니다.</div>
			
			
			<button type="submit" class="btn-default">비밀번호 수정</button>
			<button type="reset" class="btn-default btn-gray">취소</button>
			</div>
			
		</form>
		
	</div><!-- form-wrap -->
	
</div><!-- content -->
<%@include file="/../resources/footer.jsp"%><!-- footer -->