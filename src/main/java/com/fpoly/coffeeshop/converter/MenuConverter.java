package com.fpoly.coffeeshop.converter;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.ProductDTO;
import com.fpoly.coffeeshop.entity.ProductEntity;

@Component
public class MenuConverter {
	
	public ProductDTO convertToDTO (ProductEntity entity) {
		
		ProductDTO dto = new ProductDTO();
		dto.setId(entity.getId());
		dto.setProductName(entity.getProductName());
		dto.setPhoto(entity.getPhoto());
		dto.setPrice(entity.getPrice());
		dto.setCategoryCode(entity.getCategory().getCategoryCode());
		dto.setFlagDelete(entity.getFlagDelete());
		
		return dto;
	}
	
	public ProductEntity convertToEntity (ProductDTO dto) {
		
		ProductEntity entity = new ProductEntity();
		entity.setId(dto.getId());
		entity.setProductName(dto.getProductName());
		entity.setPhoto(dto.getPhoto());
		entity.setPrice(dto.getPrice());
		entity.setFlagDelete(dto.getFlagDelete());
		
		return entity;
	}
	
	public ProductEntity convertToEntity (ProductDTO dto, ProductEntity entity) {
		
		entity.setId(dto.getId());
		entity.setProductName(dto.getProductName());
		entity.setPhoto(dto.getPhoto());
		entity.setPrice(dto.getPrice());
		entity.setFlagDelete(dto.getFlagDelete());
		
		return entity;
	}
}
