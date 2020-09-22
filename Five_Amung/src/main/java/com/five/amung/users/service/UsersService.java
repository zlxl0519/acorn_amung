package com.five.amung.users.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
	
	//로그인 처리
	public void loginProcess(UsersDto dto, HttpSession session, HttpServletResponse response, HttpServletRequest request, ModelAndView mView);
	//이메일로 아이디찾기
	public List<UsersDto> idSearch(ModelAndView mView, HttpServletRequest request, UsersDto dto);
}
