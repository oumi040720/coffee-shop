package com.fpoly.coffeeshop.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.coffeeshop.dto.CategoryDTO;
import com.fpoly.coffeeshop.dto.ProductDTO;
import com.fpoly.coffeeshop.service.ICategoryService;
import com.fpoly.coffeeshop.service.IProductService;
import com.fpoly.coffeeshop.util.URLUtil;
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
	
	private String getDomainURLUntil() {
		return URLUtil.getDomainURLUntil();
	}

	@RequestMapping(value = "/list")
	public String showListPage(HttpServletRequest request, Model model) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");
		
		int page = Integer.parseInt(request.getParameter("page"));
		int limit = 5;
		boolean flagDelete = false;
		
		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}
		
		request.setAttribute("isBin", false);
		
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages",productService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("product", productService.findAllByFlagDeleteIs(flagDelete, page - 1, limit));
		request.setAttribute("domainURL", getDomainURLUntil());
		
		return "admin/product/list";
	}
	
	@RequestMapping(value = "/bin/list")
	public String showBinListPage(HttpServletRequest request, Model model) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");
		
		int page = Integer.parseInt(request.getParameter("page"));
		int limit = 5;
		boolean flagDelete = true;
		
		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}
		
		request.setAttribute("isBin", true);
		
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages",productService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("product", productService.findAllByFlagDeleteIs(flagDelete, page - 1, limit));
		request.setAttribute("domainURL", getDomainURLUntil());
		
		return "admin/product/list";
	}
	
	@RequestMapping(value = "/add")
	public String showAddPage(Model model) {
		List<CategoryDTO> category = categoryService.findAll();
		for (int i = 0; i < category.size(); i++) {
			if (category.get(i).getCategoryCode().equals("product")) {
				category.remove(i);
			}
		}
		
		model.addAttribute("domain", getDomain());
		model.addAttribute("category", category);
		model.addAttribute("check", false);
		model.addAttribute("product", new ProductDTO());
		
		return "admin/product/edit";
	}
	
	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("id") Integer id) {
		List<CategoryDTO> category = categoryService.findAll();
		for (int i = 0; i < category.size(); i++) {
			if (category.get(i).getCategoryCode().equals("product")) {
				category.remove(i);
			}
		}
		
		ProductDTO productDTO = productService.findOne(id);
		CategoryDTO categoryDTO = categoryService.findOne(productDTO.getCategoryCode());

		model.addAttribute("category", category);
		model.addAttribute("categoryCode", categoryDTO);
		model.addAttribute("product", productDTO);
		model.addAttribute("check", true);

		return "admin/product/edit";
	}
	
	@RequestMapping(value = "/save")
	public String save(@ModelAttribute ProductDTO productDTO) {
		String message = "";
		String alert = "danger";
		
		productDTO.setFlagDelete(false);

		if(productDTO.getId() == null) {
			Boolean result = productService.insert(productDTO);
			if(result != null) {
				message = "message_product_insert_success";
				alert = "success";
			}
			else {
				message = "message_product_insert_fail";
			}
		}
		else {
			Boolean result = productService.update(productDTO);
			
			if (result != null) {
				message = "message_product_update_success";
				alert = "success";
			} else {
				message = "message_product_update_fail";
			}
		}
		
		return "redirect:/admin/product/list?page=1&message=" + message + "&alert=" + alert;
	}
	
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam("id") Integer id) {
		String message = "";
		String alert = "danger";
		
		ProductDTO productDTO = productService.findOne(id);
		productDTO.setFlagDelete(true);
		
		Boolean result = productService.update(productDTO);
		
		if (result) {
			message = "message_product_delete_success";
			alert = "success";
		} else {
			message = "message_product_delete_fail";
		}
		
		return "redirect:/admin/product/list?page=1&message=" + message + "&alert=" + alert;
	}
	
	@RequestMapping(value = "/restore")
	public String restore(@RequestParam("id") Integer id) {
		String message = "";
		String alert = "danger";
		
		ProductDTO productDTO = productService.findOne(id);
		productDTO.setFlagDelete(false);
		
		Boolean result = productService.update(productDTO);
		
		if (result) {
			message = "message_product_restore_success";
			alert = "success";
		} else {
			message = "message_product_restore_fail";
		}
		
		return "redirect:/admin/product/bin/list?page=1&message=" + message + "&alert=" + alert;
	}
	
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(HttpServletRequest request) {
		String key = request.getParameter("key");
		String isDeleted = request.getParameter("is_deleted");
		
		if (isDeleted != null) {
			return "redirect:/admin/product/search?key=" + key + "&page=1&is_deleted=true";
		}
		
		return "redirect:/admin/product/search?key=" + key + "&page=1";
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
		request.setAttribute("totalPages",productService.getTotalPagesByFlagDeleteIsAndProductNameContaining(flagDelete, key, page - 1, limit));
		request.setAttribute("product", productService.findAllByFlagDeleteIsAndProductNameContaining(flagDelete, key, page - 1, limit));
		
		return "admin/product/search";
	}
}
