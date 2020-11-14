package com.fpoly.coffeeshop.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.coffeeshop.dto.ProductDTO;
import com.fpoly.coffeeshop.service.ICategoryService;
import com.fpoly.coffeeshop.service.IProductService;
import com.fpoly.coffeeshop.util.DomainUtil;

@Controller
@RequestMapping(value = "/admin/product")
public class AdminProductController {
	
	@Autowired
	private IProductService productService;
	
	@Autowired
	private ICategoryService categoryService;
	
	private String getDomain() {
		return DomainUtil.getDoamin();
	}

	@RequestMapping(value = "/list")
	public String showListPage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");
		
		int page = Integer.parseInt(request.getParameter("page"));
		int limit = 5;
		boolean flagDelete = false;
		
		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}
		
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages",productService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("product", productService.findAllByFlagDeleteIs(flagDelete, page - 1, limit));
		
		return "admin/product/list";
	}
	
	@RequestMapping(value = "/add")
	public String showAddPage(Model model) {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("check", false);
		model.addAttribute("domain", getDomain());
		model.addAttribute("products", new ProductDTO());
		
		return "admin/product/edit";
	}
	
	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("productName") String productName) {
		model.addAttribute("category", categoryService.findAll());
		model.addAttribute("check", false);
		model.addAttribute("domain", getDomain());
		model.addAttribute("products", new ProductDTO());
		model.addAttribute("pruduct", productService.findOne(productName));
		
		return "admin/product/edit";
	}
	
//	@RequestMapping(value = "/save")
//	public String save(@ModelAttribute ProductDTO productDTO) {
//		String message = "";
//		String alert = "danger";
//		
//		productDTO.setFlagDelete(false);
//		
//		if(productDTO.getId() == null) {
//			Boolean result = productService.insert(productDTO);
//			
//			if(result) {
//				message = "message_user_insert_success";
//				alert = "success";
//			}
//			else {
//				message = "message_user_insert_fail";
//			}
//		}
//		else {
//			Boolean result = productService.update(productDTO);
//			
//			if (result) {
//				message = "message_user_update_success";
//				alert = "success";
//			} else {
//				message = "message_user_update_fail";
//			}
//		}
//		
//		return "redirect:/admin/product/list?page=1&message=" + message + "&alert=" + alert;
//	}
	
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(Model model, HttpServletRequest request) {
		String key = request.getParameter("key");
		
		return "redirect:/admin/product/search?key="+key+"&page=1";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String showSearchPage(HttpServletRequest request) {
		String key = request.getParameter("key");
		int page = Integer.parseInt(request.getParameter("page"));
		int limit = 10;
		boolean flagDelete = false;
		
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages",productService.getTotalPagesByFlagDeleteIsAndProductNameContaining(flagDelete, key, page, limit));
		request.setAttribute("product", productService.findAllByFlagDeleteIsAndProductNameContaining(flagDelete, key, page - 1, limit));
		
		return "admin/product/search";
	}
}
