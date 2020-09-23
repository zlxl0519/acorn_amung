package com.five.amung.reserve.dto;

public class ReserveDto {
	private int num;
	private String member_id;
	private int dog_num;
	//private String room_name; room_name은 RoomDto에 있습니다.
	private String checkin_date;
	private String checkout_date;
	private String start_time;
	private String end_time;
	private String name;
	private String phone;
	private String regdate;
	private String state; //예약대기중, 예약완료, 예약취소
	
	public ReserveDto() {}

	public ReserveDto(int num, String member_id, int dog_num, String checkin_date, String checkout_date,
			String start_time, String end_time, String name, String phone, String regdate, String state) {
		super();
		this.num = num;
		this.member_id = member_id;
		this.dog_num = dog_num;
		this.checkin_date = checkin_date;
		this.checkout_date = checkout_date;
		this.start_time = start_time;
		this.end_time = end_time;
		this.name = name;
		this.phone = phone;
		this.regdate = regdate;
		this.state = state;
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

	public int getDog_num() {
		return dog_num;
	}

	public void setDog_num(int dog_num) {
		this.dog_num = dog_num;
	}

	public String getCheckin_date() {
		return checkin_date;
	}

	public void setCheckin_date(String checkin_date) {
		this.checkin_date = checkin_date;
	}

	public String getCheckout_date() {
		return checkout_date;
	}

	public void setCheckout_date(String checkout_date) {
		this.checkout_date = checkout_date;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	
}
