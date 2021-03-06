package com.fpoly.coffeeshop.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.coffeeshop.dto.CouponDTO;
import com.fpoly.coffeeshop.service.ICouponService;
import com.fpoly.coffeeshop.util.URLUtil;

@Controller
@RequestMapping(value = "/admin/coupon")
public class AdminCouponController {

	@Autowired
	private ICouponService couponService;
	
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
		
		request.setAttribute("isBin", false);
		
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages", couponService.getTotalPageByFlagDelete(flagDelete, page, limit));
		request.setAttribute("coupons", couponService.findAllByFlagDelete(flagDelete, page, limit));
		
		return "admin/coupon/list";
	}
	
	@RequestMapping(value = "/bin/list")
	public String showLBinistPage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");

		boolean flagDelete = true;
		int page = Integer.parseInt(request.getParameter("page"));
		int limit = 10;

		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}
		
		request.setAttribute("isBin", true);
		
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages", couponService.getTotalPageByFlagDelete(flagDelete, page, limit));
		request.setAttribute("coupons", couponService.findAllByFlagDelete(flagDelete, page, limit));
		
		return "admin/coupon/list";
	}

	@RequestMapping(value = "/add")
	public String showAddPage(Model model, HttpServletRequest request) {
		String domain = URLUtil.getBaseURL(request) + "/api";
		
		model.addAttribute("check", false);
		model.addAttribute("domain", domain);
		model.addAttribute("coupon", new CouponDTO());
		
		return "admin/coupon/edit";
	}
	
	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("id") Long id, HttpServletRequest request) {
		String domain = URLUtil.getBaseURL(request) + "/api";
		
		model.addAttribute("check", true);
		model.addAttribute("domain", domain);
		model.addAttribute("coupon", couponService.findOne(id));
		
		return "admin/coupon/edit";
	}
	
	@RequestMapping(value = "/save")
	public String save(@ModelAttribute CouponDTO couponDTO) {
		String message = "";
		String alert = "danger";
		
		couponDTO.setFlagDelete(false);
		
		if (couponDTO.getId() == null) {
			Boolean result = couponService.insert(couponDTO);
			
			if (result) {
				message = "message_coupon_insert_success";
				alert = "success";
			} else {
				message = "message_coupon_insert_fail";
			}
		} else {
			Boolean result = couponService.update(couponDTO);
			
			if (result) {
				message = "message_coupon_update_success";
				alert = "success";
			} else {
				message = "message_coupon_update_fail";
			}
		}
		
		return "redirect:/admin/coupon/list?page=1&message=" + message + "&alert=" + alert;
	}

	@RequestMapping(value = "/delete")
	public String delete(@RequestParam("id") Long id) {
		String message = "";
		String alert = "danger";
		
		CouponDTO couponDTO = couponService.findOne(id);
		couponDTO.setFlagDelete(true);
		
		Boolean result = couponService.update(couponDTO);
		
		if (result) {
			message = "message_coupon_delete_success";
			alert = "success";
		} else {
			message = "message_coupon_delete_fail";
		}
		
		return "redirect:/admin/coupon/list?page=1&message=" + message + "&alert=" + alert;
	}
	
	@RequestMapping(value = "/restore")
	public String restore(@RequestParam("id") Long id) {
		String message = "";
		String alert = "danger";
		
		CouponDTO couponDTO = couponService.findOne(id);
		couponDTO.setFlagDelete(false);
		
		Boolean result = couponService.update(couponDTO);
		
		if (result) {
			message = "message_coupon_restore_success";
			alert = "success";
		} else {
			message = "message_coupon_restore_fail";
		}
		
		return "redirect:/admin/coupon/bin/list?page=1&message=" + message + "&alert=" + alert;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(HttpServletRequest request) {
		String type = request.getParameter("type");
		String isDeleted = request.getParameter("is_deleted");
		
		if (isDeleted != null) {
			return "redirect:/admin/coupon/search?type=" + type + "&page=1&is_deleted=true";
		}
		
		return "redirect:/admin/coupon/search?type=" + type + "&page=1";
	}
	
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String showSearchPage(HttpServletRequest request) {
		String type = request.getParameter("type");
		String isDeleted = request.getParameter("is_deleted");
		
		boolean flagDelete = false;
		int page = Integer.parseInt(request.getParameter("page"));
		int limit = 10;
		
		switch (type) {
		case "giam-gia-truc-tiep":
			type = "Giảm Giá Trực Tiếp";
			break;
		case "giam-gia-theo-phan-tram":
			type = "Giảm Giá Theo Phần Trăm";
			break;
		default:
			type = "";
			break;
		}
		
		if (isDeleted != null) {
			flagDelete = true;
			request.setAttribute("isBin", true);
		} else {
			request.setAttribute("isBin", false);
		}
		
		request.setAttribute("type", type);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages", couponService.getTotalPageByFlagDeleteAndType(flagDelete, type, page, limit));
		request.setAttribute("coupons", couponService.findAllByFlagDeleteAndType(flagDelete, type, page, limit));
		
		return "admin/coupon/search";
	}
	
}
