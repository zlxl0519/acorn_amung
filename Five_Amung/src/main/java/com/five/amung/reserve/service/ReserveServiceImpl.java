package com.five.amung.reserve.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.amung.dogs.dto.DogsDto;
import com.five.amung.reserve.dao.ReserveDao;
import com.five.amung.reserve.dto.ReserveDto;
import com.five.amung.reserve.dto.RoomDto;
import com.five.amung.reserve.dto.RoomPriceDto;

@Service
public class ReserveServiceImpl implements ReserveService{
	@Autowired
	private ReserveDao reserveDao;
	//예약 가격 불러오기
	@Override
	public Map<String, Object> getPrice(RoomPriceDto dto) {
		
		//1. 방 이름, 강아지 몸무게에 따른 int type 의 가격을 불러온다.(dao)
		int price=reserveDao.getPrice(dto);
		//2. 체크인 체크아웃 기간을 가져온다.(dao)
		int term=reserveDao.getTerm(dto);
		//3. 가격 * 기간을 해서 총가격을 구한다.
		int resultPrice=price*-term;
		//4. Map 에 담아서 리턴한다.
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("price", resultPrice);
		return map;
	}
}
