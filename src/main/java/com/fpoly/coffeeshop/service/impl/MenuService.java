package com.fpoly.coffeeshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.fpoly.coffeeshop.converter.MenuConverter;
import com.fpoly.coffeeshop.dto.MenuDTO;
import com.fpoly.coffeeshop.entity.CategoryEntity;
import com.fpoly.coffeeshop.entity.MenuEntity;
import com.fpoly.coffeeshop.repository.ICategoryRepository;
import com.fpoly.coffeeshop.repository.IMenuRepository;
import com.fpoly.coffeeshop.service.IMenuService;

@Service
public class MenuService implements IMenuService {
	@Autowired
	private IMenuRepository menuRepository;
	
	@Autowired
	private ICategoryRepository categoryRepository;
	
	@Autowired
	private MenuConverter menuConverter;
	
	@Override
	public List<MenuDTO> findAll() {
		List<MenuEntity> list = menuRepository.findAll();
		List<MenuDTO> result = new ArrayList<>();
		
		for(MenuEntity menu:list) {
			result.add(menuConverter.convertToDTO(menu));
		}
		return result;
	}
	
	@Override
	public List<MenuDTO> findAllByFlagDeleteIs(Boolean flagDelete) {
		List<MenuEntity> list = menuRepository.findAllByFlagDeleteIs(flagDelete);
		List<MenuDTO> result = new ArrayList<>();
		
		for(MenuEntity menu:list) {
			result.add(menuConverter.convertToDTO(menu));
		}
		return result;
	}
	
	@Override
	public Integer getTotalPages(Boolean flagDelete, Integer page, Integer limit) {
		
		return menuRepository.findAllByFlagDeleteIs(flagDelete, PageRequest.of(page, limit)).getTotalPages();
	}
	
	@Override
	public List<MenuDTO> findAllByFlagDeleteIs(Boolean flagDelete, Integer page, Integer limit) {
		List<MenuEntity> list = menuRepository.findAllByFlagDeleteIs(flagDelete,PageRequest.of(page, limit)).getContent();
		List<MenuDTO> result = new ArrayList<>();
		
		for(MenuEntity menu:list) {
			result.add(menuConverter.convertToDTO(menu));
		}
		return result;
	}
	
	@Override
	public List<MenuDTO> findAllByProductNameContaining(String key) {
		List<MenuEntity> list = menuRepository.findAllByProductNameContaining(key);
		List<MenuDTO> result = new ArrayList<>();
		
		for(MenuEntity menu:list) {
			result.add(menuConverter.convertToDTO(menu));
		}
		return result;
	}
	
	@Override
	public Integer getTotalPagesByProductNameContaining(String key, Integer page, Integer limit) {
		return menuRepository.findAllByProductNameContaining(key, PageRequest.of(page, limit)).getTotalPages();
	}
	
	@Override
	public List<MenuDTO> findAllByProductNameContaining(String key, Integer page, Integer limit) {
		List<MenuEntity> list = menuRepository.findAllByProductNameContaining(key, PageRequest.of(page, limit)).getContent();
		List<MenuDTO> result = new ArrayList<>();
		
		for(MenuEntity menu:list) {
			result.add(menuConverter.convertToDTO(menu));
		}
		return result;
	}
	
	@Override
	public List<MenuDTO> findAllByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String key) {
		List<MenuEntity> list = menuRepository.findAllByFlagDeleteIsAndProductNameContaining(flagDelete, key);
		List<MenuDTO> result = new ArrayList<>();
		
		for(MenuEntity menu:list) {
			result.add(menuConverter.convertToDTO(menu));
		}
		return result;
	}
	
	@Override
	public Integer getTotalPagesByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String key, Integer page,
			Integer limit) {
		return menuRepository.findAllByFlagDeleteIsAndProductNameContaining(flagDelete, key, PageRequest.of(page, limit)).getTotalPages();
	}
	
	@Override
	public List<MenuDTO> findAllByFlagDeleteIsAndProductNameContaining(Boolean flagDelete, String key, Integer page,
			Integer limit) {
		List<MenuEntity> list = menuRepository.findAllByFlagDeleteIsAndProductNameContaining(flagDelete, key, PageRequest.of(page, limit)).getContent();
		List<MenuDTO> result = new ArrayList<>();
		
		for(MenuEntity menu:list) {
			result.add(menuConverter.convertToDTO(menu));
		}
		return result;
	}
	
	@Override
	public MenuDTO findOne(Integer id) {
		return menuConverter.convertToDTO(menuRepository.getOne(id));
	}
	
	@Override
	public Boolean insert(MenuDTO categoryDTO) {
		try {
			CategoryEntity categoryEntity = categoryRepository.findOneByCategoryName(categoryDTO.getProductName());
			MenuEntity menuEntity = menuConverter.convertToEntity(categoryDTO);
			menuEntity.setCategory(categoryEntity);
			
			MenuEntity result = menuRepository.save(menuEntity);
			
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
	public Boolean update(MenuDTO menuDTO) {
		try {
			CategoryEntity categoryEntity = categoryRepository.findOneByCategoryName(menuDTO.getProductName());
			MenuEntity oldMenu = menuRepository.getOne(menuDTO.getId());
			MenuEntity newMenu = menuConverter.convertToEntity(menuDTO, oldMenu);
			newMenu.setCategory(categoryEntity);
			
			MenuEntity result = menuRepository.save(newMenu);
			if(result!=null) {
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
			menuRepository.deleteById(id);
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public MenuDTO findOne(String productName) {
		return menuConverter.convertToDTO(menuRepository.findOneByProductName(productName));
	}
}
