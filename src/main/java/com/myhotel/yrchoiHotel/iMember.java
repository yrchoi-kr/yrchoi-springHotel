package com.myhotel.yrchoiHotel;

import java.util.ArrayList;

public interface iMember {
	void doSignin(String username, String userid, String userpw);
	int doCheckUser(String userid, String passcode);
}
