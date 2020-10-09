<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/resources/header.jsp"></jsp:include>
<%--예약페이지

--%>
<script>
	var myApp=angular.module("myApp", ["ngRoute"]);
	myApp.controller("dogCtrl", function($scope, $http, $location){
		$scope.isCheck=true;
		$scope.checkInput=function(){
			
			if($("#dname").val()==""){
				alert("강아지 이름을 입력해 주세요");
				$("#dname").focus();
				$scope.isCheck=false;
				
			}else if($("#dage").val()==""){
				alert("강아지 나이를 입력해 주세요");
				$("#dage").focus();
				$scope.isCheck=false;
			
			}else if($("#breed").val()==""){
				alert("견종을 입력해 주세요");
				$("#breed").focus();
				$scope.isCheck=false;
				
			}else if($('input:radio[name="weight"]').is(":checked")==false){
				alert("몸무게를 선택해 주세요");
				$scope.isCheck=false;
				
			}else if($('input:radio[name="neutral"]').is(":checked")==false){
				alert("중성화 유무를 선택해 주세요");
				$scope.isCheck=false;
				
			}else if($('input:radio[name="gender"]').is(":checked")==false){
				alert("성별을 선택해 주세요");
				$scope.isCheck=false;
			}else{
				$scope.isCheck=true;	
			}
		}
		$scope.dogData={};
		$scope.insert=function(){
			if($scope.isCheck === true){
				$http({
					url:"/amung/dogs/insert.do",
					method:"post",
					params:$scope.dogData,
					headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
				}).success(function(data){
					
					$scope.isExist=data;
					
					if($scope.isExist=="true"){
						alert("이미 존재하는 강아지 정보 입니다.");
					}else{
						alert("강아지 정보가 저장되었습니다.");
					}
					//강아지 정보 저장 후 예약 폼으로 redirect
					$location.path("/reserveform");
					
				});	
			}
		}
	
	});
	myApp.controller("reserveCtrl", function($scope, $http){
		
		$http({
			url:"/amung/dogs/getList.do",
			method:"get"
		}).success(function(data){
			
			$scope.dogList=data.dogList;
		});
		//투숙기간 보이게 하는 데이터
		$scope.showed=false;
		
		//방, 체크인, 체크아웃, 강아지 선택한 데이터들
		$scope.reserveData={};
		
		//방, 체크인, 체크아웃, 강아지 선택 여부 조사
		$scope.selected={};
		$scope.isChecked=function(str){
			$scope.selected[str]=true;
			var count=0;
			for(key in $scope.selected){
				count++;
			}
			if(count==4){//방, 체크인, 체크아웃, 강아지를 다 선택했다면
				
				$http({
					url:"/amung/reserve/getPrice.do",
					method:"get",
					params:$scope.reserveData
					
				}).success(function(data){
					
					$scope.price=data.price;
				});
			}
			if($scope.selected.checkin==true && $scope.selected.checkout==true){
				$scope.showed=true;
				$http({
					url:"/amung/reserve/getTerm.do",
					method:"get",
					params:$scope.reserveData
				}).success(function(data){
					console.log(data);
					$scope.term=data.term;
					
				});
			}
		};
		
		
	});
	
	//싱글 페이지 라우터를 사용하기 위한 설정
	myApp.config(function($routeProvider){//ng-view 에 출력이된다.
		$routeProvider
		.when("/dog_form",{templateUrl:"/amung/reserve/dog_form.jsp", controller:"dogCtrl"})
		.when("/reserveform",{templateUrl:"/amung/reserve/reserveform.jsp", controller:"reserveCtrl"})
		.otherwise({redirectTo:"/reserve_home"}); //위에 다 해당되지 않았을 때는 리다일렉트로 reserve_home 출력됨
	});
</script>
<div class="content" data-ng-app="myApp">
	<div class="mini-notice">
		<h3>
			<i class="fas fa-exclamation-circle"></i>
		</h3>
		<ol>
			<li>호텔 만실 또는 촉박한 기간으로 예약 확정되지 못할 경우 자동으로 예약이 취소될 수 있습니다.</li>
			<li>예약 후 24시간 내에 입금하지 않으실 경우 자동으로 취소 처리 됩니다.</li>
			<li>입금 후 취소 시 전화나 <a href="${pageContext.request.contextPath }/qna/list.do" class="f_red">QnA</a> 게시판에 비밀글로 남겨주세요.</li>
			<li>마이페이지 내역에 강아지 정보가 없다면 강아지 정보를 입력해 주세요.</li>
		</ol>
	</div>
		<ul class="round-nav"><!-- # 은 페이지 내에서의 이동 -->
			<li onClick="location.href ='#dog_form'">
				<div>
					<i class="fas fa-paw"></i>
					<p>강아지<br/>정보 저장</p>
				</div>
			</li>
			<li onClick="location.href ='#reserveform'">
				<div>
					<i class="fas fa-calendar-alt"></i>
					<p>예약하기</p>
				</div>
			</li>
		</ul>
		<div data-ng-view></div>
</div><!--content -->

<jsp:include page="/resources/footer.jsp"></jsp:include>