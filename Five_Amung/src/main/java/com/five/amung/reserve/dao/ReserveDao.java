package com.five.amung.reserve.dao;

import java.util.List;

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
	
	//예약 번호에 따른 방 번호 구하기
	public int getReserveRoomNum(int num);
	
	//방 예약 여부 업데이트 yes 로 업데이트
	public void updateRoomReserveState(ReserveDto dto);
	
	//예약 사항 예약DB에 저장
	public boolean insertReserve(ReserveDto dto);
	
	//예약정보 가져오기(예약 번호로)
	public ReserveDto getData(int num);
	
	//방 번호 방 정보 가져오기
	public RoomDto getRoomData(int num);
	
	//예약정보 다 가져오기
	public List<ReserveDto> getList(ReserveDto dto);
	
	public int getCount(ReserveDto dto);
	
	//예약 번호로 예약 상태 취소로 바꾸기
	public boolean reserveCancle(int num);
	
	//방 번호로 방 예약 상태를 no 로 바꾼다.
	public void updateNoRoomState(int roomNum);
	
	//예약 번호로 예약 상태 확인으로 바꾸기
	public boolean reserveOk(int num);
	
	//방 번호로 방 예약 상태를 yes 로 바꾼다.
	public void updateYesRoomState(int roomNum);
	
}
