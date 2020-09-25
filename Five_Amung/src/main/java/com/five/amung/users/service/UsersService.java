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
	
	// 리연 추가 -- 200923
	// 마이페이지 / 회원정보 요청처리
	public void getInfo(HttpSession session, ModelAndView mView);
	// 회원정보 삭제 요청처리
	public void deleteUser(HttpSession session);
	// 회원 정보 수정 시 비밀번호 체크 요청처리
	public boolean checkInfo(HttpServletRequest request, UsersDto dto, ModelAndView mView);
	
	// 회원정보 수정
	public void updateUser(HttpServletRequest request, UsersDto dto);
	
	//비밀번호 수정
	public void updateUserPwd(HttpSession session, UsersDto dto, ModelAndView mView);
}//======== UsersService ========