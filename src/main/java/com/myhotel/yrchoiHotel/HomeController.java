package com.myhotel.yrchoiHotel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
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
}
