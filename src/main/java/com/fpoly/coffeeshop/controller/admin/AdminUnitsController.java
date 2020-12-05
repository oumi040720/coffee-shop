package com.fpoly.coffeeshop.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.coffeeshop.dto.UnitDTO;
import com.fpoly.coffeeshop.service.IUnitService;
import com.fpoly.coffeeshop.util.URLUtil;

@Controller
@RequestMapping(value = "/admin/unit")
public class AdminUnitsController {
	
	@Autowired
	private IUnitService unitService;
	
	@RequestMapping(value = "/list")
	public String showListPage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");
		
		String id = request.getParameter("unit_id");
		
		String domain = URLUtil.getBaseURL(request) + "/api";
		
		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}
		
		if (id != null) {
			request.setAttribute("check", true);
			request.setAttribute("unit", unitService.findOne(Long.parseLong(id)));
		} else {
			request.setAttribute("check", false);
			request.setAttribute("unit", new UnitDTO());
		}
		
		request.setAttribute("domain", domain);
		
		request.setAttribute("isBin", false);
		request.setAttribute("units", unitService.findAllbyFlagDelete(false));
		
		return "admin/unit/list";
	}
	
	@RequestMapping(value = "/bin/list")
	public String showBinListPage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");
		
		String domain = URLUtil.getBaseURL(request) + "/api";
		
		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}
		
		request.setAttribute("domain", domain);
		
		request.setAttribute("isBin", true);
		request.setAttribute("units", unitService.findAllbyFlagDelete(true));
		
		return "admin/unit/list";
	}
	
	@RequestMapping(value = "/add")
	public String showAddPage(Model model, HttpServletRequest request) {
		String domain = URLUtil.getBaseURL(request) + "/api";
		
		model.addAttribute("check", false);
		model.addAttribute("unit", new UnitDTO());
		model.addAttribute("domain", domain);
		
		return "admin/unit/edit";
	}
	
	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("unit_id") Long id, HttpServletRequest request) {
		String domain = URLUtil.getBaseURL(request) + "/api";
		
		model.addAttribute("check", true);
		model.addAttribute("unit", unitService.findOne(id));
		model.addAttribute("domain", domain);
		
		return "admin/unit/edit";
	}
	
	@RequestMapping(value = "/save")
	public String save(Model model, @ModelAttribute UnitDTO unitDTO) {
		String message = "";
		String alert = "danger";
		
		unitDTO.setFlagDelete(false);
		
		if (unitDTO.getId() == null) {
			Boolean result = unitService.insert(unitDTO);
			if (result) {
				message = "message_unit_insert_success";
				alert = "success";
			} else {
				message = "message_unit_insert_fail";
			}
		} else {
			Boolean result = unitService.update(unitDTO);
			if (result) {
				message = "message_unit_update_success";
				alert = "success";
			} else {
				message = "message_unit_update_fail";
				alert = "danger";
			}
		}
		  
		model.addAttribute("message", message);
		model.addAttribute("alert", alert);
		
		return "redirect:/admin/unit/list?message=" + message + "&alert=" + alert;
	}
	
	@RequestMapping(value = "/delete")
	public String delete(Model model, @RequestParam("unit_id") Long id) {
		String message = "";
		String alert = "danger";
		
		UnitDTO unitDTO = unitService.findOne(id);
		unitDTO.setFlagDelete(true);
		
		Boolean result = unitService.update(unitDTO);
		
		if (result) {
			message = "message_unit_delete_success";
			alert = "success";
		} else {
			message = "message_unit_update_fail";
			alert = "danger";
		}
		return "redirect:/admin/unit/list?message=" + message + "&alert=" + alert;
	}
	
	@RequestMapping(value = "/restore")
	public String restore(Model model, @RequestParam("unit_id") Long id) {
		String message = "";
		String alert = "danger";
		
		UnitDTO unitDTO = unitService.findOne(id);
		unitDTO.setFlagDelete(false);
		
		Boolean result = unitService.update(unitDTO);
		
		if (result) {
			message = "message_unit_restore_success";
			alert = "success";
		} else {
			message = "message_unit_restore_fail";
			alert = "danger";
		}
		return "redirect:/admin/unit/bin/list?message=" + message + "&alert=" + alert;
	}
	
}
