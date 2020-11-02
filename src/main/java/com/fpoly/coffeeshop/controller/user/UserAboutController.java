package com.fpoly.coffeeshop.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserAboutController {

	@RequestMapping(value = "/about")
	public String showAboutPage(HttpServletRequest request) {
		return "user/about";
	}
	
}
