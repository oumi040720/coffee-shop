package com.fpoly.coffeeshop.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.coffeeshop.dto.CustomersDTO;
import com.fpoly.coffeeshop.service.ICustomersService;
import com.fpoly.coffeeshop.service.IUserService;

@Controller
@RequestMapping(value = "/admin/customers")
public class AdminCustomersController {
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private ICustomersService customersService;

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
		request.setAttribute("totalPages", customersService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("customers", customersService.findAllByFlagDelete(flagDelete, page-1, limit));
		
		return "admin/customers/list";
	}
	
	@RequestMapping(value = "/add")
	public String showAddPage(Model model) {
		model.addAttribute("users", userService.findAllByFlagDelete(false));
		model.addAttribute("check", false);
		model.addAttribute("customers", new CustomersDTO());
		
		return "admin/customers/edit";
	}
	
	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("id") Long id) {
		model.addAttribute("users", userService.findAllByFlagDelete(false));
		model.addAttribute("check",true);
		model.addAttribute("customers",customersService.findOne(id));
		
		return "admin/customers/edit";
	}
	
	@RequestMapping(value = "/save")
	public String save(@ModelAttribute CustomersDTO customersDTO) {
		String message = "";
		String alert = "danger";
		
		customersDTO.setFlagDelete(false);
		
		if (customersDTO.getId() == null) {

			Boolean result = customersService.insert(customersDTO);
			
			if (result != null) {
				message = "message_customers_insert_success";
				alert = "success";
			} else {
				message = "message_customers_insert_fail";
				alert = "danger";
			}
		} else {
			Boolean result = customersService.update(customersDTO);
			
			if (result != null) {
				message = "message_customers_update_success";
				alert = "success";
			} else {
				message = "message_customers_update_fail";
				alert = "danger";
			}		
		}
		
		return "redirect:/admin/customers/list?page=1&message=" + message + "&alert=" + alert;
	}

	@RequestMapping(value = "/delete")
	public String delete(Model model, @RequestParam("id") Long id) {
		String message = "";
		String alert = "danger";
		
		CustomersDTO customersDTO = customersService.findOne(id);
		
		customersDTO.setFlagDelete(true);
		 
		Boolean result = customersService.update(customersDTO);
		
		if (result) {
			message = "message_customers_delete_success";
			alert = "success";
		} else {
			message = "message_customers_delete_fail";
			alert = "danger";
		}
		
		return "redirect:/admin/customers/list?page=1&message=" + message + "&alert=" + alert;
	}
	
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(Model model, HttpServletRequest request) {
		String key = request.getParameter("key");
		
		return "redirect:/admin/customers/search?key=" + key + "&page=1";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String showSearchPage(HttpServletRequest request) {
		String key = request.getParameter("key");
		int page = Integer.parseInt(request.getParameter("page"));
		int limit = 10;
		boolean flagDelete = false;
		
		request.setAttribute("key", key);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages", customersService.getTotalPagesByFlagDeleteAndKey(flagDelete, key, page, limit));
		request.setAttribute("customers", customersService.findAllByFlagDeleteAndKey(flagDelete, key, page - 1, limit));
		return "admin/customers/search";
	}
}
