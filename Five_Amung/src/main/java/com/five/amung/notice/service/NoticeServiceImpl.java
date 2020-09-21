package com.five.amung.notice.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.amung.notice.dao.NoticeDao;
import com.five.amung.notice.dto.NoticeDto;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public Map<String, Object> getList(HttpServletRequest request) {
		
		return null;
	}//==== getList ====

	@Override
	public void getDetail(HttpServletRequest request) {
		
		
	}//==== geDetail ====

	@Override
	public void saveContent(NoticeDto dto) {
		noticeDao.insert(dto);
	}//==== saveContent ====

	@Override
	public void updateContent(NoticeDto dto) {
		
		
	}//==== updateContent ====

	@Override
	public void deleteContent(int num, HttpServletRequest request) {
		
		
	}//==== deleteContent ====
}//======== NoticeServiceImpl ========