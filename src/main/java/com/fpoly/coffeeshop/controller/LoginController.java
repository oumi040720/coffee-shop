package com.fpoly.coffeeshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.coffeeshop.dto.CustomersDTO;
import com.fpoly.coffeeshop.dto.UserDTO;
import com.fpoly.coffeeshop.service.ICustomersService;
import com.fpoly.coffeeshop.service.IStaffService;
import com.fpoly.coffeeshop.service.IUserService;
import com.fpoly.coffeeshop.util.DomainUtil;

@Controller
public class LoginController {

	@Autowired
	private IUserService userService;
	
	@Autowired
	private IStaffService staffService;
	
	@Autowired
	private ICustomersService customersService;

	private String getDomain() {
		return DomainUtil.getDoamin();
	}
	
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
		request.setAttribute("domain", getDomain());
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

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		httpSession.removeAttribute("USER");;
		
		return "redirect:/home";
	}

}
