package com.five.amung.gallery.dao;

import java.util.List;

import com.five.amung.gallery.dto.GalleryCommentDto;


public interface GalleryCommentDao {
	//댓글 목록 얻어오기 
	public List<GalleryCommentDto> getList(GalleryCommentDto dto);
	//댓글 삭제 
	public void delete(int num);
	//댓글 추가 
	public void insert(GalleryCommentDto dto);
	//추가할 댓글의 글번호를 리턴하는 메소드 
	public int getSequence();
	//댓글 수정
	public void update(GalleryCommentDto dto);
	
	public GalleryCommentDto getData(int num);
	//전체 row의 갯수를 리턴해주는 메소드
	public int getCount(int ref_group);
}
