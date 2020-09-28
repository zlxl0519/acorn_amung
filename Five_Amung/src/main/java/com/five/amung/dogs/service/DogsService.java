package com.five.amung.dogs.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.five.amung.dogs.dto.DogsDto;

public interface DogsService {
	//강아지 정보 저장
	public void insert(HttpServletRequest request, DogsDto dto);
	//map 으로 강아지 정보 리턴
	public Map<String, Object> getList(HttpServletRequest request, DogsDto dto);
	//강아지 번호로 강아지 정보 가져오기
	public DogsDto getData(int num);
	
}
