package com.five.amung.reserve.service;

import java.util.Map;

import com.five.amung.dogs.dto.DogsDto;
import com.five.amung.reserve.dto.ReserveDto;
import com.five.amung.reserve.dto.RoomDto;
import com.five.amung.reserve.dto.RoomPriceDto;

public interface ReserveService {
	//방, 체크인, 체크아웃, 강아지 몸무게에 따른 가격 구해오기
	public Map<String, Object> getPrice(RoomPriceDto dto);
	//체크인, 체크아웃 기간(텀)
	public Map<String, Object> getTerm(RoomPriceDto dto);
}
