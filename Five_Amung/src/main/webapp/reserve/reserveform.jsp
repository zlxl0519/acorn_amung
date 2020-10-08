<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form action="${pageContext.request.contextPath }/mypage/private/reserve/status.do" method="post" id="reserveForm">
	<div class="left room-h4">
		<h4>* 예약하실 룸을 먼저 선택해주세요.</h4>
	</div>
	<ul class="room_check" ng-switch="reserveData.room_name">
		<li>
			<span ng-switch-when="standard" class="room-cover"></span>
			<img src="http://www.bowraum.com/images/v6/services/01_hotel/A1.jpg" />
			<div class="room-radio">
				<input
					data-ng-change="isChecked('room')"
					data-ng-model="reserveData.room_name"
					type="radio" 
					value="standard"
					name="room_name"
					id="standard"
					/>
				<label for="standard"></label>
				<h3>Standard<br/>Room</h3>
			</div>
		</li>
		<li>
			<span ng-switch-when="deluxe" class="room-cover"></span>
			<img src="http://www.bowraum.com/images/v6/services/01_hotel/A2.jpg" />
			<div class="room-radio">
				<input 
					data-ng-change="isChecked('room')"
					data-ng-model="reserveData.room_name"
					type="radio" 
					value="deluxe"
					name="room_name"
					id="deluxe"
					/>
				<label for="deluxe"></label>
				<h3>Deluxe<br/>Room</h3>
			</div>
			
		</li>
		<li>
			<span ng-switch-when="premium" class="room-cover"></span>
			<img src="http://www.bowraum.com/images/v6/services/01_hotel/A3.jpg" />
			<div class="room-radio">
				<input 
					data-ng-change="isChecked('room')"
					data-ng-model="reserveData.room_name"
					type="radio" 
					value="premium"
					name="room_name"
					id="premium"
					/>
				<label for="premium"></label>
				<h3>Premium<br/>Room</h3>
			</div>
		</li>
	</ul>
	<div class="reserve-container">
		<div class="reserve-box1">
			<dl>
				<dt>숙박기간</dt>
				<dd>
					<input data-ng-change="isChecked('checkin')" data-ng-model="reserveData.checkin_date" 
						type="text" name="checkin_date" id="checkin" placeholder="입실" 
						onfocus="this.placeholder=''" onblur="this.placeholder='YYYY/MM/DD'"/>
				</dd>
				<dd>
					<input data-ng-change="isChecked('checkout')" data-ng-model="reserveData.checkout_date" 
						type="text" name="checkout_date" id="checkout" class="ml10" placeholder="퇴실" 
						onfocus="this.placeholder=''" onblur="this.placeholder='YYYY/MM/DD'" />
				</dd>
			</dl>
		</div>
		<div class="reserve-box2">
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
			<dl class="ml10">
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
		</div>
		
		<div class="reserve-box3">
			<h5>
			투숙기간 : 
			<strong data-ng-show="showed">
			 [  {{ term }} 일 ] {{reserveData.checkin_date}}~{{reserveData.checkout_date}}
			</strong>
			</h5>
			<h5>
				<input type="hidden" name="room_price" value="{{price}}" />
				총 금액 : <strong>{{price}}</strong>원
			</h5>
			<ul>
				<li>
					<label for="name">예약자 명: </label>
					<input type="text" name="name" id="name"/>
					
				</li>
				<li>
					<label for="phone">휴대폰 번호 : </label>
					<input type="text" name="phone" id="phone" />
				</li>
	
			</ul>
			<h6>
				결제는 계좌이체로 부탁드립니다.(예약명과 계좌이름이 동일해야 합니다.)<br/>
				<strong>우리은행 xxxx-xxx-xxxx	 홍길동</strong>
			</h6>
		</div>
			<dl class="dogs-select">
				<dt>투숙 강아지 선택</dt>
				<dd data-ng-repeat="tmp in dogList">
						<input data-ng-change="isChecked('dog')" 
							data-ng-model="reserveData.dog_num"
							type="radio"
							name="dog_num"
							value="{{tmp.num}}" />
						{{tmp.dname}}
				</dd>
			</dl>
	</div>
	<div class="leftf mt20 ml20">
		<button type="submit">예약하기</button>
	</div>
	
</form>


<script>
	//연락처 입력칸에 번호만 입력되도록한다. 
	$("#phone").on("keyup", function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
		
	//방선택, 체크인날짜, 체크아웃 날짜, 입실시간, 퇴실시간, 투숙 강아지 선택, 예약자명, 휴대폰 번호 입력 안했을시 폼전송 막기
	$("#reserveForm").on("submit", function(){
		if($('input:radio[name="room_name"]').is(":checked")==false){
			alert("방을 선택해 주세요");
			return false;
			
		}else if($("#checkin").val()==""){
			alert("체크인 날짜를 입력해주세요");
			$("#checkin").focus();
			return false;
		
		}else if($("#checkout").val()==""){
			alert("체크아웃 날짜를 입력해주세요");
			$("#checkout").focus();
			return false;
			
		}else if($("#start_time").val()==""){
			alert("입실시간을 선택해 주세요");
			$("#start_time").focus();
			return false;
			
		}else if($("#end_time").val()==""){
			alert("퇴실시간을 선택해 주세요");
			$("#end_time").focus();
			return false;
		}else if($('input:radio[name="dog_num"]').is(":checked")==false){
			alert("투숙 강아지를 선택해 주세요");
			return false;
			
		}else if($("#name").val()==""){
			alert("예약자명을 입력해 주세요");
			$("#name").focus();
			return false;
			
		}else if($("#phone").val()==""){
			alert("휴대폰 번호를 입력해 주세요");
			$("#phone").focus();
			return false;
		}
		
	});

	$(function(){
		$("#checkin").datepicker({
			minDate:0, //오늘포함한 이후 날짜만 활성화
			dateFormat: 'yy-mm-dd',//yyyy-mm-dd 모양으로 바꿈
			dayNamesMin:['일','월','화','수','목','금','토'],//달력의 요일 부분 텍스트
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
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
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
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
