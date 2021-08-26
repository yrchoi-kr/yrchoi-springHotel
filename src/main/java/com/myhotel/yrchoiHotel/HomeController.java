package com.myhotel.yrchoiHotel;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	@RequestMapping(value = "/newbie", method = RequestMethod.GET)
	public String newbie() {
		return "newbie";
	}
	@RequestMapping(value = "/hotelReservation", method = RequestMethod.GET)
	public String hotelReservation() {
		return "hotelReservation";
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
		return "hotelReservation";
	}
		
}
