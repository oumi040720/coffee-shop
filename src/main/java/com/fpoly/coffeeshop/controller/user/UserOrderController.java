package com.fpoly.coffeeshop.controller.user;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fpoly.coffeeshop.dto.ItemDTO;
import com.fpoly.coffeeshop.dto.OrderDTO;
import com.fpoly.coffeeshop.dto.OrderDetailDTO;
import com.fpoly.coffeeshop.dto.UserDTO;
import com.fpoly.coffeeshop.paypal.PaypalService;
import com.fpoly.coffeeshop.service.ICategoryService;
import com.fpoly.coffeeshop.service.IOrderDetailService;
import com.fpoly.coffeeshop.service.IOrderService;
import com.fpoly.coffeeshop.util.CategoryUtil;
import com.fpoly.coffeeshop.util.URLUtil;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

@Controller
public class UserOrderController {

	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IOrderDetailService orderDetailService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private PaypalService paypalService;
	
	 private boolean order(String username, OrderDTO orderDTO, String orderCode, Long totalPrice, String couponCode, List<ItemDTO> itemDTOs) {
		 boolean isCreatedOrder = orderService.insert(orderDTO, username);
		 
		 if (isCreatedOrder) {
			 boolean isSaveSuccess = false;
			OrderDetailDTO orderDetailDTO = new OrderDetailDTO();
			orderDetailDTO.setFlagDelete(false);
			orderDetailDTO.setOrder(orderCode);
			
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
				temp.setCouponCode(couponCode);
				temp.setTotalPrice(totalPrice);
				
				boolean isOrderSuccess = orderService.update(temp);
				
				if (isOrderSuccess) {
					return true;
				}
			}
		 }
		 
