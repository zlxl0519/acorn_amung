package com.five.amung.reserve.controller;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.five.amung.dogs.dto.DogsDto;
import com.five.amung.dogs.service.DogsService;
import com.five.amung.reserve.dto.ReserveDto;
import com.five.amung.reserve.dto.RoomDto;
import com.five.amung.reserve.dto.RoomPriceDto;
import com.five.amung.reserve.service.ReserveService;

@Controller
public class ReserveController {
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private DogsService dogsService;
	
	@RequestMapping("/reserve/reserve_home")
	public ModelAndView reserveform(ModelAndView mView) {
		
		mView.setViewName("reserve/reserve_home");
		return mView;
	}
	
	@RequestMapping(value = "/reserve/getPrice", method=RequestMethod.GET)
	@ResponseBody
	//방, 체크인 , 체크아웃, 강아지 몸무게 에 따른 가격 불러오기
	public Map<String, Object> getPrice(RoomPriceDto dto){
		//1. 강아지 번호로 강아지 몸무게를 얻어와서 dto 에 담는다.
		int num=dto.getDog_num();
		DogsDto dogDto=dogsService.getData(num);
		String weight=dogDto.getWeight();
		dto.setWeight(weight);
		//2. 전송된 값을 이용해서 서비스에서 가격을 담아온다.
		Map<String, Object> map=reserveService.getPrice(dto);
		
		return map;
	}
	
	@RequestMapping(value = "/reserve/getTerm", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getTerm(RoomPriceDto dto){
		Map<String, Object> map=reserveService.getTerm(dto);
		return map;
	}

	@RequestMapping("/reserve/reserve")
	public ModelAndView reserve(ModelAndView mView, ReserveDto dto, RoomPriceDto roomDto, HttpServletRequest request) {
		int num=dto.getDog_num();
		DogsDto dogDto=dogsService.getData(num);
		String weight=dogDto.getWeight();
		roomDto.setWeight(weight);
		//1. 방이름, 강아지 몸무게에 해당되는 방 번호를 불러온다.(dto 에 담는다.)
		int room_num=reserveService.getRoomNum(roomDto);
		dto.setRoom_num(room_num);
		
		//방 예약 현황을 바꾸고 예약 DB 저장하기 (성공여부 담아서출력)
		reserveService.reserve(request, dto);
		
		//4. 예약정보 DB 에서 예약한 사항을 가져온다(예약자 아이디, 강아지번호, 방번호 로)
		ReserveDto getDto=reserveService.getData(dto);
		
		//5. 방번호로 방 정보 가져오기
		RoomDto getRoomDto=reserveService.getRoomData(room_num);
		mView.addObject("roomDto", getRoomDto);
		mView.addObject("reserveDto", getDto);
		mView.setViewName("reserve/reserve");
		return mView;
	}
	
	// 리연 추가 - 20200923 일단 페이지만 추가함
	// 마이페이지 / 예약현황
	@RequestMapping("/mypage/private/reserve/status")
	public ModelAndView reserveStatus(HttpServletRequest request, ModelAndView mView) {
		mView.setViewName("mypage/reserve_status");
		return mView;
	}//==== reserveStatus ====
}//======== ReServeController ========