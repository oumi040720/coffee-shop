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
		dto.setProduct(entity.getProduct().getProductName());
		dto.setInput(entity.getInput().getInputCode());
		dto.setPrice(entity.getPrice());
		dto.setTotalMoney(entity.getTotalMoney());
		dto.setFlagDelete(entity.getFlagDelete());
		return dto;
	}

	public InputDetailEntity convertToEntity(InputDetailDTO dto) {
		InputDetailEntity entity = new InputDetailEntity();
		entity.setId(dto.getId());
		entity.setQuantity(dto.getQuantity());
		entity.setPrice(dto.getPrice());
		entity.setTotalMoney(dto.getTotalMoney());
		entity.setFlagDelete(dto.getFlagDelete());
		return entity;
	}
	
	public InputDetailEntity convertToEntity(InputDetailDTO dto, InputDetailEntity entity) {
		entity.setId(dto.getId());
		entity.setQuantity(dto.getQuantity());
		entity.setPrice(dto.getPrice());
		entity.setTotalMoney(dto.getTotalMoney());
		entity.setFlagDelete(dto.getFlagDelete());
		return entity;
	}
}
