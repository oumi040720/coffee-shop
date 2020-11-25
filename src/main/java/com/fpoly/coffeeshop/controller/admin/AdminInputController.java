package com.fpoly.coffeeshop.controller.admin;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.coffeeshop.dto.CustomersDTO;
import com.fpoly.coffeeshop.dto.InputDTO;
import com.fpoly.coffeeshop.service.impl.InputService;

@Controller
@RequestMapping(value="/admin/input")
public class AdminInputController {
	
	@Autowired private InputService inputService;
	
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
		request.setAttribute("totalPages", inputService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("input", inputService.findAllByFlagDelete(flagDelete, page-1, limit));
		return "admin/input/list";
	}

	@RequestMapping(value = "/bin/list")
	public String showBinListPage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");

		int page = Integer.parseInt(request.getParameter("page"));
		int limit = 10;
		boolean flagDelete = true;

		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}

		request.setAttribute("isBin", true);
		
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages", inputService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("orders", inputService.findAllByFlagDelete(flagDelete, page - 1, limit));
		
		return "admin/input/list";
	}
	
	@RequestMapping(value = "/add")
	public String showAddPage(Model model) {

		model.addAttribute("input",inputService.findAllByFlagDelete(false));
		model.addAttribute("check", false);
		model.addAttribute("orders", new CustomersDTO());

		return "admin/input/edit";
	}
	
	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("id") Long id) {
		model.addAttribute("input",inputService.findAllByFlagDelete(false));
		model.addAttribute("check", true);

		return "admin/order/edit";
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/save")
	public String save(Model model, @ModelAttribute InputDTO inputDTO) {
		
		String message = "";
		String alert = "danger";
		
		Date date =new Date(System.currentTimeMillis());
		inputDTO.setFlagDelete(false);;
		inputDTO.setInputDate(date);
		InputDTO result = inputService.insert(inputDTO);
		if (result != null) {			
			
			if (result != null) {
				message = "message_input_insert_success";
				alert = "success";
			} else {
				message = "message_input_insert_fail";
				alert = "danger";
			}
		}  
		return "redirect:/admin/inputDetail/add?inputID="+ result.getId();
	}
	
	@RequestMapping(value = "/delete")
	public String delete(Model model, @RequestParam("id") Long id){
		String message = "";
		String alert = "danger";
		
		InputDTO input = inputService.findOne(id);		
		input.setFlagDelete(true);
		Boolean result = inputService.update(input);	
		if (result) {
			message = "message_orderdetail_delete_success";
			alert = "success";
		} else {
			message = "message_orderdetail_delete_fail";
			alert = "danger";
		}

		return "redirect:/admin/input/list?page=1&message=" + message + "&alert=" + alert;
	}
	
	@RequestMapping(value = "/restore")
	public String restore(@RequestParam("id") Long id) {
		String message = "";
		String alert = "danger";
		
		InputDTO inputDTO = inputService.findOne(id);
		
		inputDTO.setFlagDelete(false);
		
		Boolean result = inputService.update(inputDTO);
		
		if (result) {
			message = "message_order_restore_success";
			alert = "success";
		} else {
			message = "message_order_restore_fail";
			alert = "danger";
		}
		
		return "redirect:/admin/input/bin/list?page=1&message=" + message + "&alert=" + alert;
	}
}
