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
	
	//방이름 , 몸무게에 따른 방 번호 구하기
	public int getRoomNum(RoomPriceDto dto);
	
	//방 예약 여부 업데이트
	public void updateRoomReserveState(ReserveDto dto);
	
	//예약 사항 예약DB에 저장
	public void insertReserve(ReserveDto dto);
	
	//예약정보 가져오기(한 줄만)
	public ReserveDto getData(ReserveDto dto);
	
	//방 번호 방 정보 가져오기
	public RoomDto getRoomData(int num);
}
