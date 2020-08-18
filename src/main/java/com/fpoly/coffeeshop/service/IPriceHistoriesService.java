package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.MenuDTO;

public interface IPriceHistoriesService {
	
	public List<MenuDTO> findAll();
	
	
	public List<MenuDTO> findAllByFlagDeleteIs(Boolean flagDelete);
	
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit);
	
	public List<MenuDTO> findAllByFlagDeleteIs(Boolean flagDelete, Integer page, Integer limit);
	
	public MenuDTO findOne(Integer id);
	
	public Boolean insert(MenuDTO menuDTO);
	
	public Boolean update(MenuDTO menuDTO);
	
	public Boolean delete(Integer id);
}
