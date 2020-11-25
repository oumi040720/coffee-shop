package com.fpoly.coffeeshop.converter;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.InputDetailDTO;
import com.fpoly.coffeeshop.entity.InputDetailEntity;

@Component
public class InputDetailConveter {

	public InputDetailDTO convertToDTO(InputDetailEntity entity) {
		InputDetailDTO dto = new InputDetailDTO();
		dto.setId(entity.getId());
		dto.setPrice(entity.getPrice());
		dto.setIngredientName(entity.getIngredients().getName());
		dto.setQuantity(entity.getQuantity());
		dto.setUnitName(entity.getUnits().getUnitName());
		dto.setInputID(entity.getInputs().getId());
		dto.setFlagDelete(entity.getFlagDelete());
		return dto;
		
	}
	
	public InputDetailEntity convertToEntity(InputDetailDTO dto) {
		InputDetailEntity entity = new InputDetailEntity();
		entity.setId(dto.getId());
		entity.setQuantity(dto.getQuantity());
		entity.setFlagDelete(dto.getFlagDelete());
		entity.setPrice(dto.getPrice());
		return entity;
	}
	
	public InputDetailEntity convertToEntity(InputDetailDTO dto , InputDetailEntity entity) {
		entity.setId(dto.getId());
		entity.setQuantity(dto.getQuantity());
		entity.setFlagDelete(dto.getFlagDelete());
		entity.setPrice(dto.getPrice());
		return entity;
	}
}
