package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.OrderDetailDTO;

public interface IOrderDetailService {

	public List<OrderDetailDTO> findAll();
	

	public List<OrderDetailDTO> findAllByFlagDelete(Boolean flagDelete);

	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);

	public List<OrderDetailDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit);

	
	public List<OrderDetailDTO> findAllById(Long key);

	public Integer getTotalPagesById(Long key, Integer page, Integer limit);

	public List<OrderDetailDTO> findAllById(Long key, Integer page, Integer limit);
	
	
	public List<OrderDetailDTO> findAllByFlagDeleteAndId(Boolean flagDelete, Long key);
	
	public Integer getTotalPagesByFlagDeleteAndId(Boolean flagDelete, Long key, Integer page, Integer limit);
	
	public List<OrderDetailDTO> findAllByFlagDeleteAndId(Boolean flagDelete, Long key, Integer page, Integer limit);
	
	
	public OrderDetailDTO findOne(Long id);
	
	public Boolean insert(OrderDetailDTO orderDTO);
	
	public Boolean update(OrderDetailDTO orderdetailDTO);
	
	public Boolean delete(Long id);
}
