package com.five.amung.users.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public String pwdSearch(UsersDto dto) {
		
		return session.selectOne("users.pwdSearch", dto);
	}

	@Override
	public void updatePwd(UsersDto dto) {
		session.update("users.updatePwd", dto);
	}

	//리연 추가
	//회원 정보 삭제
	@Override
	public void delete(String id) {
		session.delete("users.delete", id);
	}//====delete====
	
	//비밀번호 체크
	@Override
	public boolean checkPwd(UsersDto dto) {
		boolean result = false;
		int count = session.selectOne("users.checkPwd", dto);
		if(count == 1) result=true;
		return result;
	}//==== checkPwd ====
	
	//회원 정보 수정
	@Override
	public void update(UsersDto dto) {
		session.update("users.update", dto);
	}//==== update ====
}//======== UsersDaoImpl ========