package com.myhotel.yrchoiHotel;

import java.util.ArrayList;

public interface iRoom {
	ArrayList<Roominfo> getRoomList();
	ArrayList<Roomtype> getRoomType();
	void doDeleteRoom(int roomcode);
	void doAddRoom(String rname, String rtype, int howmany, int howmuch);
	void doUpdateRoom(int roomcode, String roomname, int roomtype, int howmany, int howmuch);
//	아래부터 예약 관련
	ArrayList<Bookinginfo> getBookingList();

	void doDeleteBook(int bookcode);
	void doAddBook(int roomcode, int person, String checkin, String checkout, String name, String mobile);
	void doUpdateBook(int bookcode, int roomcode, int person, String checkin, String checkout, String name,
			String mobile);
	ArrayList<Bookinginfo> getBookingListSearch(String checkin, String checkout);
	ArrayList<Roominfo> getRoomListSearch(String checkin, String checkout,int typecode);
	ArrayList<Roominfo> getRoomListSearchAll(String checkin, String checkout);

}
