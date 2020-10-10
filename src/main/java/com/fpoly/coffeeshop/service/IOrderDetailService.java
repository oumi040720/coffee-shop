package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.OrderDetailDTO;

public interface IOrderDetailService {

	public List<OrderDetailDTO> findAll();
	

	public List<OrderDetailDTO> findAllByFlagDelete(Boolean flagDelete);

	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);

	public List<OrderDetailDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit);

	
	public List<OrderDetailDTO> findAllByOrderCode(String orderCode);
	
	public Integer getTotalPagesByOrderCode(String orderCode, Integer page, Integer limit);

	public List<OrderDetailDTO> findAllByOrderCode(String orderCode, Integer page, Integer limit);
	
	
	public List<OrderDetailDTO> findAllByFlagDeleteAndOrderCode(Boolean flagDelete, String orderCode);
	
	public Integer getTotalPagesByFlagDeleteAndOrderCode(Boolean flagDelete, String orderCode, Integer page, Integer limit);
	
	public List<OrderDetailDTO> findAllByFlagDeleteAndOrderCode(Boolean flagDelete, String orderCode, Integer page, Integer limit);
	
	
	public OrderDetailDTO findOne(Long id);
	
	public OrderDetailDTO findOne(String order);
	
	public Boolean insert(OrderDetailDTO orderDTO);
	
	public Boolean update(OrderDetailDTO orderdetailDTO);
	
	public Boolean delete(Long id);
}
