package com.five.amung.users.service;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.five.amung.users.dao.UsersDao;
import com.five.amung.users.dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService{
	
	@Autowired
	private UsersDao usersDao;

	@Override
	public void addUser(UsersDto dto) {
		// TODO 회원 가입 요청 처리
		String inputPwd=dto.getPwd();
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(inputPwd);
		dto.setPwd(encodedPwd);
		usersDao.insert(dto);
	}

	@Override
	public Map<String, Object> isExistId(String inputId) {
		// TODO 아이디 중복 확인 요청 처리
		return null;
	}

	@Override
	public Map<String, Object> saveProfileImage(HttpServletRequest request, MultipartFile mFile) {
		// TODO 프로필 사진 저장 요청 처리
		return null;
	}

	@Override
	public void loginProcess(UsersDto dto, HttpSession session, HttpServletResponse response,
			HttpServletRequest request, ModelAndView mView) {
		//로그인 상태유지 체크박스 값을 가져온다.
		String remember=request.getParameter("remember");
		
		//dao 에서 아이디와 비밀번호에 유효한 정보를 얻어온다.
		UsersDto resultDto=usersDao.getData(dto.getId());
		boolean isValid=false;
		if(resultDto!=null) {//아이디는 일치하는 경우(아이디만 일치할수 있다.)
			String encodedPwd=resultDto.getPwd();
			String inputPwd=dto.getPwd();
			//DB 비밀번호와 input 비밀번호 비교
			isValid=BCrypt.checkpw(inputPwd, encodedPwd);
		}
		if(isValid) {//만일 유효한 정보이면(있다면)
			session.setAttribute("id", dto.getId());
			mView.addObject("isSuccess", true);
			//로그인 상태 유지
			if(remember==null) {//체크 안했다면
				//저장된 쿠키 삭제 
				Cookie idCook=new Cookie("savedId", dto.getId());
				idCook.setMaxAge(0);//삭제하기 위해 0 으로 설정 
				response.addCookie(idCook);
				
			}else {
				//아이디를 쿠키에 저장
				Cookie idCook=new Cookie("savedId", dto.getId());
				idCook.setMaxAge(60*60);
				response.addCookie(idCook);
				
			}
		}else {
			mView.addObject("isSuccess", false);
		}
	}

}
