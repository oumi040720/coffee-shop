package com.fpoly.coffeeshop.controller.admin;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fpoly.coffeeshop.service.IOrderService;
import com.fpoly.coffeeshop.util.URLUtil;

@Controller
public class AdminDashBoardController {

	@Autowired
	private IOrderService orderService;
	
	private Long checkNumberIsNull(Long number) {
		if (number == null) {
			return 0L;
		} else {
			return number;
		}
	}
	
	private Double getRate(Long current, Long past) {
		double result = ((current - past) / past) * 100;
		
		return result;
	}
	
	@RequestMapping(value = "/admin/dashboard")
	public String showPage(HttpServletRequest request) {
		LocalDate currentdate = LocalDate.now();
		int currentYear = currentdate.getYear();
		int currentMonth = currentdate.getMonthValue();
		int lastMonth = currentMonth - 1;
		int lastYear = currentYear;
		
		String domain = URLUtil.getBaseURL(request) + "/api";
		
		if (currentMonth == 1) {
			lastMonth = 12;
			lastYear = currentYear - 1;
		}
		
		List<Long[]> currentOrderDetailStatistic = orderService.getOrderDetailStatistic(currentYear, currentMonth);
		List<Long[]> lastOrderDetailStatistic = orderService.getOrderDetailStatistic(lastYear, lastMonth);
		
		long currentOrders = checkNumberIsNull(currentOrderDetailStatistic.get(0)[0]);
		long currentSales = checkNumberIsNull(currentOrderDetailStatistic.get(0)[1]);
		long currentAveragePrice = checkNumberIsNull(currentOrderDetailStatistic.get(0)[2]);
		long currentQuantity = checkNumberIsNull(currentOrderDetailStatistic.get(0)[3]);
		
		long lastOrders =  checkNumberIsNull(lastOrderDetailStatistic.get(0)[0]);
		long lastSales = checkNumberIsNull(lastOrderDetailStatistic.get(0)[1]);
		long lastAveragePrice = checkNumberIsNull(lastOrderDetailStatistic.get(0)[2]);
		long lastQuantity =checkNumberIsNull(lastOrderDetailStatistic.get(0)[3]);
		
		double grownRateOrder = getRate(currentOrders, lastOrders);
		double grownRateSales = getRate(currentSales, lastSales);
		double grownRateAveragePrice = getRate(currentAveragePrice, lastAveragePrice);
		double grownRateQuantity = getRate(currentQuantity, lastQuantity);
		
		request.setAttribute("currentOrders", currentOrders);
		request.setAttribute("currentSales", currentSales);
		request.setAttribute("currentAveragePrice", currentAveragePrice);
		request.setAttribute("currentQuantity", currentQuantity);
		
		request.setAttribute("grownRateOrder", grownRateOrder);
		request.setAttribute("grownRateSales", grownRateSales);
		request.setAttribute("grownRateAveragePrice", grownRateAveragePrice);
		request.setAttribute("grownRateQuantity", grownRateQuantity);
		
		request.setAttribute("domain", domain);
		
		return "admin/dashboard";
	}

}
