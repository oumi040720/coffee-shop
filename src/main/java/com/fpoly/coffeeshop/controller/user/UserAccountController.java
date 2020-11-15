package com.fpoly.coffeeshop.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.coffeeshop.dto.CustomersDTO;
import com.fpoly.coffeeshop.dto.UserDTO;
import com.fpoly.coffeeshop.service.ICustomersService;
import com.fpoly.coffeeshop.service.IUserService;
import com.fpoly.coffeeshop.util.DecryptionUtil;

@Controller
public class UserAccountController {

	@Autowired
	private IUserService userService;
	
	@Autowired
	private ICustomersService customersService;
	
	@RequestMapping(value = "/account")
	public String showAccountPage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");
		
		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}
		
		return "user/account";
	}
	
	@RequestMapping(value = "/change_password")
	public String changePassword(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO) session.getAttribute("USER");
		
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		
		String password = userService.getP(user.getUsername());
		String decryption = DecryptionUtil.decryption(password);

		
		if (decryption.equals(oldPassword)) {
			user.setPassword(newPassword);
			
			Boolean isChangePassword = userService.update(user);
			
			if (isChangePassword) {
				user.setPassword("");
				session.setAttribute("USER", user);
				
				return "redirect:/account?message=message_change_password_success&alert=success";
			} else {
				return "redirect:/account?message=message_change_password_fail&alert=danger";
			}
		} else {
			return "redirect:/account?message=message_old_password_invail&alert=danger";
		}
	}
	
	@RequestMapping(value = "/change_info")
	public String changeAccountInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		CustomersDTO customer = (CustomersDTO) session.getAttribute("CUSTOMER");
		
		String fullname = request.getParameter("fullname");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		customer.setAddress(address);
		customer.setEmail(email);
		customer.setFullname(fullname);
		customer.setPhone(phone);
		
		Boolean isChangeInfo = customersService.update(customer);
		
		if (isChangeInfo) {
			session.setAttribute("CUSTOMER",customer);
			
			return "redirect:/account?message=message_change_info_success&alert=success";	
		} else {
			return "redirect:/account?message=message_change_info_fail&alert=danger";	
		}
	}
	
}
