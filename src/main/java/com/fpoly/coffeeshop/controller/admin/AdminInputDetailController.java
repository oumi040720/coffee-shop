package com.fpoly.coffeeshop.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.coffeeshop.dto.InputDetailDTO;
import com.fpoly.coffeeshop.service.impl.IngredientService;
import com.fpoly.coffeeshop.service.impl.InputDetailService;
import com.fpoly.coffeeshop.service.impl.UnitsService;

@Controller
@RequestMapping(value="/admin/inputDetail")
public class AdminInputDetailController {

	@Autowired private InputDetailService inputdetailService;
	
	@Autowired private UnitsService unitsService;
	
	@Autowired private IngredientService ingredientService;
	
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
		
		request.setAttribute("isBin", false);
		
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages", inputdetailService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("inputdetail", inputdetailService.findAllByFlagDelete(flagDelete, page-1, limit));
		return "admin/input/list";
	}
	
	@RequestMapping(value = "/add")
	public String showAddPage(Model model, HttpServletRequest request) {
		String inpID = request.getParameter("inputID");
		long id = Long.parseLong(inpID);
		model.addAttribute("inputID",id);
		model.addAttribute("check", false);
		model.addAttribute("inputdetail", new InputDetailDTO());
		model.addAttribute("unit", unitsService.findAll());
		model.addAttribute("ingredient", ingredientService.findAll());
		return "admin/input/edit";
	}
	
	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("id") Long id) {
		model.addAttribute("inputdetail",inputdetailService.findAllByFlagDelete(false));
		model.addAttribute("check", true);

		return "admin/input/edit";
	}
	
	@RequestMapping(value = "/save")
	public String save(Model model, @ModelAttribute InputDetailDTO inputdetailDTO , @RequestParam(value = "inputID") Long inputID){
		String message = "";
		String alert = "danger";
		inputdetailDTO.setInputID(inputID);
		inputdetailDTO.setFlagDelete(false);
		if (inputdetailDTO.getId() == null) {			
			Boolean result = inputdetailService.insert(inputdetailDTO);
			if (result != null) {
				message = "message_inputdetail_insert_success";
				alert = "success";
			} else {
				message = "message_inputdetail_insert_fail";
				alert = "danger";
			}
		}
		return "redirect:/admin/inputDetail/list?page=1&message=" + message + "&alert=" + alert;
	}
	
	@RequestMapping(value = "/delete")
	public String delete(Model model, @RequestParam("id") Long id){
		String message = "";
		String alert = "danger";
		
		InputDetailDTO inputDetailDTO = inputdetailService.findOne(id);		
		inputDetailDTO.setFlagDelete(true);
		Boolean result = inputdetailService.update(inputDetailDTO);	
		if (result) {
			message = "message_orderdetail_delete_success";
			alert = "success";
		} else {
			message = "message_orderdetail_delete_fail";
			alert = "danger";
		}

		return "redirect:/admin/input/list?page=1&message=" + message + "&alert=" + alert;
	}
	
}
