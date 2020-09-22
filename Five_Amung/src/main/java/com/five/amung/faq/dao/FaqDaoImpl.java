package com.five.amung.faq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.five.amung.faq.dto.FaqDto;

@Repository
public class FaqDaoImpl implements FaqDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<FaqDto> getList(FaqDto dto) {
		return session.selectList("faq.getList", dto);
	}

	@Override
	public void insert(FaqDto dto) {
		session.insert("faq.insert", dto);
	}

	@Override
	public int getCount(FaqDto dto) {
		return session.selectOne("faq.getCount", dto);
	}

}
