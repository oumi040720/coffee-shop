package com.fpoly.coffeeshop.service;

import java.util.List;


import com.fpoly.coffeeshop.dto.IngredientsDTO;


public interface IIngredientService {

	public List<IngredientsDTO> findAll();
	
	

	public List<IngredientsDTO> findAllByFlagDelete(Boolean flagDelete);
	
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);
	
	public List<IngredientsDTO> findAllByFlagDelete(Boolean flagDelete, Integer page, Integer limit);

	
	public List<IngredientsDTO> findAllByIngredientCode(String ingredientCode);
	
	public Integer getTotalPagesByIngredientCode(String ingredientCode, Integer page, Integer limit);
	
	public List<IngredientsDTO> findAllByIngredientCode(String ingredientCode ,Integer page,Integer limit);
	
	
	
	
	
	public IngredientsDTO findOne(Integer id);
	
	public IngredientsDTO findOne(String name);
	
	public Boolean insert(IngredientsDTO ingredientDTO);
	
	public Boolean update(IngredientsDTO ingredientDTO);
	
	public Boolean delete(Integer id);
	
	
}
