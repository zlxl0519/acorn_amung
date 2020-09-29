package com.five.amung.reserve.dto;

public class RoomDto {
	private int num;
	private String room_name;
	private String room_reserve_state; //예약 되있는지 안되있는지 여부 'yes'or'no'
	private String weight; //강아지 몸무게에 따라 가격이 달라진다(3, 6, 9, 10)3키로이하,4~6키로이하, 7~9,10키로 이상 
	private int room_price;
	
	public RoomDto() {}

	public RoomDto(int num, String room_name, String room_reserve_state, String weight, int room_price) {
		super();
		this.num = num;
		this.room_name = room_name;
		this.room_reserve_state = room_reserve_state;
		this.weight = weight;
		this.room_price = room_price;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public String getRoom_reserve_state() {
		return room_reserve_state;
	}

	public void setRoom_reserve_state(String room_reserve_state) {
		this.room_reserve_state = room_reserve_state;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public int getRoom_price() {
		return room_price;
	}

	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}

	
}
