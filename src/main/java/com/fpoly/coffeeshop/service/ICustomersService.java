package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.CustomersDTO;

public interface ICustomersService {

	public List<CustomersDTO> findAll();
	
	
	public List<CustomersDTO> findAllByFlagDelete(Boolean flagDelete);
	
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);
	
	public List<CustomersDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit);
	
	
	public List<CustomersDTO> findAllByKey(String key);

	public Integer getTotalPagesByKey(String key, Integer page, Integer limit);

	public List<CustomersDTO> findAllByKey(String key, Integer page, Integer limit);
	
	
	public List<CustomersDTO> findAllByFlagDeleteAndKey(Boolean flagDelete, String key);

	public Integer getTotalPagesByFlagDeleteAndKey(Boolean flagDelete, String key, Integer page, Integer limit);

	public List<CustomersDTO> findAllByFlagDeleteAndKey(Boolean flagDelete, String key, Integer page, Integer limit);
	
	
	public CustomersDTO findOne(Long id);
	
	public CustomersDTO findOne(String fullname);
	
	public Boolean insert(CustomersDTO userDTO);
	
	public Boolean  update(CustomersDTO userDTO);
	
	public Boolean delete(Long id);
}
