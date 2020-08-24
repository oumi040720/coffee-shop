package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.MenuDTO;

public interface IMenuService {
	
	public List<MenuDTO> findAll();
	
	public List<MenuDTO> findAllByFlagDeleteIs(Boolean flagDelete);
	
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);
	
	public List<MenuDTO> findAllByFlagDeleteIs(Boolean flagDelete, Integer page, Integer limit);
	
	
	public List<MenuDTO> findAllByProductNameContaining(String key);
	
	public Integer getTotalPagesByProductNameContaining(String key, Integer page, Integer limit);
	
	public List<MenuDTO> findAllByProductNameContaining(String key, Integer page, Integer limit);
	
	
	public List<MenuDTO> findAllByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String key);
	
	public Integer getTotalPagesByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String key, Integer page, Integer limit);
	
	public List<MenuDTO> findAllByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String key, Integer page, Integer limit);
	
	public MenuDTO findOne(Integer id);
	
	public Boolean insert(MenuDTO categoryDTO);
	
	public Boolean update(MenuDTO categoryDTO);
	
	public Boolean delete(Integer id);
	
}
