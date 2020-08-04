package com.fpoly.coffeeshop.converter;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.UnitDTO;
import com.fpoly.coffeeshop.entity.UnitEntity;

@Component
public class UnitConveter {
	public UnitDTO ConvertToDTO(UnitEntity entity) {
		UnitDTO dto = new UnitDTO();
		dto.setId(entity.getId());
		dto.setUnitName(entity.getUnitName());
		dto.setFlagDelete(entity.getFlagDelete());
		return dto;
	}
	public UnitEntity convertToEntity(UnitDTO dto) {
		UnitEntity entity = new UnitEntity();
		entity.setId(dto.getId());
		entity.setUnitName(entity.getUnitName());
		entity.setFlagDelete(entity.getFlagDelete());
		return entity;
		
	}
	public UnitEntity convertToEntity(UnitDTO dto, UnitEntity entity) {
		entity.setId(dto.getId());
		entity.setUnitName(dto.getUnitName());
		entity.setFlagDelete(dto.getFlagDelete());
		return entity;
		
	}
	
}
