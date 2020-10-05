package com.five.amung.reserve.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.five.amung.dogs.dto.DogsDto;
import com.five.amung.reserve.dto.ReserveDto;
import com.five.amung.reserve.dto.RoomDto;
import com.five.amung.reserve.dto.RoomPriceDto;

@Repository
public class ReserveDaoImpl implements ReserveDao{
	@Autowired
	private SqlSession session;
	
	//방이름, 강아지 몸무게로 가격 불러오는 메소드
	@Override
	public int getPrice(RoomPriceDto dto) {
		
		return session.selectOne("reserve.getPrice", dto);
	}

	@Override
	public int getTerm(RoomPriceDto dto) {
		
		return session.selectOne("reserve.getTerm", dto);
	}

	@Override
	public int getRoomNum(RoomPriceDto dto) {
		
		return session.selectOne("reserve.getRoomNum", dto);
	}

	@Override
	public void updateRoomReserveState(ReserveDto dto) {
		session.update("reserve.updateRoomReserveState", dto);
	}

	@Override
	public boolean insertReserve(ReserveDto dto) {
		int num=session.insert("reserve.insertReserve", dto);
		if(num==1) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public ReserveDto getData(ReserveDto dto) {
		
		return session.selectOne("reserve.getData", dto);
	}

	@Override
	public RoomDto getRoomData(int num) {
		return session.selectOne("reserve.getRoomData", num);
	}

	@Override
	public List<ReserveDto> getList(ReserveDto dto) {
		
		return session.selectList("reserve.getList", dto);
	}

	@Override
	public int getCount(ReserveDto dto) {
		return session.selectOne("reserve.getCount", dto);
	}
}
