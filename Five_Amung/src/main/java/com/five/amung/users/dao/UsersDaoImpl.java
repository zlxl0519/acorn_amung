package com.five.amung.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.five.amung.users.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao{

	@Autowired
	private SqlSession session;

	@Override
	public void insert(UsersDto dto) {
		// TODO 회원 등록
		session.insert("users.insert", dto);
		
	}

	@Override
	public boolean isExist(String inputId) {
		// TODO 아이디 중복 확인
		return false;
	}
}
