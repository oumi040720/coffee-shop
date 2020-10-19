package com.fpoly.coffeeshop.controller.admin;


import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fpoly.coffeeshop.dto.OrderDetailDTO;
import com.fpoly.coffeeshop.service.IProductService;
import com.fpoly.coffeeshop.service.IOrderDetailService;

@Controller
@RequestMapping(value = "/admin/orderdetail")
public class AdminOrderDetailController {
	
	@Autowired
	private IProductService menuService;
	
	@Autowired
	private IOrderDetailService orderDetailService;
	
	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("orderCode") String orderCode) throws JsonParseException, JsonMappingException, IOException {
		
		model.addAttribute("menus",menuService.findAllByFlagDeleteIs(false));
		model.addAttribute("check", true);
		model.addAttribute("orderDetails", orderDetailService.findAllByOrderCode(orderCode));		
		return "admin/orderdetail/list";
	}
	
	@RequestMapping(value = "/editDetail")
	public String editDetailPage(Model model, @RequestParam("orderCode") String orderCode) {
		model.addAttribute("menus",menuService.findAllByFlagDeleteIs(false));
		model.addAttribute("orderCode", orderCode);
		return "admin/orderdetail/edit";
	}
	
	@RequestMapping(value = "/save")
	@ResponseBody
	public String save(Model model, @RequestBody List<OrderDetailDTO> list) throws JsonParseException, JsonMappingException, IOException {

		String message = "";
		String alert = "danger";
		
		for (OrderDetailDTO orderDetailDTO : list) {
			Boolean result = orderDetailService.insert(orderDetailDTO);
			if (result != null) {
				message = "message_orderdetail_insert_success";
				alert = "success";
			} else {
				message = "message_orderdetail_insert_fail";
				alert = "danger";
			}
		}
		
		return "redirect:/admin/order/list?page=1" ;
	}
}