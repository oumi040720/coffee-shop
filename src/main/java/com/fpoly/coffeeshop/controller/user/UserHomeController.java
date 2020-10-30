package com.fpoly.coffeeshop.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserHomeController {

	@RequestMapping(value = "/home")
	public String showHomePage(HttpServletRequest request) {
		return "user/home";
	}

}
