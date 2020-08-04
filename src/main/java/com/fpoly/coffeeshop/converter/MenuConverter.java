package com.fpoly.coffeeshop.converter;

import com.fpoly.coffeeshop.dto.MenuDTO;
import com.fpoly.coffeeshop.entity.MenuEntity;

public class MenuConverter {
	
	public MenuDTO convertToDTO (MenuEntity entity) {
		
		MenuDTO dto = new MenuDTO();
		dto.setId(entity.getId());
		dto.setProductName(entity.getProductName());
		dto.setPhoto(entity.getPhoto());
		dto.setPrice(entity.getPrice());
		dto.setFlagDelete(entity.getFlagDelete());
		
		return dto;
	}
	
	public MenuEntity convertToEntity (MenuDTO dto) {
		
		MenuEntity entity = new MenuEntity();
		entity.setId(dto.getId());
		entity.setProductName(dto.getProductName());
		entity.setPhoto(dto.getPhoto());
		entity.setPrice(dto.getPrice());
		entity.setFlagDelete(dto.getFlagDelete());
		
		return entity;
	}
	
	public MenuEntity convertToEntity (MenuDTO dto, MenuEntity entity) {
		
		entity.setId(dto.getId());
		entity.setProductName(dto.getProductName());
		entity.setPhoto(dto.getPhoto());
		entity.setPrice(dto.getPrice());
		entity.setFlagDelete(dto.getFlagDelete());
		
		return entity;
	}
}
