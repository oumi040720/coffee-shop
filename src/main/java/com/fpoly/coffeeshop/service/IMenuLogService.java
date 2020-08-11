package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.MenuLogDTO;

public interface IMenuLogService {
	
	public List<MenuLogDTO> findAll();
	
	
	public List<MenuLogDTO> findAllByOldFlagDeleteIs(Boolean oldFlagDelete);
	
	public Integer getTotalPages(Boolean oldFlagDelete, Integer page, Integer limit);
	
	public List<MenuLogDTO> findAllByOldFlagDeleteIs(Boolean oldFlagDelete, Integer page, Integer limit);
	
	
	public List<MenuLogDTO> findAllByMenuId(Integer menuId);
	
	public Integer getTotalPagesByMenuId(Integer menuId, Integer page, Integer limit);
	
	public List<MenuLogDTO> findAllByMenuId(Integer menuId, Integer page, Integer limit);
	
	
	public List<MenuLogDTO> findAllByOldFlagDeleteIsAndMenuId(Boolean oldFlagDelete, Integer menuId);
	
	public Integer getTotalPagesByOldFlagDeleteIsAndMenuId(Boolean oldFlagDelete, Integer menuId, Integer page, Integer limit);
	
	public List<MenuLogDTO> findAllByOldFlagDeleteIsAndMenuId(Boolean oldFlagDelete, Integer menuId, Integer page, Integer limit);
	
	
	public Boolean insert(MenuLogDTO menuLogDTO);
	
	public Boolean delete(Integer id);
	
}
