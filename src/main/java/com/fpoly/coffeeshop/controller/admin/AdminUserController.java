package com.fpoly.coffeeshop.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.coffeeshop.dto.UserDTO;
import com.fpoly.coffeeshop.service.IRoleService;
import com.fpoly.coffeeshop.service.IUserService;
import com.fpoly.coffeeshop.util.DomainUtil;

@Controller
@RequestMapping(value = "/admin/user")
public class AdminUserController {

	@Autowired
	private IRoleService roleService;
	
	@Autowired
	private IUserService userService;
	
	private String getDomain() {
		return DomainUtil.getDoamin();
	}
	
	@RequestMapping(value = "/list")
	public String showListPage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");

		boolean flagDelete = false;
		int page = Integer.parseInt(request.getParameter("page"));
		int limit = 10;

		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}
		
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages", userService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("users", userService.findAllByFlagDelete(flagDelete, page, limit));
		
		return "admin/user/list";
	}
	
	@RequestMapping(value = "/add")
	public String showAddPage(Model model) {
		model.addAttribute("roles", roleService.findAll());
		model.addAttribute("check", false);
		model.addAttribute("domain", getDomain());
		model.addAttribute("user", new UserDTO());
		
		return "admin/user/edit";
	}
	
	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("username") String username) {
		model.addAttribute("roles", roleService.findAll());
		model.addAttribute("check", true);
		model.addAttribute("domain", getDomain());
		model.addAttribute("user", userService.findOne(username));
		
		return "admin/user/edit";
	}
	
	@RequestMapping(value = "/save")
	public String save(Model model, @ModelAttribute UserDTO userDTO) {
		String message = "";
		String alert = "danger";
		
		userDTO.setFlagDelete(false);
		
		if (userDTO.getId() == null) {
			Boolean result = userService.insert(userDTO);
			
			if (result) {
				message = "message_user_insert_success";
				alert = "success";
			} else {
				message = "message_user_insert_fail";
			}
		} else {
			Boolean result = userService.update(userDTO);
			
			if (result) {
				message = "message_user_update_success";
				alert = "success";
			} else {
				message = "message_user_update_fail";
			}
		}
		
		model.addAttribute("message", message);
		model.addAttribute("alert", alert);
		
		return "redirect:/admin/user/list?page=1";
	}

	@RequestMapping(value = "/delete")
	public String delete(Model model, @RequestParam("username") String username) {
		String message = "";
		String alert = "danger";
		
		UserDTO userDTO = userService.findOne(username);
		userDTO.setFlagDelete(true);
		userDTO.setPassword("123@123zxCV@");
		
		Boolean result = userService.update(userDTO);
		
		if (result) {
			message = "message_user_delete_success";
			alert = "success";
		} else {
			message = "message_user_delete_fail";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("alert", alert);
		
		return "redirect:/admin/user/list?page=1";
	}
	
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(Model model, HttpServletRequest request) {
		String key = request.getParameter("key");
		int page = 1;
		
		model.addAttribute("key", key);
		model.addAttribute("page", page);
		
		return "redirect:/admin/user/search";
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
		request.setAttribute("totalPages", userService.getTotalPagesByFlagDeleteAndUsername(flagDelete, key, page, limit));
		request.setAttribute("users", userService.findAllByFlagDeleteAndUsername(flagDelete, key, page, limit));
		
		return "admin/user/search";
	}
	
}
