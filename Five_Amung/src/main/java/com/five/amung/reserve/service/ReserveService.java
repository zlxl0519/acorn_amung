package com.five.amung.reserve.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.five.amung.dogs.dto.DogsDto;
import com.five.amung.reserve.dto.ReserveDto;
import com.five.amung.reserve.dto.RoomDto;
import com.five.amung.reserve.dto.RoomPriceDto;

public interface ReserveService {
	//방, 체크인, 체크아웃, 강아지 몸무게에 따른 가격 구해오기
	public Map<String, Object> getPrice(RoomPriceDto dto);
	//체크인, 체크아웃 기간(텀)
	public Map<String, Object> getTerm(RoomPriceDto dto);
	//강아지 몸무게, 방 이름에 따른 방번호 구하기
	public int getRoomNum(RoomPriceDto dto);
	
	//예약하기
	public void reserve(ModelAndView mView, HttpServletRequest request, ReserveDto dto);
	
	//방번호로 방 정보 가져오기
	public RoomDto getRoomData(int num);
	
	//마이페이지 : 예약현황
	public void getList(HttpServletRequest request, ReserveDto dto);
}//======== ReserveService ========