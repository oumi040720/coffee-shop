package com.fpoly.coffeeshop.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.coffeeshop.service.ICategoryService;
import com.fpoly.coffeeshop.service.IProductService;

@Controller
public class UserMenuController {

	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private IProductService productService;
	
	@RequestMapping(value = "/menu")
	public String showMenuPage(HttpServletRequest request) {
		request.setAttribute("products", productService.findAllByFlagDeleteIs(false, 0, 12));
		
		return "user/products";
	}
	
}
