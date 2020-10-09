package com.five.amung.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.five.amung.qna.dto.QnaDto;

@Repository
public class QnaDaoImpl implements QnaDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<QnaDto> getList(QnaDto dto) {
		return session.selectList("qna.getList", dto);
	}

	@Override
	public int getCount(QnaDto dto) {
		return session.selectOne("qna.getCount", dto);
	}

	@Override
	public QnaDto getData(int num) {
		return session.selectOne("qna.getData", num);
	}

	@Override
	public QnaDto getData(QnaDto dto) {
		return session.selectOne("qna.getData2", dto);
	}

	@Override
	public void addHit(int num) {
		session.update("qna.addHit", num);
	}

	@Override
	public void insert(QnaDto dto) {
		session.insert("qna.insert", dto);
	}

	@Override
	public void update(QnaDto dto) {
		session.update("qna.update", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("qna.delete", num);
	}

	@Override
	public List<QnaDto> getMyList(QnaDto dto) {
		return session.selectList("qna.getMyList", dto);
	}

	@Override
	public int getMyCount(QnaDto dto) {
		return session.selectOne("qna.getMyCount", dto);
	}

}
