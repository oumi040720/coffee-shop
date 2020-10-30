package com.fpoly.coffeeshop.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminDashBoardController {

	@RequestMapping(value = "/admin/dashboard")
	public String showPage(HttpServletRequest request) {
		return "admin/dashboard";
	}

}
