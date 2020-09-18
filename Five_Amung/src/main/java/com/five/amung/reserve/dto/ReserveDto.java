package com.five.amung.reserve.dto;

public class ReserveDto {
	private int num;
	private String member_id;
	private int dog_num;
	private String room_name;
	private String checkin_date;
	private String checkout_date;
	private String checkin_time;
	private String checkout_time;
	private String name;
	private String phone;
	private String regdate;
	private String cancel; //예약 취소 여부저장 필드 //"yes" or "no"
	
	public ReserveDto() {}

	public ReserveDto(int num, String member_id, int dog_num, String room_name, String checkin_date,
			String checkout_date, String checkin_time, String checkout_time, String name, String phone, String regdate,
			String cancel) {
		super();
		this.num = num;
		this.member_id = member_id;
		this.dog_num = dog_num;
		this.room_name = room_name;
		this.checkin_date = checkin_date;
		this.checkout_date = checkout_date;
		this.checkin_time = checkin_time;
		this.checkout_time = checkout_time;
		this.name = name;
		this.phone = phone;
		this.regdate = regdate;
		this.cancel = cancel;
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

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
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

	public String getCheckin_time() {
		return checkin_time;
	}

	public void setCheckin_time(String checkin_time) {
		this.checkin_time = checkin_time;
	}

	public String getCheckout_time() {
		return checkout_time;
	}

	public void setCheckout_time(String checkout_time) {
		this.checkout_time = checkout_time;
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

	public String getCancel() {
		return cancel;
	}

	public void setCancel(String cancel) {
		this.cancel = cancel;
	}
	
}
