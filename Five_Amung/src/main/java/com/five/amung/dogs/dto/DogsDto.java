package com.five.amung.dogs.dto;

public class DogsDto {
	private int num;
	private String member_id;
	private String dname;
	private String breed;
	private String weight;
	private String neutral;
	private String gender;
	private String etc;
	
	public DogsDto() {}

	public DogsDto(int num, String member_id, String dname, String breed, String weight, String neutral, String gender,
			String etc) {
		super();
		this.num = num;
		this.member_id = member_id;
		this.dname = dname;
		this.breed = breed;
		this.weight = weight;
		this.neutral = neutral;
		this.gender = gender;
		this.etc = etc;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getNeutral() {
		return neutral;
	}

	public void setNeutral(String neutral) {
		this.neutral = neutral;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}
	
	
}
