package com.fpoly.coffeeshop.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserContactController {

	@RequestMapping(value = "/contact")
	public String showHomePage(HttpServletRequest request) {
		return "user/contact";
	}
	
}
