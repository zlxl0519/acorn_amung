package com.five.amung.reserve.dto;

public class ReserveDto {
	private int num;
	private String member_id;
	private int dog_num;
	private String dname;
	private int room_num;
	private String room_name;
	private String checkin_date;
	private String checkout_date;
	private String start_time;
	private String end_time;
	private String name;
	private String phone;
	private String regdate;
	private String state; //예약대기중, 예약완료, 예약취소
	private int room_price;
	
	//예약내역 보는 관리자 페이지 페이징처리
	private int startRowNum;
	private int endRowNum;
	private int prevNum; //이전글의 글번호
	private int nextNum; //다음글의 글번호
	
	public ReserveDto() {}

	public ReserveDto(int num, String member_id, int dog_num, String dname, int room_num, String room_name,
			String checkin_date, String checkout_date, String start_time, String end_time, String name, String phone,
			String regdate, String state, int room_price, int startRowNum, int endRowNum, int prevNum, int nextNum) {
		super();
		this.num = num;
		this.member_id = member_id;
		this.dog_num = dog_num;
		this.dname = dname;
		this.room_num = room_num;
		this.room_name = room_name;
		this.checkin_date = checkin_date;
		this.checkout_date = checkout_date;
		this.start_time = start_time;
		this.end_time = end_time;
		this.name = name;
		this.phone = phone;
		this.regdate = regdate;
		this.state = state;
		this.room_price = room_price;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
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

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
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

	public int getRoom_price() {
		return room_price;
	}

	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public int getPrevNum() {
		return prevNum;
	}

	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}

	public int getNextNum() {
		return nextNum;
	}

	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}

	
}
