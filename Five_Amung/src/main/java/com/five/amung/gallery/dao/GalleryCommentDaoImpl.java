package com.five.amung.gallery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.five.amung.gallery.dto.GalleryCommentDto;

@Repository
public class GalleryCommentDaoImpl implements GalleryCommentDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<GalleryCommentDto> getList(GalleryCommentDto dto) {
		// TODO 댓글 전체 목록 가져오기
		return session.selectList("galleryComment.getList", dto);
	}

	@Override
	public void delete(int num) {
		// TODO 댓글 삭제
		session.delete("galleryComment.delete", num);
		
	}

	@Override
	public void insert(GalleryCommentDto dto) {
		// TODO 댓글 추가
		session.insert("galleryComment.insert", dto);
	}

	@Override
	public int getSequence() {
		// TODO 추가할 댓글의 글번호를 리턴
		return session.selectOne("galleryComment.getSequence");
	}

	@Override
	public void update(GalleryCommentDto dto) {
		// TODO 댓글 수정
		session.update("galleryComment.update", dto);
		
	}

	@Override
	public GalleryCommentDto getData(int num) {
		// TODO 댓글 하나의 정보 가져오기
		return session.selectOne("galleryComment.getData", num);
	}

	@Override
	public int getCount(int ref_group) {
		// TODO 전체 row의 갯수 리턴
		return session.selectOne("galleryComment.getCount", ref_group);
	}

}
