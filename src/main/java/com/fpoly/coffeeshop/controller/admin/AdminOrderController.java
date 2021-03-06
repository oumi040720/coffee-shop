package com.fpoly.coffeeshop.controller.admin;

import java.util.Date;

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
import com.fpoly.coffeeshop.dto.OrderDTO;
import com.fpoly.coffeeshop.service.ICustomersService;
import com.fpoly.coffeeshop.service.IOrderService;
import com.fpoly.coffeeshop.util.URLUtil;

@Controller
@RequestMapping(value = "/admin/order")
public class AdminOrderController extends Thread {

	@Autowired
	private IOrderService orderService;
	
	@Autowired 
	private ICustomersService customersService;
	
	@RequestMapping(value = "/list")
	public String showListPage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");

		String domainURL = URLUtil.getBaseURL(request) + "/admin";
		String domain = URLUtil.getBaseURL(request) + "/api";
		
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
		request.setAttribute("totalPages", orderService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("orders", orderService.findAllByFlagDelete(flagDelete, page-1, limit));
		request.setAttribute("domain", domain);
		request.setAttribute("domainURL", domainURL);
		return "admin/order/list";
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
		request.setAttribute("totalPages", orderService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("orders", orderService.findAllByFlagDelete(flagDelete, page - 1, limit));
		
		return "admin/order/list";
	}

	@RequestMapping(value = "/add")
	public String showAddPage(Model model) {

		model.addAttribute("customers",customersService.findAllByFlagDelete(false));
		model.addAttribute("check", false);
		model.addAttribute("orders", new CustomersDTO());

		return "admin/order/edit";
	}

	@RequestMapping(value = "/edit")
	public String showUpdatePage(Model model, @RequestParam("id") Long id) {
		model.addAttribute("customers",customersService.findAllByFlagDelete(false));
		model.addAttribute("check", true);
		model.addAttribute("orders", orderService.findOne(id));

		return "admin/order/edit";
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
	public String save(Model model, @ModelAttribute OrderDTO orderDTO) {
//		String message = "";
//		String alert = "danger";

		String code = RandomStringUtils.randomAlphanumeric(6);
		Date date =new Date(System.currentTimeMillis());
		orderDTO.setFlagDelete(false);
		orderDTO.setOrderCode(code);
		orderDTO.setStatus(1);
		orderDTO.setOrderDate(date);
		if (orderDTO.getId() == null) {
			orderService.insert(orderDTO,"");
		}
		model.addAttribute("orderCode", code);
		model.addAttribute("datetime", date);
		
		return "redirect:/admin/orderdetail/editDetail?orderCode="+ code;
	}

	@RequestMapping(value = "/delete")
	public String delete(Model model, @RequestParam("orderCode") String orderCode){
		String message = "";
		String alert = "danger";
		
		OrderDTO order = orderService.findOne(orderCode);		
		order.setFlagDelete(true);
		Boolean result = orderService.update(order);
		if (result) {
			message = "message_orderdetail_delete_success";
			alert = "success";
		} else {
			message = "message_orderdetail_delete_fail";
			alert = "danger";
		}

		return "redirect:/admin/order/list?page=1&message=" + message + "&alert=" + alert;
	}


	@RequestMapping(value = "/restore")
	public String restore(@RequestParam("id") Long id) {
		String message = "";
		String alert = "danger";
		
		OrderDTO orderDTO = orderService.findOne(id);
		
		orderDTO.setFlagDelete(false);
		
		Boolean result = orderService.update(orderDTO);
		
		if (result) {
			message = "message_order_restore_success";
			alert = "success";
		} else {
			message = "message_order_restore_fail";
			alert = "danger";
		}
		
		return "redirect:/admin/order/bin/list?page=1&message=" + message + "&alert=" + alert;
	}
	
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(Model model, HttpServletRequest request) {
		String key = request.getParameter("key");
		String isDeleted = request.getParameter("is_deleted");
		if (isDeleted != null) {
			return "redirect:/admin/order/search?key=" + key + "&page=1&is_deleted=true";
		}
		return "redirect:/admin/order/search?key=" + key + "&page=1";
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
		request.setAttribute("totalPages", orderService.getTotalPagesByFlagDeleteAndOrderCode(flagDelete, key, page, limit));
		request.setAttribute("orders", orderService.findAllByFlagDeleteAndOrderCode(flagDelete, key, page-1, limit));
		
		return "admin/order/search";
	}
}
