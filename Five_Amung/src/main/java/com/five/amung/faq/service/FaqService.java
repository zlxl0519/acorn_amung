package com.five.amung.faq.service;

import javax.servlet.http.HttpServletRequest;

import com.five.amung.faq.dto.FaqDto;

public interface FaqService {
	public void getList(HttpServletRequest request);
	public void saveContent(FaqDto dto);
}
