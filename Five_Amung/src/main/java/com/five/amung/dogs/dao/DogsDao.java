package com.five.amung.dogs.dao;

import java.util.List;

import com.five.amung.dogs.dto.DogsDto;

public interface DogsDao {
	public void insert(DogsDto dto);
	public List<DogsDto> getList(DogsDto dto);
	public DogsDto getData(int num);
}
