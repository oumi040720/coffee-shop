package com.fpoly.coffeeshop.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.coffeeshop.service.IIngredientService;
import com.fpoly.coffeeshop.util.DomainUtil;

@Controller
@RequestMapping(value = "/admin/ingredient")
public class AdminIngredientController {
	private String getDomain() {
		return DomainUtil.getDoamin();
	}
	@Autowired
	private IIngredientService ingredientService;
	@RequestMapping(value = "/list")
	public String showListPage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");

		int page = Integer.parseInt(request.getParameter("page"));
		int limit = 10;
		boolean flagDelete = false;

		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}

		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages", ingredientService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("customers", ingredientService.findAllByFlagDelete(flagDelete, page-1, limit));
		
		return "admin/ingredients/list";
	}
	@RequestMapping(value = "/add")
	public String showPage(Model model) {
//		model.addAttribute("")
		
		
		return "admin/ingredients/edit";
		
	}
	

}
