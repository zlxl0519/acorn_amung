<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/resources/header.jsp"></jsp:include>
<%--예약페이지

--%>
<script>
	var myApp=angular.module("myApp", []);
	myApp.controller("dogCtrl", function($scope, $http){
		$http({
			url:"/amung/dogs/getList.do",
			method:"get"
		}).success(function(data){
			
			$scope.dogList=data.dogList;
		});
		
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
				});
		}
		
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
		};
	
	});
</script>
<div class="content" data-ng-app="myApp">
<div data-ng-controller="dogCtrl">
<p>강아지 정보</p>
<form ng-submit="send()">
	<div class="form-ul-wrap">
	<ul>
		<li>
			<label for="dname">이름</label>
			<input data-ng-model="dogData.dname" type="text" name="dname" id="dname" placeholder="반려견의 이름을 작성해주세요" />
		</li>
		<li>
			<label for="dage">나이</label>
			<input data-ng-model="dogData.dage" type="number" name="dage" id="dage" value="0"/><span>&nbsp;살</span>
		</li>
		<li>
			<label for="breed">견종</label>
			<input data-ng-model="dogData.breed" type="text" name="breed" id="breed" placeholder="견종을 작성해주세요"/>
		</li>
		<li>
			<fieldset>
				<legend>몸무게</legend>
				<input data-ng-model="dogData.weight"  type="radio" name="weight" value="3" />3kg 이하
				<input data-ng-model="dogData.weight" type="radio" name="weight" value="6" />4kg~6kg
				<input data-ng-model="dogData.weight" type="radio" name="weight" value="9" />7kg~9kg
				<input data-ng-model="dogData.weight" type="radio" name="weight" value="10" />10kg~
			</fieldset>
		</li>
		<li>
			<fieldset>
				<legend>중성화 유무</legend>
				<input data-ng-model="dogData.neutral" type="radio" name="neutral" value="yes" checked/> 유
				<input data-ng-model="dogData.neutral" type="radio" name="neutral" value="no" /> 무
			</fieldset>	
		</li>
		<li>
		
		<fieldset>
			<legend>성별선택</legend>
			<input data-ng-model="dogData.gender" type="radio" name="gender" value="male" checked/> 남아
			<input data-ng-model="dogData.gender" type="radio" name="gender" value="female" /> 여아
		</fieldset>
		</li>
		<li>
			<label for="etc">기타사항</label>
			<textarea data-ng-model="dogData.etc" name="etc" id="etc" cols="60" rows="10" placeholder="반려견 호텔링 시, 요청사항이나 주의해야하는 사항을 적어주세요"></textarea>
		</li>
	</ul>
	</div>
	<p>* 강아지 정보를 꼭 저장해주세요!!</p>
	<button type="submit">강아지 정보 저장</button>
</form>

<form action="reserve.do" method="post">

	<p>*예약하실 룸을 먼저 선택해주세요.</p>
	<ul class="room_check">
		<li>
			<label for="standad">
				<input
					data-ng-change="isChecked('room')"
					data-ng-model="reserveData.room_name"
					type="radio" 
					value="standard"
					name="standard"
					id="room"/>
			</label>
		</li>
		<li>
			<label for="deluxe">
				<input
					data-ng-change="isChecked('room')"
					data-ng-model="reserveData.room_name"
					type="radio" 
					value="deluxe"
					name="deluxe"
					id="room"/>
			</label>
		</li>
		<li>
			<label for="premium">
			프리미엄
				<img src="http://www.bowraum.com/images/v6/services/01_hotel/A3.jpg" alt="premium"/>
				<input
					data-ng-change="isChecked('room')"
					data-ng-model="reserveData.room_name"
					type="radio" 
					value="premium"
					name="premium"
					id="room"/>
			</label>
		</li>
	</ul>
	
	<dl>
		<dt>숙박기간</dt>
		<dd>
			<input data-ng-change="isChecked('checkin')" data-ng-model="reserveData.checkin_date" 
				type="text" name="checkin" id="checkin" placeholder="입실" 
				onfocus="this.placeholder=''" onblur="this.placeholder='YYYY/MM/DD'"/>
		</dd>
		<dd>
			<input data-ng-change="isChecked('checkout')" data-ng-model="reserveData.checkout_date" 
				type="text" name="checkout" id="checkout" placeholder="퇴실" 
				onfocus="this.placeholder=''" onblur="this.placeholder='YYYY/MM/DD'" />
		</dd>
	</dl>
	<dl>
		<dt>입실시간</dt>
		<dd>
			<select data-ng-model="reserveData.start_time" name="start_time" id="start_time">
				<option value="">[옵션]시간을 선택해주세요.</option>
				<option value="10">10시</option>
				<option value="11">11시</option>
				<option value="12">12시</option>
				<option value="13">13시</option>
				<option value="14">14시</option>
				<option value="15">15시</option>
				<option value="16">16시</option>
				<option value="17">17시</option>
				<option value="18">18시</option>
				<option value="19">19시</option>
				<option value="20">20시</option>
				<option value="21">21시</option>
			</select>
		</dd>
	</dl>
	<dl>
		<dt>퇴실시간</dt>
		<dd>
			<select data-ng-model="reserveData.end_time" name="end_time" id="end_time">
				<option value="">[옵션]시간을 선택해주세요.</option>
				<option value="10">10시</option>
				<option value="11">11시</option>
				<option value="12">12시</option>
				<option value="13">13시</option>
				<option value="14">14시</option>
				<option value="15">15시</option>
				<option value="16">16시</option>
				<option value="17">17시</option>
				<option value="18">18시</option>
				<option value="19">19시</option>
				<option value="20">20시</option>
				<option value="21">21시</option>
			</select>
		</dd>
	</dl>
	<table>
		<tr>
			<th>투숙기간</th>
			<td></td>
		</tr>
		
		<tr data-ng-repeat="tmp in dogList">
			<th>투숙 강아지 선택</th>
			<td>
				{{tmp.dname}}
				<input data-ng-change="isChecked('dog')" id="dog" 
					data-ng-model="reserveData.dog_num" type="radio" name="dog" value="{{tmp.num}}" />
			</td>
		</tr>
		<tr>
			<th>총 금액</th>
			<td><input type="hidden" name="price" ng-value="price" />{{price}}원</td>
		</tr>
		<tr>
			<th>예약자명</th>
			<td>
				<input type="text" name="name" id="name"/>
			</td>
		</tr>
		<tr>
			<th>휴대폰 번호</th>
			<td>
				<input type="text" name="phone" id="phone" />
			</td>
		</tr>
	</table>
	
	<button type="submit">예약하기</button>
</form>
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