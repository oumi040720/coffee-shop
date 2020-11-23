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
import com.fpoly.coffeeshop.service.IProductService;
import com.fpoly.coffeeshop.service.impl.CouponService;
import com.fpoly.coffeeshop.util.DomainURLUntil;
import com.fpoly.coffeeshop.util.DomainUtil;
import com.fpoly.coffeeshop.service.IInputDetailService;
import com.fpoly.coffeeshop.service.IInputService;

@Controller
@RequestMapping(value = "/admin/inputdetail")
public class AdminInputDetailController {
	
	@Autowired
	private IProductService menuService;
	
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
	public String showUpdatePage(Model model, @RequestParam("inputId") String inputId) throws JsonParseException, JsonMappingException, IOException {
		
		model.addAttribute("menus",menuService.findAllByFlagDeleteIs(false));
		model.addAttribute("check", true);
		List<InputDetailDTO> list = inputDetailService.findAllByInputId(inputId);
		model.addAttribute("inputDetails", list);	
		model.addAttribute("input", inputService.findOne(inputId));
		return "admin/inputdetail/list";
	}
	
	@RequestMapping(value = "/editDetail")
	public String editDetailPage(Model model, @RequestParam("inputId") String inputId) {
		model.addAttribute("menus",menuService.findAllByFlagDeleteIs(false));
		model.addAttribute("coupon", couponService.findAllDate(new Date(System.currentTimeMillis()), false));
		model.addAttribute("inputId", inputId);
		model.addAttribute("domain", getDomain());
		model.addAttribute("domainURL", getDomainURLUntil());
		model.addAttribute("input", inputService.findOne(inputId));
		return "admin/inputdetail/edit";
	}
	
	@RequestMapping(value = "/save")
	@ResponseBody
	public String save(Model model, @RequestBody List<InputDetailDTO> list) throws JsonParseException, JsonMappingException, IOException {

		String message = "";
		String alert = "danger";
		Long totalprice = 0L;
		System.out.println(totalprice);
		for (InputDetailDTO inputDetailDTO : list) {
			totalprice += inputDetailDTO.getTotalMoney();
			System.out.println(inputDetailDTO);
			Boolean result = inputDetailService.insert(inputDetailDTO);
			
			if (result != null) {
				message = "message_inputdetail_insert_success";
				alert = "success";
			} else {
				message = "message_inputdetail_insert_fail";
				alert = "danger";
			}
		}
		InputDTO inputDTO = inputService.findOne(list.get(0).getInput());
		inputDTO.setTotalPrice(totalprice);
		inputService.update(inputDTO);
		return "redirect:/admin/input/list?page=1" ;
	}
}