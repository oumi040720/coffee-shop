package com.fpoly.coffeeshop.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fpoly.coffeeshop.service.IOrderService;

@RestController
public class StatisticAPI {

	@Autowired
	private IOrderService orderService;
	
	@GetMapping(value = "/api/statistic/get_order_detail_statistic")
	public List<Long[]> getOrderDetailStatistic(@RequestParam("year") Integer year, @RequestParam("month") Integer month) {
		return orderService.getOrderDetailStatistic(year, month);
	}
	
	@GetMapping(value = "/api/statistic/get_top_4_best_seller")
	public List<Object[]> getTop4BestSeller() {
		return orderService.getTop4BestSeller();
	}
	
	@GetMapping(value = "/api/statistic/get_sales_every_year")
	public List<Object[]> getSalesEveryYear() {
		return orderService.getSalesEveryYear();
	}
	
	@GetMapping(value = "/api/statistic/get_sales_every_month/{year}")
	public List<Object[]> getSalesEveryMonthByYear(@PathVariable("year") Integer year) {
		return orderService.getSalesEveryMonthByYear(year);
	}
	
	@GetMapping(value = "/api/statistic/get_sales_every_day")
	public List<Object[]> getSalesEveryDayByYearAndMonth(@RequestParam("year") Integer year, @RequestParam("month") Integer month) {
		return orderService.getSalesEveryDayByYearAndMonth(year, month);
	}
	
	@GetMapping(value = "/api/statistic/get_sales_rate_every_month/{year}")
	public List<Object[]> getSalesRateEveryMotnhInYear(@PathVariable("year") Integer year) {
		return orderService.getSalesRateEveryMotnhInYear(year);
	}
	
	@GetMapping(value = "/api/statistic/get_sales_rate_every_day")
	public List<Object[]> getSalesRateEveryDayInMonthOfYear(@RequestParam("year") Integer year, @RequestParam("month") Integer month) {
		return orderService.getSalesRateEveryDayInMonthOfYear(year, month);
	}
	
}
