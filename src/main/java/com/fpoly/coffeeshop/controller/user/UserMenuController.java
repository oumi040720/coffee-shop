package com.fpoly.coffeeshop.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.coffeeshop.service.ICategoryService;
import com.fpoly.coffeeshop.service.IProductService;
import com.fpoly.coffeeshop.util.CategoryUtil;
import com.fpoly.coffeeshop.util.URLUtil;

@Controller
public class UserMenuController {

	@Autowired
	private IProductService productService;

	@Autowired
	private ICategoryService categoryService;
	
	@RequestMapping(value = "/menu")
	public String showMenuPage(HttpServletRequest request) {
		CategoryUtil.setCategory(request, categoryService);
		
		String domain = URLUtil.getBaseURL(request) + "/api";
		
		request.setAttribute("PRODUCTS", productService.findAllByFlagDeleteIs(false, 0, 12));
		request.setAttribute("PRODUCTS_TOTAL_PAGES", productService.getTotalPages(false, 0, 12));
		request.setAttribute("domain", domain);

		return "user/products";
	}
	
	@RequestMapping(value = "/menu/{categoryCode}")
	public String showMenuPageByCategory(@PathVariable("categoryCode") String categoryCode, HttpServletRequest request) {
		CategoryUtil.setCategory(request, categoryService);
		
		String domain = URLUtil.getBaseURL(request) + "/api";
		
		request.setAttribute("categoryCode", categoryCode);
		request.setAttribute("PRODUCTS", productService.findAllByFlagDeleteAndCategoryCode(false, categoryCode, 0, 12));
		request.setAttribute("PRODUCTS_TOTAL_PAGES", productService.getTotalPagesByFlagDeleteAndCategoryCode(false, categoryCode,  0, 12));
		request.setAttribute("domain", domain);

		return "user/products";
	}

}
