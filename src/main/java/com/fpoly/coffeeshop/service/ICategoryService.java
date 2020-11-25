package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.CategoryDTO;


public interface ICategoryService {
	
public List<CategoryDTO> findAll();
	
	public List<CategoryDTO> findAllByFlagDelete(Boolean flagDelete);
	
	public CategoryDTO findOne(Integer id);
	
	public CategoryDTO findOne(String categoryCode);
	
	public Boolean insert(CategoryDTO categoryDTO);
	
	public Boolean update(CategoryDTO categoryDTO);
	
	public Boolean delete(Integer id);
}
