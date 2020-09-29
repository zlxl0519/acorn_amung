package com.five.amung.reserve.dto;

public class RoomPriceDto {
	private int dog_num;
	private String room_name;
	private String checkin_date;
	private String checkout_date;
	private String weight;
	
	public RoomPriceDto() {}

	public RoomPriceDto(int dog_num, String room_name, String checkin_date, String checkout_date, String weight) {
		super();
		this.dog_num = dog_num;
		this.room_name = room_name;
		this.checkin_date = checkin_date;
		this.checkout_date = checkout_date;
		this.weight = weight;
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

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	
}
