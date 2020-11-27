package com.fpoly.coffeeshop.converter;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.IngredientsDTO;
import com.fpoly.coffeeshop.entity.IngredientsEntity;


@Component
public class IngredientsConveter {
	public IngredientsDTO convertToDTO(IngredientsEntity entity) {
		IngredientsDTO dto = new IngredientsDTO();
		dto.setId(entity.getId());
		dto.setName(entity.getName());
		dto.setQuantity(entity.getQuantity());
		dto.setUnit(entity.getUnit().getUnitName());
		dto.setFlagDelete(entity.getFlagDelete());
		return dto;

	}

	public IngredientsEntity convertToEntity(IngredientsDTO dto) {
		IngredientsEntity entity = new IngredientsEntity();
		entity.setName(dto.getName());
		entity.setQuantity(dto.getQuantity());
		entity.setFlagDelete(dto.getFlagDelete());
		return entity;
	}

	public IngredientsEntity convetToEntity(IngredientsDTO dto, IngredientsEntity entity) {
		entity.setId(dto.getId());
		entity.setName(dto.getName());
		entity.setQuantity(dto.getQuantity());
		entity.setFlagDelete(dto.getFlagDelete());

		return entity;
	}
}