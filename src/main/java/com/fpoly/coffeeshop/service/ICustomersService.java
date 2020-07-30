package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.CustomersDTO;

public interface ICustomersService {

	public List<CustomersDTO> findAll();
	
	public List<CustomersDTO> findAllByFlagDelete(Boolean flagDelete);
	
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);
	
	public List<CustomersDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit);
	
	
	public List<CustomersDTO> findAllByFullname(String key);
	
	public Integer getTotalPagesByFullname(String key, Integer page, Integer limit); 
	
	public List<CustomersDTO> findAllByFullname(String key, Integer page, Integer limit);
	
	
	public List<CustomersDTO> findAllByEmail(String key);
	
	public Integer getTotalPagesByEmail(String key, Integer page, Integer limit);
	
	public List<CustomersDTO> findAllByEmail(String key, Integer page, Integer limit);
	
		
	public List<CustomersDTO> findAllByAddress(String key);
	
	public Integer getTotalPagesByAddress(String key, Integer page, Integer limit);
	
	public List<CustomersDTO> findAllByAddress(String key, Integer page, Integer limit);
	
	
	public List<CustomersDTO> findAllByPhone(String key);
	
	public Integer getTotalPagesByPhone(String key, Integer page, Integer limit);
	
	public List<CustomersDTO> findAllByPhone(String key, Integer page, Integer limit);
	
	
	public List<CustomersDTO> findAllByFlagDeleteAndFullname(Boolean flagDelete, String key);
	
	public Integer getTotalPagesByFlagDeleteAndFullname(Boolean flagDelete, String key, Integer page, Integer limit);
	
	public List<CustomersDTO> findAllByFlagDeleteAndFullname(Boolean flagDelete, String key, Integer page, Integer limit);
	
	
	public List<CustomersDTO> findAllByFlagDeleteAndEmail(Boolean flagDelete, String key);
	
	public Integer getTotalPagesByFlagDeleteAndEmail(Boolean flagDelete, String key, Integer page, Integer limit);
	
	public List<CustomersDTO> findAllByFlagDeleteAndEmail(Boolean flagDelete, String key, Integer page, Integer limit);
	
	
	public List<CustomersDTO> findAllByFlagDeleteAndPhone(Boolean flagDelete, String key);
	
	public Integer getTotalPagesByFlagDeleteAndPhone(Boolean flagDelete, String key, Integer page, Integer limit);
	
	public List<CustomersDTO> findAllByFlagDeleteAndPhone(Boolean flagDelete, String key, Integer page, Integer limit);
	
	
	public List<CustomersDTO> findAllByFlagDeleteAndAddress(Boolean flagDelete, String key);
	
	public Integer getTotalPagesByFlagDeleteAndAddress(Boolean flagDelete, String key, Integer page, Integer limit);
	
	public List<CustomersDTO> findAllByFlagDeleteAndAddress(Boolean flagDelete, String key, Integer page, Integer limit);
	
	
	public CustomersDTO findOne( Long id);
	
	public Boolean insert(CustomersDTO customersDTO);
	
	public Boolean  update(CustomersDTO customersDTO);
	
	public Boolean delete(Long id);
}
