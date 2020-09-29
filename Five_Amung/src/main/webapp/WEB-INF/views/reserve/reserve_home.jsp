<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/resources/header.jsp"></jsp:include>
<%--예약페이지

--%>
<script>
	var myApp=angular.module("myApp", ["ngRoute"]);
	myApp.controller("dogCtrl", function($scope, $http, $location){
		
		$scope.isSuccess=false;
		$scope.dogData={};
		$scope.send=function(){
			$http({
				url:"/amung/dogs/insert.do",
				method:"post",
				params:$scope.dogData,
				headers:{"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"}
			}).success(function(data){
				$scope.isSuccess=true;
				
				if($scope.isSuccess){
					alert("강아지 정보가 저장되었습니다.");
				}else{
					alert("강아지 정보 저장에 실패했습니다.");
				}
				//강아지 정보 저장 후 예약 폼으로 redirect
				$location.path("/reserveform");
				
			});
		}
	
	});
	myApp.controller("reserveCtrl", function($scope, $http){
		
		$http({
			url:"/amung/dogs/getList.do",
			method:"get"
		}).success(function(data){
			
			$scope.dogList=data.dogList;
		});
		
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
	<div class="form-wrap">
		<h1>예약 페이지 입니다.</h1>
		<p>
			강아지 정보가 없을 시 예약하지 못합니다.
			강아지 정보를 먼저 입력해주세요!!
		</p>
		<ul class="nav"><!-- # 은 페이지 내에서의 이동 -->
			<li><a href="#dog_form">강아지 정보 저장</a></li>
			<li><a href="#reserveform">예약하기</a></li>
		</ul>
		<div data-ng-view></div>
	</div><!-- form-wrap -->
</div><!--content -->

<script>
	//연락처 입력칸에 번호만 입력되도록한다. 
	$("#phone2").on("keyup", function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
		
	//반려견이름, 반려견종, 반려견나이, 체크인, 체크아웃 입력 안했을시 폼전송 막기
	$("#reserveForm").on("submit", function(){
		if($("#dogName").val()==""){
			alert("반려견 이름을 입력해주세요");
			$("#dogName").focus();
			return false;
		
		}else if($("#dogBreed").val()==""){
			alert("반려견종을 입력해주세요");
			$("#dogBreed").focus();
			return false;
		
		}else if($("#dogAge").val()==""){
			alert("반려견 나이를 입력해주세요");
			$("#dogAge").focus();
			return false;
		
		}else if($("#checkin").val()==""){
			alert("체크인 날짜를 입력해주세요");
			$("#checkin").focus();
			return false;
		
		}else if($("#checkout").val()==""){
			alert("체크아웃 날짜를 입력해주세요");
			$("#checkout").focus();
			return false;
		}
	});

	$(function(){
		$("#checkin").datepicker({
			minDate:0, //오늘포함한 이후 날짜만 활성화
			dateFormat: 'yy-mm-dd',//yyyy-mm-dd 모양으로 바꿈
			dayNamesMin:['일','월','화','수','목','금','토'],//달력의 요일 부분 텍스트
			changeYear:true, // 달력 년도 select 박스로 선택하게 하기
			changeMonth:true, // 달력 월 select 박스로 선택하게 하기
			showOn:"both", //버튼클릭하거나 포커스가 가면 달력이 나온다.
			buttonImage:"${pageContext.request.contextPath }/resources/img/icon_cal.png",
			buttonImageOnly:true,
			buttonText:"날짜 선택",
			onClose: function(selectedDate){
				//체크인 datepicker 가 닫힐때
				//체크아웃의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
				$("#checkout").datepicker("option", "minDate", selectedDate);
			}
		});
		
		$("#checkout").datepicker({
			minDate:0, //오늘포함한 이후 날짜만 활성화
			dateFormat: 'yy-mm-dd',//yyyy-mm-dd 모양으로 바꿈
			dayNamesMin:['일','월','화','수','목','금','토'],//달력의 요일 부분 텍스트
			changeYear:true, // 달력 년도 select 박스로 선택하게 하기
			changeMonth:true, // 달력 월 select 박스로 선택하게 하기
			showOn:"both", //버튼클릭하거나 포커스가 가면 달력이 나온다.
			buttonImage:"${pageContext.request.contextPath }/resources/img/icon_cal.png",
			buttonImageOnly:true,
			buttonText:"날짜 선택"	,
			onClose: function(selectedDate){
				//체크아웃 datepicker 가 닫힐때
				//체크인 의 선택할수 있는 최대 날짜(maxDate)를 선택한 시작일로 지정
				$("#checkin").datepicker("option","maxDate",selectedDate);
			}
		});
		

	});
	
</script>
<jsp:include page="/resources/footer.jsp"></jsp:include>