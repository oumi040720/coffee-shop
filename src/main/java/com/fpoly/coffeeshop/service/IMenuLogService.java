package com.fpoly.coffeeshop.service;

import java.util.List;

import com.fpoly.coffeeshop.dto.MenuLogDTO;

public interface IMenuLogService {
	
	public List<MenuLogDTO> findAll();
	
	
	public List<MenuLogDTO> findAllByOldFlagDeleteIs(Boolean oldFlagDelete);
	
	public Integer getTotalPages(Boolean oldFlagDelete, Integer page, Integer limit);
	
	public List<MenuLogDTO> findAllByOldFlagDelete(Boolean oldFlagDelete, Integer page, Integer limit);
	
	
	public List<MenuLogDTO> findAllByMenuID(Integer menuID);
	
	public Integer getTotalPagesByMenuID(Integer menuID, Integer page, Integer limit);
	
	public List<MenuLogDTO> findAllByMenuID(Integer menuID, Integer page, Integer limit);
	
	
	public List<MenuLogDTO> findAllByOldFlagDeleteIsAndMenuID(Boolean oldFlagDelete, Integer menuID);
	
	public List<MenuLogDTO> getTotalPagesByOldFlagDeleteIsAndMenuID(Boolean oldFlagDelete, Integer menuID, Integer page, Integer limit);
	
	public List<MenuLogDTO> findAllByOldFlagDeleteIsAndMenuID(Boolean oldFlagDelete, Integer menuID, Integer page, Integer limit);
	
	
	public Boolean insert(MenuLogDTO menuLogDTO);
	
	public Boolean delete(Integer id);
	
}
