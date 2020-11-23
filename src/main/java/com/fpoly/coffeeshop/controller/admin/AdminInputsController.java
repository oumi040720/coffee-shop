package com.fpoly.coffeeshop.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.fpoly.coffeeshop.dto.InputDTO;
import com.fpoly.coffeeshop.service.IInputService;
import com.fpoly.coffeeshop.util.DomainUtil;

@Controller
@RequestMapping(value = "/admin/input")
public class AdminInputsController {
	
	private String getDomain() {
		return DomainUtil.getDoamin();
	}
	@Autowired
	private IInputService inputService;
	@RequestMapping(value = "/list")
	public String showListPage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");
		
		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}
		
		request.setAttribute("input", inputService.findAllbyFlagDelete(false));
		
		return "admin/input/list";
	}
	
	@RequestMapping(value = "/add")
	public String showAddPage(Model model) {
		model.addAttribute("check", false);
		model.addAttribute("input", new InputDTO());
		model.addAttribute("domain", getDomain());
		
		return "admin/input/edit";
	}
	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("input_id") Integer id) {
		model.addAttribute("check", true);
		model.addAttribute("input", inputService.findOne(id));
		model.addAttribute("domain", getDomain());
		
		return "admin/input/edit";
	}
	
	
	@RequestMapping(value = "/save")
	public String save(Model model, @ModelAttribute InputDTO inputDTO) {
		String message = "";
		String alert = "danger";
		
		inputDTO.setFlagDelete(false);
		
		if (inputDTO.getId() == null) {
			Boolean result = inputService.insert(inputDTO);
			if (result) {
				message = "message_input_insert_success";
				alert = "success";
			} else {
				message = "message_input_insert_fail";
			}
		} else {
			Boolean result = inputService.update(inputDTO);
			if (result) {
				message = "message_input_update_success";
				alert = "success";
			} else {
				message = "message_input_update_fail";
				alert = "danger";
			}
		}
		  
		model.addAttribute("message", message);
		model.addAttribute("alert", alert);
		
		return "redirect:/admin/input/list?message=" + message + "&alert=" + alert;
	}
	@RequestMapping(value = "/delete")
	public String delete(Model model, @RequestParam("input_id") Integer id) {
		String message = "";
		String alert = "danger";
		
		InputDTO inputDTO = inputService.findOne(id);
		inputDTO.setFlagDelete(true);
		
		Boolean result = inputService.update(inputDTO);
		
		if (result) {
			message = "message_input_delete_success";
			alert = "success";
		} else {
			message = "message_input_update_fail";
			alert = "danger";
		}
		return "redirect:/admin/input/list?message=" + message + "&alert=" + alert;
	}
	
	
	
	
}
