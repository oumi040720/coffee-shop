package com.fpoly.coffeeshop.controller.user;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fpoly.coffeeshop.dto.ItemDTO;
import com.fpoly.coffeeshop.dto.OrderDTO;
import com.fpoly.coffeeshop.dto.OrderDetailDTO;
import com.fpoly.coffeeshop.service.IOrderDetailService;
import com.fpoly.coffeeshop.service.IOrderService;
import com.fpoly.coffeeshop.util.DomainUtil;

@Controller
public class UserCheckOutController {

	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IOrderDetailService orderDetailService;
	
	private String getDomain() {
		return DomainUtil.getDoamin();
	}
	
	@RequestMapping(value = "/cart")
	public String showCartPage(HttpServletRequest request) {
		request.setAttribute("domain", getDomain());
		
		return "user/cart";
	}
	
	@RequestMapping(value = "/order_result")
	public String showOrderSuccessPage(HttpServletRequest request) {
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");
		String orderCode = request.getParameter("order_code");
		
		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}
		
		request.setAttribute("order", orderService.findOne(orderCode));
		request.setAttribute("orderDetails", orderDetailService.findAllByOrderCode(orderCode));
		
		return "user/orderResult";
	}
	
	@RequestMapping(value = "/checkout")
	public String showCheckoutPage(HttpServletRequest request) {
		request.setAttribute("domain", getDomain());
		
		return "user/checkout";
	}
	
	@RequestMapping(value = "/order")
	public String order(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("UTF-8");
		
		String items = request.getParameter("items");
		String fullname = request.getParameter("fullname");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
//		String email = request.getParameter("email");
		String note = request.getParameter("note");
		long totalPrice = Long.parseLong(request.getParameter("totalPrice"));
		String orderCode = RandomStringUtils.randomAlphanumeric(7);
		
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setFlagDelete(false);
		orderDTO.setOrderCode(orderCode);
		orderDTO.setStatus(0);
		orderDTO.setFullname(fullname);
		orderDTO.setAddress(address);
		orderDTO.setPhone(phone);
		orderDTO.setNote(note);
		orderDTO.setOrderDate(new Date(System.currentTimeMillis()));
		
		boolean isCreatedOrder = orderService.insert(orderDTO,"");
		
		if (isCreatedOrder) {
			boolean isSaveSuccess = false;
			OrderDetailDTO orderDetailDTO = new OrderDetailDTO();
			orderDetailDTO.setFlagDelete(false);
			orderDetailDTO.setOrder(orderCode);
			
			try {
				ObjectMapper mapper = new ObjectMapper();
				List<ItemDTO> itemDTOs =  mapper.readValue(items, new TypeReference<List<ItemDTO>>(){});
				
				for (ItemDTO itemDTO : itemDTOs) {
					orderDetailDTO.setProduct(itemDTO.getProductName());
					orderDetailDTO.setQuantity(itemDTO.getQuantity());
					orderDetailDTO.setPrice(itemDTO.getPrice());
					orderDetailDTO.setTotalMoney(itemDTO.getPrice() * itemDTO.getQuantity());
					isSaveSuccess = orderDetailService.insert(orderDetailDTO);
					
					if (!isSaveSuccess) {
						OrderDTO temp = orderService.findOne(orderCode);
						temp.setTotalPrice(totalPrice);
						temp.setFlagDelete(true);
						orderService.update(temp);
						isSaveSuccess = false;
						
						break;
					} 
				}
				
				if (isSaveSuccess) {
					OrderDTO temp = orderService.findOne(orderCode);
					temp.setTotalPrice(totalPrice);
					
					boolean isOrderSuccess = orderService.update(temp);
					if (isOrderSuccess) {
						return "redirect:/order_result?order_code=" + orderCode + "&message=message_order_success&alert=success";
					} else {
						return "redirect:/order_result?message=message_order_fail&alert=danger";
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/checkout";
	}
	
}
