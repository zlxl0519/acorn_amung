package com.five.amung.gallery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.five.amung.gallery.dto.GalleryDto;

@Repository
public class GalleryDaoImpl implements GalleryDao{

	@Autowired
	private SqlSession session;

	@Override
	public List<GalleryDto> getList(GalleryDto dto) {
		// TODO 게시물 리스트 가지고 오기
		List<GalleryDto> list = session.selectList("gallery.getList", dto);
		return list;
	}

	@Override
	public void insert(GalleryDto dto) {
		// TODO 게시물 추가
		session.insert("gallery.insert", dto);
	}

	@Override
	public int getCount(GalleryDto dto) {
		// TODO 전체 row 갯수 구하기
		return session.selectOne("gallery.getCount", dto);
	}

	@Override
	public void delete(int num) {
		// TODO 글 삭제
		session.delete("gallery.delete", num);
	}

	@Override
	public void update(GalleryDto dto) {
		// TODO 글 수정
		session.update("gallery.update", dto);
	}

	@Override
	public GalleryDto getData(int num) {
		// TODO 상세보기 페이지
		return session.selectOne("gallery.getData", num);
	}

	@Override
	public void viewCount(int num) {
		// TODO 조회수
		session.update("gallery.viewCount", num);
		
	} 
}
