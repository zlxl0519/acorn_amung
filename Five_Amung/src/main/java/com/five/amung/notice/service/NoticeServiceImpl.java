package com.five.amung.notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.amung.notice.dao.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;
}