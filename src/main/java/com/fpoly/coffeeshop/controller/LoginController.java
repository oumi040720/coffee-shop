package com.fpoly.coffeeshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.coffeeshop.dto.UserDTO;
import com.fpoly.coffeeshop.service.IStaffService;
import com.fpoly.coffeeshop.service.IUserService;

@Controller
public class LoginController {

	@Autowired
	private IUserService userService;
	
	@Autowired
	private IStaffService staffService;

	@RequestMapping(value = "/login")
	public String showLoginPage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");

		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}

		return "login";
	}

	@RequestMapping(value = "/check_login")
	public String checkLogin(HttpServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		UserDTO userDTO = userService.checkLogin(username, password, false);

		
		if (userDTO != null) {
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("USER", userDTO);
			httpSession.setAttribute("INFO", staffService.findOne(username));

			if (userDTO.getRoleCode().equals("admin")) {
				return "redirect:/admin/dashboard";
			} else if (userDTO.getRoleCode().equals("cashier")) {
				return "redirect:/admin/order/list?page=1";
			} else if (userDTO.getRoleCode().equals("user")) {
				return "redirect:/home";
			}
		} else {
			return "redirect:/login?message=message_login_fail&alert=danger";
		}

		return "redirect:/login?message=message_login_fail&alert=danger";
	}

	@RequestMapping(value = "/registration")
	public String showSignUpPage() {
		return "register";
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		httpSession.removeAttribute("USER");;
		
		return "redirect:/home";
	}

}
