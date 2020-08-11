package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.OrderLogDTO;

public interface IOrderLogService {
	
	public List<OrderLogDTO> findAll();
	
	
	public List<OrderLogDTO> findAllByOldFlagDelete(Boolean oldFlagDelete);
	
	public Integer getTotalPages(Boolean oldFlagDelete, Integer page, Integer limit);
	
	public List<OrderLogDTO> findAllByOldFlagDelete(Boolean oldFlagDelete, Integer page, Integer limit);
	
	
	public List<OrderLogDTO> findAllByOrderID(Long orderID);
	
	public Integer getTotalPagesByOrderID(Long orderID, Integer page, Integer limit); 
	
	public List<OrderLogDTO> findAllByOrderID(Long orderID, Integer page, Integer limit);
	
	
	public List<OrderLogDTO> findAllByOldFlagDeleteAndOrderID(Boolean oldFlagDelete, Long orderID);
	
	public Integer getTotalPagesByOldFlagDeleteAndOrderID(Boolean oldFlagDelete, Long orderID, Integer page, Integer limit);
	
	public List<OrderLogDTO> findAllByOldFlagDeleteAndOrderID(Boolean oldFlagDelete, Long orderID, Integer page, Integer limit);
	

	
	public Boolean insert(OrderLogDTO orderLogDTO);
	
	public Boolean delete(Long id);

}
