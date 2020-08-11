package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;

import com.fpoly.coffeeshop.converter.MenuLogConverter;
import com.fpoly.coffeeshop.dto.MenuLogDTO;
import com.fpoly.coffeeshop.entity.MenuLogEntity;
import com.fpoly.coffeeshop.repository.IMenuLogRepository;
import com.fpoly.coffeeshop.service.IMenuLogService;

public class MenuLogService implements IMenuLogService {
	
	@Autowired
	private IMenuLogRepository menuLogRepository;
	
	@Autowired
	private MenuLogConverter menuLogConverter;
	
	@Override
	public List<MenuLogDTO> findAll() {
		List<MenuLogEntity> list = menuLogRepository.findAll();
		List<MenuLogDTO> result = new ArrayList<>();
		
		for(MenuLogEntity menuLog : list) {
			result.add(menuLogConverter.convertToDTO(menuLog));
		}
		
		return result;
	}
	
	@Override
	public List<MenuLogDTO> findAllByOldFlagDeleteIs(Boolean oldFlagDelete) {
		List<MenuLogEntity> list = menuLogRepository.findAllByOldFlagDeleteIs(oldFlagDelete);
		List<MenuLogDTO> result = new ArrayList<>();
		
		for(MenuLogEntity menuLog : list){
			result.add(menuLogConverter.convertToDTO(menuLog));
		}
		
		return result;
	}
	
	@Override
	public List<MenuLogDTO> findAllByOldFlagDeleteIs(Boolean oldFlagDelete, Integer page, Integer limit) {
		List<MenuLogEntity> list = menuLogRepository.findAllByOldFlagDeleteIs(oldFlagDelete, PageRequest.of(page, limit)).getContent();
		List<MenuLogDTO> result = new ArrayList<>();
		
		for(MenuLogEntity menuLog : list) {
			result.add(menuLogConverter.convertToDTO(menuLog));
		}
		return result;
	}
	
	@Override
	public Integer getTotalPages(Boolean oldFlagDelete, Integer page, Integer limit) {
		
	return menuLogRepository.findAllByOldFlagDeleteIs(oldFlagDelete, PageRequest.of(page, limit)).getTotalPages();
	}
	
	@Override
	public List<MenuLogDTO> findAllByMenuId(Integer menuId) {
		List<MenuLogEntity> list = menuLogRepository.findAllByMenuId(menuId);
		List<MenuLogDTO> result = new ArrayList<>();
		
		for(MenuLogEntity menuLog : list) {
			result.add(menuLogConverter.convertToDTO(menuLog));
		}
		return result;
	}
	
	@Override
	public List<MenuLogDTO> findAllByMenuId(Integer menuId, Integer page, Integer limit) {
		List<MenuLogEntity> list = menuLogRepository.findAllByMenuId(menuId, PageRequest.of(page, limit)).getContent();
		List<MenuLogDTO> result  = new ArrayList<>();
		
		for(MenuLogEntity menuLog : list) {
			result.add(menuLogConverter.convertToDTO(menuLog));
		}
		return result;
	}
	
	@Override
	public Integer getTotalPagesByMenuId(Integer menuId, Integer page, Integer limit) {
		return menuLogRepository.findAllByMenuId(menuId, PageRequest.of(page, limit)).getTotalPages();
	}
	
	@Override
	public List<MenuLogDTO> findAllByOldFlagDeleteIsAndMenuId(Boolean oldFlagDelete, Integer menuId) {
		List<MenuLogEntity> list = menuLogRepository.findAllByOldFlagDeleteIsAndMenuId(oldFlagDelete, menuId);
		List<MenuLogDTO> result = new ArrayList<>();
		
		for(MenuLogEntity menuLog : list) {
			result.add(menuLogConverter.convertToDTO(menuLog));
		}
		return result;
	}
	
	@Override
	public List<MenuLogDTO> findAllByOldFlagDeleteIsAndMenuId(Boolean oldFlagDelete, Integer menuId, Integer page,
			Integer limit) {
		List<MenuLogEntity> list = menuLogRepository.findAllByOldFlagDeleteIsAndMenuId(oldFlagDelete, menuId, PageRequest.of(page, limit)).getContent();
		List<MenuLogDTO> result = new ArrayList<>();
		
		for(MenuLogEntity menuLog : list) {
			result.add(menuLogConverter.convertToDTO(menuLog));
		}
		return result;
	}
	
	@Override
	public Integer getTotalPagesByOldFlagDeleteIsAndMenuId(Boolean oldFlagDelete, Integer menuId, Integer page,
			Integer limit) {
		return menuLogRepository.findAllByOldFlagDeleteIsAndMenuId(oldFlagDelete, menuId, PageRequest.of(page, limit)).getTotalPages();
	}
	
	@Override
	public Boolean insert(MenuLogDTO menuLogDTO) {
		try {
			MenuLogEntity result = menuLogRepository.save(menuLogConverter.convertToEntity(menuLogDTO));
			if(result != null) {
				return true;
			}
			else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
		
	}
	
	@Override
	public Boolean delete(Integer id) {
		try {
			menuLogRepository.deleteById(id);
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
