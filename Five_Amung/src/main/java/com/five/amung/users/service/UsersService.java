package com.five.amung.users.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.five.amung.users.dto.UsersDto;

public interface UsersService {
	//회원가입 완료 요청 처리
	public void addUser(UsersDto dto);
	//아이디가 중복확인 기능 : 아이디 존재 여부 요청 처리
	public Map<String, Object> isExistId(String inputId);
	//ajax 프로필 사진 업로드 요청 처리
	public Map<String, Object> saveProfileImage(HttpServletRequest request,
			MultipartFile mFile);
	//회원 목록 보기 요청 처리
}
