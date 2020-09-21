package com.five.amung.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.five.amung.notice.dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	
	@Autowired
	private SqlSession session;
	
	// 게시글 추가하기 
	@Override
	public void insert(NoticeDto dto) {
		session.insert("notice.insert", dto);
	}//==== insert ====
	
	// 글 목록 리스트
	@Override
	public List<NoticeDto> getList(NoticeDto dto) {
		return session.selectList("notice.getList", dto);
	}// ==== getList ====
	
	// 글 갯수 얻어오기
	@Override
	public int getCount(NoticeDto dto) {
		return session.selectOne("notice.getCount", dto);
	}
	
	//글 정보 얻어오기
	
	
	//조회수 증가
	
}//==========NoticeDaoImpl==========