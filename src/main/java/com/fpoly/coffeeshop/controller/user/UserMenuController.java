package com.fpoly.coffeeshop.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.coffeeshop.service.IProductService;
import com.fpoly.coffeeshop.util.DomainUtil;

@Controller
public class UserMenuController {

	@Autowired
	private IProductService productService;

	private String getDomain() {
		return DomainUtil.getDoamin();
	}

	@RequestMapping(value = "/menu")
	public String showMenuPage(HttpServletRequest request) {
		request.setAttribute("PRODUCTS", productService.findAllByFlagDeleteIs(false, 0, 12));
		request.setAttribute("PRODUCTS_TOTAL_PAGES", productService.getTotalPages(false, 0, 12));
		request.setAttribute("domain", getDomain());

		return "user/products";
	}

}
