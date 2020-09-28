package com.five.amung.reserve.dao;

import com.five.amung.dogs.dto.DogsDto;
import com.five.amung.reserve.dto.ReserveDto;
import com.five.amung.reserve.dto.RoomDto;
import com.five.amung.reserve.dto.RoomPriceDto;

public interface ReserveDao {
	//방이름, 강아지몸무게에 따른 방 가격 구하는 메소드
	public int getPrice(RoomPriceDto dto);
	
	//체크인 체크아웃 기간 구하는 메소드
	public int getTerm(RoomPriceDto dto);
}
