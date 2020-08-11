package com.fpoly.coffeeshop.converter;

import com.fpoly.coffeeshop.dto.MenuLogDTO;
import com.fpoly.coffeeshop.entity.MenuLogEntity;

public class MenuLogConverter {
	
	public MenuLogDTO convertToDTO(MenuLogEntity entity) {
		
		MenuLogDTO dto = new MenuLogDTO();
		dto.setId(entity.getId());
		dto.setCreatedDate(entity.getCreatedDate());
		dto.setCreatedBy(entity.getCreatedBy());
		dto.setModifiedDate(entity.getModifiedDate());
		dto.setModifiedBy(entity.getModifiedBy());
		dto.setMenuId(entity.getMenuID());
		dto.setOldProductName(entity.getOldProductName());
		dto.setOldPhoto(entity.getOldPhoto());
		dto.setOldPrice(entity.getOldPrice());
		dto.setOldFlagDelete(entity.getOldFlagDelete());
		dto.setOldCategoryId(entity.getOldCategoryId());
		dto.setOldCategoryName(entity.getOldCategoryName());
		
		return dto;
	}
	
	public MenuLogEntity convertToEntity(MenuLogDTO dto) {
		
		MenuLogEntity entity = new MenuLogEntity();
		entity.setId(dto.getId());
		entity.setCreatedDate(dto.getCreatedDate());
		entity.setCreatedBy(dto.getCreatedBy());
		entity.setModifiedDate(dto.getModifiedDate());
		entity.setModifiedBy(dto.getModifiedBy());
		entity.setMenuID(dto.getMenuId());
		entity.setOldProductName(dto.getOldProductName());
		entity.setOldPhoto(dto.getOldPhoto());
		entity.setOldPrice(dto.getOldPrice());
		entity.setOldFlagDelete(dto.getOldFlagDelete());
		entity.setOldCategoryId(dto.getOldCategoryId());
		entity.setOldCategoryName(dto.getOldCategoryName());
		
		return entity;
	}
	
	public MenuLogEntity convertToEntity(MenuLogDTO dto, MenuLogEntity entity) {
		
		entity.setId(dto.getId());
		entity.setCreatedDate(dto.getCreatedDate());
		entity.setCreatedBy(dto.getCreatedBy());
		entity.setModifiedDate(dto.getModifiedDate());
		entity.setModifiedBy(dto.getModifiedBy());
		entity.setMenuID(dto.getMenuId());
		entity.setOldProductName(dto.getOldProductName());
		entity.setOldPhoto(dto.getOldPhoto());
		entity.setOldPrice(dto.getOldPrice());
		entity.setOldFlagDelete(dto.getOldFlagDelete());
		entity.setOldCategoryId(dto.getOldCategoryId());
		entity.setOldCategoryName(dto.getOldCategoryName());
		
		return entity;
	}
}
