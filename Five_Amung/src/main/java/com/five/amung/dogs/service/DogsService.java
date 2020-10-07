package com.five.amung.dogs.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.five.amung.dogs.dto.DogsDto;

public interface DogsService {
	//강아지 정보 저장
	public boolean insert(HttpServletRequest request, DogsDto dto);
	//map 으로 강아지 정보 리턴
	public Map<String, Object> getList(HttpServletRequest request, DogsDto dto, ModelAndView mView);
	//강아지 번호로 강아지 정보 가져오기
	public DogsDto getData(int num);
	
	//강아지 정보 삭제하기
	public void delete(int num, DogsDto dto, HttpServletRequest request);
}// ======== DogsService ========