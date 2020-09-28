package com.five.amung.reserve.dao;

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
}
