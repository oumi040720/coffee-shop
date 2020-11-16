package com.fpoly.coffeeshop.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.fpoly.coffeeshop.service.ICategoryService;

public class CategoryUtil {

	public static void setCategory(HttpServletRequest request, ICategoryService categoryService) {
		HttpSession session = request.getSession();
		
		if (session.getAttribute("CATEGORIES") == null) {
			request.setAttribute("CATEGORIES", categoryService.findAllByFlagDelete(false));
		}
	}
	
}
