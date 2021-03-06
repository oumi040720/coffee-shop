package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.OrderDTO;

public interface IOrderService {

	public List<OrderDTO> findAll();
	
	
	public List<OrderDTO> findAllByFlagDelete(Boolean flagDelete);
	
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);
	
	public List<OrderDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit);
	
	
	public List<OrderDTO> findAllByOrderCode(String key);
	
	public Integer getTotalPagesByOrderCode(String key, Integer page, Integer limit); 
	
	public List<OrderDTO> findAllByOrderCode(String key, Integer page, Integer limit);
	
	
	public List<OrderDTO> findAllByFlagDeleteAndOrderCode(Boolean flagDelete, String key);
	
	public Integer getTotalPagesByFlagDeleteAndOrderCode(Boolean flagDelete, String key, Integer page, Integer limit);
	
	public List<OrderDTO> findAllByFlagDeleteAndOrderCode(Boolean flagDelete, String key, Integer page, Integer limit);
	
	
	public Integer getTotalPagesByFlagDeleteAndUsername(Boolean flagDelete, String username, Integer page, Integer limit);
	
	public List<OrderDTO> findAllByFlagDeleteAndUsername(Boolean flagDelete, String username, Integer page, Integer limit);
	
	
	public OrderDTO findOne(Long id);
	
	public OrderDTO findOne(String orderCode);
	
	public Boolean insert(OrderDTO customerDTO, String username);
	
	public Boolean update(OrderDTO orderDTO);
	
	public Boolean delete(Long id);
	
	
	
	public List<Long[]> getOrderDetailStatistic(Integer year, Integer month);
	
	
	public List<Object[]> getTop4BestSeller();
	
	
	public List<Object[]> getSalesEveryYear();
	
	public List<Object[]> getSalesEveryMonthByYear(Integer year);

	public List<Object[]> getSalesEveryDayByYearAndMonth(Integer year, Integer month);
	
	
	public List<Object[]> getSalesRateEveryMotnhInYear(Integer year);
	
	public List<Object[]> getSalesRateEveryDayInMonthOfYear(Integer year, Integer month);
	
}

