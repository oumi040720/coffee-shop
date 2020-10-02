package com.fpoly.coffeeshop.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.coffeeshop.dto.RoleDTO;
import com.fpoly.coffeeshop.service.IRoleService;
import com.fpoly.coffeeshop.util.DomainUtil;

@Controller
@RequestMapping(value = "/admin/role")
public class AdminRoleController {
	
	private String getDomain() {
		return DomainUtil.getDoamin();
	}
	
	@Autowired
	private IRoleService roleService;
	
	@RequestMapping(value = "/list")
	public String showListPage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");
		
		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}
		
		request.setAttribute("roles", roleService.findAll());
		
		return "admin/role/list";
	}
	
	@RequestMapping(value = "/add")
	public String showAddPage(Model model) {
		model.addAttribute("check", false);
		model.addAttribute("role", new RoleDTO());
		model.addAttribute("domain", getDomain());
		
		return "admin/role/edit";
	}
	
	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("role_code") String roleCode) {
		model.addAttribute("check", true);
		model.addAttribute("role", roleService.findOne(roleCode));
		model.addAttribute("domain", getDomain());
		
		return "admin/role/edit";
	}
	
	@RequestMapping(value = "/save")
	public String save(Model model, @ModelAttribute RoleDTO roleDTO) {
		String message = "";
		String alert = "danger";
		
		roleDTO.setFlagDelete(false);
		
		if (roleDTO.getId() == null) {
			Boolean result = roleService.insert(roleDTO);
			
			if (result) {
				message = "message_role_insert_success";
				alert = "success";
			} else {
				message = "message_role_insert_fail";
			}
		} else {
			Boolean result = roleService.update(roleDTO);
			
			if (result) {
				message = "message_role_update_success";
				alert = "success";
			} else {
				message = "message_role_update_fail";
			}
		}
		
		model.addAttribute("message", message);
		model.addAttribute("alert", alert);
		
		return "redirect:/admin/role/list";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(Model model, @RequestParam("role_code") String roleCode) {
		String message = "";
		String alert = "danger";
		
		RoleDTO roleDTO = roleService.findOne(roleCode);
		roleDTO.setFlagDelete(true);
		
		Boolean result = roleService.update(roleDTO);
		
		if (result) {
			message = "message_role_delete_success";
			alert = "success";
		} else {
			message = "message_role_update_fail";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("alert", alert);
		
		return "redirect:/admin/role/list";
	}
	
}