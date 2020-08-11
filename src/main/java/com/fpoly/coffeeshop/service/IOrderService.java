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
	
	
	public OrderDTO findOne(Long id);
	
	public Boolean insert(OrderDTO customerDTO);
	
	public Boolean update(OrderDTO orderDTO);
	
	public Boolean delete(Long id);
}
