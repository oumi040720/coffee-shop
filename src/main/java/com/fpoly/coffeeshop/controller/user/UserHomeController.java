package com.fpoly.coffeeshop.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.coffeeshop.service.ICategoryService;
import com.fpoly.coffeeshop.util.CategoryUtil;

@Controller
public class UserHomeController {

	@Autowired
	private ICategoryService categoryService;
	
	@RequestMapping(value = "/home")
	public String showHomePage(HttpServletRequest request) {
		CategoryUtil.setCategory(request, categoryService);
		
		return "user/home";
	}

}
