package com.fpoly.coffeeshop.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.coffeeshop.dto.IngredientsDTO;
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
		model.addAttribute("check", false);
		model.addAttribute("ingredient", new IngredientsDTO());
		model.addAttribute("domain", getDomain());
		
		return "admin/ingredients/edit";
	}
	@RequestMapping(value = "/save")
	public String save(Model model, @ModelAttribute IngredientsDTO ingredientsDTO) {
		String message = "";
		String alert = "danger";
		
		ingredientsDTO.setFlagDelete(false);
		
		if (ingredientsDTO.getId() == null) {
			Boolean result = ingredientService.insert(ingredientsDTO);
			if (result) {
				message = "message_ingredient_insert_success";
				alert = "success";
			} else {
				message = "message_ingredient_insert_fail";
			}
		} else {
			Boolean result = ingredientService.update(ingredientsDTO);
			if (result) {
				message = "message_ingredient_update_success";
				alert = "success";
			} else {
				message = "message_ingredient_update_fail";
				alert = "danger";
			}
		}
		 
		model.addAttribute("message", message);
		model.addAttribute("alert", alert);
		
		return "redirect:/admin/ingredient/list?message=" + message + "&alert=" + alert;
	}
	@RequestMapping(value = "/delete")
	public String delete(Model model, @RequestParam("name") String name) {
		String message = "";
		String alert = "danger";
		
		IngredientsDTO ingredientsDTO = ingredientService.findOne(name);
		ingredientsDTO.setFlagDelete(true);
		
		Boolean result = ingredientService.update(ingredientsDTO);
		
		if (result) {
			message = "message_ingredient_delete_success";
			alert = "success";
		} else {
			message = "message_ingredient_update_fail";
			alert = "danger";
		}
		return "redirect:/admin/ingredient/list?message=" + message + "&alert=" + alert;
	}
	

}



























