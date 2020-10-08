package com.five.amung.reserve.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

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
	@Override
	public Map<String, Object> getTerm(RoomPriceDto dto) {
		//1. 기간을 계산 해서 숙박 일을 저장해서 보낸다.
		int term=reserveDao.getTerm(dto);
		//2. 체크인 , 체크아웃 기간을 저장해서 보낸다.
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("term", -term);
		return map;
	}
	@Override
	public int getRoomNum(RoomPriceDto dto) {
		
		return reserveDao.getRoomNum(dto);
	}
	@Transactional
	@Override
	public void reserve(ModelAndView mView, HttpServletRequest request, ReserveDto dto) {
		//1. 예약자 아이디를 읽어와서 dto 에 저장한다.
		String id=(String)request.getSession().getAttribute("id");
		dto.setMember_id(id);
		//2.해당되는 방번호의 예약여부를 업데이트 시킨다.
		reserveDao.updateRoomReserveState(dto);
		//3. 예약정보를 DB 에 저장한다.
		//(예약자 아이디, 강아지 번호,방번호, 체크인날, 체크아웃날, 체크인시간, 
		//체크아웃시간, 예약자명, 핸드폰번호, 결제금액, 예약날짜, 예약상태(대기중, 완료, 취소))
		boolean isSuccess=reserveDao.insertReserve(dto);
		mView.addObject("isSuccess", isSuccess);
	}
	@Override
	public RoomDto getRoomData(int num) {
		
		return reserveDao.getRoomData(num);
	}
	
	//예약현황
	@Override
	public void getList(HttpServletRequest request, ReserveDto dto) {
		
	}//====getList====
}//======== ReserveServiceImpl ========