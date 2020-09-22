package com.five.amung.users.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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

}
