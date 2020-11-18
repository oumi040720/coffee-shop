package com.fpoly.coffeeshop.controller.admin;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fpoly.coffeeshop.dto.CustomersDTO;
import com.fpoly.coffeeshop.dto.InputDTO;
import com.fpoly.coffeeshop.dto.InputDetailDTO;
import com.fpoly.coffeeshop.dto.InputLogDTO;
import com.fpoly.coffeeshop.service.ICustomersService;
import com.fpoly.coffeeshop.service.IInputDetailService;
import com.fpoly.coffeeshop.service.IInputLogService;
import com.fpoly.coffeeshop.service.IInputService;
import com.fpoly.coffeeshop.service.impl.CouponService;
import com.fpoly.coffeeshop.util.DomainURLUntil;
import com.fpoly.coffeeshop.util.DomainUtil;

@Controller
@RequestMapping(value = "/admin/input")
public class AdminInputController extends Thread {

	@Autowired
	private IInputService inputService;
	
	@Autowired ICustomersService customersService;
	
	@Autowired IInputLogService inputLogService;
	
	@Autowired IInputDetailService inputDetailService;

	private String getDomain() {
		return DomainUtil.getDoamin();
	}
	
	private String getDomainURLUntil() {
		return DomainURLUntil.getDomainURLUntil();
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
		
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages", inputService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("inputs", inputService.findAllByFlagDelete(flagDelete, page-1, limit));
		request.setAttribute("domain", getDomain());
		request.setAttribute("domainURL", getDomainURLUntil());
		return "admin/input/list";
	}

	@RequestMapping(value = "/add")
	public String showAddPage(Model model) {

		model.addAttribute("customers",customersService.findAllByFlagDelete(false));
		model.addAttribute("check", false);
		model.addAttribute("inputs", new CustomersDTO());

		return "admin/input/edit";
	}

	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("id") Long id) {
		model.addAttribute("customers",customersService.findAllByFlagDelete(false));
		model.addAttribute("check", true);
		model.addAttribute("inputs", inputService.findOne(id));

		return "admin/input/edit";
	}

	/*
	 * @GetMapping(value = "/orderDetail")
	 * 
	 * @ResponseBody public List<OrderDetail>
	 * fetcOrderDetail(@RequestParam("orderCode") String orderCode) throws
	 * URISyntaxException, JsonParseException, JsonMappingException, IOException {
	 * String url = getDomain()+"/orderdetail/list/search_or/" + orderCode;
	 * RestTemplate restTemplate = new RestTemplate(); RequestEntity<String> req =
	 * new RequestEntity(HttpMethod.GET, new URI(url)); ResponseEntity<String> res =
	 * restTemplate.exchange(req, String.class); ObjectMapper obj = new
	 * ObjectMapper(); return obj.readValue(res.getBody(), new
	 * TypeReference<List<OrderDetail>>() { }); }
	 */

	@RequestMapping(value = "/save")
	public String save(Model model, @ModelAttribute InputDTO inputDTO) {
		
		String message = "";
		String alert = "danger";

		Boolean logResult = false;
		
		InputLogDTO inputLogDTO = new InputLogDTO();
		
		String code = RandomStringUtils.randomAlphanumeric(6);
		Date date =new Date(System.currentTimeMillis());
		inputDTO.setFlagDelete(false);
		inputDTO.setInputCode(code);
		inputDTO.setStatus(0);
		inputDTO.setInputDate(date);
		if (inputDTO.getId() == null) {
			
			Boolean result = inputService.insert(inputDTO,"");
			inputLogDTO.setInputID(inputDTO.getId());
			inputLogDTO.setCreatedBy("admin");
			inputLogDTO.setCreatedDate(new Date(System.currentTimeMillis()));
			
			logResult = inputLogService.insert(inputLogDTO);

			if (result != null) {
				message = "message_input_insert_success";
				alert = "success";
			} else {
				message = "message_input_insert_fail";
				alert = "danger";
			}
		}
		model.addAttribute("inputCode", code);
		model.addAttribute("datetime", date);
		return "redirect:/admin/inputdetail/editDetail?inputCode="+ code;
	}

	@RequestMapping(value = "/delete")
	public String delete(Model model, @RequestParam("inputCode") String inputCode){
		String message = "";
		String alert = "danger";
		
		InputLogDTO log = new InputLogDTO();
		
		InputDTO input = inputService.findOne(inputCode);		
		log.setInputID(input.getId());
		log.setCreatedBy("admin");
		log.setCreatedDate(new Date(System.currentTimeMillis()));
		log.setModifiedBy("admin");
		log.setModifiedDate(new Date(System.currentTimeMillis()));
		log.setOldCustomerID(input.getFullname());
		log.setOldFlagDelete(input.getFlagDelete());		
		log.setOldInputCode(input.getInputCode());
		log.setOldInputDate(input.getInputDate());		
		log.setOldStatus(input.getStatus());
		input.setFlagDelete(true);
		Boolean result = inputService.update(input);
		List<InputDetailDTO> inputDTO = inputDetailService.findAllByInputCode(inputCode);
		for (InputDetailDTO inputDetailDTO : inputDTO) {
			System.out.println(inputDTO);
			log.setInputDetailID(inputDetailDTO.getId());
			log.setOldProductID(inputDetailDTO.getProduct());
			log.setOldQuantity(inputDetailDTO.getQuantity());					
			inputLogService.insert(log);
		}
	
		
		
		if (result) {
			message = "message_inputdetail_delete_success";
			alert = "success";
		} else {
			message = "message_inputdetail_delete_fail";
			alert = "danger";
		}

		return "redirect:/admin/input/list?page=1&message=" + message + "&alert=" + alert;
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(Model model, HttpServletRequest request) {
		String key = request.getParameter("key");

		return "redirect:/admin/input/search?key=" + key + "&page=1";
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
		request.setAttribute("totalPages", inputService.getTotalPagesByFlagDeleteAndInputCode(flagDelete, key, page, limit));
		request.setAttribute("inputs", inputService.findAllByFlagDeleteAndInputCode(flagDelete, key, page-1, limit));
		
		return "admin/input/search";
	}
}
