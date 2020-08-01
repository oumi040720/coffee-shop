package com.fpoly.coffeeshop.converter;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.CategoryDTO;
import com.fpoly.coffeeshop.entity.CategoryEntity;

@Component
public class CategoryConveter {
	 public CategoryDTO convertToDTO(CategoryEntity entity) {
		 CategoryDTO dto = new CategoryDTO();
		 dto.setId(entity.getId());
		 dto.setCategoryName(entity.getCategoryName());
		 dto.setCategoryCode(entity.getCategoryCode());
		 dto.setFlagDelete(entity.getFlagDelete());
		 
		 return dto;
	 }
	 public CategoryEntity convertToEntity(CategoryDTO dto) {
		 CategoryEntity entity = new CategoryEntity();
		 entity.setId(dto.getId());
		 entity.setCategoryName(entity.getCategoryName());
		 entity.setCategoryCode(entity.getCategoryCode());
		 entity.setFlagDelete(entity.getFlagDelete());
		 
		 return entity;
	 }
	 public CategoryEntity convertToEntity(CategoryDTO dto, CategoryEntity entity) {
		 entity.setId(dto.getId());
		 entity.setCategoryName(dto.getCategoryName());
		 entity.setCategoryCode(dto.getCategoryCode());
		 entity.setFlagDelete(dto.getFlagDelete());
		 return entity;
		 
		 
	 }
}
