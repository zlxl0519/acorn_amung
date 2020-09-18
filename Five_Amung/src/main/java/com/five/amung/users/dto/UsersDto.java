package com.five.amung.users.dto;

public class UsersDto {

	private String id;
	private String pwd;
	private String newPwd;
	private String email;
	private String profile;
	private String name;
	private String phone;
	private String regdate;
	
	public UsersDto() {}

	public UsersDto(String id, String pwd, String newPwd, String email, String profile, String name, String phone,
			String regdate) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.newPwd = newPwd;
		this.email = email;
		this.profile = profile;
		this.name = name;
		this.phone = phone;
		this.regdate = regdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
