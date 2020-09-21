package com.five.amung.notice.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.five.amung.notice.dto.NoticeDto;

public interface NoticeService {
	public Map<String, Object> getList(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
	public void saveContent(NoticeDto dto);
	public void updateContent(NoticeDto dto);
	public void deleteContent(int num, HttpServletRequest request);
}