		 return false;
	 }
	
	@RequestMapping(value = "/cart")
	public String showCartPage(HttpServletRequest request) {
		CategoryUtil.setCategory(request, categoryService);
		
		String domain = URLUtil.getBaseURL(request) + "/api";
		
		request.setAttribute("domain", domain);
		
		return "user/cart";
	}
	
	@RequestMapping(value = "/order_list")
	public String showOrderListPage(HttpServletRequest request) {
		CategoryUtil.setCategory(request, categoryService);
		
		HttpSession httpSession = request.getSession();
		UserDTO user = (UserDTO) httpSession.getAttribute("USER");
		
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
		request.setAttribute("totalPages", orderService.getTotalPagesByFlagDeleteAndUsername(flagDelete, user.getUsername(), page, limit));
		request.setAttribute("orders", orderService.findAllByFlagDeleteAndUsername(flagDelete, user.getUsername(), page - 1, limit));
		
		return "user/orders";
	}
	
	@RequestMapping(value = "/order_detail")
	public String showOrderDetailPage(HttpServletRequest request) {
		CategoryUtil.setCategory(request, categoryService);
		
		String orderCode = request.getParameter("order_code");
		
		OrderDTO orderDTO = orderService.findOne(orderCode);
		List<OrderDetailDTO> orderDetailDTOs = orderDetailService.findAllByOrderCode(orderCode);
		Long discount = 0L;
		
		if (orderDTO.getCouponCode() != null) {
			Long subtotal = 0L;
			
			for (OrderDetailDTO orderDetailDTO : orderDetailDTOs) {
				subtotal += orderDetailDTO.getTotalMoney();
			}
			
			discount = subtotal + 22000 - orderDTO.getTotalPrice();
		}
		
		request.setAttribute("order", orderDTO);
		request.setAttribute("discount", discount);
		request.setAttribute("orderDetails", orderDetailDTOs);
		
		return "user/orderResult";
	}
	
	@RequestMapping(value = "/cancel_order")
	public String cancelOrder(HttpServletRequest request) {
		CategoryUtil.setCategory(request, categoryService);
		
		String orderCode = request.getParameter("order_code");
		
		OrderDTO orderDTO = orderService.findOne(orderCode);
		orderDTO.setStatus(-1);
		
		if (orderService.update(orderDTO)) {
			return "redirect:/order_list?page=1&message=message_cancel_order_success&alert=success";
		} else {
			return "redirect:/order_list?page=1&message=message_cancel_order_fail&alert=danger";
		}
	}

	
	@RequestMapping(value = "/order_result")
	public String showOrderSuccessPage(HttpServletRequest request) {
		CategoryUtil.setCategory(request, categoryService);
		
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");
		String orderCode = request.getParameter("order_code");
		
		OrderDTO orderDTO = orderService.findOne(orderCode);
		List<OrderDetailDTO> orderDetailDTOs = orderDetailService.findAllByOrderCode(orderCode);
		Long discount = 0L;
		
		if (orderDTO.getCouponCode() != null) {
			Long subtotal = 0L;
			
			for (OrderDetailDTO orderDetailDTO : orderDetailDTOs) {
				subtotal += orderDetailDTO.getTotalMoney();
			}
			
			discount = subtotal + 22000 - orderDTO.getTotalPrice();
		}
		
		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}
		
		request.setAttribute("order", orderDTO);
		request.setAttribute("discount", discount);
		request.setAttribute("orderDetails", orderDetailDTOs);
		
		return "user/orderResult";
	}
	
	@RequestMapping(value = "/checkout")
	public String showCheckoutPage(HttpServletRequest request) {
		CategoryUtil.setCategory(request, categoryService);
		
		String domain = URLUtil.getBaseURL(request) + "/api";
		
		request.setAttribute("domain", domain);
		
		return "user/checkout";
	}
	
	@RequestMapping(value = "/order")
	public String order(HttpServletRequest request, HttpServletResponse response) {
		CategoryUtil.setCategory(request, categoryService);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("UTF-8");
		
		HttpSession httpSession = request.getSession();
		UserDTO user = (UserDTO) httpSession.getAttribute("USER");
		
		String paymentMethod = request.getParameter("payment");
		
		String items = request.getParameter("items");
		String couponCode = request.getParameter("coupon");
		
		String fullname = request.getParameter("fullname");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String note = request.getParameter("note");
		long subPrice = Long.parseLong(request.getParameter("subPrice"));
		String c = request.getParameter("c");
		String orderCode = RandomStringUtils.randomAlphanumeric(7);
		
		long discount = 0;
		if (c.length() != 0) {
			discount = Long.parseLong(c);
		}
		
		long totalPrice = subPrice + 22000 - discount;
		
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setFlagDelete(false);
		orderDTO.setOrderCode(orderCode);
		orderDTO.setStatus(0);
		orderDTO.setFullname(fullname);
		orderDTO.setAddress(address);
		orderDTO.setPhone(phone);
		orderDTO.setNote(note);
		orderDTO.setOrderDate(new Date(System.currentTimeMillis()));
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			List<ItemDTO> itemDTOs =  mapper.readValue(items, new TypeReference<List<ItemDTO>>(){});
			
			if (paymentMethod.equals("COD")) {
				boolean isOrderSuccess = order(user.getUsername(), orderDTO, orderCode, totalPrice, couponCode, itemDTOs);
				
				if (isOrderSuccess) {
					return "redirect:/order_result?order_code=" + orderCode + "&message=message_order_success&alert=success";
				} else {
					return "redirect:/order_result?message=message_order_fail&alert=danger";
				}
			} else if (paymentMethod.equals("paypal")) {
				String cancelUrl = URLUtil.getBaseURL(request) + "/pay/cancel";
				String successUrl = URLUtil.getBaseURL(request) + "/pay/success";
				
				Payment payment = paypalService.createPayment(totalPrice / 21000, 
															  "USD", 
															  "paypal",
															  "sale", 
															  "payment order " + orderCode, 
															  cancelUrl, 
															  successUrl);
				
				for (Links links : payment.getLinks()) {
					if (links.getRel().equals("approval_url")) {
						String url = links.getHref();
						
						httpSession.setAttribute("_order", orderDTO);
						httpSession.setAttribute("_odc", orderCode);
						httpSession.setAttribute("_total", totalPrice);
						httpSession.setAttribute("_coupon", couponCode);
						httpSession.setAttribute("_items", itemDTOs);
						
						return "redirect:" + url;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/checkout";
	}
	
	@RequestMapping(value = "/pay/cancel")
	public String cancelPay(HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		httpSession.removeAttribute("_order");
		httpSession.removeAttribute("_odc");
		httpSession.removeAttribute("_total");
		httpSession.removeAttribute("_coupon");
		httpSession.removeAttribute("_items");
		
		return "redirect:/cart";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/pay/success")
	public String successPay(HttpServletRequest request , 
							 @RequestParam("paymentId") String paymentId, 
							 @RequestParam("PayerID") String payerId) {
		HttpSession httpSession = request.getSession();
		UserDTO user = (UserDTO) httpSession.getAttribute("USER");
		OrderDTO orderDTO = (OrderDTO) httpSession.getAttribute("_order");
		String orderCode = (String) httpSession.getAttribute("_odc");
		Long totalPrice = (Long) httpSession.getAttribute("_total");
		String coupon = (String) httpSession.getAttribute("_coupon");
		List<ItemDTO> itemDTOs =  (List<ItemDTO>) httpSession.getAttribute("_items");
		
		try {
			Payment payment = paypalService.executePayment(paymentId, payerId);
			
			if (payment.getState().equals("approved")) {
				orderDTO.setStatus(10);
				
				boolean isSuccessOrder = order(user.getUsername(), orderDTO, orderCode, totalPrice, coupon, itemDTOs);
				
				httpSession.removeAttribute("_order");
				httpSession.removeAttribute("_odc");
				httpSession.removeAttribute("_total");
				httpSession.removeAttribute("_coupon");
				httpSession.removeAttribute("_items");
				
				if (isSuccessOrder) {
					return "redirect:/order_result?order_code=" + orderCode + "&message=message_order_success&alert=success";
				} else {
					return "redirect:/order_result?order_code=" + orderCode + "&message=message_order_fail&alert=danger";
				}
			}
		} catch (PayPalRESTException e) {
			log.error(e.getMessage());
		}
		return "redirect:/home";
	}
}
