package com.myhotel.yrchoiHotel;

public class Bookinginfo {
	private int bookcode;
	private int person;
	private int roomcode;
	private String roomname;
	private String checkin;
	private String checkout;
	private String name;
	private String mobile;
	public Bookinginfo() {}
	public Bookinginfo(int bookcode, int person,int roomcode, String roomname, String checkin, String checkout, String name,
			String mobile) {
		this.bookcode = bookcode;
		this.person = person;
		this.roomname = roomname;
		this.checkin = checkin;
		this.checkout = checkout;
		this.name = name;
		this.mobile = mobile;
		this.roomcode = roomcode;
	}
	
	public int getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}
	public int getBookcode() {
		return bookcode;
	}
	public void setBookcode(int bookcode) {
		this.bookcode = bookcode;
	}
	public int getPerson() {
		return person;
	}
	public void setPerson(int person) {
		this.person = person;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	

}
