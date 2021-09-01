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
	private SqlSession sqlSession2;
	private HttpSession session;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "login";
	}
	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public String login(Model model) {
		String loginid = (String) session.getAttribute("loginid");
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
		String uid = hsr.getParameter("user_id");
		if(uid==null) {
			return "redirect:/login";
		}
		session=hsr.getSession();
		session.setAttribute("loginid", uid);
		model.addAttribute("loginid",uid);

		return "redirect:/hotelReservation";
	}
	@RequestMapping(value = "/hotelReservation", method = RequestMethod.GET)
	public String hotelReservation() {
		String loginid = (String) session.getAttribute("loginid");
		if(loginid.equals("yr")){
			return"hotelReservation";
		}else {
			return "redirect:/login";
		}
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
	@RequestMapping(value = "/viewinfo", method = RequestMethod.GET)
	public String viewinfo(HttpServletRequest hsr,Model model) {
		String uid = hsr.getParameter("user_id");
		String upw = hsr.getParameter("user_pw");
		model.addAttribute("user_id",uid);
		model.addAttribute("user_pw",upw);

		return "viewinfo";
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
	
}
