package com.five.amung.faq.dao;

import java.util.List;

import com.five.amung.faq.dto.FaqDto;

public interface FaqDao {
	public List<FaqDto> getList(FaqDto dto);
	public int getCount(FaqDto dto);
	public void insert(FaqDto dto);
	
}
