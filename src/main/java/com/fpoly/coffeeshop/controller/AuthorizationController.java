package com.fpoly.coffeeshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthorizationController {

	@RequestMapping(value = "/403")
	public String show403Page() {
		return "403";
	}
	
}
