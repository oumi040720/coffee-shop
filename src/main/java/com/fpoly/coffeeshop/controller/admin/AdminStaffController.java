package com.fpoly.coffeeshop.controller.admin;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.coffeeshop.dto.StaffDTO;
import com.fpoly.coffeeshop.dto.StaffLogDTO;
import com.fpoly.coffeeshop.service.IStaffLogService;
import com.fpoly.coffeeshop.service.IStaffService;
import com.fpoly.coffeeshop.service.IUserService;

@Controller
@RequestMapping(value = "/admin/staff")
public class AdminStaffController {

	@Autowired
	private IUserService userService;
	
	@Autowired
	private IStaffService staffService;
	
	@Autowired
	private IStaffLogService staffLogService;
	
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
		request.setAttribute("totalPages", staffService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("staffs", staffService.findAllByFlagDelete(flagDelete, page - 1, limit));
		
		return "admin/staff/list";
	}
	
	@RequestMapping(value = "/add")
	public String showAddPage(Model model) {
		model.addAttribute("users", userService.findAll());
		model.addAttribute("check", false);
		model.addAttribute("staff", new StaffDTO());
		
		return "admin/staff/edit";
	}
	
	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("id") Long id) {
		model.addAttribute("users", userService.findAll());
		model.addAttribute("check", true);
		model.addAttribute("staff", staffService.findOne(id));
		
		return "admin/staff/edit";
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/save")
	public String save(Model model, @ModelAttribute StaffDTO staff) {
		String message = "";
		String alert = "danger";
		
		Boolean logResult = false;
		
		StaffLogDTO log = new StaffLogDTO();
		
		staff.setFlagDelete(false);
		
		if (staff.getId() == null) {
			StaffDTO result = staffService.insert(staff);
			
			log.setStaffID(result.getId());
			log.setCreatedBy("admin");
			log.setCreatedDate(new Date(System.currentTimeMillis()));
			
			logResult = staffLogService.insert(log);
			
			if (result != null) {
				message = "message_staff_insert_success";
				alert = "success";
			} else {
				message = "message_staff_insert_fail";
				alert = "danger";
			}
		} else {
			StaffDTO tempt = staffService.findOne(staff.getId());
			
			Boolean result = staffService.update(staff);
			
			log.setStaffID(tempt.getId());
			log.setOldAddress(tempt.getAddress());
			log.setOldBirthday(tempt.getBirthday());
			log.setOldEmail(tempt.getEmail());
			log.setOldFlagDelete(tempt.getFlagDelete());
			log.setOldFullname(tempt.getFullname());
			log.setOldPhone(tempt.getPhone());
			log.setOldPhoto(tempt.getPhoto());
			log.setOldUsername(tempt.getUsername());
			log.setModifiedBy("admin");
			log.setCreatedDate(new Date(System.currentTimeMillis()));
			log.setCreatedBy("admin");
			log.setCreatedDate(new Date(System.currentTimeMillis()));
			
			logResult = staffLogService.insert(log);
			
			if (result) {
				message = "message_staff_update_success";
				alert = "success";
			} else {
				message = "message_staff_update_fail";
				alert = "danger";
			}
		}
		
		model.addAttribute("message", message);
		model.addAttribute("alert", alert);
		
		return "redirect:/admin/staff/list?page=1";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(Model model, @RequestParam("id") Long id) {
		String message = "";
		String alert = "danger";
		
		StaffLogDTO log = new StaffLogDTO();
		
		StaffDTO staff = staffService.findOne(id);
		
		log.setStaffID(staff.getId());
		log.setOldAddress(staff.getAddress());
		log.setOldBirthday(staff.getBirthday());
		log.setOldEmail(staff.getEmail());
		log.setOldFlagDelete(staff.getFlagDelete());
		log.setOldFullname(staff.getFullname());
		log.setOldPhone(staff.getPhone());
		log.setOldPhoto(staff.getPhoto());
		log.setOldUsername(staff.getUsername());
		log.setModifiedBy("admin");
		log.setCreatedDate(new Date(System.currentTimeMillis()));
		log.setCreatedBy("admin");
		log.setCreatedDate(new Date(System.currentTimeMillis()));
		
		staffLogService.insert(log);

		staff.setFlagDelete(true);
		
		Boolean result = staffService.update(staff);
		
		if (result) {
			message = "message_staff_delete_success";
			alert = "success";
		} else {
			message = "message_staff_delete_fail";
			alert = "danger";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("alert", alert);
		
		return "redirect:/admin/staff/list?page=1";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(Model model, HttpServletRequest request) {
		String key = request.getParameter("key");
		
		return "redirect:/admin/staff/search?key=" + key + "&page=1";
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
		request.setAttribute("totalPages", staffService.getTotalPagesByFlagDeleteAndKey(flagDelete, key, page, limit));
		request.setAttribute("staffs", staffService.findAllByFlagDeleteAndKey(flagDelete, key, page - 1, limit));
		
		return "admin/staff/search";
	}
	
}
