package com.fpoly.coffeeshop.controller.admin;


import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fpoly.coffeeshop.dto.OrderDTO;
import com.fpoly.coffeeshop.dto.OrderDetailDTO;
import com.fpoly.coffeeshop.service.IProductService;
import com.fpoly.coffeeshop.service.impl.CouponService;
import com.fpoly.coffeeshop.util.DomainURLUntil;
import com.fpoly.coffeeshop.util.DomainUtil;
import com.fpoly.coffeeshop.service.IOrderDetailService;
import com.fpoly.coffeeshop.service.IOrderService;

@Controller
@RequestMapping(value = "/admin/orderdetail")
public class AdminOrderDetailController {
	
	@Autowired
	private IProductService menuService;
	
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IOrderDetailService orderDetailService;
	
	@Autowired CouponService couponService;
	
	private String getDomain() {
		return DomainUtil.getDoamin();
	}
	
	private String getDomainURLUntil() {
		return DomainURLUntil.getDomainURLUntil();
	}
	
	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("orderCode") String orderCode) throws JsonParseException, JsonMappingException, IOException {
		
		model.addAttribute("menus",menuService.findAllByFlagDeleteIs(false));
		model.addAttribute("check", true);
		List<OrderDetailDTO> list = orderDetailService.findAllByOrderCode(orderCode);
		model.addAttribute("orderDetails", list);	
		model.addAttribute("order", orderService.findOne(orderCode));
		return "admin/orderdetail/list";
	}
	
	@RequestMapping(value = "/editDetail")
	public String editDetailPage(Model model, @RequestParam("orderCode") String orderCode) {
		model.addAttribute("menus",menuService.findAllByFlagDeleteIs(false));
		model.addAttribute("coupon", couponService.findAllDate(new Date(System.currentTimeMillis()), false));
		model.addAttribute("orderCode", orderCode);
		model.addAttribute("domain", getDomain());
		model.addAttribute("domainURL", getDomainURLUntil());
		model.addAttribute("order", orderService.findOne(orderCode));
		return "admin/orderdetail/edit";
	}
	
	@RequestMapping(value = "/save")
	@ResponseBody
	public String save(Model model, @RequestBody List<OrderDetailDTO> list) throws JsonParseException, JsonMappingException, IOException {

		String message = "";
		String alert = "danger";
		Long totalprice = 0L;
		System.out.println(totalprice);
		for (OrderDetailDTO orderDetailDTO : list) {
			totalprice += orderDetailDTO.getTotalMoney();
			System.out.println(orderDetailDTO);
			Boolean result = orderDetailService.insert(orderDetailDTO);
			
			if (result != null) {
				message = "message_orderdetail_insert_success";
				alert = "success";
			} else {
				message = "message_orderdetail_insert_fail";
				alert = "danger";
			}
		}
		OrderDTO orderDTO = orderService.findOne(list.get(0).getOrder());
		orderDTO.setTotalPrice(totalprice);
		orderService.update(orderDTO);
		return "redirect:/admin/order/list?page=1" ;
	}
}