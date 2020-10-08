package com.five.amung.popup.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.five.amung.popup.dto.PopupDto;

@Repository
public class PopupDaoImpl implements PopupDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public void insert(PopupDto dto) {
		// TODO 팝업 등록
		session.insert("popup.insert",dto);
		
	}

	@Override
	public PopupDto getData() {
		// TODO 팝업 데이터 가져오기
		return session.selectOne("popup.getData");
	}

	@Override
	public void delete() {
		// TODO 삭제하기
		session.delete("popup.delete");
		
	}
	
}
