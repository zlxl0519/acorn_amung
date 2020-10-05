package com.five.amung.dogs.dao;

import java.util.List;

import com.five.amung.dogs.dto.DogsDto;

public interface DogsDao {
	public void insert(DogsDto dto);
	public List<DogsDto> getList(DogsDto dto);
	//한 강아지의 정보
	public DogsDto getData(int num);
	//한 아이디의 강아지 리스트 정보를 가져온다.
	public List<DogsDto> getDogsData(DogsDto dto);
	
	//검색한 아이디로 강아지 정보가 존재하는지 체크 없으면 0 출력
	public int getCheck(DogsDto dto);
	
	public void delete(DogsDto dto);
}