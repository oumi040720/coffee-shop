package com.fpoly.coffeeshop.converter;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.UserDTO;
import com.fpoly.coffeeshop.entity.UserEntity;

@Component
public class UserConveter {

	public UserDTO convertToDTO(UserEntity entity) {
		UserDTO dto = new UserDTO();
		dto.setId(entity.getId());
		dto.setUsername(entity.getUsername());
		dto.setRoleCode(entity.getRole().getRoleCode());
		dto.setFlagDelete(entity.getFlagDelete());
		
		return dto;
	}
	
	public UserEntity convertToEntity(UserDTO dto) {
		UserEntity entity = new UserEntity();
		entity.setId(dto.getId());
		entity.setUsername(dto.getUsername());
		entity.setPassword(dto.getPassword());
		entity.setFlagDelete(dto.getFlagDelete());
		
		return entity;
	}
	
	public UserEntity convertToEntity(UserDTO dto, UserEntity entity) {
		entity.setId(dto.getId());
		entity.setUsername(dto.getUsername());
		entity.setPassword(dto.getPassword());
		entity.setFlagDelete(dto.getFlagDelete());
		
		return entity;
	}
	
}
