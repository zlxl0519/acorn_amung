package com.five.amung.dogs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.five.amung.dogs.dto.DogsDto;

@Repository
public class DogsDaoImpl implements DogsDao{
	@Autowired
	private SqlSession session;

	@Override
	public void insert(DogsDto dto) {
		session.insert("dogs.insert", dto);
	}

	@Override
	public List<DogsDto> getList(DogsDto dto) {
		
		return session.selectList("dogs.getList", dto);
	}

	@Override
	public DogsDto getData(int num) {
		return session.selectOne("dogs.getData", num);
	}

	@Override
	public List<DogsDto> getDogsData(DogsDto dto) {
		
		return session.selectList("dogs.getDogsData", dto);
	}

	@Override
	public int getCheck(DogsDto dto) {
		return session.selectOne("dogs.getCheck", dto);
	}
}
