package com.fpoly.coffeeshop.converter;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.InputDTO;
import com.fpoly.coffeeshop.entity.InputEntity;

@Component
public class InputConveter {
	
	public InputDTO convertToDTO(InputEntity entity) {
		InputDTO dto = new InputDTO();
		dto.setId(entity.getId());
		dto.setInputDate(entity.getInputDate());
		dto.setFlagDelete(entity.getFlagDelete());
		return dto;

	}

	public InputEntity convertToEntity(InputDTO dto) {
		InputEntity entity = new InputEntity();
		entity.setId(dto.getId());
		entity.setInputDate(dto.getInputDate());
		entity.setFlagDelete(dto.getFlagDelete());
		return entity;
	}

	public InputEntity convertToEntity(InputDTO dto, InputEntity entity) {
		entity.setId(dto.getId());
		entity.setInputDate(dto.getInputDate());
		entity.setFlagDelete(dto.getFlagDelete());
		return entity;
	}
}
