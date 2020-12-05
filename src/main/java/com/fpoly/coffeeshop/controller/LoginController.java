package com.fpoly.coffeeshop.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.coffeeshop.dto.CustomersDTO;
import com.fpoly.coffeeshop.dto.StaffDTO;
import com.fpoly.coffeeshop.dto.UserDTO;
import com.fpoly.coffeeshop.service.ICustomersService;
import com.fpoly.coffeeshop.service.IStaffService;
import com.fpoly.coffeeshop.service.IUserService;
import com.fpoly.coffeeshop.util.EmailUtil;
import com.fpoly.coffeeshop.util.URLUtil;

@Controller
public class LoginController {

	@Autowired
	private IUserService userService;
	
	@Autowired
	private IStaffService staffService;
	
	@Autowired
	private ICustomersService customersService;

	@Autowired
	private JavaMailSender mailSender;
	
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
	public String checkLogin(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		UserDTO userDTO = userService.checkLogin(username, password, false);
		
		if (userDTO != null) {
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("USER", userDTO);
			
			if (userDTO.getRoleCode().equals("admin")) {
				httpSession.setAttribute("INFO", staffService.findOne(username));
				
				return "redirect:/admin/dashboard";
			} else if (userDTO.getRoleCode().equals("cashier")) {
				httpSession.setAttribute("INFO", staffService.findOne(username));
				
				return "redirect:/admin/order/list?page=1";
			} else if (userDTO.getRoleCode().equals("user")) {
				httpSession.setAttribute("CUSTOMER", customersService.findOne1(username));
				
				return "redirect:/home";
			}
		} else {
			return "redirect:/login?message=message_login_fail&alert=danger";
		}

		return "redirect:/login?message=message_login_fail&alert=danger";
	}
	
	@RequestMapping(value = "/registration")
	public String showSignUpPage(HttpServletRequest request) {
		String domain = URLUtil.getBaseURL(request) + "/api";
		
		request.setAttribute("domain", domain);
		return "register";
	}
	
	@RequestMapping(value = "/register")
	public String register(HttpServletRequest request) {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String fullname = request.getParameter("fullname");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		
		UserDTO userDTO = new UserDTO();
		userDTO.setFlagDelete(false);
		userDTO.setPassword(password);
		userDTO.setRoleCode("user");
		userDTO.setUsername(username);
		
		CustomersDTO customersDTO = new CustomersDTO();
		customersDTO.setAddress("");
		customersDTO.setEmail(email);
		customersDTO.setFlagDelete(false);
		customersDTO.setFullname(fullname);
		customersDTO.setPhone(phone);
		customersDTO.setUsername(username);
		
		Boolean resultUser = userService.insert(userDTO);
		
		if (resultUser) {
			Boolean resultCustomer = customersService.insert(customersDTO);
			
			if (resultCustomer) {
				return "redirect:/login?message=message_registion_success&alert=success";
			} else {
				return "redirect:/login?message=message_registion_fail&alert=danger";
			}
		}
		
		return "redirect:/registration";
	}

	@RequestMapping(value = "/get_password")
	public String forgetPassword(HttpServletRequest request) {
		String username = request.getParameter("username");
		String email = "";
		
		UserDTO userDTO = userService.findOne(username);
		String password = RandomStringUtils.randomAlphanumeric(15);
		String text = "Mật khẩu mới của bạn là: " + password + "<br> <b>Vui lòng đổi lại mật khẩu để tăng tính bảo mật!</b>";
		
		userDTO.setPassword(password);
		
		if (userDTO.getRoleCode().equals("user")) {
			CustomersDTO customersDTO = customersService.findOne1(username);
			
			email = customersDTO.getEmail();
		} else {
			StaffDTO staffDTO = staffService.findOne(username);
			
			email = staffDTO.getEmail();
		}
		
		if (userService.update(userDTO)) {
			EmailUtil.sendSimpleMessage(email, "Mật khẩu mới", text, mailSender);
		}
		
		return "redirect:/login?message=message_forget_password_send_mail&alert=success";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession httpSession = request.getSession();
		httpSession.removeAttribute("USER");
		httpSession.removeAttribute("INFO");;
		httpSession.removeAttribute("CUSTOMER");;
		
		Cookie cookie = new Cookie("_uid", "");
		cookie.setMaxAge(-1);
		response.addCookie(cookie);
		
		return "redirect:/home";
	}

}
