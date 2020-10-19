package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.ProductDTO;

public interface IProductService {
	
	public List<ProductDTO> findAll();
	
	public List<ProductDTO> findAllByCategoryCode(String categoryCode);
	
	public List<ProductDTO> findAllByFlagDeleteIs(Boolean flagDelete);
	
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);
	
	public List<ProductDTO> findAllByFlagDeleteIs(Boolean flagDelete, Integer page, Integer limit);
	
	
	public List<ProductDTO> findAllByProductNameContaining(String key);
	
	public Integer getTotalPagesByProductNameContaining(String key, Integer page, Integer limit);
	
	public List<ProductDTO> findAllByProductNameContaining(String key, Integer page, Integer limit);
	
	
	public List<ProductDTO> findAllByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String key);
	
	public Integer getTotalPagesByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String key, Integer page, Integer limit);
	
	public List<ProductDTO> findAllByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String key, Integer page, Integer limit);
	
	public ProductDTO findOne(Integer id);
	
	public ProductDTO findOne(String productName);
	
	public Boolean insert(ProductDTO categoryDTO);
	
	public Boolean update(ProductDTO categoryDTO);
	
	public Boolean delete(Integer id);
	
}
