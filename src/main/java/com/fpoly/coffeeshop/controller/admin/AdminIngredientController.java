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
import com.fpoly.coffeeshop.service.IUnitService;
import com.fpoly.coffeeshop.util.URLUtil;

@Controller
@RequestMapping(value = "/admin/ingredient")
public class AdminIngredientController {
	
	@Autowired
	private IIngredientService ingredientService;
	
	@Autowired
	private IUnitService unitService;
	
	@RequestMapping(value = "/list")
	public String showListPage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");

		int limit = 10;
		boolean flagDelete = false;
		int page = Integer.parseInt(request.getParameter("page"));
		
		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}

		request.setAttribute("isBin", false);
		
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages", ingredientService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("ingredients", ingredientService.findAllByFlagDelete(flagDelete, page - 1, limit));
		
		return "admin/ingredient/list";
	}
	
	@RequestMapping(value = "/bin/list")
	public String showBinListPage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");
		
		int limit = 10;
		boolean flagDelete = true;
		int page = Integer.parseInt(request.getParameter("page"));
		
		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}

		request.setAttribute("isBin", true);
		
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages", ingredientService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("ingredients", ingredientService.findAllByFlagDelete(flagDelete, page - 1, limit));
		
		return "admin/ingredient/list";
	}
	
	@RequestMapping(value = "/add")
	public String showPage(Model model, HttpServletRequest request) {
		String domain = URLUtil.getBaseURL(request) + "/api";
		
		model.addAttribute("check", false);
		model.addAttribute("ingredient", new IngredientsDTO());
		model.addAttribute("units", unitService.findAll());
		model.addAttribute("domain", domain);
		
		return "admin/ingredient/edit";
	}
	
	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("id") Integer id, HttpServletRequest request) {
		String domain = URLUtil.getBaseURL(request) + "/api";
		
		model.addAttribute("check", true);
		model.addAttribute("ingredient", ingredientService.findOne(id));
		model.addAttribute("units", unitService.findAll());
		model.addAttribute("domain", domain);
		
		return "admin/ingredient/edit";
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
		
		return "redirect:/admin/ingredient/list?page=1&message=" + message + "&alert=" + alert;
	}
	
	@RequestMapping(value = "/delete")
	public String delete(Model model, @RequestParam("id") Integer id) {
		String message = "";
		String alert = "danger";
		
		IngredientsDTO ingredientsDTO = ingredientService.findOne(id);
		ingredientsDTO.setFlagDelete(true);
		
		Boolean result = ingredientService.update(ingredientsDTO);
		
		if (result) {
			message = "message_ingredient_delete_success";
			alert = "success";
		} else {
			message = "message_ingredient_update_fail";
			alert = "danger";
		}
		return "redirect:/admin/ingredient/list?page=1&message=" + message + "&alert=" + alert;
	}
	
	@RequestMapping(value = "/restore")
	public String restore(Model model, @RequestParam("id") Integer id) {
		String message = "";
		String alert = "danger";
		
		IngredientsDTO ingredientsDTO = ingredientService.findOne(id);
		ingredientsDTO.setFlagDelete(false);
		
		Boolean result = ingredientService.update(ingredientsDTO);
		
		if (result) {
			message = "message_ingredient_restore_success";
			alert = "success";
		} else {
			message = "message_ingredient_restore_fail";
			alert = "danger";
		}
		
		return "redirect:/admin/ingredient/bin/list?page=1&message=" + message + "&alert=" + alert;
	}

}
