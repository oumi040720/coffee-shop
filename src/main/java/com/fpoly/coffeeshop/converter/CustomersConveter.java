package com.fpoly.coffeeshop.converter;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.CustomersDTO;
import com.fpoly.coffeeshop.entity.CustomersEntity;

@Component
public class CustomersConveter {
	
	public CustomersDTO convertToDTO(CustomersEntity entity) {
		CustomersDTO dto = new CustomersDTO();
		dto.setId(entity.getId());
		dto.setUsername(entity.getUser().getUsername());
		dto.setFullname(entity.getFullname());
		dto.setEmail(entity.getEmail());
		dto.setPhone(entity.getPhone());
		dto.setAddress(entity.getAddress());
		dto.setFlagDelete(entity.getFlagDelete());
		return dto;
	}
	
	public CustomersEntity convertToEntity(CustomersDTO dto) {
		CustomersEntity entity = new CustomersEntity();
		entity.setId(dto.getId());
		entity.setFullname(dto.getFullname());
		entity.setEmail(dto.getEmail());
		entity.setPhone(dto.getPhone());
		entity.setAddress(dto.getAddress());
		entity.setFlagDelete(dto.getFlagDelete());
		return entity;
	}
	
	public CustomersEntity convertToEntity(CustomersDTO dto , CustomersEntity entity) {
		entity.setId(dto.getId());
		entity.setFullname(dto.getFullname());
		entity.setEmail(dto.getEmail());
		entity.setPhone(dto.getPhone());
		entity.setAddress(dto.getAddress());
		entity.setFlagDelete(dto.getFlagDelete());
		return entity;
	}
}
