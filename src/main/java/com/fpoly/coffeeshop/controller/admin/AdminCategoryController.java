package com.fpoly.coffeeshop.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.coffeeshop.dto.CategoryDTO;
import com.fpoly.coffeeshop.service.ICategoryService;
import com.fpoly.coffeeshop.util.DomainUtil;

@Controller
@RequestMapping(value = "/admin/category")
public class AdminCategoryController {
	private String getDomain() {
		return DomainUtil.getDoamin();
	}

	@Autowired
	private ICategoryService categoryService;

	@RequestMapping(value = "/list")
	public String showListPage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");

		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}

		request.setAttribute("categories", categoryService.findAllByFlagDelete(false));
		request.setAttribute("isBin", false);
		
		return "admin/category/list";
	}
	
	@RequestMapping(value = "/bin/list")
	public String showBinListPage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");

		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}

		request.setAttribute("categories", categoryService.findAllByFlagDelete(true));
		request.setAttribute("isBin", true);
		
		return "admin/category/list";
	}

	@RequestMapping(value = "/add")
	public String showAddPage(Model model) {
		model.addAttribute("check", false);
		model.addAttribute("category", new CategoryDTO());
		model.addAttribute("domain", getDomain());
		return "admin/category/edit";
	}

	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("category_code") String categoryCode) {
		model.addAttribute("check", true);
		model.addAttribute("category", categoryService.findOne(categoryCode));
		model.addAttribute("domain", getDomain());

		return "admin/category/edit";
	}

	@RequestMapping(value = "/save")
	public String save(Model model, @ModelAttribute CategoryDTO categoryDTO) {
		String message = "";
		String alert = "danger";

		categoryDTO.setFlagDelete(false);

		if (categoryDTO.getId() == null) {
			Boolean result = categoryService.insert(categoryDTO);
			if (result) {
				message = "message_category_insert_success";
				alert = "success";
			} else {
				message = "message_category_insert_fail";
			}
		} else {
			Boolean result = categoryService.update(categoryDTO);
			if (result) {
				message = "message_category_update_success";
				alert = "success";
			} else {
				message = "message_category_update_fail";
				alert = "danger";
			}
		}

		model.addAttribute("message", message);
		model.addAttribute("alert", alert);

		return "redirect:/admin/category/list?message=" + message + "&alert=" + alert;
	}

	@RequestMapping(value = "/delete")
	public String delete(Model model, @RequestParam("category_code") String categoryCode) {
		String message = "";
		String alert = "danger";

		CategoryDTO categoryDTO = categoryService.findOne(categoryCode);
		categoryDTO.setFlagDelete(true);

		Boolean result = categoryService.update(categoryDTO);

		if (result) {
			message = "message_category_delete_success";
			alert = "success";
		} else {
			message = "message_cayegory_update_fail";
			alert = "danger";
		}

		return "redirect:/admin/category/list?message=" + message + "&alert=" + alert;
	}
	
	@RequestMapping(value = "/restore")
	public String restore(Model model, @RequestParam("category_code") String categoryCode) {
		String message = "";
		String alert = "danger";

		CategoryDTO categoryDTO = categoryService.findOne(categoryCode);
		categoryDTO.setFlagDelete(false);

		Boolean result = categoryService.update(categoryDTO);

		if (result) {
			message = "message_category_restore_success";
			alert = "success";
		} else {
			message = "message_cayegory_restore_fail";
			alert = "danger";
		}

		return "redirect:/admin/category/bin/list?message=" + message + "&alert=" + alert;
	}

}
