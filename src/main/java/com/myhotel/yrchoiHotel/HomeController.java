package com.myhotel.yrchoiHotel;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private SqlSession sqlSession;

	private HttpSession session;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "login";
	}
	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public String login(HttpServletRequest hsr, Model model) {
		session=hsr.getSession(true);
		String loginid = (String) session.getAttribute("loginid");
		System.out.println(loginid);
		model.addAttribute("loginid",loginid);
		iRoom room = sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> roominfo=room.getRoomList();
		model.addAttribute("list",roominfo);
		ArrayList<Roomtype> roomtype=room.getRoomType();
		System.out.println(roomtype);
	    model.addAttribute("Rtype",roomtype);
		
		return "room";
	}
	@RequestMapping(value = "/newbie", method = RequestMethod.GET)
	public String newbie() {
		return "newbie";
	}
	@RequestMapping(value = "/check_user", method = RequestMethod.POST)
	public String check_user(HttpServletRequest hsr,Model model) {
		String userid = hsr.getParameter("user_id");
		String passcode = hsr.getParameter("user_pw");
		iMember member=sqlSession.getMapper(iMember.class);
		int n=member.doCheckUser(userid,passcode);
		System.out.println(n);
		if(n>0) {
			HttpSession session=hsr.getSession();
			session.setAttribute("loginid", userid);
			String loginid = (String) session.getAttribute("loginid");
			System.out.println(loginid);
			return "redirect:/hotelReservation";
		} else {
			return "/login";
		}

	}
	@RequestMapping(value = "/hotelReservation", method = RequestMethod.GET)
	public String hotelReservation(HttpServletRequest hsr,Model model) {
		session=hsr.getSession(true);
		String loginid = (String) session.getAttribute("loginid");
		System.out.println(loginid);
		model.addAttribute("loginid",loginid);
		iRoom room = sqlSession.getMapper(iRoom.class);
		ArrayList<Roomtype> roomtype=room.getRoomType();
		System.out.println(roomtype);
	    model.addAttribute("Rtype",roomtype);
		return"hotelReservation";

	}
	@RequestMapping(value = "/newinfo", method = RequestMethod.GET)
	public String newinfo(HttpServletRequest hsr ,Model model) {
		String uid = hsr.getParameter("user_id");
		String upw = hsr.getParameter("user_pw");
		String uname = hsr.getParameter("user_name");
		String uemail = hsr.getParameter("email");
		model.addAttribute("user_id",uid);
		model.addAttribute("user_pw",upw);
		model.addAttribute("user_name",uname);
		model.addAttribute("user_email",uemail);
		return "login";
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String viewinfo(HttpServletRequest hsr) {
		session.invalidate();
		session=hsr.getSession();
		return "redirect:/";
	}
	@RequestMapping(value="/getRoomList",method=RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String getRoomList(HttpServletRequest hsr) {
		iRoom room=sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> roominfo=room.getRoomList();
		// 찾아진 데이터로 JSONArray만들기
		JSONArray ja = new JSONArray();
		for(int i=0;i<roominfo.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomcode",roominfo.get(i).getRoomcode());
			jo.put("roomname",roominfo.get(i).getRoomname());
			jo.put("typename",roominfo.get(i).getTypename());
			jo.put("howmany",roominfo.get(i).getHowmany());
			jo.put("howmuch",roominfo.get(i).getHowmuch());
			ja.add(jo);
		}
		return ja.toString();
	}
	@RequestMapping(value="/deleteRoom",method=RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteRoom(HttpServletRequest hsr) {
		int roomcode= Integer.parseInt(hsr.getParameter("roomcode"));
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doDeleteRoom(roomcode);
		return "ok";
	}
	@RequestMapping(value="/addRoom",method=RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String addRoom(HttpServletRequest hsr) {
		String rname=hsr.getParameter("roomname");
		String rtype=hsr.getParameter("roomtype");
		int howmany=Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch=Integer.parseInt(hsr.getParameter("howmuch"));
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doAddRoom(rname,rtype,howmany,howmuch);
		return "ok";
	}
	@RequestMapping(value="/updateRoom",method=RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateRoom(HttpServletRequest hsr) {
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doUpdateRoom(Integer.parseInt(hsr.getParameter("roomcode")),
				hsr.getParameter("roomname"),
				Integer.parseInt(hsr.getParameter("roomtype")),
				Integer.parseInt(hsr.getParameter("howmany")),
				Integer.parseInt(hsr.getParameter("howmuch")));
		return "ok";
	}
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String doSignin(HttpServletRequest hsr) {
		String username=hsr.getParameter("user_name");
		String userid=hsr.getParameter("user_id");
		String userpw=hsr.getParameter("user_pw");
		iMember member=sqlSession.getMapper(iMember.class);
		member.doSignin(username,userid,userpw);
		return "redirect:/";
	}
	
	@RequestMapping(value="/getBookingList",method=RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String getBookingList(HttpServletRequest hsr) {
		iRoom book=sqlSession.getMapper(iRoom.class);
		ArrayList<Bookinginfo> bookinfo=book.getBookingList();
		// 찾아진 데이터로 JSONArray만들기
		JSONArray ja2 = new JSONArray();
		for(int i=0;i<bookinfo.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("bookcode",bookinfo.get(i).getBookcode());
			jo.put("roomname",bookinfo.get(i).getRoomname());
			jo.put("roomcode",bookinfo.get(i).getRoomcode());
			jo.put("person",bookinfo.get(i).getPerson());
			jo.put("checkin",bookinfo.get(i).getCheckin());
			jo.put("checkout",bookinfo.get(i).getCheckout());
			jo.put("booker",bookinfo.get(i).getName());
			jo.put("mobile",bookinfo.get(i).getMobile());
			ja2.add(jo);

		}
//		System.out.println(ja2);
		return ja2.toString();
	}
	@RequestMapping(value="/deleteBooking",method=RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteBooking(HttpServletRequest hsr) {
		int bookcode= Integer.parseInt(hsr.getParameter("bookcode"));
		iRoom book=sqlSession.getMapper(iRoom.class);
		book.doDeleteBook(bookcode);
		return "ok";
	}
	@RequestMapping(value="/addBooking",method=RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String addBooking(HttpServletRequest hsr) {
		int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
		int person=Integer.parseInt(hsr.getParameter("person"));
		String checkin=hsr.getParameter("checkin");
		String checkout=hsr.getParameter("checkout");
		String name=hsr.getParameter("name");
		String mobile=hsr.getParameter("mobile");
		iRoom book=sqlSession.getMapper(iRoom.class);
		book.doAddBook(roomcode,person,checkin,checkout,name,mobile);
		return "ok";
	}
	@RequestMapping(value="/updateBooking",method=RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateBooking(HttpServletRequest hsr) {
		int bookcode=Integer.parseInt(hsr.getParameter("bookcode"));
		int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
		int person=Integer.parseInt(hsr.getParameter("person"));
		String checkin=hsr.getParameter("checkin");
		String checkout=hsr.getParameter("checkout");
		String name=hsr.getParameter("name");
		String mobile=hsr.getParameter("mobile");
		iRoom book=sqlSession.getMapper(iRoom.class);
		book.doUpdateBook(bookcode,roomcode,person,checkin,checkout,name,mobile);
		return "ok";
	}
	@RequestMapping(value="/getBookingListSearch",method=RequestMethod.POST,
			produces = "application/text; charset=utf8")
	@ResponseBody
	public String getBookingListSearch(HttpServletRequest hsr) {
		String checkin=hsr.getParameter("checkin");
		String checkout=hsr.getParameter("checkout");
		iRoom book=sqlSession.getMapper(iRoom.class);
		ArrayList<Bookinginfo> bookinfoR=book.getBookingListSearch(checkin, checkout);
		// 찾아진 데이터로 JSONArray만들기
		JSONArray ja3 = new JSONArray();
		for(int i=0;i<bookinfoR.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("bookcode",bookinfoR.get(i).getBookcode());
			jo.put("roomname",bookinfoR.get(i).getRoomname());
			jo.put("roomcode",bookinfoR.get(i).getRoomcode());
			jo.put("person",bookinfoR.get(i).getPerson());
			jo.put("checkin",bookinfoR.get(i).getCheckin());
			jo.put("checkout",bookinfoR.get(i).getCheckout());
			jo.put("booker",bookinfoR.get(i).getName());
			jo.put("mobile",bookinfoR.get(i).getMobile());
			ja3.add(jo);

		}
		return ja3.toString();
	}
	@RequestMapping(value="/getRoomListSearch",method=RequestMethod.POST,
				produces = "application/text; charset=utf8")
	@ResponseBody	
	public String getRoomListSearch(HttpServletRequest hsr) {
		String checkin=hsr.getParameter("checkin");
		String checkout=hsr.getParameter("checkout");
		int typecode=Integer.parseInt(hsr.getParameter("typecode"));
		iRoom room=sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> roominfoR=room.getRoomListSearch(checkin,checkout,typecode);
		// 찾아진 데이터로 JSONArray만들기
		JSONArray ja4 = new JSONArray();
		for(int i=0;i<roominfoR.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomcode",roominfoR.get(i).getRoomcode());
			jo.put("roomname",roominfoR.get(i).getRoomname());
			jo.put("typename",roominfoR.get(i).getTypename());
			jo.put("howmany",roominfoR.get(i).getHowmany());
			jo.put("howmuch",roominfoR.get(i).getHowmuch());
			ja4.add(jo);
		}
		return ja4.toString();
		
	}
@RequestMapping(value="/getRoomListSearchAll",method=RequestMethod.POST,
			produces = "application/text; charset=utf8")
@ResponseBody	
public String getRoomListSearchAll(HttpServletRequest hsr) {
	String checkin=hsr.getParameter("checkin");
	String checkout=hsr.getParameter("checkout");
	iRoom room=sqlSession.getMapper(iRoom.class);
	ArrayList<Roominfo> roominfoR=room.getRoomListSearchAll(checkin,checkout);
	// 찾아진 데이터로 JSONArray만들기
	JSONArray ja4 = new JSONArray();
	for(int i=0;i<roominfoR.size();i++) {
		JSONObject jo = new JSONObject();
		jo.put("roomcode",roominfoR.get(i).getRoomcode());
		jo.put("roomname",roominfoR.get(i).getRoomname());
		jo.put("typename",roominfoR.get(i).getTypename());
		jo.put("howmany",roominfoR.get(i).getHowmany());
		jo.put("howmuch",roominfoR.get(i).getHowmuch());
		ja4.add(jo);
	}
	return ja4.toString();
	
}
//	@RequestMapping(value="/check_id",method=RequestMethod.POST,
//			produces = "application/text; charset=utf8")
//	@ResponseBody
//	public String check_id(HttpServletRequest hsr) {
//		String userid=hsr.getParameter("user_id");
//		iMember member=sqlSession.getMapper(iMember.class);
//		// 찾아진 데이터로 JSONArray만들기
//		JSONArray ja = new JSONArray();
//		for(int i=0;i<roominfo.size();i++) {
//			JSONObject jo = new JSONObject();
//			jo.put("username",roominfo.get(i).getUsername());
//			ja.add(jo);
//		}
//
//		return ja.toString();
//	}
}
