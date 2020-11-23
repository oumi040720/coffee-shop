package com.fpoly.coffeeshop.converter;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.InputDetailDTO;
import com.fpoly.coffeeshop.entity.InputDetailEntity;

@Component
public class InputDetailConveter {

	public InputDetailDTO convertToDTO(InputDetailEntity entity) {
		InputDetailDTO dto = new InputDetailDTO();
		dto.setId(entity.getId());
		dto.setQuantity(entity.getQuantity());
		dto.setUnit(entity.getUnit().getId());
		dto.setIngredient(entity.getIngredient().getId());
		dto.setInput(entity.getInputId());
		dto.setPrice(entity.getPrice());
		dto.setFlagDelete(entity.getFlagDelete());
		return dto;
	}

	public InputDetailEntity convertToEntity(InputDetailDTO dto) {
		InputDetailEntity entity = new InputDetailEntity();
		entity.setId(dto.getId());
		entity.setQuantity(dto.getQuantity());
		entity.setPrice(dto.getPrice());
		entity.setFlagDelete(dto.getFlagDelete());
		return entity;
	}
	
	public InputDetailEntity convertToEntity(InputDetailDTO dto, InputDetailEntity entity) {
		entity.setId(dto.getId());
		entity.setQuantity(dto.getQuantity());
		entity.setPrice(dto.getPrice());
		entity.setFlagDelete(dto.getFlagDelete());
		return entity;
	}
}
