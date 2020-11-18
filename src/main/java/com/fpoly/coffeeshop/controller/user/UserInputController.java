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
import com.fpoly.coffeeshop.dto.InputDTO;
import com.fpoly.coffeeshop.dto.InputDetailDTO;
import com.fpoly.coffeeshop.dto.UserDTO;
import com.fpoly.coffeeshop.service.ICategoryService;
import com.fpoly.coffeeshop.service.IInputDetailService;
import com.fpoly.coffeeshop.service.IInputService;
import com.fpoly.coffeeshop.util.CategoryUtil;
import com.fpoly.coffeeshop.util.DomainUtil;

@Controller
public class UserInputController {

	@Autowired
	private IInputService inputService;
	
	@Autowired
	private IInputDetailService inputDetailService;
	
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
	
	@RequestMapping(value = "/input_list")
	public String showInputListPage(HttpServletRequest request) {
		CategoryUtil.setCategory(request, categoryService);
		
		HttpSession httpSession = request.getSession();
		UserDTO user = (UserDTO) httpSession.getAttribute("USER");
		
		int page = Integer.parseInt(request.getParameter("page"));
		int limit = 10;
		boolean flagDelete = false;
		
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("totalPages", inputService.getTotalPagesByFlagDeleteAndUsername(flagDelete, user.getUsername(), page, limit));
		request.setAttribute("inputs", inputService.findAllByFlagDeleteAndUsername(flagDelete, user.getUsername(), page - 1, limit));
		
		return "user/inputs";
	}
	
	@RequestMapping(value = "/input_detail")
	public String showInputDetailPage(HttpServletRequest request) {
		CategoryUtil.setCategory(request, categoryService);
		
		String inputCode = request.getParameter("input_code");
		
		InputDTO inputDTO = inputService.findOne(inputCode);
		List<InputDetailDTO> inputDetailDTOs = inputDetailService.findAllByInputCode(inputCode);
		Long discount = 0L;
		
		if (inputDTO.getCouponCode() != null) {
			Long subtotal = 0L;
			
			for (InputDetailDTO inputDetailDTO : inputDetailDTOs) {
				subtotal += inputDetailDTO.getTotalMoney();
			}
			
			discount = subtotal + 22000 - inputDTO.getTotalPrice();
		}
		
		request.setAttribute("input", inputDTO);
		request.setAttribute("discount", discount);
		request.setAttribute("inputDetails", inputDetailDTOs);
		
		return "user/inputResult";
	}
	
	@RequestMapping(value = "/input_result")
	public String showInputSuccessPage(HttpServletRequest request) {
		CategoryUtil.setCategory(request, categoryService);
		
		String message = request.getParameter("message");
		String alert = request.getParameter("alert");
		String inputCode = request.getParameter("input_code");
		
		InputDTO inputDTO = inputService.findOne(inputCode);
		List<InputDetailDTO> inputDetailDTOs = inputDetailService.findAllByInputCode(inputCode);
		Long discount = 0L;
		
		if (inputDTO.getCouponCode() != null) {
			Long subtotal = 0L;
			
			for (InputDetailDTO inputDetailDTO : inputDetailDTOs) {
				subtotal += inputDetailDTO.getTotalMoney();
			}
			
			discount = subtotal + 22000 - inputDTO.getTotalPrice();
		}
		
		if (message != null && alert != null) {
			request.setAttribute("message", message.replaceAll("_", "."));
			request.setAttribute("alert", alert);
		}
		
		request.setAttribute("input", inputDTO);
		request.setAttribute("discount", discount);
		request.setAttribute("inputDetails", inputDetailDTOs);
		
		return "user/inputResult";
	}
	
	@RequestMapping(value = "/checkout")
	public String showCheckoutPage(HttpServletRequest request) {
		CategoryUtil.setCategory(request, categoryService);
		
		request.setAttribute("domain", getDomain());
		
		return "user/checkout";
	}
	
	@RequestMapping(value = "/input")
	public String input(HttpServletRequest request, HttpServletResponse response) {
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
		String inputCode = RandomStringUtils.randomAlphanumeric(7);
		
		long discount = 0;
		if (c.length() != 0) {
			discount = Long.parseLong(c);
		}
		
		long totalPrice = subPrice + 22000 - discount;
		
		InputDTO inputDTO = new InputDTO();
		inputDTO.setFlagDelete(false);
		inputDTO.setInputCode(inputCode);
		inputDTO.setStatus(0);
		inputDTO.setFullname(fullname);
		inputDTO.setAddress(address);
		inputDTO.setPhone(phone);
		inputDTO.setNote(note);
		inputDTO.setInputDate(new Date(System.currentTimeMillis()));
		
		boolean isCreatedInput = inputService.insert(inputDTO, user.getUsername());
		
		if (isCreatedInput) {
			boolean isSaveSuccess = false;
			InputDetailDTO inputDetailDTO = new InputDetailDTO();
			inputDetailDTO.setFlagDelete(false);
			inputDetailDTO.setInput(inputCode);
			
			try {
				ObjectMapper mapper = new ObjectMapper();
				List<ItemDTO> itemDTOs =  mapper.readValue(items, new TypeReference<List<ItemDTO>>(){});
				
				for (ItemDTO itemDTO : itemDTOs) {
					inputDetailDTO.setProduct(itemDTO.getProductName());
					inputDetailDTO.setQuantity(itemDTO.getQuantity());
					inputDetailDTO.setPrice(itemDTO.getPrice());
					inputDetailDTO.setTotalMoney(itemDTO.getPrice() * itemDTO.getQuantity());
					isSaveSuccess = inputDetailService.insert(inputDetailDTO);
					
					if (!isSaveSuccess) {
						InputDTO temp = inputService.findOne(inputCode);
						temp.setTotalPrice(totalPrice);
						temp.setFlagDelete(true);
						inputService.update(temp);
						isSaveSuccess = false;
						
						break;
					} 
				}
				
				if (isSaveSuccess) {
					InputDTO temp = inputService.findOne(inputCode);
					temp.setCouponCode(couponCode);
					temp.setTotalPrice(totalPrice);
					
					boolean isInputSuccess = inputService.update(temp);
					
					if (isInputSuccess) {
						return "redirect:/input_result?input_code=" + inputCode + "&message=message_input_success&alert=success";
					} else {
						return "redirect:/input_result?message=message_input_fail&alert=danger";
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/checkout";
	}
	
}
