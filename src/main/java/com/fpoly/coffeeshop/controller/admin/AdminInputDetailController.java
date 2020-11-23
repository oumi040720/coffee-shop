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
import com.fpoly.coffeeshop.dto.InputDTO;
import com.fpoly.coffeeshop.dto.InputDetailDTO;
import com.fpoly.coffeeshop.service.IUnitService;
import com.fpoly.coffeeshop.service.impl.CouponService;
import com.fpoly.coffeeshop.util.DomainURLUntil;
import com.fpoly.coffeeshop.util.DomainUtil;
import com.fpoly.coffeeshop.service.IInputDetailService;
import com.fpoly.coffeeshop.service.IInputService;

@Controller
@RequestMapping(value = "/admin/inputdetail")
public class AdminInputDetailController {
	
	@Autowired
	private IUnitService menuService;
	
	@Autowired
	private IInputService inputService;
	
	@Autowired
	private IInputDetailService inputDetailService;
	
	@Autowired CouponService couponService;
	
	private String getDomain() {
		return DomainUtil.getDoamin();
	}
	
	private String getDomainURLUntil() {
		return DomainURLUntil.getDomainURLUntil();
	}
	
	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("inputDate") String inputDate) throws JsonParseException, JsonMappingException, IOException {
		
		model.addAttribute("menus",menuService.findAllByFlagDelete(false));
		model.addAttribute("check", true);
		List<InputDetailDTO> list = inputDetailService.findAllByInputDate(inputDate);
		model.addAttribute("inputDetails", list);	
		model.addAttribute("input", inputService.findOne(inputDate));
		return "admin/inputdetail/list";
	}
	
	@RequestMapping(value = "/editDetail")
	public String editDetailPage(Model model, @RequestParam("inputDate") String inputDate) {
		model.addAttribute("menus",menuService.findAllByFlagDeleteIs(false));
		model.addAttribute("coupon", couponService.findAllDate(new Date(System.currentTimeMillis()), false));
		model.addAttribute("inputDate", inputDate);
		model.addAttribute("domain", getDomain());
		model.addAttribute("domainURL", getDomainURLUntil());
		model.addAttribute("input", inputService.findOne(inputDate));
		return "admin/inputdetail/edit";
	}
}