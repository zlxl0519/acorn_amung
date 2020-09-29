package com.five.amung.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.five.amung.review.dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<ReviewDto> getList(ReviewDto dto) {
		return session.selectList("review.getList", dto);
	}

	@Override
	public int getCount(ReviewDto dto) {
		return session.selectOne("review.getCount", dto);
	}

	@Override
	public List<ReviewDto> getMyList(ReviewDto dto) {
		return session.selectList("review.getMyList", dto);
	}

	@Override
	public int getMyCount(ReviewDto dto) {
		return session.selectOne("review.getMyCount", dto);
	}

	@Override
	public ReviewDto getData(int num) {
		return session.selectOne("review.getData", num);
	}


	@Override
	public void insert(ReviewDto dto) {
		session.insert("review.insert", dto);
	}

	@Override
	public void update(ReviewDto dto) {
		session.update("review.update", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("review.delete", num);
	}

	@Override
	public String selectProfile(String id) {
		return session.selectOne("review.getProfile", id);
	}

	
}
