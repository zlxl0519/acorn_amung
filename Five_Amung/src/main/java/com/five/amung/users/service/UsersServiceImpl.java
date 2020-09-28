package com.five.amung.users.service;

import java.util.List;
import java.io.File;
import java.util.HashMap;
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
		boolean isExist=usersDao.isExist(inputId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isExist", isExist);
		return map;
	}

	@Override
	public Map<String, Object> saveProfileImage(HttpServletRequest request, MultipartFile mFile) {
		// TODO 프로필 사진 저장 요청 처리
		String orgFileName=mFile.getOriginalFilename();
		String realPath=request.getServletContext().getRealPath("/upload");
		String filePath=realPath+File.separator;

		File upload=new File(filePath);
		if(!upload.exists()) {//만일 디렉토리가 존재하지 않으면 
			upload.mkdir(); //만들어 준다.
		}

		String saveFileName=
				System.currentTimeMillis()+orgFileName;
		try {

			mFile.transferTo(new File(filePath+saveFileName));
			System.out.println(filePath+saveFileName);
		}catch(Exception e) {
			e.printStackTrace();
		}

		Map<String, Object> map=new HashMap<String, Object>();
		map.put("imageSrc","/upload/"+saveFileName);
		
		return map;
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

	@Override
	public List<UsersDto> idSearch(ModelAndView mView, HttpServletRequest request, UsersDto dto) {
		//이름, 이메일로 아이디를 찾을때
		String email_1=request.getParameter("email_1");
		String email_2=request.getParameter("email_2");
		String selectEmail=request.getParameter("selectEmail");
		String name=request.getParameter("name");
		String name2=request.getParameter("name2");
		String phone=request.getParameter("phone");
		if(name!=null && email_1 !=null) {
			if(selectEmail.equals("etc")){
				email_1=email_1+"@"+email_2;
			}else{
				email_1=email_1+"@"+selectEmail;
			}
			dto.setEmail(email_1);
			dto.setName(name);
		}else {
			dto.setName(name2);
			dto.setPhone(phone);
		}

		//dao 에서 dto 인자로 받아서 id 찾아오기
		List<UsersDto> idList=usersDao.idSearchList(dto);
		return idList;
	}
	
	@Override
	public void pwdSearch(ModelAndView mView, UsersDto dto) {
		System.out.println(dto.getId());
		//1. 아이디, 이름, 휴대폰 번호 로 일치하는 비밀번호 찾기(dao 사용)
		String pwd=usersDao.pwdSearch(dto);
		
		//작업 성공여부
		boolean isSuccess=false;
		String newPwd = "";
		//비밀번호를 찾았다면
		if(pwd != null) {
			//2. 임시 비밀번호 랜덤으로 생성
			for (int i = 0; i < 12; i++) {
				newPwd += (char) ((Math.random() * 26) + 97);
			}
	
			//새 비밀번호를 암호화
			BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
			String encodednewPwd=encoder.encode(newPwd);
			//새 비밀번호를 dto 에 다시 담기
			dto.setNewPwd(encodednewPwd);
			//DB에 비밀번호 반영하기
			usersDao.updatePwd(dto);
			//성공
			isSuccess=true;
		}
		//3. 임시 비밀번호 ModelAndView 에 담기
		mView.addObject("newPwd", newPwd);
		mView.addObject("isSuccess", isSuccess);
	}
	
	//리연 추가 -- 20923
	//회원정보 보기 요청처리
	@Override
	public void getInfo(HttpSession session, ModelAndView mView) {
		//로그인 된 아이디를 session 객체를 이용해서 얻어온다.
		String id = (String)session.getAttribute("id");
		//dao를 이용해서 사용자 정보를 얻어와서
		UsersDto dto = usersDao.getData(id);
		
			
		String email = dto.getEmail();
		// @를 기준으로 배열에 담는다.
		String[] mail= email.split("@");
		
		System.out.println(mail[0]+"@"+mail[1]);

		//mView 객체에 담아준다.
		mView.addObject("dto", dto);
		mView.addObject("mail1", mail[0]);
		mView.addObject("mail2", mail[1]);
	}//==== getInfo ==== 

	@Override
	public void deleteUser(HttpSession session) {
		//세션에 저장된 아이디를 읽어와서
		String id = (String)session.getAttribute("id");
		//삭제
		usersDao.delete(id);
		//로그아웃 처리
		session.invalidate();
	}//==== deleteUser ==== 

	//회원정보 수정 시 필요한 비밀번호 체크
	@Override
	public boolean checkInfo(HttpServletRequest request, UsersDto dto, ModelAndView mView) {
		String id = (String)request.getSession().getAttribute("id");
		UsersDto resultDto=usersDao.getData(id);
		
		String encodedPwd=resultDto.getPwd();
		String inputPwd=dto.getPwd();
		
		//DB 비밀번호와 input 비밀번호 비교
		boolean result=BCrypt.checkpw(inputPwd, encodedPwd);
		if(result == true) {//비밀번호와 
			request.getSession().setAttribute("id", id);
			mView.addObject("isSuccess", true);
		}else {
			mView.addObject("isSuccess", false);
		}
		return result;
	}//==== checkInfo ==== 
	
	//회원정보 수정
	@Override
	public void updateUser(HttpServletRequest request, UsersDto dto) {
		String id = (String)request.getSession().getAttribute("id");
		String email=request.getParameter("email01")+"@"+request.getParameter("email02");
		//UsersDto에 담고
		dto.setId(id);
		dto.setEmail(email);
		//dao를 이용해서 수정 반영하기
		usersDao.update(dto);
	}//==== updateUser ====
	
	//비밀번호 수정
	@Override
	public void updateUserPwd(HttpSession session, UsersDto dto, ModelAndView mView) {
		// TODO Auto-generated method stub
		
	}//==== updateUserPwd ====
}//======== UsersServiceImpl ========