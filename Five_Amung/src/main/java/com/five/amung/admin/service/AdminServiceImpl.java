package com.five.amung.admin.service;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.five.amung.dogs.dao.DogsDao;
import com.five.amung.dogs.dto.DogsDto;
import com.five.amung.reserve.dao.ReserveDao;
import com.five.amung.reserve.dto.ReserveDto;
import com.five.amung.reserve.dto.RoomPriceDto;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private ReserveDao reserveDao;
	@Autowired
	private DogsDao dogsDao;
	
	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=10;
	//하단 디스플레이 페이지 갯수
	final int PAGE_DISPLAY_COUNT=5;

	@Override
	public void getList(HttpServletRequest request, ReserveDto dto, RoomPriceDto roomPriceDto) {
		//보여줄 페이지의 번호
		int pageNum=1;
		//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
			//페이지 번호를 설정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT; //공차 수열 an=a1+(n-1)d
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		/*
		검색 키워드에 관련된 처리
		*/
		String keyword=request.getParameter("keyword");
		//어떤 것으로 검색했는지 파라미터 값
		String condition=request.getParameter("condition");
		if(keyword==null){//전달된 키워드가 없다면
			condition="";
			keyword="";//빈 문자열을 넣어준다.
		}
		//인코딩된 키워드를 미리 만들어 둔다.
		String encodedK=URLEncoder.encode(keyword);
		//검색 키워드와 startRowNum, endRowNum 을 담을 FileDto 객체 생성
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		if(!keyword.equals("")){//만일 키워드가 넘어온다면
			if(condition.equals("room_name")){
				//검색 키워드를 FileDto 객체의 필드에 담는다.
				dto.setRoom_name(keyword);
			}else if(condition.equals("name")){
				dto.setName(keyword);
			}else if(condition.equals("member_id")){
				dto.setMember_id(keyword);
			}else if(condition.equals("state")) {
				dto.setState(keyword);
			}
		}
		//예약 리스트를 다 가져온다.(reserveDao)
		List<ReserveDto> reserveList=reserveDao.getList(dto);
		
		for(int i=0; i<reserveList.size(); i++) {
			String checkin_date=reserveList.get(i).getCheckin_date();
			String checkout_date=reserveList.get(i).getCheckout_date();
			roomPriceDto.setCheckin_date(checkin_date);
			roomPriceDto.setCheckout_date(checkout_date);
			//2. 숙박기간 을 가져와서 modelAndview 에 담는다.
			int term=reserveDao.getTerm(roomPriceDto);
			//숙박기간
			request.setAttribute("term", term);
		}
		//전체 row 의 갯수를 담을 변수// 전체 row 의 갯수를 알아야지 페이지를 나눌수 있다.
		int totalRow=reserveDao.getCount(dto);
		
		//전체 페이지의 갯수 구하기 //나눈것의 실수를 정수값으로 올림해서 사용한다는뜻 // 실수를 나오게하려면 정수 나누기 실수를 해야되서 나누는건 double로 우선 캐스팅
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호 //1,2,3이든 page_display_count 가 5 이면 0 // 정수 정수끼리 나누면 정수이기때문
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		
		request.setAttribute("reserveList", reserveList);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("encodedK", encodedK);
	}

	@Override
	public void reserveCancle(ModelAndView mView, HttpServletRequest request) {
		//예약 번호
		int num=Integer.parseInt(request.getParameter("num"));
		//1. reserveDB 에서 예약상태를 예약 취소로 업데이트 한다.(num getparameter 받아옴)
		boolean isSuccess=reserveDao.reserveCancle(num);
		//2. 예약 번호에 맞는 방번호를 가져온다.
		ReserveDto dto=reserveDao.getData(num);
		int roomNum=dto.getRoom_num();
		//예약 취소 상태이면 방 번호로 방이 예약 가능하게 바뀜 room state 도 바뀌게 하기
		if(isSuccess) {
			reserveDao.updateRoomState(roomNum);
		}
		
	}
	
	

}
