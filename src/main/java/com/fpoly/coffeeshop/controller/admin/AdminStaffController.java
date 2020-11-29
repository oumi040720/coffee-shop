package com.fpoly.coffeeshop.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.coffeeshop.dto.RoleDTO;
import com.fpoly.coffeeshop.dto.StaffDTO;
import com.fpoly.coffeeshop.dto.UserDTO;
import com.fpoly.coffeeshop.service.IRoleService;
import com.fpoly.coffeeshop.service.IStaffService;
import com.fpoly.coffeeshop.service.IUserService;
import com.fpoly.coffeeshop.util.DomainUtil;

@Controller
@RequestMapping(value = "/admin/staff")
public class AdminStaffController {

	@Autowired
	private IRoleService roleService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IStaffService staffService;

	private String getDomain() {
		return DomainUtil.getDoamin();
	}
	
	private List<RoleDTO> getRoles() {
		RoleDTO role = new RoleDTO();
		
		List<RoleDTO> list = roleService.findAll();
		List<RoleDTO> roles = new ArrayList<RoleDTO>();
		
		for (int i = 0; i < list.size(); i++) {
			role = list.get(i);
			
			if (!role.getFlagDelete()) {
				if (role.getRoleCode().equals("admin") || role.getRoleCode().equals("cashier")) {
					roles.add(role);
				}
			}
		}
		
		return roles;
	}
	
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
		request.setAttribute("totalPages", staffService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("staffs", staffService.findAllByFlagDelete(flagDelete, page - 1, limit));
		
		return "admin/staff/list";
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
		request.setAttribute("totalPages", staffService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("staffs", staffService.findAllByFlagDelete(flagDelete, page - 1, limit));
		
		return "admin/staff/list";
	}
	
	@RequestMapping(value = "/add")
	public String showAddPage(Model model) {
		
		model.addAttribute("domain", getDomain());
		model.addAttribute("roles", getRoles());
		model.addAttribute("check", false);
		model.addAttribute("staff", new StaffDTO());
		
		return "admin/staff/edit";
	}
	
	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("id") Long id) {
		StaffDTO staffDTO = staffService.findOne(id);
		UserDTO userDTO = userService.findOne(staffDTO.getUsername());
		RoleDTO roleDTO = roleService.findOne(userDTO.getRoleCode());
		
		model.addAttribute("roles", getRoles());
		model.addAttribute("roleCode", roleDTO.getRoleCode());
		model.addAttribute("userID", userDTO.getId());
		model.addAttribute("staff", staffDTO);
		model.addAttribute("check", true);
		
		return "admin/staff/edit";
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/save")
	public String save(@ModelAttribute StaffDTO staff, @RequestParam("roleCode") String roleCode, @RequestParam("p") String p) {
		String message = "";
		String alert = "danger";
		
		Boolean logResult = false;
		
		staff.setFlagDelete(false);
		
		if (staff.getId() == null) {
			UserDTO userDTO = new UserDTO();
			userDTO.setFlagDelete(false);
			userDTO.setUsername(staff.getUsername());
			userDTO.setPassword(p);
			userDTO.setRoleCode(roleCode);
			
			Boolean userResult = userService.insert(userDTO);
			StaffDTO staffResult = staffService.insert(staff);
			
			if (staffResult != null && userResult) {
				message = "message_staff_insert_success";
				alert = "success";
			} else {
				message = "message_staff_insert_fail";
				alert = "danger";
			}
		} else {
			UserDTO userDTO = userService.findOne(staff.getUsername());
			userDTO.setRoleCode(roleCode);
			
			if (p.trim().length() > 0) {
				userDTO.setPassword(p);
			} else {
				userDTO.setPassword(userService.getP(staff.getUsername()));
			}
			
			StaffDTO tempt = staffService.findOne(staff.getId());
			
			Boolean userResult = userService.update(userDTO);
			Boolean staffUesult = staffService.update(staff);
		
			if (staffUesult && userResult) {
				message = "message_staff_update_success";
				alert = "success";
			} else {
				message = "message_staff_update_fail";
				alert = "danger";
			}
		}
		
		return "redirect:/admin/staff/list?page=1&message=" + message + "&alert=" + alert;
	}
	
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam("id") Long id) {
		String message = "";
		String alert = "danger";
		
		StaffDTO staff = staffService.findOne(id);
		
		staff.setFlagDelete(true);
		
		Boolean result = staffService.update(staff);
		
		if (result) {
			message = "message_staff_delete_success";
			alert = "success";
		} else {
			message = "message_staff_delete_fail";
			alert = "danger";
		}
		
		return "redirect:/admin/staff/list?page=1&message=" + message + "&alert=" + alert;
	}
	
	@RequestMapping(value = "/restore")
	public String restore(@RequestParam("id") Long id) {
		String message = "";
		String alert = "danger";
		
		StaffDTO staff = staffService.findOne(id);
		
		staff.setFlagDelete(false);
		
		Boolean result = staffService.update(staff);
		
		if (result) {
			message = "message_staff_restore_success";
			alert = "success";
		} else {
			message = "message_staff_restore_fail";
			alert = "danger";
		}
		
		return "redirect:/admin/staff/bin/list?page=1&message=" + message + "&alert=" + alert;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(HttpServletRequest request) {
		String key = request.getParameter("key");
		String isDeleted = request.getParameter("is_deleted");
		
		if (isDeleted != null) {
			return "redirect:/admin/staff/search?key=" + key + "&page=1&is_deleted=true";
		}
		
		return "redirect:/admin/staff/search?key=" + key + "&page=1";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String showSearchPage(HttpServletRequest request) {
		String key = request.getParameter("key");
		String isDeleted = request.getParameter("is_deleted");
		int page = Integer.parseInt(request.getParameter("page"));
		int limit = 10;
		boolean flagDelete = false;
		
		if (isDeleted != null) {
			flagDelete = true;
			request.setAttribute("isBin", true);
		} else {
			request.setAttribute("isBin", false);
		}

		request.setAttribute("key", key);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages", staffService.getTotalPagesByKey(flagDelete, key, page - 1, limit));
		request.setAttribute("staffs", staffService.search(flagDelete, key, page - 1, limit));
		
		return "admin/staff/search";
	}
	
}
