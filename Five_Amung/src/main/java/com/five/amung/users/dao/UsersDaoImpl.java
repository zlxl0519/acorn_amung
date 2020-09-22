package com.five.amung.users.dao;

import java.util.List;

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
		String id=session.selectOne("users.isExist", inputId);
		if(id==null) {
			//존재하지 않는 아이디
			return false;
		}else {
			//존재하는 아이디
			return true;
		}
	}

	@Override
	public UsersDto getData(String id) {
		return session.selectOne("users.getData", id);
	}

	@Override
	public List<UsersDto> idSearchList(UsersDto dto) {
		
		return session.selectList("users.idSearch", dto);
	}

	
}
