package com.fpoly.coffeeshop.controller.user;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fpoly.coffeeshop.dto.ItemDTO;
import com.fpoly.coffeeshop.dto.OrderDTO;
import com.fpoly.coffeeshop.dto.OrderDetailDTO;
import com.fpoly.coffeeshop.dto.UserDTO;
import com.fpoly.coffeeshop.service.ICategoryService;
import com.fpoly.coffeeshop.service.IOrderDetailService;
import com.fpoly.coffeeshop.service.IOrderService;
import com.fpoly.coffeeshop.util.CategoryUtil;
import com.fpoly.coffeeshop.util.DomainUtil;

@Controller
public class UserOrderController {

	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IOrderDetailService orderDetailService;
	
	@Autowired
	private ICategoryService categoryService;
	
	private String getDomain() {
		return DomainUtil.getDoamin();
	}
	
	@RequestMapping(value = "/cart")
	public String showCartPage(HttpServletRequest request) {
		CategoryUtil.setCategory(request, categoryService);
		
		request.setAttribute("domain", getDomain());
		
		return "user/cart";
	}
	
	@RequestMapping(value = "/order_list")
	public String showOrderListPage(HttpServletRequest request) {
		CategoryUtil.setCategory(request, categoryService);
		
		HttpSession httpSession = request.getSession();
		UserDTO user = (UserDTO) httpSession.getAttribute("USER");
		
		int page = Integer.parseInt(request.getParameter("page"));
		int limit = 10;
		boolean flagDelete = false;
		
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
		
		request.setAttribute("domain", getDomain());
		
		return "user/checkout";
	}
	
	@RequestMapping(value = "/order")
	public String order(HttpServletRequest request, HttpServletResponse response) {
		CategoryUtil.setCategory(request, categoryService);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("UTF-8");
		
		HttpSession httpSession = request.getSession();
		UserDTO user = (UserDTO) httpSession.getAttribute("USER");
		
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
		
		boolean isCreatedOrder = orderService.insert(orderDTO, user.getUsername());
		
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
					temp.setCouponCode(couponCode);
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
