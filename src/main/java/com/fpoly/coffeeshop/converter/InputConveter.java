package com.fpoly.coffeeshop.converter;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.InputDTO;
import com.fpoly.coffeeshop.entity.InputEntity;

@Component
public class InputConveter {
	public InputDTO ConvertToDTO(InputEntity entity) {
		InputDTO dto = new InputDTO();
		dto.setId(entity.getId());
		dto.setInputName(entity.getInputName());
		dto.setFlagDelete(entity.getFlagDelete());
		return dto;
	}
	
	public InputEntity convertToEntity(InputDTO dto) {
		InputEntity entity = new InputEntity();
		entity.setInputName(dto.getInputName());
		entity.setFlagDelete(dto.getFlagDelete());
		return entity;
	}
	
	public InputEntity convertToEntity(InputDTO dto, InputEntity entity) {
		entity.setId(dto.getId());
		entity.setInputName(dto.getInputName());
		entity.setFlagDelete(dto.getFlagDelete());
		
		return entity;
		
	}
	
}
