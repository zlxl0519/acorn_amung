package com.five.amung.gallery.dao;

import java.util.List;

import com.five.amung.gallery.dto.GalleryDto;

public interface GalleryDao {

	//리스트
	public List<GalleryDto> getList(GalleryDto dto);
	//추가
	public void insert(GalleryDto dto);
	//row의 갯수
	public int getCount(GalleryDto dto);
	//삭제
	public void delete(int num);
	//수정
	public void update(GalleryDto dto);
	//상세보기
	public GalleryDto getData(int num);
	//조회수
	public void viewCount(int num);
}
