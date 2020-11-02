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
import com.fpoly.coffeeshop.dto.OrderDTO;
import com.fpoly.coffeeshop.dto.OrderDetailDTO;
import com.fpoly.coffeeshop.dto.OrderLogDTO;
import com.fpoly.coffeeshop.service.ICustomersService;
import com.fpoly.coffeeshop.service.IOrderDetailService;
import com.fpoly.coffeeshop.service.IOrderLogService;
import com.fpoly.coffeeshop.service.IOrderService;

@Controller
@RequestMapping(value = "/admin/order")
public class AdminOrderController extends Thread {

	@Autowired
	private IOrderService orderService;
	
	@Autowired ICustomersService customersService;
	
	@Autowired IOrderLogService orderLogService;
	
	@Autowired IOrderDetailService orderDetailService;
	
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
		request.setAttribute("totalPages", orderService.getTotalPages(flagDelete, page, limit));
		request.setAttribute("orders", orderService.findAllByFlagDelete(flagDelete, page-1, limit));
		
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
		
		String message = "";
		String alert = "danger";

		Boolean logResult = false;
		
		OrderLogDTO orderLogDTO = new OrderLogDTO();
		
		String code = RandomStringUtils.randomAlphanumeric(6);
		Date date =new Date(System.currentTimeMillis());
		orderDTO.setFlagDelete(false);
		orderDTO.setOrderCode(code);
		orderDTO.setStatus(0);
		orderDTO.setOrderDate(date);
		if (orderDTO.getId() == null) {
			
			Boolean result = orderService.insert(orderDTO);
			orderLogDTO.setOrderID(orderDTO.getId());
			orderLogDTO.setCreatedBy("admin");
			orderLogDTO.setCreatedDate(new Date(System.currentTimeMillis()));
			
			logResult = orderLogService.insert(orderLogDTO);

			if (result != null) {
				message = "message_order_insert_success";
				alert = "success";
			} else {
				message = "message_order_insert_fail";
				alert = "danger";
			}
		}
		model.addAttribute("orderCode", code);
		model.addAttribute("datetime", date);
		return "redirect:/admin/orderdetail/editDetail?orderCode="+ code;
	}

	@RequestMapping(value = "/delete")
	public String delete(Model model, @RequestParam("orderCode") String orderCode){
		String message = "";
		String alert = "danger";
		
		OrderLogDTO log = new OrderLogDTO();
		
		OrderDTO order = orderService.findOne(orderCode);		
		log.setOrderID(order.getId());
		log.setCreatedBy("admin");
		log.setCreatedDate(new Date(System.currentTimeMillis()));
		log.setModifiedBy("admin");
		log.setModifiedDate(new Date(System.currentTimeMillis()));
		log.setOldCustomerID(order.getFullname());
		log.setOldFlagDelete(order.getFlagDelete());		
		log.setOldOrderCode(order.getOrderCode());
		log.setOldOrderDate(order.getOrderDate());		
		log.setOldStatus(order.getStatus());
		order.setFlagDelete(true);
		Boolean result = orderService.update(order);
		List<OrderDetailDTO> orderDTO = orderDetailService.findAllByOrderCode(orderCode);
		for (OrderDetailDTO orderDetailDTO : orderDTO) {
			System.out.println(orderDTO);
			log.setOrderDetailID(orderDetailDTO.getId());
			log.setOldMenuID(orderDetailDTO.getProduct());
			log.setOldQuantity(orderDetailDTO.getQuantity());					
			orderLogService.insert(log);
		}
	
		
		
		if (result) {
			message = "message_orderdetail_delete_success";
			alert = "success";
		} else {
			message = "message_orderdetail_delete_fail";
			alert = "danger";
		}

		return "redirect:/admin/order/list?page=1&message=" + message + "&alert=" + alert;
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(Model model, HttpServletRequest request) {
		String key = request.getParameter("key");

		return "redirect:/admin/order/search?key=" + key + "&page=1";
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
		request.setAttribute("totalPages", orderService.getTotalPagesByFlagDeleteAndOrderCode(flagDelete, key, page, limit));
		request.setAttribute("orders", orderService.findAllByFlagDeleteAndOrderCode(flagDelete, key, page-1, limit));
		
		return "admin/order/search";
	}
}
